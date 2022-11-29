package com.thenine.hrmsystem.controller;

import com.thenine.hrmsystem.service.HumanService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
public class TestController {

    private HumanService humanService;

    @GetMapping("/test")
    public List<String> testHello() {
        return humanService.getHumanList();
    }
}
