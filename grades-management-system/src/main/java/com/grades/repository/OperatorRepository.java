package com.grades.repository;

import com.grades.model.Operator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OperatorRepository {
    @Autowired private JdbcTemplate jdbcTemplate;

    private static final class OperatorRowMapper implements RowMapper<Operator> {
        @Override
        public Operator mapRow(ResultSet rs, int rowNum) throws SQLException {
            Operator o = new Operator();
            o.setId(rs.getInt("id"));
            o.setName(rs.getString("name"));
            o.setSymbol(rs.getString("symbol"));
            return o;
        }
    }

    public List<Operator> findAll() { return jdbcTemplate.query("SELECT * FROM operators", new OperatorRowMapper()); }
    public Operator findById(Integer id) { return jdbcTemplate.queryForObject("SELECT * FROM operators WHERE id = ?", new OperatorRowMapper(), id); }
    public int save(Operator o) { return jdbcTemplate.update("INSERT INTO operators (name, symbol) VALUES (?, ?)", o.getName(), o.getSymbol()); }
    public int update(Operator o) { return jdbcTemplate.update("UPDATE operators SET name = ?, symbol = ? WHERE id = ?", o.getName(), o.getSymbol(), o.getId()); }
    public int deleteById(Integer id) { return jdbcTemplate.update("DELETE FROM operators WHERE id = ?", id); }
}
