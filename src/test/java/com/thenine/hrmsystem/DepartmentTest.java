package com.thenine.hrmsystem;

import com.thenine.hrmsystem.domain.Department;
import com.thenine.hrmsystem.repository.DepartmentRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

@SpringBootTest
public class DepartmentTest {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    void 이름으로_조회 () {
        final String testDepartmentName = "생산기술";
        Optional<Department> testDepartment = departmentRepository.getDepartmentByName(testDepartmentName);
        testDepartment.ifPresent(department -> assertEquals(testDepartment.get().getName(), testDepartmentName));
    }
}
