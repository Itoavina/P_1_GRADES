package com.forage.controller;

import com.forage.repository.TravauxRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travaux")
public class TravauxController {

    @Autowired
    private TravauxRepository travauxRepository;

    @GetMapping
    public String listTravaux(Model model) {
        model.addAttribute("travauxList", travauxRepository.findAll());
        return "travaux/list";
    }
}
