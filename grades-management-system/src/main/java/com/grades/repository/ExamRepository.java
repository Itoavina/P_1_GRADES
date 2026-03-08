package com.grades.repository;

import com.grades.model.Exam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ExamRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class ExamRowMapper implements RowMapper<Exam> {
        @Override
        public Exam mapRow(ResultSet rs, int rowNum) throws SQLException {
            Exam e = new Exam();
            e.setId(rs.getInt("id"));
            e.setIdSubject(rs.getInt("id_subject"));
            e.setName(rs.getString("name"));
            e.setExamDate(rs.getDate("exam_date").toLocalDate());
            try { e.setSubjectName(rs.getString("subject_name")); } catch (Exception ignored) {}
            return e;
        }
    }

    public List<Exam> findAll() {
        return jdbcTemplate.query("SELECT e.*, s.subject_name FROM exams e JOIN subjects s ON e.id_subject = s.id", new ExamRowMapper());
    }

    public Exam findById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT e.*, s.subject_name FROM exams e JOIN subjects s ON e.id_subject = s.id WHERE e.id = ?", new ExamRowMapper(), id);
    }

    public int save(Exam e) {
        return jdbcTemplate.update("INSERT INTO exams (id_subject, name, exam_date) VALUES (?, ?, ?)", e.getIdSubject(), e.getName(), e.getExamDate());
    }

    public int update(Exam e) {
        return jdbcTemplate.update("UPDATE exams SET id_subject = ?, name = ?, exam_date = ? WHERE id = ?", e.getIdSubject(), e.getName(), e.getExamDate(), e.getId());
    }

    public int deleteById(Integer id) {
        return jdbcTemplate.update("DELETE FROM exams WHERE id = ?", id);
    }
}
