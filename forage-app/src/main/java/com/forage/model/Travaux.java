package com.forage.model;

import jakarta.persistence.*;

@Entity
@Table(name = "travaux")
public class Travaux {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "demande_id", nullable = false)
    private Demande demande;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "statut_travaux_id", nullable = false)
    private StatutTravaux statutTravaux;

    public Travaux() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Demande getDemande() { return demande; }
    public void setDemande(Demande demande) { this.demande = demande; }
    public StatutTravaux getStatutTravaux() { return statutTravaux; }
    public void setStatutTravaux(StatutTravaux statutTravaux) { this.statutTravaux = statutTravaux; }
}
