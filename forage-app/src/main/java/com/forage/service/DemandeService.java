package com.forage.service;

import com.forage.model.Demande;
import com.forage.repository.DemandeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DemandeService {

    @Autowired
    private DemandeRepository demandeRepository;

    public List<Demande> findAll() { return demandeRepository.findAll(); }
    public Demande findById(Long id) { return demandeRepository.findById(id).orElse(null); }
    public Demande save(Demande demande) { return demandeRepository.save(demande); }
    public void delete(Long id) { demandeRepository.deleteById(id); }
}
