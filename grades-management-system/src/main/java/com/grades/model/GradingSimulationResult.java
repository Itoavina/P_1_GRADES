package com.grades.model;

import java.math.BigDecimal;
import java.util.List;

public class GradingSimulationResult {
    private Student student;
    private Exam exam;
    private List<Grade> originalGrades;
    private BigDecimal sumOfDifferences;
    private Parameter matchingParameter;
    private BigDecimal finalGrade;
    private String operatorApplied;

    public GradingSimulationResult() {}

    // Getters and Setters
    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }
    public Exam getExam() { return exam; }
    public void setExam(Exam exam) { this.exam = exam; }
    public List<Grade> getOriginalGrades() { return originalGrades; }
    public void setOriginalGrades(List<Grade> originalGrades) { this.originalGrades = originalGrades; }
    public BigDecimal getSumOfDifferences() { return sumOfDifferences; }
    public void setSumOfDifferences(BigDecimal sumOfDifferences) { this.sumOfDifferences = sumOfDifferences; }
    public Parameter getMatchingParameter() { return matchingParameter; }
    public void setMatchingParameter(Parameter matchingParameter) { this.matchingParameter = matchingParameter; }
    public BigDecimal getFinalGrade() { return finalGrade; }
    public void setFinalGrade(BigDecimal finalGrade) { this.finalGrade = finalGrade; }
    public String getOperatorApplied() { return operatorApplied; }
    public void setOperatorApplied(String operatorApplied) { this.operatorApplied = operatorApplied; }
}
