package com.grades.model;

import java.time.LocalDate;

public class Exam {
    private Integer id;
    private Integer idSubject;
    private String name;
    private LocalDate examDate;
    private String subjectName; // for convenience in listing

    public Exam() {}
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getIdSubject() { return idSubject; }
    public void setIdSubject(Integer idSubject) { this.idSubject = idSubject; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public LocalDate getExamDate() { return examDate; }
    public void setExamDate(LocalDate examDate) { this.examDate = examDate; }
    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }
}
