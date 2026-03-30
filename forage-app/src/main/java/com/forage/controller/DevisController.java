package com.forage.controller;

import com.forage.repository.DevisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/devis")
public class DevisController {

    @Autowired
    private DevisRepository devisRepository;

    @GetMapping
    public String listDevis(Model model) {
        model.addAttribute("devisList", devisRepository.findAll());
        return "devis/list";
    }
}
