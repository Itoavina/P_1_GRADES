package com.forage.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.forage.model.Devis;

@Repository
public interface DevisRepository extends JpaRepository<Devis, Long> {

    // Query récupérer-na montant total mila décommenter-na
    @Query("SELECT CASE WHEN SUM(d.montant) IS NULL THEN 0 ELSE SUM(d.montant) END FROM DetailDevis d")
    BigDecimal calculateTotalChiffreAffaire();
}
