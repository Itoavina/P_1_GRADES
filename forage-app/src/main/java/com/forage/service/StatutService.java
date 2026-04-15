package com.forage.service;

import com.forage.model.Statut;
import com.forage.repository.StatutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StatutService {

    @Autowired
    private StatutRepository statutRepository;

    public List<Statut> findAll() { return statutRepository.findAll(); }
    public Statut findById(Long id) { return statutRepository.findById(id).orElse(null); }
    public Statut save(Statut statut) { return statutRepository.save(statut); }
    public void delete(Long id) { statutRepository.deleteById(id); }
}
