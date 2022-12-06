package com.thenine.hrmsystem.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OfficePeopleCountDto {

    private int floor;
    private int peopleCount;
}
