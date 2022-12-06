package com.thenine.hrmsystem.repository;

import com.thenine.hrmsystem.domain.Human;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Repository
public class HumanRepository {

    private final JdbcTemplate jdbcTemplate;

    HumanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Human> getHumanByName(String name) {
        List<Human> sameNameHumanList;
        try {
            sameNameHumanList = jdbcTemplate.query("SELECT * FROM Human WHERE name = ?",
                    (rs, rowNum) -> Human.builder()
                        .ID(rs.getBigDecimal("ID").longValue())
                        .name(rs.getString("name"))
                        .birthDate(rs.getDate("birth_date"))
                        .email(rs.getString("email"))
                        .phoneNumber(rs.getString("phone_number"))
                        .academicBackGround(rs.getInt("academic_background"))
                        .build(), name);
        } catch (EmptyResultDataAccessException e) {
            return Collections.emptyList();
        }
        return sameNameHumanList;
    }
}
