package com.thenine.hrmsystem.controller;

import com.thenine.hrmsystem.domain.Employee;
import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.dto.OfficePeopleCountDto;
import com.thenine.hrmsystem.service.DepartmentService;
import com.thenine.hrmsystem.service.HumanService;
import com.thenine.hrmsystem.service.OfficeService;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final HumanService humanService;

    private final OfficeService officeService;

    private final DepartmentService departmentService;

    @GetMapping("/human")
    public ResponseEntity<List<Human>> getHumanByName (@RequestParam String name) {
        List<Human> foundHuman = humanService.getHumanByName(name);
        if (foundHuman.isEmpty()) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return ResponseEntity.ok(foundHuman);
    }

    @GetMapping("/office/usage")
    public ResponseEntity<List<OfficePeopleCountDto>> getOfficeCurrentUsage() {
        List<OfficePeopleCountDto> officePeopleCountDtoList = officeService.getOfficePeopleCount();
        if (officePeopleCountDtoList.isEmpty()) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return ResponseEntity.ok(officePeopleCountDtoList);
    }

    @GetMapping("/employee/department/sub")
    public ResponseEntity<List<Employee>> getSubordinateEmployeeList(@RequestParam int rootDepartmentID) {
        List<Employee> subEmployeeList = departmentService.getInferiorEmployeeList(rootDepartmentID);
        if (subEmployeeList.isEmpty()) return ResponseEntity.ok(Collections.emptyList());
        return ResponseEntity.ok(subEmployeeList);
    }
}
