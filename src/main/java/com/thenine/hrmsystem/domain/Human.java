package com.thenine.hrmsystem.domain;

import lombok.Builder;
import lombok.Getter;

import java.util.Date;

@Getter
@Builder
public class Human {

    private Long ID;
    private String name;
    private Date birthDate;
    private String phoneNumber;
    private String email;
    private Integer academicBackGround;
}
