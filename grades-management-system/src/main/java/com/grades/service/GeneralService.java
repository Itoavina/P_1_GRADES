package com.grades.service;

import com.grades.model.*;
import com.grades.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GeneralService {
    @Autowired private CorrectorRepository correctorRepo;
    @Autowired private SubjectRepository subjectRepo;
    @Autowired private OperatorRepository operatorRepo;
    @Autowired private ExamRepository examRepo;
    @Autowired private ParameterRepository parameterRepo;
    @Autowired private GradeRepository gradeRepo;

    // Corrector
    public List<Corrector> getAllCorrectors() { return correctorRepo.findAll(); }
    public Corrector getCorrectorById(Integer id) { return correctorRepo.findById(id); }
    public void saveOrUpdateCorrector(Corrector c) { if (c.getId() == null || c.getId() == 0) correctorRepo.save(c); else correctorRepo.update(c); }
    public void deleteCorrector(Integer id) { correctorRepo.deleteById(id); }

    // Subject
    public List<Subject> getAllSubjects() { return subjectRepo.findAll(); }
    public Subject getSubjectById(Integer id) { return subjectRepo.findById(id); }
    public void saveOrUpdateSubject(Subject s) { if (s.getId() == null || s.getId() == 0) subjectRepo.save(s); else subjectRepo.update(s); }
    public void deleteSubject(Integer id) { subjectRepo.deleteById(id); }

    // Operator
    public List<Operator> getAllOperators() { return operatorRepo.findAll(); }
    public Operator getOperatorById(Integer id) { return operatorRepo.findById(id); }
    public void saveOrUpdateOperator(Operator o) { if (o.getId() == null || o.getId() == 0) operatorRepo.save(o); else operatorRepo.update(o); }
    public void deleteOperator(Integer id) { operatorRepo.deleteById(id); }

    // Exam
    public List<Exam> getAllExams() { return examRepo.findAll(); }
    public Exam getExamById(Integer id) { return examRepo.findById(id); }
    public void saveOrUpdateExam(Exam e) { if (e.getId() == null || e.getId() == 0) examRepo.save(e); else examRepo.update(e); }
    public void deleteExam(Integer id) { examRepo.deleteById(id); }

    // Parameter
    public List<Parameter> getAllParameters() { return parameterRepo.findAll(); }
    public Parameter getParameterById(Integer id) { return parameterRepo.findById(id); }
    public void saveOrUpdateParameter(Parameter p) { if (p.getId() == null || p.getId() == 0) parameterRepo.save(p); else parameterRepo.update(p); }
    public void deleteParameter(Integer id) { parameterRepo.deleteById(id); }

    // Grade
    public List<Grade> getAllGrades() { return gradeRepo.findAll(); }
    public Grade getGradeById(Integer id) { return gradeRepo.findById(id); }
    public void saveOrUpdateGrade(Grade g) { if (g.getId() == null || g.getId() == 0) gradeRepo.save(g); else gradeRepo.update(g); }
    public void deleteGrade(Integer id) { gradeRepo.deleteById(id); }
}
