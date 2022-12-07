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
DELIMITER //
DROP FUNCTION IF EXISTS getAcceptableEmployeeNumber//
CREATE FUNCTION getAcceptableEmployeeNumber(departmentID int) RETURNS int
BEGIN
	declare ret int;
    declare gap int;
    -- ret: 부서별 사람 수
    select count(D.ID) into ret
	from Department D
	inner join DepartmentMember DM on D.id=DM.department_ID
    where D.ID=departmentID
	group by D.ID;
    -- cap : 부서에서 사용하는 사무실의 capacity
    select O.capacity into gap
	from Department D
	inner join Office O on D.office_ID=O.ID
	where D.ID=departmentID;
    
    return gap-ret;
END//
DELIMITER ;
```
//해당 부서의 상급부서
```
DELIMITER //
DROP FUNCTION IF EXISTS getParentDepartment//
CREATE FUNCTION getParentDepartment(departmentID int) RETURNS int
BEGIN
	declare ret int;
    
    select parent_department into ret
	from DepartmentHierarchy 
    where child_department=departmentID;
    
    return ret;
END//
DELIMITER ;
```
//(부서를 옮기고 싶은 직원,옮길 부서)
```
DELIMITER //
DROP PROCEDURE IF EXISTS MoveDepartment//
CREATE PROCEDURE MoveDepartment (employeeID INTEGER, departmentID int)
BEGIN
	if getAcceptableEmployeeNumber(departmentID)>0 then
        delete from DepartmentMember where employeeID=employee_ID;
        insert into DepartmentMember values(departmentID,employeeID);
    	end if;
END//
DELIMITER ;
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

4. (권구현) 하위 부서 임직원 정보 조회 (본인 부서와 반복되는 하위 부서의 하위 부서 포함)
```
DELIMITER //
DROP PROCEDURE IF EXISTS AllEmployeesInChildDepartments//
CREATE PROCEDURE AllEmployeesInChildDepartments(ID int)
BEGIN
	WITH RECURSIVE child_departments (department_ID) AS
    (
		SELECT department_ID FROM DepartmentMember WHERE employee_ID=ID
        UNION ALL	
        SELECT h.child_department FROM DepartmentHierarchy AS h
        JOIN child_departments AS c ON c.department_ID=h.parent_department
    )
    SELECT * FROM Employee AS e
    WHERE e.ID IN (SELECT employee_ID AS ID FROM DepartmentMember NATURAL JOIN child_departments);
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
2. (송섬균) 해당 부서에서 해당 전공이 차지하는 비율
```
-- 해당 부서에 해당 전공을 가진 사람의 수
DELIMITER //
DROP FUNCTION IF EXISTS getDepartmentNum //
CREATE FUNCTION getDepartmentNum(departmentID int, MajorID int) RETURNS int
BEGIN
	declare ret int;
    
    select count(DM.department_ID) into ret
	from employee E
	inner join Human H on E.Human_ID=H.ID
	inner join AcademicBackground AB on H.academic_background=AB.ID and AB.Major_ID=MajorID
	inner join DepartmentMember DM on E.ID=DM.employee_ID and DM.department_ID=departmentID
    group by DM.department_ID;
    
    return ret;
END//
DELIMITER ;
```
```
-- 해당 부서에서 해당 전공이 차지하는 비율
DELIMITER //
DROP FUNCTION IF EXISTS getPercentMajor //
CREATE FUNCTION getPercentMajor(departmentID int, MajorID int) RETURNS float
BEGIN
	declare ret float;
    select getDepartmentNum(departmentID,MajorID)/sum(getDepartmentNum(departmentID,M.ID)) into ret
    from Major M where ID is not null
    group by M.ID;
    
    return ret;
