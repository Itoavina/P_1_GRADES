package com.grades.controller;

import com.grades.model.Operator;
import com.grades.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/operators")
public class OperatorController {
    @Autowired private GeneralService service;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("operators", service.getAllOperators());
        return "operators/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("operator", new Operator());
        return "operators/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Operator operator) {
        service.saveOrUpdateOperator(operator);
        return "redirect:/operators";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("operator", service.getOperatorById(id));
        return "operators/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        service.deleteOperator(id);
        return "redirect:/operators";
    }
}
