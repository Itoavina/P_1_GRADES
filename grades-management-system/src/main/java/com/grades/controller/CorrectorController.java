package com.grades.controller;

import com.grades.model.Corrector;
import com.grades.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/correctors")
public class CorrectorController {
    @Autowired private GeneralService service;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("correctors", service.getAllCorrectors());
        return "correctors/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("corrector", new Corrector());
        return "correctors/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("corrector") Corrector corrector) {
        service.saveOrUpdateCorrector(corrector);
        return "redirect:/correctors";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("corrector", service.getCorrectorById(id));
        return "correctors/form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        service.deleteCorrector(id);
        return "redirect:/correctors";
    }
}