END//
DELIMITER ;
```
3. (조언욱) 임직원의 남은 총 휴가 시간 리턴

## Trigger
1. (권구현) Applicant가 pass 되었을때 임직원으로 배치 or 급여 변동시 로그 테이블에 기록
```
DELIMITER //
DROP TRIGGER IF EXISTS ApplicantToEmployee //
CREATE TRIGGER ApplicantToEmployee AFTER UPDATE ON Applicant FOR EACH ROW
BEGIN
    IF new.pass=true AND old.pass=false AND new.human_ID NOT IN (SELECT human_ID FROM Employee ) THEN
        INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (new.human_ID, 10, now(), NULL);
        INSERT INTO Payment VALUES((SELECT ID FROM Employee WHERE Employee.human_ID=new.human_ID),25000000);
        INSERT INTO DepartmentMember VALUES ((SELECT department FROM Recruiting WHERE ID=new.recruiting_ID),(SELECT ID FROM Employee WHERE Employee.human_ID=old.human_ID));
    END IF;
END//
DELIMITER ;
```

2. (조언욱) 임직원의 진급 시 로그 테이블에 기록

3. (조언욱) 휴가 변동 시 로그 테이블에 기록

## 조회 쿼리 
### 정석우
1. 최종 학력 별 임직원의 현재 연봉 (Payment) 통계 조회
2. 연차 별 임직원의 현재 연봉 통계 

### 송섬균
1. 부서별로 차지하는 비율이 가장 높은 학교 조회 : 적응을 잘 못하는 임직원을 같은 학교가 많은 부서로 옮겨줄 수 있다
```
select distinct D.name 부서, S.name 학교, myS2.M 인원수
from (
	select distinct Q, P, max(C) as M
	from (
		select DM.department_ID as Q, AB.school_ID as P, count(AB.school_ID) as C
		from employee E
		inner join Human H on E.Human_ID=H.ID
		inner join AcademicBackground AB on H.academic_background=AB.ID
		inner join DepartmentMember DM on E.ID=DM.employee_ID
		group by Q, P
	) myS1
	group by Q, P
) myS2
left join Department D on D.ID=myS2.Q
left join School S on S.ID=myS2.P
inner join (
	select DM.department_ID as Q, AB.school_ID as P, count(AB.school_ID) as C
	from employee E
	inner join Human H on E.Human_ID=H.ID
	inner join AcademicBackground AB on H.academic_background=AB.ID
	inner join DepartmentMember DM on E.ID=DM.employee_ID
	group by Q, P
) myS3
where myS2.M=myS3.C and myS2.Q=myS3.Q and myS2.P=myS3.P
order by D.name
```
2. 사무실 층 별 사용하는 인원 수 조회 : 너무 한쪽에만 몰리면 소외되는 층이 발생할 수 있어 부대편성때 골고루 할 수 있게 도와준다
```
select O.floor 층, sum(myS.C) 총원
from (
	select DM.department_ID dID, count(DM.department_ID) C
	from DepartmentMember DM
	group by DM.department_ID
) myS
inner join Department D on D.ID=myS.dID
inner join Office O on O.ID=D.office_ID
group by O.floor
```

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



```
--휴가 타입에 따라 휴가 일수를 반환
DELIMITER //
DROP FUNCTION IF EXISTS TRANS_TYPE;
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
```
```
DELIMITER //
CREATE TRIGGER `promotionhistory_AFTER_UPDATE` AFTER UPDATE ON `employee` FOR EACH ROW 
BEGIN
	INSERT INTO PromotionHistory (prev_position, current_position, created_at) VALUES 
    (OLD.Employee.current_position, new.Employee.current_position, now());
END; //
```
\
```
DELIMITER //
CREATE TRIGGER `vacationhistory_AFTER_DELETE` AFTER DELETE ON `vacationavailable` FOR EACH ROW BEGIN
	INSERT INTO VacationHistory (employee_ID, vacation_type, created_at) VALUES 
    (old.vacationAvailable.employee_ID, old.vacationAvailable.vacation_type, now());
END; //
```
