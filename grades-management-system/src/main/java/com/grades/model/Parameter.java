package com.grades.model;

import java.math.BigDecimal;

public class Parameter {
    private Integer id;
    private Integer idSubject;
    private BigDecimal minValue;
    private BigDecimal maxValue;
    private Integer idOperator;
    private String subjectName; // for convenience
    private String operatorName; // for convenience

    public Parameter() {}
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public Integer getIdSubject() { return idSubject; }
    public void setIdSubject(Integer idSubject) { this.idSubject = idSubject; }
    public BigDecimal getMinValue() { return minValue; }
    public void setMinValue(BigDecimal minValue) { this.minValue = minValue; }
    public BigDecimal getMaxValue() { return maxValue; }
    public void setMaxValue(BigDecimal maxValue) { this.maxValue = maxValue; }
    public Integer getIdOperator() { return idOperator; }
    public void setIdOperator(Integer idOperator) { this.idOperator = idOperator; }
    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }
    public String getOperatorName() { return operatorName; }
    public void setOperatorName(String operatorName) { this.operatorName = operatorName; }
}
