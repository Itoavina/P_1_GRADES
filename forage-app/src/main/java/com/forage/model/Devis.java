package com.forage.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "devis")
public class Devis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "demande_id", nullable = false)
    private Demande demande;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_devis_id", nullable = false)
    private TypeDevis typeDevis;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "statut_id", nullable = false)
    private Statut statut;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "date_devis", nullable = false)
    private Date dateDevis;

    @OneToMany(mappedBy = "devis", cascade = CascadeType.ALL, orphanRemoval = true)
    private java.util.List<DetailDevis> detailDevisList = new java.util.ArrayList<>();

    public Devis() {}

    @PrePersist
    protected void onCreate() {
        if (dateDevis == null) dateDevis = new Date();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Demande getDemande() { return demande; }
    public void setDemande(Demande demande) { this.demande = demande; }
    public TypeDevis getTypeDevis() { return typeDevis; }
    public void setTypeDevis(TypeDevis typeDevis) { this.typeDevis = typeDevis; }
    public Statut getStatut() { return statut; }
    public void setStatut(Statut statut) { this.statut = statut; }
    public Date getDateDevis() { return dateDevis; }
    public void setDateDevis(Date dateDevis) { this.dateDevis = dateDevis; }
    public java.util.List<DetailDevis> getDetailDevisList() { return detailDevisList; }
    public void setDetailDevisList(java.util.List<DetailDevis> detailDevisList) { this.detailDevisList = detailDevisList; }
}
