package com.forage.controller;

import com.forage.model.Statut;
import com.forage.service.StatutService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/statuts")
public class StatutController {

    @Autowired
    private StatutService statutService;

    @GetMapping
    public String listStatuts(Model model) {
        model.addAttribute("statuts", statutService.findAll());
        return "statut/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("statut", new Statut());
        return "statut/form";
    }

    @PostMapping("/create")
    public String createStatut(@Valid @ModelAttribute("statut") Statut statut, BindingResult result) {
        if (result.hasErrors()) {
            return "statut/form";
        }
        statutService.save(statut);
        return "redirect:/statuts";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Statut statut = statutService.findById(id);
        if (statut == null) return "redirect:/statuts";
        model.addAttribute("statut", statut);
        return "statut/form";
    }

    @PostMapping("/update/{id}")
    public String updateStatut(@PathVariable("id") Long id, @Valid @ModelAttribute("statut") Statut statut,
                               BindingResult result) {
        if (result.hasErrors()) {
            statut.setId(id);
            return "statut/form";
        }
        statut.setId(id);
        statutService.save(statut);
        return "redirect:/statuts";
    }

    @GetMapping("/delete/{id}")
    public String deleteStatut(@PathVariable("id") Long id) {
        statutService.delete(id);
        return "redirect:/statuts";
    }
}
