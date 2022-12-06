package com.thenine.hrmsystem.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.Date;

@Getter
@Builder
@ToString
public class Employee {

    private Integer humanID;
    private Integer ID;
    private Integer currentPosition;
    private Date entranceDate;
    private Date quitDate;
}
