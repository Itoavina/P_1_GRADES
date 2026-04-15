package com.forage.controller;

import com.forage.model.Demande;
import com.forage.model.Statut;
import com.forage.service.ClientService;
import com.forage.service.DemandeService;
import com.forage.service.StatutService;
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

    @Autowired
    private StatutService statutService;

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
        
        // Assign default "en attente" status on creation
        Statut defaultStatut = statutService.findById(1L);
        if (defaultStatut != null) {
            demande.addStatut(defaultStatut, "Création de la demande");
        }
        
        demandeService.save(demande);
        return "redirect:/demandes";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Demande demande = demandeService.findById(id);
        if (demande == null) return "redirect:/demandes";
        model.addAttribute("demande", demande);
        model.addAttribute("clients", clientService.findAll());
        model.addAttribute("statuts", statutService.findAll());
        return "demande/form";
    }

    @PostMapping("/update/{id}")
    public String updateDemande(@PathVariable("id") Long id, @Valid @ModelAttribute("demande") Demande demande, 
                                BindingResult result, Model model,
                                @RequestParam(value = "newStatutId", required = false) Long newStatutId,
                                @RequestParam(value = "statutDescription", required = false) String statutDescription) {
        if (demande.getClient() == null || demande.getClient().getId() == null) {
            result.rejectValue("client", "error.demande", "Veuillez sélectionner un client");
        }
        if (result.hasErrors()) {
            demande.setId(id);
            model.addAttribute("clients", clientService.findAll());
            model.addAttribute("statuts", statutService.findAll());
            return "demande/form";
        }
        
        Demande existing = demandeService.findById(id);
        existing.setClient(clientService.findById(demande.getClient().getId()));
        existing.setDescription(demande.getDescription());
        existing.setLieu(demande.getLieu());
        
        // Add new status entry if provided
        if (newStatutId != null) {
            Statut newStatut = statutService.findById(newStatutId);
            if (newStatut != null) {
                existing.addStatut(newStatut, statutDescription);
            }
        }
        
        demandeService.save(existing);
        return "redirect:/demandes";
    }

    @GetMapping("/delete/{id}")
    public String deleteDemande(@PathVariable("id") Long id) {
        demandeService.delete(id);
        return "redirect:/demandes";
    }
}
