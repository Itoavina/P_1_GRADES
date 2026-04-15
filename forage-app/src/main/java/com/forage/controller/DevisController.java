package com.forage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forage.model.DetailDevis;
import com.forage.model.Devis;
import com.forage.repository.DemandeRepository;
import com.forage.repository.DevisRepository;
import com.forage.repository.TypeDevisRepository;

@Controller
@RequestMapping("/devis")
public class DevisController {

    @Autowired
    private DevisRepository devisRepository;

    @Autowired
    private DemandeRepository demandeRepository;

    @Autowired
    private TypeDevisRepository typeDevisRepository;


    @GetMapping
    public String listDevis(Model model) {
        model.addAttribute("devisList", devisRepository.findAll());
        model.addAttribute("totalChiffreAffaire", devisRepository.calculateTotalChiffreAffaire());
        return "devis/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("devis", new Devis());
        model.addAttribute("demandeList", demandeRepository.findAll());
        model.addAttribute("typeDevisList", typeDevisRepository.findAll());
        return "devis/form";
    }

    @PostMapping("/save")
    public String saveDevis(@ModelAttribute("devis") Devis devis) {
        boolean isNew = devis.getId() == null;
        
        if (devis.getDemande() != null && devis.getDemande().getId() != null) {
            com.forage.model.Demande demande = demandeRepository.findById(devis.getDemande().getId()).orElse(null);
            if (demande != null) {
                devis.setDemande(demande);
            }
        }

        if (devis.getTypeDevis() != null && devis.getTypeDevis().getId() != null) {
            com.forage.model.TypeDevis type = typeDevisRepository.findById(devis.getTypeDevis().getId()).orElse(null);
            if (type != null) {
                devis.setTypeDevis(type);
                
                if (type.getStatut() != null) {
                    devis.setStatut(type.getStatut());
                }
                
                if (isNew && devis.getDemande() != null && type.getStatut() != null) {
                    devis.getDemande().addStatut(type.getStatut());
                }
            }
        }

        if (devis.getDetailDevisList() != null) {
            devis.getDetailDevisList().removeIf(d -> d.getLibelle() == null || d.getLibelle().isBlank());
            for (DetailDevis detail : devis.getDetailDevisList()) {
                detail.setDevis(devis);
                
                java.math.BigDecimal qty = detail.getQuantite() != null ? detail.getQuantite() : java.math.BigDecimal.ONE;
                java.math.BigDecimal pu = detail.getPrixUnitaire() != null ? detail.getPrixUnitaire() : java.math.BigDecimal.ZERO;
                java.math.BigDecimal rowTotal = qty.multiply(pu);
                
                //système de remise amin'ny total
                if (pu.compareTo(new java.math.BigDecimal("1000000")) >= 0) {
                    rowTotal = rowTotal.multiply(new java.math.BigDecimal("0.9"));
                }
                detail.setMontant(rowTotal);
            }
        }
        
        if (devis.getDemande() != null) {
            demandeRepository.save(devis.getDemande());
        }
        devisRepository.save(devis);
        return "redirect:/devis";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Devis devis = devisRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid devis Id:" + id));
        model.addAttribute("devis", devis);
        model.addAttribute("demandeList", demandeRepository.findAll());
        model.addAttribute("typeDevisList", typeDevisRepository.findAll());
        return "devis/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteDevis(@PathVariable("id") Long id) {
        devisRepository.deleteById(id);
        return "redirect:/devis";
    }

    @GetMapping("/api/demande/{id}")
    @ResponseBody
    public java.util.Map<String, Object> getDemandeApi(@PathVariable("id") Long id) {
        com.forage.model.Demande d = demandeRepository.findById(id).orElse(null);
        if (d == null) return null;
        
        java.util.Map<String, Object> map = new java.util.HashMap<>();
        map.put("id", d.getId());
        map.put("description", d.getDescription());
        map.put("lieu", d.getLieu());
        map.put("dateDemande", d.getDateDemande() != null ? d.getDateDemande().getTime() : null);
        
        java.util.Map<String, Object> clientMap = new java.util.HashMap<>();
        if (d.getClient() != null) {
            clientMap.put("nom", d.getClient().getNom());
            clientMap.put("contact", d.getClient().getContact());
        }
        map.put("client", clientMap);
        
        return map;
    }
}
