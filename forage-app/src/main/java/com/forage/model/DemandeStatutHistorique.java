package com.forage.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "demande_statut_historique")
public class DemandeStatutHistorique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @com.fasterxml.jackson.annotation.JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "demande_id", nullable = false)
    private Demande demande;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_statut", nullable = false)
    private Statut statut;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_changement", nullable = false)
    private Date dateChangement;

    public DemandeStatutHistorique() {}

    public DemandeStatutHistorique(Demande demande, Statut statut) {
        this.demande = demande;
        this.statut = statut;
        this.dateChangement = new Date();
    }

    public DemandeStatutHistorique(Demande demande, Statut statut, String description) {
        this.demande = demande;
        this.statut = statut;
        this.description = description;
        this.dateChangement = new Date();
    }

    @PrePersist
    protected void onCreate() {
        if (dateChangement == null) dateChangement = new Date();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Demande getDemande() { return demande; }
    public void setDemande(Demande demande) { this.demande = demande; }
    public Statut getStatut() { return statut; }
    public void setStatut(Statut statut) { this.statut = statut; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getDateChangement() { return dateChangement; }
    public void setDateChangement(Date dateChangement) { this.dateChangement = dateChangement; }
}
