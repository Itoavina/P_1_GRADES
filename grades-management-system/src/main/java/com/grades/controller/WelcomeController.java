package com.grades.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@Controller
public class WelcomeController {

    @Autowired
    private DataSource dataSource;

    @GetMapping("/")
    public String welcome(Model model) {
        String dbStatus;
        try (Connection connection = dataSource.getConnection()) {
            if (connection != null && !connection.isClosed()) {
                dbStatus = "Successfully connected to PostgreSQL database!";
            } else {
                dbStatus = "Connected, but connection is closed or null.";
            }
        } catch (SQLException e) {
            dbStatus = "Failed to connect to PostgreSQL: " + e.getMessage();
            e.printStackTrace();
        }

        model.addAttribute("dbStatus", dbStatus);
        model.addAttribute("message", "Welcome to the Grades Management System!");
        return "welcome";
    }
}
