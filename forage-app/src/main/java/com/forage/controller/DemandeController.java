package com.forage.controller;

import com.forage.model.Demande;
import com.forage.service.ClientService;
import com.forage.service.DemandeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/demandes")
public class DemandeController {

    @Autowired
    private DemandeService demandeService;
    
    @Autowired
    private ClientService clientService;

    @GetMapping
    public String listDemandes(Model model) {
        model.addAttribute("demandes", demandeService.findAll());
        return "demande/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("demande", new Demande());
        model.addAttribute("clients", clientService.findAll());
        return "demande/form";
    }

    @PostMapping("/create")
    public String createDemande(@Valid @ModelAttribute("demande") Demande demande, BindingResult result, Model model) {
        if (demande.getClient() == null || demande.getClient().getId() == null) {
            result.rejectValue("client", "error.demande", "Veuillez sélectionner un client");
        }
        if (result.hasErrors()) {
            model.addAttribute("clients", clientService.findAll());
            return "demande/form";
        }
        demande.setClient(clientService.findById(demande.getClient().getId()));
        demandeService.save(demande);
        return "redirect:/demandes";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Demande demande = demandeService.findById(id);
        if (demande == null) return "redirect:/demandes";
        model.addAttribute("demande", demande);
        model.addAttribute("clients", clientService.findAll());
        return "demande/form";
    }

    @PostMapping("/update/{id}")
    public String updateDemande(@PathVariable("id") Long id, @Valid @ModelAttribute("demande") Demande demande, 
                                BindingResult result, Model model) {
        if (demande.getClient() == null || demande.getClient().getId() == null) {
            result.rejectValue("client", "error.demande", "Veuillez sélectionner un client");
        }
        if (result.hasErrors()) {
            demande.setId(id);
            model.addAttribute("clients", clientService.findAll());
            return "demande/form";
        }
        demande.setId(id);
        demande.setClient(clientService.findById(demande.getClient().getId()));
        demandeService.save(demande);
        return "redirect:/demandes";
    }

    @GetMapping("/delete/{id}")
    public String deleteDemande(@PathVariable("id") Long id) {
        demandeService.delete(id);
        return "redirect:/demandes";
    }
}
