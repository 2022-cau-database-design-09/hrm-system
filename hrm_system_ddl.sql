-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/WIumc0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Employee` (
    `human_ID` int  NOT NULL ,
    `ID` int AUTO_INCREMENT NOT NULL ,
    `current_position` int  NOT NULL ,
    `entrance_date` date  NOT NULL ,
    `quit_date` date ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Recruiting` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `department` int  NOT NULL ,
    `type` int  NOT NULL ,
    `start_time` datetime  NOT NULL ,
    `end_time` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `RecruitingType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Applicant` (
    `human_ID` int AUTO_INCREMENT  NOT NULL ,
    `recruiting_ID` int  NOT NULL ,
    `pass` boolean  NOT NULL ,
    PRIMARY KEY (
        `human_ID`
    )
);

CREATE TABLE `Payment` (
    `employee_ID` int  NOT NULL ,
    `salary` bigint  NOT NULL ,
    PRIMARY KEY (
        `employee_ID`
    )
);

CREATE TABLE `Annuity` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `receiver_ID` int  NOT NULL ,
    `amount` int  NOT NULL ,
    `given_year` date  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Rating` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `senior_ID` int  NOT NULL ,
    `junior_ID` int  NOT NULL ,
    `rank` varchar(5)  NOT NULL ,
    `description` text  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

-- Employee should take this course
CREATE TABLE `Education` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `type` int NOT NULL ,
    `employee_ID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `EducationType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(100)  NOT NULL ,
    `department` int  ,
    `mandatory` boolean  NOT NULL ,
    `due_date` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `EducationHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `education_ID` bigint  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Counselor` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `human_ID` int  NOT NULL ,
    `status` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `CounselingHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `counselor_ID` int  NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `name` varchar(200)  ,
    `description` text  ,
    `start_time` datetime  NOT NULL ,
    `end_time` datetime  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Department` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(30)  NOT NULL ,
    `office_ID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `DepartmentHierarchy` (
    `parent_department` int  NOT NULL ,
    `child_department` int  NOT NULL 
);

CREATE TABLE `DepartmentMember` (
    `department_ID` int  NOT NULL ,
    `employee_ID` int  NOT NULL 
);

CREATE TABLE `Office` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `floor` int  NOT NULL ,
    `room_number` int  NOT NULL ,
    `capacity` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `VacationType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(30)  NOT NULL ,
    `vacation_time` time  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `VacationAvailable` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `vacation_type` int  NOT NULL ,
    `remaining_time` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `VacationHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `vacation_type` int  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Incentive` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(20)  NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `given_date` date  NOT NULL ,
    `amount` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `SearchHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `type` int  NOT NULL ,
    `caller` int  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `SearchType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `PaymentHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `prev_salary` bigint  NOT NULL ,
    `current_salary` bigint  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `DepartmentHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `prev_department` int  NOT NULL ,
    `current_department` int  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `PromotionHistory` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `prev_position` int  NOT NULL ,
    `current_position` int  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `PositionType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `User` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `user_id` varchar(20)  NOT NULL ,
    `password` varchar(100)  NOT NULL ,
    `role_ID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `UserRole` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `role_name` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `CommuteTime` (
    `ID` bigint AUTO_INCREMENT NOT NULL ,
    `employee_ID` int  NOT NULL ,
    `start_time` datetime  NOT NULL ,
    `end_time` datetime  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Human` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(50)  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `phone_number` varchar(20)  NOT NULL ,
    `email` varchar(50)  NOT NULL ,
    `academic_background` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `AcademicBackground` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `type` varchar(50)  NOT NULL ,
    `school_ID` int  NOT NULL ,
    `major_ID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `School` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Major` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

ALTER TABLE `Employee` ADD CONSTRAINT `fk_Employee_human_ID` FOREIGN KEY(`human_ID`)
REFERENCES `Human` (`ID`);

ALTER TABLE `Employee` ADD CONSTRAINT `fk_Employee_current_position` FOREIGN KEY(`current_position`)
REFERENCES `PositionType` (`ID`);

