package com.thenine.hrmsystem.domain;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class Department {

    private Integer ID;
    private String name;
    private Integer officeID;
}
