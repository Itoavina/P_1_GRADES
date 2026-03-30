package com.forage.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Nom est requis")
    @Size(max = 150)
    @Column(nullable = false, length = 150)
    private String nom;

    @NotBlank(message = "Contact est requis")
    @Size(max = 150)
    @Column(nullable = false, length = 150)
    private String contact;

    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL, orphanRemoval = true)
    private java.util.List<Demande> demandes = new java.util.ArrayList<>();

    // Constructors
    public Client() {}

    public Client(String nom, String contact) {
        this.nom = nom;
        this.contact = contact;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public java.util.List<Demande> getDemandes() { return demandes; }
    public void setDemandes(java.util.List<Demande> demandes) { this.demandes = demandes; }
}
