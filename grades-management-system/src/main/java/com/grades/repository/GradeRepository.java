package com.grades.repository;

import com.grades.model.Grade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class GradeRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class GradeRowMapper implements RowMapper<Grade> {
        @Override
        public Grade mapRow(ResultSet rs, int rowNum) throws SQLException {
            Grade g = new Grade();
            g.setId(rs.getInt("id"));
            g.setIdStudent(rs.getInt("id_student"));
            g.setIdExam(rs.getInt("id_exam"));
            g.setValue(rs.getBigDecimal("value"));
            g.setIdCorrector(rs.getInt("id_corrector"));
            try {
                g.setStudentName(rs.getString("student_name"));
                g.setExamName(rs.getString("exam_name"));
                g.setCorrectorName(rs.getString("corrector_name"));
            } catch (Exception ignored) {}
            return g;
        }
    }

    public List<Grade> findAll() {
        return jdbcTemplate.query("SELECT g.*, st.name as student_name, e.name as exam_name, c.name as corrector_name FROM grades g JOIN students st ON g.id_student = st.id JOIN exams e ON g.id_exam = e.id JOIN correctors c ON g.id_corrector = c.id", new GradeRowMapper());
    }

    public Grade findById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT g.*, st.name as student_name, e.name as exam_name, c.name as corrector_name FROM grades g JOIN students st ON g.id_student = st.id JOIN exams e ON g.id_exam = e.id JOIN correctors c ON g.id_corrector = c.id WHERE g.id = ?", new GradeRowMapper(), id);
    }

    public int save(Grade g) {
        return jdbcTemplate.update("INSERT INTO grades (id_student, id_exam, value, id_corrector) VALUES (?, ?, ?, ?)", g.getIdStudent(), g.getIdExam(), g.getValue(), g.getIdCorrector());
    }

    public int update(Grade g) {
        return jdbcTemplate.update("UPDATE grades SET id_student = ?, id_exam = ?, value = ?, id_corrector = ? WHERE id = ?", g.getIdStudent(), g.getIdExam(), g.getValue(), g.getIdCorrector(), g.getId());
    }

    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM grades WHERE id = ?", id); }
}
