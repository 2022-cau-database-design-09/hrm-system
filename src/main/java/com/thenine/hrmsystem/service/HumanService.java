package com.thenine.hrmsystem.service;

import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.repository.HumanRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HumanService {

    private final HumanRepository humanRepository;

    HumanService (HumanRepository humanRepository) {
        this.humanRepository = humanRepository;
    }

    public List<Human> getHumanByName(String name) {
        return humanRepository.getHumanByName(name);
    }
}
