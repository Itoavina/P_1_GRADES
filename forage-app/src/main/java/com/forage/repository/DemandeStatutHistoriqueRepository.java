package com.forage.repository;

import com.forage.model.DemandeStatutHistorique;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandeStatutHistoriqueRepository extends JpaRepository<DemandeStatutHistorique, Long> {
}
