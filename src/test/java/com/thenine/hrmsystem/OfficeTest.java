package com.thenine.hrmsystem;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.thenine.hrmsystem.dto.OfficePeopleCountDto;
import com.thenine.hrmsystem.repository.DepartmentRepository;
import com.thenine.hrmsystem.repository.OfficeRepository;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class OfficeTest {

    @Autowired
    private OfficeRepository officeRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    @Test
    void 층별_근무자_집계 () {
        List<OfficePeopleCountDto> officePeopleCountDto = officeRepository.getPeopleCountByOfficeFloor();
        int sum = officePeopleCountDto.stream().mapToInt(OfficePeopleCountDto::getPeopleCount).sum();
        assertEquals(sum, departmentRepository.getHumanInDepartmentCount());
    }
}
