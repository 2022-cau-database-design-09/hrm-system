package com.thenine.hrmsystem.controller;

import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.dto.OfficePeopleCountDto;
import com.thenine.hrmsystem.service.HumanService;
import com.thenine.hrmsystem.service.OfficeService;

import lombok.AllArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@AllArgsConstructor
public class TestController {

    private HumanService humanService;

    private OfficeService officeService;
    @GetMapping("/human")
    public ResponseEntity<Human> getHumanByName (@RequestParam String name) {
        Optional<Human> foundHuman = humanService.getHumanByName(name);
        if (foundHuman.isEmpty()) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return ResponseEntity.ok(foundHuman.get());
    }

    @GetMapping("/office/usage")
    public ResponseEntity<List<OfficePeopleCountDto>> getOfficeCurrentUsage() {
        List<OfficePeopleCountDto> officePeopleCountDtoList = officeService.getOfficePeopleCount();
        if (officePeopleCountDtoList.isEmpty()) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return ResponseEntity.ok(officePeopleCountDtoList);
    }
}
