package com.forage.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "demande")
public class Demande {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "client_id", nullable = false)
    @NotNull(message = "Le client est requis")
    private Client client;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_demande", nullable = false)
    private Date dateDemande;

    @NotBlank(message = "La description est requise")
    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @NotBlank(message = "Le lieu est requis")
    @Column(nullable = false, length = 255)
    private String lieu;

    @OneToMany(mappedBy = "demande", cascade = CascadeType.ALL, orphanRemoval = true)
    private java.util.List<Devis> devisList = new java.util.ArrayList<>();

    @OneToMany(mappedBy = "demande", cascade = CascadeType.ALL, orphanRemoval = true)
    private java.util.List<Travaux> travauxList = new java.util.ArrayList<>();

    public Demande() {}

    @PrePersist
    protected void onCreate() {
        if (dateDemande == null) dateDemande = new Date();
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Client getClient() { return client; }
    public void setClient(Client client) { this.client = client; }
    public Date getDateDemande() { return dateDemande; }
    public void setDateDemande(Date dateDemande) { this.dateDemande = dateDemande; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getLieu() { return lieu; }
    public void setLieu(String lieu) { this.lieu = lieu; }
    public java.util.List<Devis> getDevisList() { return devisList; }
    public void setDevisList(java.util.List<Devis> devisList) { this.devisList = devisList; }
    public java.util.List<Travaux> getTravauxList() { return travauxList; }
    public void setTravauxList(java.util.List<Travaux> travauxList) { this.travauxList = travauxList; }
}
