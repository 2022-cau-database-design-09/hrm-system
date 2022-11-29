package com.thenine.hrmsystem.service;

import com.thenine.hrmsystem.repository.HumanRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HumanService {

    private final HumanRepository humanRepository;

    HumanService (HumanRepository humanRepository) {
        this.humanRepository = humanRepository;
    }

    public List<String> getHumanList() {
        return humanRepository.getHumanList();
    }
}
