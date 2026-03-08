package com.grades.repository;

import com.grades.model.Corrector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CorrectorRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class CorrectorRowMapper implements RowMapper<Corrector> {
        @Override
        public Corrector mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new Corrector(rs.getInt("id"), rs.getString("name"));
        }
    }

    public List<Corrector> findAll() { return jdbcTemplate.query("SELECT * FROM correctors", new CorrectorRowMapper()); }
    public Corrector findById(Integer id) { return jdbcTemplate.queryForObject("SELECT * FROM correctors WHERE id = ?", new CorrectorRowMapper(), id); }
    public int save(Corrector corrector) { return jdbcTemplate.update("INSERT INTO correctors (name) VALUES (?)", corrector.getName()); }
    public int update(Corrector corrector) { return jdbcTemplate.update("UPDATE correctors SET name = ? WHERE id = ?", corrector.getName(), corrector.getId()); }
    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM correctors WHERE id = ?", id); }
}
