package com.thenine.hrmsystem.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HumanRepository {

    private final JdbcTemplate jdbcTemplate;

    HumanRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> getHumanList() {
        return jdbcTemplate.queryForList("SELECT name FROM test", String.class);
    }
}
