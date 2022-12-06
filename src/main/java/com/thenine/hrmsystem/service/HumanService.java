package com.thenine.hrmsystem.service;

import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.repository.HumanRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class HumanService {

    private final HumanRepository humanRepository;

    HumanService (HumanRepository humanRepository) {
        this.humanRepository = humanRepository;
    }

    public Optional<Human> getHumanByName(String name) {
        return humanRepository.getHumanByName(name);
    }
}
