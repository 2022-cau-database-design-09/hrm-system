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
//해당 부서가 사용하는 사무실이 추가적으로 수용할 수 있는 인원 수
```
DROP FUNCTION IF EXISTS getAcceptableEmployeeNumber;
CREATE FUNCTION getAcceptableEmployeeNumber(departmentID int) RETURNS int
BEGIN
	declare ret int
    declare gap int
    ret=0
    gap=0
    
    select count(D.ID) into ret
	from Department D where D.ID=departmentID
	inner join Office O on D.office_ID=O.ID
	inner join DepartmentMember DM on D.id=DM.department_ID
	group by D.ID
    
    if ret!=0 then
		select O.capacity into gap
        from Department D where D.ID=departmentID
        inner join Office O where on D.office_ID=O.ID
    end if
    
    return ret-gap
END//
```
//해당 부서의 상급부서
```
DROP FUNCTION IF EXISTS getParentDepartment
CREATE FUNCTION getParentDepartment(departmentID int) RETURNS int
BEGIN
	declare ret int
    
    select parent_department into ret
	from DepartmentHierarchy where child_department=departmentID
    
    return ret
END//
```
//(부서를 옮기고 싶은 직원,옮길 부서)
```
DELIMITER //
DROP PROCEDURE IF EXISTS `MoveDepartment`;
CREATE PROCEDURE `MoveDepartment` (employeeID INTEGER, departmentID int)
BEGIN
	declare now int
    -- 옮길 부서가 자리가 없으면 안 옮긴다
	if getAcceptableEmployeeNumber(departmentID)>0 then
    -- 현재 소속된 부서 기록을 모두 지운다.
        delete from DepartmentMember where employeeID=employee_ID
        now=departmentID
        -- 들어갈 부서와 그 부서의 상급 부서들까지 모두 소속되게 한다
        while now is not null
			begin
			insert into DepartmentMember values(now,employeeID)
			now=getParentDepartment(now)
			end
    end if
END//
DELIMITER;
```
3. (권구현) 임직원 일괄 휴가 지급 프로시저
```
DELIMITER //
DROP PROCEDURE IF EXISTS GiveVacationForAllEmployees//
CREATE PROCEDURE GiveVacationForAllEmployees (vacation_type INTEGER, remaining_time DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR 1452 -- foreign key error / does not exist vacation_type
		BEGIN
			SELECT CONCAT('No Vacation_type found with id ', vacation_type);
		END;
    
    INSERT INTO vacationAvailable (employee_ID, vacation_type,remaining_time)
    SELECT ID, vacation_type, remaining_time FROM employee;
END//
DELIMITER ;
```

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
2. (송섬균) 임직 사람들 목록 리턴 : 친해지고 싶은 사람들의 주변인들부터 알아가면 친해지기 쉽다
3. (조언욱) 임직원의 남은 총 휴가 시간 리턴
```
--휴가 타입에 따라 휴가 일수를 반환
DELIMITER //
DROP FUNCTION TRANS_TYPE;
CREATE FUNCTION TRANS_TYPE(vacationType int) 
RETURNS int DETERMINISTIC
RETURN
		CASE vacationType 
			WHEN 1 
				THEN 1 
			WHEN 2
				THEN 1
			WHEN 3
				THEN 1
			WHEN 4
				THEN 3
			WHEN 5
				THEN 2
			WHEN 6
				THEN 1
			WHEN 7
				THEN 1
			WHEN 8
				THEN 1
		END//
DELIMITER ;
```
```
-- 임직원의 남은 총 휴가를 반환 
DELIMITER //
DROP FUNCTION IF EXISTS TOTAL_VACATION;
CREATE FUNCTION TOTAL_VACATION (employeeID int)
RETURNS INT
BEGIN 
	DECLARE returnVal int
    
    SELECT SUM(TRANS_TYPE(v.vacation_type)) INTO returnVal
    FROM VacationAvailable v
    LEFT JOIN VacationType vt on v.vacation_type = vt.ID
    WHERE v.employee_ID = employeeID
    GROUP BY v.employee_ID
    
    RETURN returnVal
END//
DELIMITER ;
-- 임직원의 남은 총 휴가를 반환 
```
## Trigger
1. (권구현) Applicant가 pass 되었을때 임직원으로 배치 or 급여 변동시 로그 테이블에 기록
'''
DELIMITER //
DROP TRIGGER IF EXISTS ApplicantToEmployee //
CREATE TRIGGER ApplicantToEmployee AFTER UPDATE ON Applicant FOR EACH ROW
BEGIN
	IF new.pass=true AND old.pass=false AND new.human_ID NOT IN (SELECT human_ID FROM Employee )THEN
		INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES 
        (new.human_ID, 10, now(), NULL);
        INSERT INTO Payment VALUES((SELECT ID FROM Employee WHERE Employee.human_ID=new.human_ID),25000000);
        INSERT INTO DepartmentMember VALUES ((SELECT department FROM Recruiting WHERE ID=new.recruiting_ID), (SELECT ID FROM Employee WHERE Employee.human_ID=old.human_ID));
        
	END IF;
END//
DELIMITER ;
'''
2. (조언욱) 임직원의 진급 시 로그 테이블에 기록
3. (조언욱) 휴가 변동 시 로그 테이블에 기록

