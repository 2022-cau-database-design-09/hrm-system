package com.thenine.hrmsystem.repository;

import com.thenine.hrmsystem.domain.Department;
import com.thenine.hrmsystem.domain.Employee;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import org.springframework.util.LinkedCaseInsensitiveMap;

import java.sql.Types;
import java.util.*;

@Repository
public class DepartmentRepository {

    private final JdbcTemplate jdbcTemplate;

    DepartmentRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

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

    public List<Employee> getInferiorEmployeeList (int employeeID) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withProcedureName("AllEmployeesInChildDepartments")
                .declareParameters(
                        new SqlParameter("in_ID", Types.INTEGER),
                        new SqlOutParameter("human_ID",Types.INTEGER),
                        new SqlOutParameter("ID", Types.INTEGER),
                        new SqlOutParameter("current_position", Types.INTEGER),
                        new SqlOutParameter("entrance_date", Types.DATE),
                        new SqlOutParameter("quit_date", Types.DATE)
                        );

        Map<String, Object> employeeMap = simpleJdbcCall.execute(new MapSqlParameterSource("in_ID", employeeID));
        List<LinkedCaseInsensitiveMap> employeeList = (List<LinkedCaseInsensitiveMap>) employeeMap.get("#result-set-1");

        List<Employee> resultList = new ArrayList<>();
        for (LinkedCaseInsensitiveMap eachMap : employeeList) {
            resultList.add(Employee.builder()
                    .ID((Integer) eachMap.get("ID"))
                    .humanID((Integer) eachMap.get("human_ID"))
                    .currentPosition((Integer) eachMap.get("current_position"))
                    .entranceDate((Date) eachMap.get("entrance_date"))
                    .quitDate((Date) eachMap.get("quit_date"))
                    .build());
        }
        return resultList;
    }
}
