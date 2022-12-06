package com.thenine.hrmsystem.repository;

import com.thenine.hrmsystem.domain.Human;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class HumanRepository {

    private final JdbcTemplate jdbcTemplate;

    HumanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Optional<Human> getHumanByName(String name) {
        Human res;
        try {
            res = jdbcTemplate.queryForObject("SELECT * FROM Human WHERE name = ?",
                    (rs, rowNum) -> Human.builder()
                        .ID(rs.getBigDecimal("ID").longValue())
                        .name(rs.getString("name"))
                        .birthDate(rs.getDate("birth_date"))
                        .email(rs.getString("email"))
                        .phoneNumber(rs.getString("phone_number"))
                        .academicBackGround(rs.getInt("academic_background"))
                        .build(), name);
        } catch (EmptyResultDataAccessException e) {
            e.printStackTrace();
            return Optional.empty();
        }
        assert res != null;
        return Optional.of(res);
    }
}
