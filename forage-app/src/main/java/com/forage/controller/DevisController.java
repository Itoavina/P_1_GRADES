package com.forage.controller;

import com.forage.model.Devis;
import com.forage.model.DetailDevis;
import com.forage.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/devis")
public class DevisController {

    @Autowired
    private DevisRepository devisRepository;

    @Autowired
    private DemandeRepository demandeRepository;

    @Autowired
    private TypeDevisRepository typeDevisRepository;

    @Autowired
    private StatutRepository statutRepository;

    @GetMapping
    public String listDevis(Model model) {
        model.addAttribute("devisList", devisRepository.findAll());
        return "devis/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("devis", new Devis());
        model.addAttribute("demandeList", demandeRepository.findAll());
        model.addAttribute("typeDevisList", typeDevisRepository.findAll());
        model.addAttribute("statutList", statutRepository.findAll());
        return "devis/form";
    }

    @PostMapping("/save")
    public String saveDevis(@ModelAttribute("devis") Devis devis) {
        devisRepository.save(devis);
        return "redirect:/devis";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Devis devis = devisRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid devis Id:" + id));
        model.addAttribute("devis", devis);
        model.addAttribute("demandeList", demandeRepository.findAll());
        model.addAttribute("typeDevisList", typeDevisRepository.findAll());
        model.addAttribute("statutList", statutRepository.findAll());
        return "devis/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteDevis(@PathVariable("id") Long id) {
        devisRepository.deleteById(id);
        return "redirect:/devis";
    }
}
