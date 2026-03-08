package com.grades.repository;

import com.grades.model.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ParameterRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class ParameterRowMapper implements RowMapper<Parameter> {
        @Override
        public Parameter mapRow(ResultSet rs, int rowNum) throws SQLException {
            Parameter p = new Parameter();
            p.setId(rs.getInt("id"));
            p.setIdSubject(rs.getInt("id_subject"));
            p.setMinValue(rs.getBigDecimal("min_value"));
            p.setMaxValue(rs.getBigDecimal("max_value"));
            p.setIdOperator(rs.getInt("id_operator"));
            try { 
                p.setSubjectName(rs.getString("subject_name"));
                p.setOperatorName(rs.getString("operator_name"));
            } catch (Exception ignored) {}
            return p;
        }
    }

    public List<Parameter> findAll() {
        return jdbcTemplate.query("SELECT p.*, s.subject_name, o.name as operator_name FROM parameters p JOIN subjects s ON p.id_subject = s.id JOIN operators o ON p.id_operator = o.id", new ParameterRowMapper());
    }

    public Parameter findById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT p.*, s.subject_name, o.name as operator_name FROM parameters p JOIN subjects s ON p.id_subject = s.id JOIN operators o ON p.id_operator = o.id WHERE p.id = ?", new ParameterRowMapper(), id);
    }

    public int save(Parameter p) {
        return jdbcTemplate.update("INSERT INTO parameters (id_subject, min_value, max_value, id_operator) VALUES (?, ?, ?, ?)", p.getIdSubject(), p.getMinValue(), p.getMaxValue(), p.getIdOperator());
    }

    public int update(Parameter p) {
        return jdbcTemplate.update("UPDATE parameters SET id_subject = ?, min_value = ?, max_value = ?, id_operator = ? WHERE id = ?", p.getIdSubject(), p.getMinValue(), p.getMaxValue(), p.getIdOperator(), p.getId());
    }

    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM parameters WHERE id = ?", id); }
}
