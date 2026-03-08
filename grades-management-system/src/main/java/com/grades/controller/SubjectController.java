package com.grades.controller;

import com.grades.model.Subject;
import com.grades.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/subjects")
public class SubjectController {
    @Autowired private GeneralService service;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("subjects", service.getAllSubjects());
        return "subjects/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("subject", new Subject());
        return "subjects/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Subject subject) {
        service.saveOrUpdateSubject(subject);
        return "redirect:/subjects";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("subject", service.getSubjectById(id));
        return "subjects/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.deleteSubject(id);
        return "redirect:/subjects";
    }
}
