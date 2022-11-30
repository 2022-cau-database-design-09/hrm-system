# hrm-system
Implement a human resource management system for small businesses

## Code Guide

본 가이드는 Spring / Spring Boot 환경에 익숙하지 않은 Java 사용자를 대상으로 합니다.
또한, 빠른 시간 내에 실제 작동하는 쿼리를 Java 프로그래밍으로 마이그레이션 하는 것이 목적이므로, 객체 지향스럽거나 Spring F/W의 철학에 맞지 않는 부분이 다수 존재할 수 있습니다. 

1. 기능을 상세히 정한다.
-> human_ID로 검색하여 해당 임직원의 근로 시간 합계 추출

2. 쿼리를 작성한다
 ```
 SELECT Employee.ID AS employee_ID,
SEC_TO_TIME(SUM(TIME_TO_SEC(CommuteTime.end_time) - TIME_TO_SEC(CommuteTime.start_time))) AS total_work_time 
FROM Employee 
LEFT JOIN CommuteTime ON CommuteTime.employee_ID = Employee.ID 
WHERE human_ID = ? GROUP BY Employee.ID;
```

3.  작성한 쿼리 중 파라미터가 될 수 있는 부분을 선택
-> 상기 예시에서는 human_ID 가 파라미터가 됨 

4. JdbcTemplate으로 RDB <-> Java Object 변환하는 메소드 작성
com.thenine.hrmsystem.repository 패키지 아래 '각 엔티티 이름 + Repository.java'파일 생성한 후, (HumanRepository.java)
JdbcTemplate 으로 불러온 데이터를 Java Object로 변환하는 과정은 [공식 가이드](https://docs.spring.io/spring-framework/docs/3.0.x/spring-framework-reference/html/jdbc.html) 참고

5. 해당 테스트 코드 작성
Repository와 마찬가지로 각 엔티티 이름 + Test.java 파일 생성한 후, (HumanTest.java)
Repository의 결과물을 JUnit 라이브러리 사용하여 테스트 코드 작성

[JUnit 공식 가이드](https://junit.org/junit5/docs/current/user-guide/#writing-tests)

[테스트 코드 작성법](https://velog.io/@yyong3519/JUnit5%EC%9C%BC%EB%A1%9C-%EB%8B%A8%EC%9C%84-%ED%85%8C%EC%8A%A4%ED%8A%B8-%EC%BD%94%EB%93%9C-%EC%9E%91%EC%84%B1)

[JdbcTemplate에서 Procedure 호출하는 법](https://stackoverflow.com/questions/9361538/spring-jdbc-template-for-calling-stored-procedures)

[JdbcTemplate에서 Function 호출하는 법](https://www.tutorialspoint.com/springjdbc/springjdbc_stored_function.htm)


