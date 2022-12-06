package com.thenine.hrmsystem.service;

import com.thenine.hrmsystem.domain.Employee;
import com.thenine.hrmsystem.repository.DepartmentRepository;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepartmentService {

    private final DepartmentRepository departmentRepository;

    public List<Employee> getInferiorEmployeeList (int id) {
        return departmentRepository.getInferiorEmployeeList(id);
    }
}
