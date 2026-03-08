package com.grades.model;

import java.math.BigDecimal;

public class Subject {
    private Integer id;
    private String name;
    private BigDecimal coefficient;

    public Subject() {}
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public BigDecimal getCoefficient() { return coefficient; }
    public void setCoefficient(BigDecimal coefficient) { this.coefficient = coefficient; }
}
