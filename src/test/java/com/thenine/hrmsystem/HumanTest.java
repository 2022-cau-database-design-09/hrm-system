package com.thenine.hrmsystem;

import com.thenine.hrmsystem.domain.Human;
import com.thenine.hrmsystem.repository.HumanRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.*;

@SpringBootTest
public class HumanTest {

    @Autowired
    private HumanRepository humanRepository;

    @Test
    void 이름으로_조회() {
        final String testName = "우유윤";
        Optional<Human> testHuman = humanRepository.getHumanByName(testName);
        testHuman.ifPresent(human -> assertEquals(human.getName(), testName));
    }
}