## 조회 쿼리 

### 정석우
1. 최종 학력 별 임직원의 현재 연봉 (Payment) 통계 조회
2. 연차 별 임직원의 현재 연봉 통계 

### 송섬균
1. 부서별로 차지하는 비율이 가장 높은 학교 조회 : 적응을 잘 못하는 임직원을 같은 학교가 많은 부서로 옮겨줄 수 있다
2. 사무실 층 별 사용하는 인원 수 조회 : 너무 한쪽에만 몰리면 소외되는 층이 발생할 수 있어 부대편성때 골고루 할 수 있게 도와준다

### 권구현
1. 특정 부서의 모든 하위부서의 임직원 조회
2. 특정 임직원의 가용 휴가 시간의 합 조회

### 조언욱
1. 부서 별로 임직원에게 요구되는 교육에 대한 정보를 조회
```
 -- 부서 별로 임직원에게 요구되는 교육에 대한 정보를 조회
SELECT d.name as department_name, Edu.edu_name, Edu.mandatory, Edu.due_date, EmInfo.employee_ID, EmInfo.employee_name
    FROM Department d 
    LEFT JOIN (
        SELECT t.department as dept, t.name as edu_name, mandatory, t.due_date, employee_ID
        FROM EducationType t 
        NATURAL JOIN Education e1) Edu on d.ID = Edu.dept
    natural JOIN (
        SELECT e2.ID as employee_ID, h.name as employee_name
        FROM Employee e2
        NATURAL JOIN Human h) EmInfo 
```
2. 채용에 지원하는 지원자에 대한 정보를 조회
```
-- 채용에 지원하는 지원자에 대한 정보를 조회
SELECT d.name as department_name, Recruit.recruit_type, Appli.applicant_name, Appli.pass,
Academic.academic_type, Academic.school_name, Academic.major_name
    FROM Department d
    LEFT JOIN(
        SELECT r.ID as recruit_ID, rt.type as recruit_type, r.department as dept
        FROM Recruiting r
        LEFT JOIN RecruitingType rt on r.type = rt.ID
        ) Recruit on d.ID = Recruit.dept
    LEFT JOIN (
        SELECT a.recruiting_ID, a.pass as pass, h.name as applicant_name, h.academic_background as background
        FROM Applicant a
        LEFT JOIN Human h on a.human_ID = h.ID) Appli on Recruit.recruit_ID = Appli.recruiting_ID
    LEFT JOIN (
        SELECT ab.ID as academic_ID , ab.type as academic_type, s.name as school_name, m.name as major_name
        FROM Academicbackground ab
        LEFT JOIN School s on ab.school_ID = s.ID 
        LEFT JOIN Major m on ab.major_ID = m.ID) Academic on Appli.background = Academic.academic_ID
    WHERE  Recruit.recruit_type is not null
```

#### 목표
1. 친목을 위한 기능
