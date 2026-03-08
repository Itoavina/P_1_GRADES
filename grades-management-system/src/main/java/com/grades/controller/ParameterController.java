package com.grades.controller;

import com.grades.model.Parameter;
import com.grades.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/parameters")
public class ParameterController {
    @Autowired private GeneralService service;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("parameters", service.getAllParameters());
        return "parameters/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("parameter", new Parameter());
        model.addAttribute("subjects", service.getAllSubjects());
        model.addAttribute("operators", service.getAllOperators());
        return "parameters/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Parameter parameter) {
        service.saveOrUpdateParameter(parameter);
        return "redirect:/parameters";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("parameter", service.getParameterById(id));
        model.addAttribute("subjects", service.getAllSubjects());
        model.addAttribute("operators", service.getAllOperators());
        return "parameters/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.deleteParameter(id);
        return "redirect:/parameters";
    }
}
