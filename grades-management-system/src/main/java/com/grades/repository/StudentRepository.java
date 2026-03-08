package com.grades.repository;

import com.grades.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class StudentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final class StudentRowMapper implements RowMapper<Student> {
        @Override
        public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
            Student student = new Student();
            student.setId(rs.getInt("id"));
            student.setName(rs.getString("name"));
            return student;
        }
    }

    public List<Student> findAll() {
        return jdbcTemplate.query("SELECT * FROM students", new StudentRowMapper());
    }

    public Student findById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT * FROM students WHERE id = ?", new StudentRowMapper(), id);
    }

    public int save(Student student) {
        return jdbcTemplate.update("INSERT INTO students (name) VALUES (?)", student.getName());
    }

    public int update(Student student) {
        return jdbcTemplate.update("UPDATE students SET name = ? WHERE id = ?", student.getName(), student.getId());
    }

    public int deleteById(Integer id) {
        return jdbcTemplate.update("DELETE FROM students WHERE id = ?", id);
    }
}
