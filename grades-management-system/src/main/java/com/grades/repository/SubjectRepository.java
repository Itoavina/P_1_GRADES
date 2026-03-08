package com.grades.repository;

import com.grades.model.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class SubjectRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class SubjectRowMapper implements RowMapper<Subject> {
        @Override
        public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
            Subject s = new Subject();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("subject_name"));
            s.setCoefficient(rs.getBigDecimal("coefficient"));
            return s;
        }
    }

    public List<Subject> findAll() { return jdbcTemplate.query("SELECT * FROM subjects", new SubjectRowMapper()); }
    public Subject findById(Integer id) { return jdbcTemplate.queryForObject("SELECT * FROM subjects WHERE id = ?", new SubjectRowMapper(), id); }
    public int save(Subject s) { return jdbcTemplate.update("INSERT INTO subjects (subject_name, coefficient) VALUES (?, ?)", s.getName(), s.getCoefficient()); }
    public int update(Subject s) { return jdbcTemplate.update("UPDATE subjects SET subject_name = ?, coefficient = ? WHERE id = ?", s.getName(), s.getCoefficient(), s.getId()); }
    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM subjects WHERE id = ?", id); }
}
