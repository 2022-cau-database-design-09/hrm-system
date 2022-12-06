package com.thenine.hrmsystem;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.thenine.hrmsystem.dto.OfficePeopleCountDto;
import com.thenine.hrmsystem.repository.OfficeRepository;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class OfficeTest {

    @Autowired
    private OfficeRepository officeRepository;

    @Test
    void 층별_근무자_집계 () {
        List<OfficePeopleCountDto> officePeopleCountDto = officeRepository.getPeopleCountByOfficeFloor();
        int sum = officePeopleCountDto.stream().mapToInt(OfficePeopleCountDto::getPeopleCount).sum();
        assertEquals(sum, 14);
    }
}
