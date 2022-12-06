package com.thenine.hrmsystem.controller;

import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.service.HumanService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@AllArgsConstructor
public class TestController {

    private HumanService humanService;

    @GetMapping("/human")
    public Human getHumanByName (@RequestParam String name) {
        Optional<Human> foundHuman = humanService.getHumanByName(name);
        return (foundHuman.orElse(Human.builder().build()));
    }
}
