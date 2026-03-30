package com.forage.repository;

import com.forage.model.StatutTravaux;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutTravauxRepository extends JpaRepository<StatutTravaux, Long> {}
