package com.grades.model;

import java.math.BigDecimal;

public class Grade {
    private Integer id;
    private Integer idStudent;
    private Integer idExam;
    private BigDecimal value;
    private Integer idCorrector;
    
    // Joint data for views
    private String studentName;
    private String examName;
    private String correctorName;

    public Grade() {}
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getIdStudent() { return idStudent; }
    public void setIdStudent(Integer idStudent) { this.idStudent = idStudent; }
    public Integer getIdExam() { return idExam; }
    public void setIdExam(Integer idExam) { this.idExam = idExam; }
    public BigDecimal getValue() { return value; }
    public void setValue(BigDecimal value) { this.value = value; }
    public Integer getIdCorrector() { return idCorrector; }
    public void setIdCorrector(Integer idCorrector) { this.idCorrector = idCorrector; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public String getExamName() { return examName; }
    public void setExamName(String examName) { this.examName = examName; }
    public String getCorrectorName() { return correctorName; }
    public void setCorrectorName(String correctorName) { this.correctorName = correctorName; }
}
