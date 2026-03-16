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
            p.setIdSubject((Integer) rs.getObject("id_subject"));
            p.setLimitValue(rs.getBigDecimal("limit_value"));
            p.setIdOperator((Integer) rs.getObject("id_operator"));
            p.setComparisonSymbol(rs.getString("comparison_symbol"));
            try { 
                p.setSubjectName(rs.getString("subject_name"));
                p.setOperatorName(rs.getString("operator_name"));
                p.setOperatorSymbol(rs.getString("operator_symbol"));
            } catch (Exception ignored) {}
            return p;
        }
    }

    public List<Parameter> findAll() {
        return jdbcTemplate.query("SELECT p.*, s.subject_name, o.name as operator_name, o.symbol as operator_symbol FROM parameters p LEFT JOIN subjects s ON p.id_subject = s.id LEFT JOIN operators o ON p.id_operator = o.id", new ParameterRowMapper());
    }

    public Parameter findById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT p.*, s.subject_name, o.name as operator_name, o.symbol as operator_symbol FROM parameters p LEFT JOIN subjects s ON p.id_subject = s.id LEFT JOIN operators o ON p.id_operator = o.id WHERE p.id = ?", new ParameterRowMapper(), id);
    }

    public List<Parameter> findBySubject(Integer subjectId) {
        String sql = "SELECT p.*, s.subject_name, o.name as operator_name, o.symbol as operator_symbol " +
                     "FROM parameters p " +
                     "LEFT JOIN subjects s ON p.id_subject = s.id " +
                     "LEFT JOIN operators o ON p.id_operator = o.id " +
                     "WHERE p.id_subject = ?";
        return jdbcTemplate.query(sql, new ParameterRowMapper(), subjectId);
    }

    public int save(Parameter p) {
        return jdbcTemplate.update("INSERT INTO parameters (id_subject, limit_value, id_operator, comparison_symbol) VALUES (?, ?, ?, ?)", p.getIdSubject(), p.getLimitValue(), p.getIdOperator(), p.getComparisonSymbol());
    }

    public int update(Parameter p) {
        return jdbcTemplate.update("UPDATE parameters SET id_subject = ?, limit_value = ?, id_operator = ?, comparison_symbol = ? WHERE id = ?", p.getIdSubject(), p.getLimitValue(), p.getIdOperator(), p.getComparisonSymbol(), p.getId());
    }

    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM parameters WHERE id = ?", id); }
}
