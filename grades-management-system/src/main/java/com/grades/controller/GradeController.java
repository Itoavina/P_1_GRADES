package com.grades.controller;

import com.grades.model.Grade;
import com.grades.service.GeneralService;
import com.grades.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/grades")
public class GradeController {
    @Autowired private GeneralService service;
    @Autowired private StudentService studentService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("grades", service.getAllGrades());
        return "grades/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("grade", new Grade());
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("exams", service.getAllExams());
        model.addAttribute("correctors", service.getAllCorrectors());
        return "grades/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Grade grade) {
        service.saveOrUpdateGrade(grade);
        return "redirect:/grades";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("grade", service.getGradeById(id));
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("exams", service.getAllExams());
        model.addAttribute("correctors", service.getAllCorrectors());
        return "grades/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.deleteGrade(id);
        return "redirect:/grades";
    }
}
