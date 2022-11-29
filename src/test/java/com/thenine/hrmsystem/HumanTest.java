package com.thenine.hrmsystem;

import com.thenine.hrmsystem.repository.HumanRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

@SpringBootTest
public class HumanTest {

    @Autowired
    private HumanRepository humanRepository;

    @Test
    void 사람_이름_전부_조회 () {
        List<String> nameList = humanRepository.getHumanNameList();
        assertNotEquals(nameList.size(), 0);
    }
}
