package com.thenine.hrmsystem.repository;

import com.thenine.hrmsystem.domain.Department;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public class DepartmentRepository {

    private final JdbcTemplate jdbcTemplate;

    DepartmentRepository(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    public Optional<Department> getDepartmentByName(String name) {
        return Optional.ofNullable(
                jdbcTemplate.queryForObject("SELECT * FROM Department WHERE name = ?",
                        (rs, rowNum) -> Department.builder()
                                .ID(rs.getInt("ID"))
                                .name(rs.getString("name"))
                                .officeID(rs.getInt("office_ID"))
                                .build(), name));
    }

    public Integer getHumanInDepartmentCount() {
        return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM DepartmentMember", Integer.class);
    }
}