ALTER TABLE `Recruiting` ADD CONSTRAINT `fk_Recruiting_department` FOREIGN KEY(`department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `Recruiting` ADD CONSTRAINT `fk_Recruiting_type` FOREIGN KEY(`type`)
REFERENCES `RecruitingType` (`ID`);

ALTER TABLE `Applicant` ADD CONSTRAINT `fk_Applicant_human_ID` FOREIGN KEY(`human_ID`)
REFERENCES `Human` (`ID`);

ALTER TABLE `Applicant` ADD CONSTRAINT `fk_Applicant_recruiting_ID` FOREIGN KEY(`recruiting_ID`)
REFERENCES `Recruiting` (`ID`);

ALTER TABLE `Payment` ADD CONSTRAINT `fk_Payment_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Annuity` ADD CONSTRAINT `fk_Annuity_receiver_ID` FOREIGN KEY(`receiver_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Rating` ADD CONSTRAINT `fk_Rating_senior_ID` FOREIGN KEY(`senior_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Rating` ADD CONSTRAINT `fk_Rating_junior_ID` FOREIGN KEY(`junior_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Education` ADD CONSTRAINT `fk_Education_type` FOREIGN KEY(`type`)
REFERENCES `EducationType` (`ID`);

ALTER TABLE `Education` ADD CONSTRAINT `fk_Education_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `EducationType` ADD CONSTRAINT `fk_EducationType_department` FOREIGN KEY(`department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `EducationHistory` ADD CONSTRAINT `fk_EducationHistory_education_ID` FOREIGN KEY(`education_ID`)
REFERENCES `Education` (`ID`);

ALTER TABLE `Counselor` ADD CONSTRAINT `fk_Counselor_human_ID` FOREIGN KEY(`human_ID`)
REFERENCES `Human` (`ID`);

ALTER TABLE `CounselingHistory` ADD CONSTRAINT `fk_CounselingHistory_counselor_ID` FOREIGN KEY(`counselor_ID`)
REFERENCES `Counselor` (`ID`);

ALTER TABLE `CounselingHistory` ADD CONSTRAINT `fk_CounselingHistory_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Department` ADD CONSTRAINT `fk_Department_office_ID` FOREIGN KEY(`office_ID`)
REFERENCES `Office` (`ID`);

ALTER TABLE `DepartmentHierarchy` ADD CONSTRAINT `fk_DepartmentHierarchy_parent_department` FOREIGN KEY(`parent_department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `DepartmentHierarchy` ADD CONSTRAINT `fk_DepartmentHierarchy_child_department` FOREIGN KEY(`child_department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `DepartmentMember` ADD CONSTRAINT `fk_DepartmentMember_department_ID` FOREIGN KEY(`department_ID`)
REFERENCES `Department` (`ID`);

ALTER TABLE `DepartmentMember` ADD CONSTRAINT `fk_DepartmentMember_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `VacationAvailable` ADD CONSTRAINT `fk_VacationAvailable_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `VacationAvailable` ADD CONSTRAINT `fk_VacationAvailable_vacation_type` FOREIGN KEY(`vacation_type`)
REFERENCES `VacationType` (`ID`);

ALTER TABLE `VacationHistory` ADD CONSTRAINT `fk_VacationHistory_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `VacationHistory` ADD CONSTRAINT `fk_VacationHistory_vacation_type` FOREIGN KEY(`vacation_type`)
REFERENCES `VacationType` (`ID`);

ALTER TABLE `Incentive` ADD CONSTRAINT `fk_Incentive_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `SearchHistory` ADD CONSTRAINT `fk_SearchHistory_type` FOREIGN KEY(`type`)
REFERENCES `SearchType` (`ID`);

ALTER TABLE `SearchHistory` ADD CONSTRAINT `fk_SearchHistory_caller` FOREIGN KEY(`caller`)
REFERENCES `User` (`ID`);

ALTER TABLE `PaymentHistory` ADD CONSTRAINT `fk_PaymentHistory_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `DepartmentHistory` ADD CONSTRAINT `fk_DepartmentHistory_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `DepartmentHistory` ADD CONSTRAINT `fk_DepartmentHistory_prev_department` FOREIGN KEY(`prev_department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `DepartmentHistory` ADD CONSTRAINT `fk_DepartmentHistory_current_department` FOREIGN KEY(`current_department`)
REFERENCES `Department` (`ID`);

ALTER TABLE `PromotionHistory` ADD CONSTRAINT `fk_PromotionHistory_prev_position` FOREIGN KEY(`prev_position`)
REFERENCES `PositionType` (`ID`);

ALTER TABLE `PromotionHistory` ADD CONSTRAINT `fk_PromotionHistory_current_position` FOREIGN KEY(`current_position`)
REFERENCES `PositionType` (`ID`);

ALTER TABLE `User` ADD CONSTRAINT `fk_User_role_ID` FOREIGN KEY(`role_ID`)
REFERENCES `UserRole` (`ID`);

ALTER TABLE `CommuteTime` ADD CONSTRAINT `fk_CommuteTime_employee_ID` FOREIGN KEY(`employee_ID`)
REFERENCES `Employee` (`ID`);

ALTER TABLE `Human` ADD CONSTRAINT `fk_Human_academic_background` FOREIGN KEY(`academic_background`)
REFERENCES `AcademicBackground` (`ID`);

ALTER TABLE `AcademicBackground` ADD CONSTRAINT `fk_AcademicBackground_school_ID` FOREIGN KEY(`school_ID`)
REFERENCES `School` (`ID`);

ALTER TABLE `AcademicBackground` ADD CONSTRAINT `fk_AcademicBackground_major_ID` FOREIGN KEY(`major_ID`)
REFERENCES `Major` (`ID`);

SET foreign_key_checks=0;
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (1,"우유윤","1989-05-27","010-2511-5276","cxggbw8576@cau.ac.kr",33);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (2,"이재민","1984-12-12","010-3418-4277","rvystmwcy024@gmail.com",14);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (3,"김무용","1996-10-06","010-946-6618","enzkycxfx5984@naver.com",48);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (4,"노성수","1994-05-27","010-776-1657","boygp4607@cau.ac.kr",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (5,"박무석","1975-06-10","010-126-3801","qpmxujj@naver.com",40);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (6,"박규선","1986-10-21","010-8138-0877","atxdknly965@naver.com",21);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (7,"우성윤","1974-05-21","010-9533-4380","oketlyhn228@gmail.com",10);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (8,"이재윤","1995-05-05","010-228-2653","cmpsajlfv62@cau.ac.kr",80);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (9,"권영균","1981-01-18","010-5228-7722","hdizcobzc9125@naver.com",15);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (10,"전재결","1987-02-10","010-637-6582","sbmbo3355@gmail.com",21);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (11,"좌유현","1971-11-15","010-1695-3649","peyanfe3428@cau.ac.kr",84);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (12,"권광용","1987-11-19","010-423-7787","vqgxiepj@cau.ac.kr",36);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (13,"신춘윤","1982-06-14","010-231-2264","obiwy53@gmail.com",10);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (14,"노재윤","1994-08-09","010-5426-3148","msrqcozij6738@naver.com",98);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (15,"장구현","1974-10-08","010-8026-1554","emuvn17@naver.com",9);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (16,"김영민","1991-03-26","010-3870-9307","mbppweqtg50@gmail.com",50);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (17,"백섬윤","1985-01-05","010-7711-2727","rjbxph@gmail.com",18);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (18,"우규훈","1984-05-10","010-2717-5832","rzjpxiogv3@naver.com",55);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (19,"신광선","1994-01-06","010-5801-5221","wkjilef5280@naver.com",72);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (20,"신무균","1978-06-23","010-9540-8592","nhhlq2796@gmail.com",22);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (21,"박재윤","1974-10-02","010-321-9087","ockvfajfr@naver.com",24);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (22,"홍정빈","1992-12-26","010-4259-2874","chzriwkb2@cau.ac.kr",126);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (23,"좌무우","1988-11-11","010-327-3133","hbbcpxi@naver.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (24,"송무석","1982-09-01","010-8803-0876","mbsztssh@cau.ac.kr",12);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (25,"백춘선","1991-02-28","010-944-5326","qurpixiq53@cau.ac.kr",56);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (26,"신성희","1972-09-11","010-5111-6002","fskuidubu368@naver.com",12);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (27,"노영용","1998-11-27","010-1332-9823","uhjzefczz@naver.com",24);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (28,"백근수","1998-10-11","010-7189-5979","jelrlpax@cau.ac.kr",11);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (29,"유광우","1984-05-24","010-1988-2693","ihrcqayb5@cau.ac.kr",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (30,"노유현","1995-05-06","010-830-9789","hmeckotrw0@gmail.com",6);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (31,"신근민","1972-06-17","010-536-8277","ygmdca03@cau.ac.kr",50);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (32,"노규용","1972-08-15","010-8429-3869","gajqkckl5@naver.com",9);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (33,"신섬빈","1970-07-24","010-805-7678","tkydziv000@naver.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (34,"전규균","1998-11-07","010-8851-5840","fyrar9030@cau.ac.kr",80);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (35,"전형결","1973-05-27","010-157-7340","pnaraewk629@naver.com",130);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (36,"노재수","1979-10-26","010-654-3490","pfycg186@gmail.com",56);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (37,"박형우","1971-04-25","010-454-1277","jiupalyyn@naver.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (38,"송제석","1973-12-03","010-686-0727","ipdfodk3@cau.ac.kr",108);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (39,"권제선","1982-01-03","010-473-7881","gfullk378@gmail.com",9);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (40,"좌춘결","1981-07-13","010-0295-3342","tydteam@gmail.com",2);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (41,"전유민","1999-12-03","010-260-1830","meaearwt7@gmail.com",5);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (42,"송성빈","1988-10-24","010-7956-3008","fygtydha28@naver.com",10);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (43,"권성빈","1982-08-13","010-7910-8314","eqgjfwkj4@gmail.com",54);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (44,"우광선","1983-05-08","010-479-5120","rfvvrivuy028@cau.ac.kr",14);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (45,"노재희","1970-09-24","010-706-2191","proqyl@gmail.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (46,"유영민","1999-01-05","010-247-0129","phnqkamh870@naver.com",42);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (47,"우영선","1979-01-26","010-834-5132","omonxrqy1@gmail.com",63);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (48,"노재현","1977-01-13","010-1654-7553","sewjtb059@naver.com",4);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (49,"노섬윤","1982-05-16","010-2179-8178","tdcckx8@gmail.com",15);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (50,"송근현","1981-07-24","010-6115-4856","mkxgbfcpy7068@naver.com",12);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (51,"송무현","1983-02-06","010-4370-5291","nfgfrcc9@cau.ac.kr",100);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (52,"좌무훈","1988-11-12","010-609-9498","msqsghm@naver.com",50);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (53,"권재희","1981-10-04","010-817-6707","chynvzhcp6@gmail.com",10);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (54,"백섬수","1998-12-18","010-1417-2753","lfjmtkuqp3008@naver.com",24);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (55,"송성결","1980-08-26","010-3354-5065","enemw5@naver.com",36);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (56,"홍섬용","1977-03-09","010-080-4370","afxwh81@cau.ac.kr",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (57,"우유우","1985-07-12","010-128-7400","xdzuj9511@cau.ac.kr",117);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (58,"홍구아","1983-08-25","010-832-9057","qadojskkv51@naver.com",60);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (59,"박규아","1992-12-24","010-353-2515","ropbyjz88@naver.com",54);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (60,"김영균","1990-09-18","010-7111-1505","offvnc92@naver.com",78);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (61,"송구선","1970-08-27","010-381-3340","nhkebm35@naver.com",50);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (62,"좌영결","1970-01-18","010-4642-1249","xaxqxkjlz165@gmail.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (63,"백규희","1987-05-19","010-019-4219","pvlhvhr@cau.ac.kr",28);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (64,"신근빈","1999-08-14","010-6818-3343","xozbafpfm60@gmail.com",40);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (65,"장구훈","1989-06-15","010-268-1575","mltedzl6381@gmail.com",130);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (66,"전성결","1992-12-24","010-143-5092","thunwo857@gmail.com",96);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (67,"홍영아","1971-04-07","010-1782-0282","qlyqn@gmail.com",30);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (68,"전유아","1995-01-22","010-054-3294","qnmicxapz23@cau.ac.kr",50);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (69,"신춘윤","1983-05-04","010-384-2012","hecqud@gmail.com",15);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (70,"홍유아","1972-03-17","010-2187-8795","jnbkcpdmo24@cau.ac.kr",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (71,"박섬용","1991-01-20","010-070-3231","zpdpy70@cau.ac.kr",99);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (72,"박정균","1981-06-02","010-9385-7179","gokrcxaet2808@cau.ac.kr",20);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (73,"홍광선","1976-03-27","010-670-8355","sttyzu3@naver.com",100);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (74,"유유희","1997-11-10","010-9998-6933","hozvaf4638@cau.ac.kr",36);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (75,"박섬균","1981-03-19","010-395-8989","owejazhkw00@naver.com",126);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (76,"좌구결","1973-02-11","010-6122-5225","leprxibe1@gmail.com",3);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (77,"신영민","1986-03-02","010-001-5525","glgzmbin763@naver.com",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (78,"김구아","1989-02-21","010-2382-3754","atowza163@naver.com",8);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (79,"전규수","1992-05-08","010-674-9183","pjfzslzm91@cau.ac.kr",32);
insert into Human (id, name, birth_dtae, phone_number, email, academic_background) values (80,"노구훈","1973-02-14","010-7445-0294","htuoxrajv774@cau.ac.kr",7);
SET foreign_key_checks=1;

insert into Office (ID, floor, room_number, capacity) values (1,1,102,11);
insert into Office (ID, floor, room_number, capacity) values (2,1,103,14);
insert into Office (ID, floor, room_number, capacity) values (3,1,104,19);
insert into Office (ID, floor, room_number, capacity) values (4,1,105,29);
insert into Office (ID, floor, room_number, capacity) values (5,2,201,18);
insert into Office (ID, floor, room_number, capacity) values (6,2,202,20);
insert into Office (ID, floor, room_number, capacity) values (7,2,203,20);
insert into Office (ID, floor, room_number, capacity) values (8,2,204,19);
insert into Office (ID, floor, room_number, capacity) values (9,2,205,25);
insert into Office (ID, floor, room_number, capacity) values (10,3,301,20);
insert into Office (ID, floor, room_number, capacity) values (11,3,302,12);
insert into Office (ID, floor, room_number, capacity) values (12,3,303,29);
insert into Office (ID, floor, room_number, capacity) values (13,3,304,30);
insert into Office (ID, floor, room_number, capacity) values (14,3,305,14);
insert into Office (ID, floor, room_number, capacity) values (15,4,401,30);
insert into Office (ID, floor, room_number, capacity) values (16,4,402,17);
insert into Office (ID, floor, room_number, capacity) values (17,4,403,13);
insert into Office (ID, floor, room_number, capacity) values (18,4,404,25);
insert into Office (ID, floor, room_number, capacity) values (19,4,405,26);
insert into Office (ID, floor, room_number, capacity) values (20,5,501,26);
insert into Office (ID, floor, room_number, capacity) values (21,5,502,27);
insert into Office (ID, floor, room_number, capacity) values (22,5,503,24);
insert into Office (ID, floor, room_number, capacity) values (23,5,504,22);
insert into Office (ID, floor, room_number, capacity) values (24,5,505,19);

insert into Department (id, name, Office_ID) values (1,"품질",1);
insert into Department (id, name, Office_ID) values (2,"품질보증",12);
insert into Department (id, name, Office_ID) values (3,"품질경영",24);
insert into Department (id, name, Office_ID) values (4,"생산",5);
insert into Department (id, name, Office_ID) values (5,"생산관리",13);
insert into Department (id, name, Office_ID) values (6,"생산기술",3);
insert into Department (id, name, Office_ID) values (7,"소재",8);
insert into Department (id, name, Office_ID) values (8,"기획",21);
insert into Department (id, name, Office_ID) values (9,"기술",20);
insert into Department (id, name, Office_ID) values (10,"회계",10);
insert into Department (id, name, Office_ID) values (11,"인사",2);
insert into Department (id, name, Office_ID) values (12,"연구",7);
insert into Department (id, name, Office_ID) values (13,"마케팅",16);
insert into Department (id, name, Office_ID) values (14,"경영",4);
insert into Department (id, name, Office_ID) values (15,"법무",22);
insert into Department (id, name, Office_ID) values (16,"고객",11);

insert into DepartmentHierarchy (parent_department, child_department) values (1,2);
insert into DepartmentHierarchy (parent_department, child_department) values (1,3);
insert into DepartmentHierarchy (parent_department, child_department) values (4,5);
insert into DepartmentHierarchy (parent_department, child_department) values (4,6);

insert into Major (ID, name) values (1,"생물학");
insert into Major (ID, name) values (2,"기계공학");
insert into Major (ID, name) values (3,"전자공학");
insert into Major (ID, name) values (4,"컴퓨터공학");
insert into Major (ID, name) values (5,"경영학");
insert into Major (ID, name) values (6,"경제학");
insert into Major (ID, name) values (7,"통계학");
insert into Major (ID, name) values (8,"물리학");
insert into Major (ID, name) values (9,"화학");
insert into Major (ID, name) values (10,"로봇공학");
insert into Major (ID, name) values (11,"컴퓨터공학");
insert into Major (ID, name) values (12,"에너지공학");
insert into Major (ID, name) values (13,"소프트웨어");
insert into Major (ID, name) values (14,"건축학");

insert into School (ID, name) values (1,"한양대");
insert into School (ID, name) values (2,"서울대");
insert into School (ID, name) values (3,"중앙대");
insert into School (ID, name) values (4,"연세대");
insert into School (ID, name) values (5,"고려대");
insert into School (ID, name) values (6,"건국대");
insert into School (ID, name) values (7,"성균관대");
insert into School (ID, name) values (8,"서강대");
insert into School (ID, name) values (9,"숭실대");
insert into School (ID, name) values (10,"경북대");
insert into School (ID, name) values (11,"부산대");

insert into DepartmentMember (department_ID, employee_ID) values (14,1);
insert into DepartmentMember (department_ID, employee_ID) values (2,2);
insert into DepartmentMember (department_ID, employee_ID) values (7,3);
insert into DepartmentMember (department_ID, employee_ID) values (13,4);
insert into DepartmentMember (department_ID, employee_ID) values (4,5);
insert into DepartmentMember (department_ID, employee_ID) values (3,6);
insert into DepartmentMember (department_ID, employee_ID) values (13,7);
insert into DepartmentMember (department_ID, employee_ID) values (1,8);
insert into DepartmentMember (department_ID, employee_ID) values (13,9);
insert into DepartmentMember (department_ID, employee_ID) values (7,10);
insert into DepartmentMember (department_ID, employee_ID) values (8,11);
insert into DepartmentMember (department_ID, employee_ID) values (6,12);
insert into DepartmentMember (department_ID, employee_ID) values (14,13);
insert into DepartmentMember (department_ID, employee_ID) values (14,14);

insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (1,14,2,9,"2022-11-13",);
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (2,4,3,4,"2022-07-15",);
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (3,13,7,10,"2022-06-06",);
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (4,7,14,7,"2022-02-16",);
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (5,1,1,1,"2022-04-05",);
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (6,10,3,10,"2022-03-14",);

INSERT INTO PositionType (name) VALUES ('대표 이사');
INSERT INTO PositionType (name) VALUES ('상무');
INSERT INTO PositionType (name) VALUES ('이사');
INSERT INTO PositionType (name) VALUES ('차장');
INSERT INTO PositionType (name) VALUES ('부장');
INSERT INTO PositionType (name) VALUES ('팀장');
INSERT INTO PositionType (name) VALUES ('파트장');
INSERT INTO PositionType (name) VALUES ('과장');
INSERT INTO PositionType (name) VALUES ('대리');
INSERT INTO PositionType (name) VALUES ('사원');

INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (1, 1, '2022-08-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (2, 2, '2022-10-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (3, 3, '2022-09-15', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (4, 4, '2022-10-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (5, 5, '2022-10-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (6, 6, '2022-10-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (7, 7, '2022-10-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (8, 8, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (9, 9, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (10, 10, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (11, 10, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (12, 10, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (13, 10, '2022-11-01', NULL);
INSERT INTO Employee (human_ID, current_position, entrance_date, quit_date) VALUES (14, 9, '2022-11-01', NULL);

INSERT INTO Counselor (human_ID,status) VALUES (71, 'mental');
INSERT INTO Counselor (human_ID,status) VALUES (72, 'mental');
INSERT INTO Counselor (human_ID,status) VALUES (73, 'mental');
INSERT INTO Counselor (human_ID,status) VALUES (74, 'mental');
INSERT INTO Counselor (human_ID,status) VALUES (75, 'mental');

INSERT INTO CounselingHistory (counselor_ID, employee_ID, start_time, end_time, created_at) VALUES (1, 1, '2022-11-28 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:00');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (2, 3,'2022-11-28 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:12');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (3, 4,'2022-11-28 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:09');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (4, 2,'2022-11-28 15:00:00','2022-11-28 16:00:00','2022-11-28 16:06:07');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (5, 13, '2022-11-28 15:00:00','2022-11-28 16:00:00','2022-11-28 16:06:21');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (1, 14, '2022-11-28 16:00:00','2022-11-28 17:00:00','2022-11-28 17:04:34');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (2, 8, '2022-11-28 16:00:00','2022-11-28 17:00:00','2022-11-28 17:05:24');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (3, 9,'2022-11-28 16:00:00','2022-11-28 17:00:00','2022-11-28 17:05:21');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (4, 5,'2022-11-28 16:00:00','2022-11-28 17:00:00','2022-11-28 17:05:57');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (5, 6, '2022-11-28 16:00:00','2022-11-28 17:00:00','2022-11-28 17:06:12');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (1, 7, '2022-11-29 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:10');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (2, 8,'2022-11-29 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:23');
INSERT INTO CounselingHistory (counselor_ID, employee_ID,start_time, end_time, created_at) VALUES (3, 13,'2022-11-29 15:00:00','2022-11-28 16:00:00','2022-11-28 16:05:34');

INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("품질이란 무엇인가", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("품질 향상 방법 고안", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("품질 관리 방법", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("생산이란 무엇인가", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("생산 설비 점검 방법", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("생산 효율 향상 방법", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("신입사원 입문 교육", NULL, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("사내 필수 성교육", NULL, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("화재 대처 요령", NULL, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("응급환자 발생 시 대처 요령", NULL, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("위급상황 발생 시 대처 요령", NULL, true, '2022-12-31');


INSERT INTO Education (type, employee_ID) VAlUES (8, 1);
INSERT INTO Education (type, employee_ID) VAlUES (8, 2);
INSERT INTO Education (type, employee_ID) VAlUES (8, 3);
INSERT INTO Education (type, employee_ID) VAlUES (8, 4);
INSERT INTO Education (type, employee_ID) VAlUES (8, 5);
INSERT INTO Education (type, employee_ID) VAlUES (9, 1);
INSERT INTO Education (type, employee_ID) VAlUES (9, 2);
INSERT INTO Education (type, employee_ID) VAlUES (9, 3);
INSERT INTO Education (type, employee_ID) VAlUES (9, 4);
INSERT INTO Education (type, employee_ID) VAlUES (9, 5);
INSERT INTO Education (type, employee_ID) VAlUES (10, 1);
INSERT INTO Education (type, employee_ID) VAlUES (10, 2);
INSERT INTO Education (type, employee_ID) VAlUES (8, 3);
INSERT INTO Education (type, employee_ID) VAlUES (8, 4);
INSERT INTO Education (type, employee_ID) VAlUES (8, 5);



INSERT INTO EducationHistory (education_ID, created_at) VALUES (1, '2022-12-01 16:58:11');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (2, '2022-12-01 16:58:11');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (3, '2022-12-01 16:58:11');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (4, '2022-12-01 16:58:11');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (5, '2022-12-01 16:58:13');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (6, '2022-12-01 16:58:15');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (7, '2022-12-01 16:58:15');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (8, '2022-12-01 16:58:20');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (9, '2022-12-01 16:58:21');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (10, '2022-12-01 16:58:22');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (11, '2022-12-01 16:58:30');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (12, '2022-12-01 16:58:59');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (13, '2022-12-01 16:59:00');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (14, '2022-12-01 16:59:11');
INSERT INTO EducationHistory (education_ID, created_at) VALUES (15, '2022-12-01 16:59:13');

INSERT INTO RecruitingType(ID, type) VALUES (1,"인턴십");
INSERT INTO RecruitingType(ID, type) VALUES (2,"상반기 공채 경력직");
INSERT INTO RecruitingType(ID, type) VALUES (3,"상반기 공채 신입");
INSERT INTO Recruitingtype(ID, type) VALUES (4,"하반기 공채 경력직");
INSERT INTO RecruitingType(ID, type) VALUES (5,"하반기 공채 신입");
INSERT INTO RecruitingType(ID, type) VALUES (6,"특채");

INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (1, 1, '2022-09-01 09:00:00', '2022-12-21 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (2, 1, '2022-09-01 09:00:00', '2022-12-21 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (3, 1, '2022-09-01 09:00:00', '2022-12-21 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (4, 1, '2022-09-01 09:00:00', '2022-12-21 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (5, 1, '2022-09-01 09:00:00', '2022-12-21 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (1, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (2, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (3, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (4, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (5, 5,'2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (7, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (8, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (9, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (10, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');
INSERT INTO Recruiting (department, type, start_time, end_time) VALUES (11, 5, '2022-09-02 13:00:00', '2022-10-31 18:00:00');

INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (60,1,true);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (61,1,true);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (62,1,false);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (63,1,false);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (64,1,true);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (65,2,true);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (66,2,false);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (67,2,false);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (68,2,false);
INSERT INTO Applicant (human_ID, recruiting_ID, pass) VALUES (69,2,false);