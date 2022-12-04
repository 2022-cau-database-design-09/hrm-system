package com.thenine.hrmsystem.repository;

import com.thenine.hrmsystem.domain.Human;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class HumanRepository {

    private final JdbcTemplate jdbcTemplate;

    HumanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Optional<Human> getHumanByName(String name) {
        return Optional.ofNullable(
                jdbcTemplate.queryForObject("SELECT * FROM Human WHERE name = ?",
                        (rs, rowNum) -> Human.builder()
                                .ID(rs.getBigDecimal("ID").longValue())
                                .name(rs.getString("name"))
                                .birthDate(rs.getDate("birth_date"))
                                .academicBackGround(rs.getInt("academic_background"))
                                .build(), name));
    }
}
