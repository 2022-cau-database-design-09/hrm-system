# 쿼리 List up 및 배정

## Procedure
1. (정석우) 임직원의 연봉 n% 인상 프로시저
```
DROP PROCEDURE IF EXISTS `INCREASE_PAYMENT`;
CREATE PROCEDURE `INCREASE_PAYMENT` (ID INTEGER, incRate FLOAT)
BEGIN
    DECLARE existingPayment BIGINT;
    DECLARE newPayment BIGINT;
    DECLARE EXIT HANDLER FOR NOT FOUND
        BEGIN
            ROLLBACK;
            SELECT CONCAT('No Employee payment found with id', ID);
        END;

    SET existingPayment = IFNULL((SELECT salary FROM Payment WHERE employee_ID = ID), -1);
    IF existingPayment != -1 THEN
        SET newPayment = existingPayment * (1 + incRate * 0.01);
        UPDATE Payment SET salary = newPayment WHERE employee_ID = ID;
        INSERT PaymentHistory (employee_ID, prev_salary, current_salary, created_at)
            VALUES (ID, existingPayment, newPayment, NOW());
    END IF;
END;
```
2. (송섬균) 임직원의 부서 이동 프로시저
3. (권구현) 임직원 일괄 휴가 지급 프로시저

## Function
1. (정석우) 임직원의 한 달 근무 시간 통계 리턴
```
DELIMITER //
DROP FUNCTION IF EXISTS getMonthlyWorkTime;
CREATE FUNCTION getMonthlyWorkTime (getType VARCHAR(20), ID INT) RETURNS TIME
BEGIN
    DECLARE checkStartTime DATETIME;
    DECLARE checkEndTime DATETIME;

    IF getType = 'fixedRange' THEN
            SET checkStartTime = CURDATE() - INTERVAL 30 day;
            SET checkEndTime = CURDATE() + INTERVAL 1 day;
    ELSEIF getType = 'thisMonth' THEN
            SET checkStartTime = LAST_DAY(CURDATE() - INTERVAL 1 MONTH) + INTERVAL 1 DAY;
            SET checkEndTime = LAST_DAY(CURDATE());
    END IF;

    RETURN IFNULL((
            SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(end_time) - TIME_TO_SEC(start_time)))
            FROM CommuteTime
            WHERE employee_ID = ID
            AND (checkStartTime <= CommuteTime.start_time AND CommuteTime.end_time <= checkEndTime)
            GROUP BY employee_ID
        ), '00:00:00');

END //
DELIMITER ;
```
2. (송섬균) 공통점(학교, 직급, 부서, 받은 교육)을 가진 사람들 목록 리턴 : 친해지고 싶은 사람들의 주변인들부터 알아가면 친해지기 쉽다
3. (조언욱) 임직원의 남은 총 휴가 시간 리턴

## Trigger
1. (권구현) Applicant가 pass 되었을때 임직원으로 배치 or 급여 변동시 로그 테이블에 기록
2. (조언욱) 임직원의 진급 시 로그 테이블에 기록
3. (조언욱) 휴가 변동 시 로그 테이블에 기록

## 조회 쿼리 

### 정석우
1. 최종 학력 별 임직원의 현재 연봉 (Payment) 통계 조회
2. 

### 송섬균
1. 부서별로 차지하는 비율이 가장 높은 학교 조회 : 적응을 잘 못하는 임직원을 같은 학교가 많은 부서로 옮겨줄 수 있다
2. 사무실 층 별 사용하는 인원 수 조회 : 너무 한쪽에만 몰리면 소외되는 층이 발생할 수 있어 부대편성때 골고루 할 수 있게 도와준다

### 권구현
1. 특정 부서의 모든 하위부서의 임직원 조회
2. 특정 임직원의 가용 휴가 시간의 합 조회

### 조언욱
1. 부서 별로 임직원에게 요구되는 교육에 대한 정보를 조회
2. 채용에 지원하는 지원자에 대한 정보를 조회

#### 목표
1. 친목을 위한 기능
