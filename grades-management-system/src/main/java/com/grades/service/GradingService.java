package com.grades.service;

import com.grades.model.*;
import com.grades.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
public class GradingService {

    @Autowired private StudentRepository studentRepo;
    @Autowired private ExamRepository examRepo;
    @Autowired private GradeRepository gradeRepo;
    @Autowired private ParameterRepository parameterRepo;

    public GradingSimulationResult simulateGrading(Integer studentId, Integer examId) {
        GradingSimulationResult result = new GradingSimulationResult();
        
        // 1. Fetch Basic Data
        Student student = studentRepo.findById(studentId);
        Exam exam = examRepo.findById(examId);
        List<Grade> grades = gradeRepo.findByStudentAndExam(studentId, examId);
        
        result.setStudent(student);
        result.setExam(exam);
        result.setOriginalGrades(grades);

        if (grades.isEmpty()) {
            return result;
        }

        // 2. Calculate Sum of Differences: Sum of all pairwise absolute differences
        BigDecimal sumOfDiffs = BigDecimal.ZERO;
        for (int i = 0; i < grades.size(); i++) {
            for (int j = i + 1; j < grades.size(); j++) {
                BigDecimal diff = grades.get(i).getValue().subtract(grades.get(j).getValue()).abs();
                sumOfDiffs = sumOfDiffs.add(diff);
            }
        }
        result.setSumOfDifferences(sumOfDiffs);

        // 3. Find Matching Parameter for the subject
        List<Parameter> params = parameterRepo.findBySubject(exam.getIdSubject());
        Parameter matchingParam = null;
        BigDecimal minDifference = null;

        for (Parameter p : params) {
            if (p.getLimitValue() == null) {
                // Keep as fallback if no limit value exists
                if (matchingParam == null) {
                    matchingParam = p;
                }
                continue;
            }

            BigDecimal diff = sumOfDiffs.subtract(p.getLimitValue()).abs();

            if (minDifference == null) {
                matchingParam = p;
                minDifference = diff;
            } else {
                int comparison = diff.compareTo(minDifference);
                if (comparison < 0) {
                    matchingParam = p;
                    minDifference = diff;
                } else if (comparison == 0) {
                    // Difference is the same, take the lowest limit
                    if (p.getLimitValue().compareTo(matchingParam.getLimitValue()) < 0) {
                        matchingParam = p;
                        minDifference = diff;
                    }
                }
            }
        }
        result.setMatchingParameter(matchingParam);

        // 4. Apply Operator Logic
        if (matchingParam != null && matchingParam.getOperatorName() != null) {
            String opName = matchingParam.getOperatorName().toLowerCase();
            String symbol = matchingParam.getOperatorSymbol();
            result.setOperatorApplied(matchingParam.getOperatorName() + " (" + symbol + ")");
            
            BigDecimal finalVal = BigDecimal.ZERO;
            if (opName.contains("highest") || opName.contains("max") || (symbol != null && symbol.contains(">"))) {
                // Highest
                finalVal = grades.stream().map(Grade::getValue).max(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            } else if (opName.contains("lowest") || opName.contains("min") || (symbol != null && symbol.contains("<"))) {
                // Lowest
                finalVal = grades.stream().map(Grade::getValue).min(BigDecimal::compareTo).orElse(BigDecimal.ZERO);
            } else {
                // Average (null or any other value)
                BigDecimal sum = grades.stream().map(Grade::getValue).reduce(BigDecimal.ZERO, BigDecimal::add);
                finalVal = sum.divide(new BigDecimal(grades.size()), 2, RoundingMode.HALF_UP);
            }
            result.setFinalGrade(finalVal);
        } else {
            // Default to average if no matching parameter or operator
            result.setOperatorApplied("Default (Average)");
            BigDecimal sum = grades.stream().map(Grade::getValue).reduce(BigDecimal.ZERO, BigDecimal::add);
            result.setFinalGrade(sum.divide(new BigDecimal(grades.size()), 2, RoundingMode.HALF_UP));
        }

        return result;
    }
}
