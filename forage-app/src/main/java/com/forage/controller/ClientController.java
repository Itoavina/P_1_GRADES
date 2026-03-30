package com.forage.controller;

import com.forage.model.Client;
import com.forage.service.ClientService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping
    public String listClients(Model model) {
        model.addAttribute("clients", clientService.findAll());
        return "client/list";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("client", new Client());
        return "client/form";
    }

    @PostMapping("/create")
    public String createClient(@Valid @ModelAttribute("client") Client client, 
                               BindingResult result) {
        if (result.hasErrors()) {
            return "client/form";
        }
        clientService.save(client);
        return "redirect:/clients";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Client client = clientService.findById(id);
        if (client == null) {
            return "redirect:/clients";
        }
        model.addAttribute("client", client);
        return "client/form";
    }

    @PostMapping("/update/{id}")
    public String updateClient(@PathVariable("id") Long id, 
                               @Valid @ModelAttribute("client") Client client, 
                               BindingResult result) {
        if (result.hasErrors()) {
            client.setId(id);
            return "client/form";
        }
        client.setId(id);
        clientService.save(client);
        return "redirect:/clients";
    }

    @GetMapping("/delete/{id}")
    public String deleteClient(@PathVariable("id") Long id) {
        clientService.delete(id);
        return "redirect:/clients";
    }
}
