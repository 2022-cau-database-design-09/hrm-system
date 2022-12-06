package com.thenine.hrmsystem.repository;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.thenine.hrmsystem.dto.OfficePeopleCountDto;

@Repository
public class OfficeRepository {

    private final JdbcTemplate jdbcTemplate;

    OfficeRepository (JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    public List<OfficePeopleCountDto> getPeopleCountByOfficeFloor() {
        List<OfficePeopleCountDto> officePeopleCountDto;
        try {
            officePeopleCountDto = jdbcTemplate.query(
                """
                    select O.floor, sum(myS.C) totalPeople
                    from (
                    \tselect DM.department_ID dID, count(DM.department_ID) C
                    \tfrom DepartmentMember DM
                    \tgroup by DM.department_ID
                    ) myS
                    inner join Department D on D.ID=myS.dID
                    inner join Office O on O.ID=D.office_ID
                    group by O.floor""",
                (rs, rowNum) -> OfficePeopleCountDto.builder()
                    .floor(rs.getInt("floor"))
                    .peopleCount(rs.getInt("totalPeople"))
                    .build());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return officePeopleCountDto;
    }
}
