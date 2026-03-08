package com.grades.controller;

import com.grades.model.Exam;
import com.grades.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/exams")
public class ExamController {
    @Autowired private GeneralService service;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("exams", service.getAllExams());
        return "exams/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("exam", new Exam());
        model.addAttribute("subjects", service.getAllSubjects());
        return "exams/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Exam exam) {
        service.saveOrUpdateExam(exam);
        return "redirect:/exams";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("exam", service.getExamById(id));
        model.addAttribute("subjects", service.getAllSubjects());
        return "exams/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.deleteExam(id);
        return "redirect:/exams";
    }
}
