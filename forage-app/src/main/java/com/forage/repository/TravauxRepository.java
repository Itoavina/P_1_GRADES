package com.forage.repository;

import com.forage.model.Travaux;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TravauxRepository extends JpaRepository<Travaux, Long> {}
