package com.thenine.hrmsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thenine.hrmsystem.dto.OfficePeopleCountDto;
import com.thenine.hrmsystem.repository.OfficeRepository;

@Service
public class OfficeService {

    private final OfficeRepository officeRepository;

    OfficeService (OfficeRepository officeRepository) { this.officeRepository = officeRepository; }

    public List<OfficePeopleCountDto> getOfficePeopleCount() {
        return officeRepository.getPeopleCountByOfficeFloor();
    }
}
