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
    `department` int NOT NULL  ,
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

DELIMITER //
CREATE TRIGGER `promotionhistory_AFTER_UPDATE` AFTER UPDATE ON `employee` FOR EACH ROW 
BEGIN
	INSERT INTO PromotionHistory (prev_position, current_position, created_at) VALUES 
    (OLD.Employee.current_position, new.Employee.current_position, now());
END; //

DELIMITER //
CREATE TRIGGER `vacationhistory_AFTER_UPDATE` AFTER UPDATE ON `vacationavailable` FOR EACH ROW BEGIN
	INSERT INTO VacationHistory (employee_ID, vacation_type, created_at) VALUES 
    (old.vacationAvailable.employee_ID, old.vacationAvailable.vacation_type, now());
END; //

DELIMITER ;

SET foreign_key_checks=0;
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (1,"?????????","1989-05-27","010-2511-5276","cxggbw8576@cau.ac.kr",19);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (2,"?????????","1985-07-04","010-2313-7427","nrvystm2860@cau.ac.kr",5);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (3,"?????????","1999-11-07","010-183-4606","wsrenz8@cau.ac.kr",103);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (4,"?????????","1999-07-25","010-7314-0973","oejuvpv41@gmail.com",16);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (5,"?????????","1980-04-08","010-7739-8182","ehwqnq5@gmail.com",60);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (6,"?????????","1975-10-19","010-1468-8414","coksfzkv8371@naver.com",138);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (7,"?????????","1995-04-21","010-984-4992","zrzbm@cau.ac.kr",69);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (8,"?????????","1976-03-22","010-872-2890","ddiutei258@cau.ac.kr",83);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (9,"?????????","1982-01-17","010-8196-9520","lzyln532@gmail.com",63);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (10,"?????????","1977-05-21","010-499-2554","wlqijtvdw7@gmail.com",50);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (11,"?????????","1985-10-05","010-524-1616","tlhcsmpx618@naver.com",83);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (12,"?????????","1999-02-20","010-3423-4059","cukepz812@gmail.com",18);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (13,"?????????","1974-01-28","010-0770-8252","jsrdz343@cau.ac.kr",102);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (14,"?????????","1973-10-12","010-2600-4005","uunfsksr4@cau.ac.kr",146);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (15,"?????????","1981-03-03","010-189-0706","ijipf84@naver.com",143);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (16,"?????????","1974-10-08","010-8026-1554","emuvn17@naver.com",101);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (17,"?????????","1980-08-15","010-0857-8930","dmbppwe8345@naver.com",152);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (18,"?????????","1970-08-10","010-6771-1627","cprjbxp92@naver.com",15);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (19,"?????????","1984-05-10","010-2717-5832","rzjpxiogv3@naver.com",119);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (20,"?????????","1997-03-13","010-621-3155","zpowkji30@gmail.com",123);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (21,"?????????","1972-09-08","010-1809-5341","axxmn4139@naver.com",89);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (22,"?????????","1971-08-28","010-9315-3241","smzcnoc0774@cau.ac.kr",151);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (23,"?????????","1981-10-13","010-234-2055","impmyhchz526@naver.com",150);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (24,"?????????","1994-10-05","010-803-2270","vtrehbbc3@naver.com",109);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (25,"?????????","1979-02-21","010-814-6093","ubmjr@naver.com",66);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (26,"?????????","1988-04-28","010-6565-1964","upzww8266@gmail.com",130);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (27,"?????????","1985-10-18","010-646-6825","efnjh6@gmail.com",31);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (28,"?????????","1976-01-09","010-333-8473","cuykabfcv639@gmail.com",142);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (29,"?????????","1974-01-27","010-1881-5142","qzikf014@gmail.com",62);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (30,"?????????","1977-10-03","010-1750-2824","switd@gmail.com",116);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (31,"?????????","1978-02-17","010-9803-4801","fxnxv8569@naver.com",79);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (32,"?????????","1996-10-12","010-916-6667","ospofg9523@naver.com",2);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (33,"?????????","1976-05-23","010-716-4946","sgovs812@gmail.com",55);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (34,"?????????","1985-09-14","010-889-6623","cklznayx80@naver.com",21);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (35,"?????????","1972-01-08","010-2688-6095","cuypurfm1486@cau.ac.kr",127);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (36,"?????????","1975-12-14","010-545-7214","svkhtqdih8364@naver.com",92);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (37,"?????????","1994-06-20","010-085-3246","gjccvh1@naver.com",130);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (38,"?????????","1986-11-20","010-439-5391","gfieowq902@naver.com",12);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (39,"?????????","1992-08-09","010-2275-4034","ynmkmn85@naver.com",124);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (40,"?????????","1999-11-10","010-677-6471","dkjmjqwi01@gmail.com",97);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (41,"?????????","1977-10-24","010-7868-6172","uhsjafbt10@naver.com",132);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (42,"?????????","1999-10-26","010-342-1277","mdcjb39@cau.ac.kr",10);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (43,"?????????","1978-07-24","010-8806-0284","tvjsjb048@naver.com",142);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (44,"?????????","1989-08-10","010-630-8230","ydhacw@naver.com",30);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (45,"?????????","1977-09-16","010-4359-2831","reqgjfwkj407@cau.ac.kr",26);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (46,"?????????","1982-04-21","010-0501-0989","vrivuy02@naver.com",106);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (47,"?????????","1994-01-21","010-7706-2191","proqyl@gmail.com",154);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (48,"?????????","1994-08-05","010-8706-1293","hnqkamhu@gmail.com",151);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (49,"?????????","1988-05-06","010-4329-8513","jomonxr641@gmail.com",53);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (50,"?????????","1999-02-05","010-6723-0755","usewjtbo5@gmail.com",91);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (51,"?????????","1992-08-21","010-7217-9181","autdcck584@naver.com",94);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (52,"?????????","1981-07-24","010-6115-4856","mkxgbfcpy7068@naver.com",42);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (53,"?????????","1996-02-06","010-3019-3529","infgfr22@cau.ac.kr",141);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (54,"?????????","1986-11-09","010-160-9894","llmsqsghm095@cau.ac.kr",120);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (55,"?????????","1975-02-11","010-1760-4121","vzhcpqug302@cau.ac.kr",85);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (56,"?????????","1971-02-09","010-1725-4455","tkuqpz0081@naver.com",89);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (57,"?????????","1980-08-26","010-3354-5065","enemw5@naver.com",76);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (58,"?????????","1996-10-11","010-063-6437","wafxw@gmail.com",9);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (59,"?????????","1985-02-05","010-531-2888","wehtxdz0995@cau.ac.kr",122);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (60,"?????????","1979-04-15","010-3449-4905","lqadojs8015@gmail.com",31);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (61,"?????????","1989-03-19","010-7353-2515","ropbyjz88@naver.com",107);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (62,"?????????","1983-03-17","010-7233-5150","uoffv3@cau.ac.kr",19);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (63,"?????????","1977-06-23","010-0438-1033","wvnhkebmt@gmail.com",118);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (64,"?????????","1977-07-01","010-346-4529","knhfxa58@cau.ac.kr",29);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (65,"?????????","1976-08-17","010-3654-9061","oqkdvf0933@cau.ac.kr",62);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (66,"?????????","1995-08-17","010-353-2881","jjhevryxo176@naver.com",66);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (67,"?????????","1982-08-07","010-705-3256","yljdd792@gmail.com",128);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (68,"?????????","1976-04-05","010-0861-9561","pxino9213@cau.ac.kr",15);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (69,"?????????","1998-10-18","010-333-1108","pmmleb028@naver.com",111);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (70,"?????????","1994-12-05","010-2190-4015","yvwtgtoq9044@cau.ac.kr",79);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (71,"?????????","1970-08-28","010-9823-2834","mtcjg76@cau.ac.kr",99);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (72,"?????????","1999-04-02","010-220-3168","uwjxnpq91@cau.ac.kr",151);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (73,"?????????","1980-09-13","010-5101-9303","kutappw277@cau.ac.kr",64);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (74,"?????????","1996-12-02","010-511-9730","tfhvxxyt8@cau.ac.kr",43);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (75,"?????????","1988-04-03","010-0543-1680","bjrqgepp5@naver.com",62);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (76,"?????????","1993-01-10","010-704-7898","vrtnovidz31@gmail.com",2);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (77,"?????????","1983-01-19","010-847-9014","fsrqt68@naver.com",139);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (78,"?????????","1988-05-28","010-960-6516","xlzqys5182@gmail.com",83);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (79,"?????????","1985-05-11","010-8508-5073","dygthcuyy1@gmail.com",136);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (80,"?????????","1983-09-18","010-5796-1598","onpyzwotk@naver.com",78);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (81,"?????????","1975-11-02","010-269-1637","hkfcm8546@cau.ac.kr",148);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (82,"?????????","1981-03-04","010-771-3529","nehryk@cau.ac.kr",122);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (83,"?????????","1994-05-11","010-509-9835","xrajv7744@naver.com",115);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (84,"?????????","1990-11-23","010-846-9873","cuqdscil6@cau.ac.kr",133);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (85,"?????????","1974-01-20","010-8824-6938","qkvcsw103@cau.ac.kr",108);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (86,"?????????","1975-09-26","010-110-7741","yxwjsj0322@naver.com",44);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (87,"?????????","1998-05-10","010-3712-9274","zolhu@gmail.com",72);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (88,"?????????","1973-02-14","010-729-2303","lktbq7@gmail.com",117);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (89,"?????????","1983-05-12","010-864-3796","rtahnex36@naver.com",67);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (90,"?????????","1992-01-03","010-352-1693","xxeumzf4688@gmail.com",96);
SET foreign_key_checks=1;

insert into Office (floor, room_number, capacity) values (0, 0, 0);
insert into Office (floor, room_number, capacity) values (1,102,11);
insert into Office (floor, room_number, capacity) values (1,103,14);
insert into Office (floor, room_number, capacity) values (1,104,19);
insert into Office (floor, room_number, capacity) values (1,105,29);
insert into Office (floor, room_number, capacity) values (2,201,18);
insert into Office (floor, room_number, capacity) values (2,202,20);
insert into Office (floor, room_number, capacity) values (2,203,20);
insert into Office (floor, room_number, capacity) values (2,204,19);
insert into Office (floor, room_number, capacity) values (2,205,25);
insert into Office (floor, room_number, capacity) values (3,301,20);
insert into Office (floor, room_number, capacity) values (3,302,12);
insert into Office (floor, room_number, capacity) values (3,303,29);
insert into Office (floor, room_number, capacity) values (3,304,30);
insert into Office (floor, room_number, capacity) values (3,305,14);
insert into Office (floor, room_number, capacity) values (4,401,30);
insert into Office (floor, room_number, capacity) values (4,402,17);
insert into Office (floor, room_number, capacity) values (4,403,13);
insert into Office (floor, room_number, capacity) values (4,404,25);
insert into Office (floor, room_number, capacity) values (4,405,26);
insert into Office (floor, room_number, capacity) values (5,501,26);
insert into Office (floor, room_number, capacity) values (5,502,27);
insert into Office (floor, room_number, capacity) values (5,503,24);
insert into Office (floor, room_number, capacity) values (5,504,22);
insert into Office (floor, room_number, capacity) values (5,505,19);

insert into Department (id, name, Office_ID) values (1,"??????",6);
insert into Department (id, name, Office_ID) values (2,"????????????",12);
insert into Department (id, name, Office_ID) values (3,"????????????",24);
insert into Department (id, name, Office_ID) values (4,"??????",5);
insert into Department (id, name, Office_ID) values (5,"????????????",13);
insert into Department (id, name, Office_ID) values (6,"????????????",3);
insert into Department (id, name, Office_ID) values (7,"??????",8);
insert into Department (id, name, Office_ID) values (8,"??????",21);
insert into Department (id, name, Office_ID) values (9,"??????",20);
insert into Department (id, name, Office_ID) values (10,"??????",10);
insert into Department (id, name, Office_ID) values (11,"??????",2);
insert into Department (id, name, Office_ID) values (12,"??????",7);
insert into Department (id, name, Office_ID) values (13,"?????????",16);
insert into Department (id, name, Office_ID) values (14,"??????",4);
insert into Department (id, name, Office_ID) values (15,"??????",22);
insert into Department (id, name, Office_ID) values (16,"??????",11);
INSERT INTO Department (id, name, Office_ID) VALUES (20, "??????", 1);

insert into DepartmentHierarchy (parent_department, child_department) values (1,2);
insert into DepartmentHierarchy (parent_department, child_department) values (1,3);
insert into DepartmentHierarchy (parent_department, child_department) values (4,5);
insert into DepartmentHierarchy (parent_department, child_department) values (4,6);

insert into Major (ID, name) values (1,"?????????");
insert into Major (ID, name) values (2,"????????????");
insert into Major (ID, name) values (3,"????????????");
insert into Major (ID, name) values (4,"???????????????");
insert into Major (ID, name) values (5,"?????????");
insert into Major (ID, name) values (6,"?????????");
insert into Major (ID, name) values (7,"?????????");
insert into Major (ID, name) values (8,"?????????");
insert into Major (ID, name) values (9,"??????");
insert into Major (ID, name) values (10,"????????????");
insert into Major (ID, name) values (11,"???????????????");
insert into Major (ID, name) values (12,"???????????????");
insert into Major (ID, name) values (13,"???????????????");
insert into Major (ID, name) values (14,"?????????");

insert into School (ID, name) values (1,"?????????");
insert into School (ID, name) values (2,"?????????");
insert into School (ID, name) values (3,"?????????");
insert into School (ID, name) values (4,"?????????");
insert into School (ID, name) values (5,"?????????");
insert into School (ID, name) values (6,"?????????");
insert into School (ID, name) values (7,"????????????");
insert into School (ID, name) values (8,"?????????");
insert into School (ID, name) values (9,"?????????");
insert into School (ID, name) values (10,"?????????");
insert into School (ID, name) values (11,"?????????");

INSERT INTO PositionType (name) VALUES ('?????? ??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('?????????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');
INSERT INTO PositionType (name) VALUES ('??????');

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

insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (1,14,2,9,"2022-11-13");
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (2,4,3,4,"2022-07-15");
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (3,13,7,10,"2022-06-06");
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (4,7,14,7,"2022-02-16");
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (5,1,1,1,"2022-04-05");
insert into DepartmentHistory (ID, employee_ID, prev_department, current_department, created_at) values (6,10,3,10,"2022-03-14");

insert into AcademicBackground (ID, type, school_ID, major_ID) values (1,"??????",1,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (2,"??????",1,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (3,"??????",1,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (4,"??????",1,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (5,"??????",1,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (6,"??????",1,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (7,"??????",1,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (8,"??????",1,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (9,"??????",1,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (10,"??????",1,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (11,"??????",1,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (12,"??????",1,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (13,"??????",1,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (14,"??????",1,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (15,"??????",2,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (16,"??????",2,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (17,"??????",2,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (18,"??????",2,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (19,"??????",2,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (20,"??????",2,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (21,"??????",2,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (22,"??????",2,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (23,"??????",2,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (24,"??????",2,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (25,"??????",2,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (26,"??????",2,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (27,"??????",2,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (28,"??????",2,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (29,"??????",3,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (30,"??????",3,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (31,"??????",3,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (32,"??????",3,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (33,"??????",3,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (34,"??????",3,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (35,"??????",3,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (36,"??????",3,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (37,"??????",3,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (38,"??????",3,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (39,"??????",3,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (40,"??????",3,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (41,"??????",3,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (42,"??????",3,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (43,"??????",4,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (44,"??????",4,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (45,"??????",4,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (46,"??????",4,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (47,"??????",4,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (48,"??????",4,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (49,"??????",4,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (50,"??????",4,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (51,"??????",4,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (52,"??????",4,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (53,"??????",4,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (54,"??????",4,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (55,"??????",4,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (56,"??????",4,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (57,"??????",5,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (58,"??????",5,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (59,"??????",5,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (60,"??????",5,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (61,"??????",5,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (62,"??????",5,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (63,"??????",5,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (64,"??????",5,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (65,"??????",5,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (66,"??????",5,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (67,"??????",5,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (68,"??????",5,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (69,"??????",5,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (70,"??????",5,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (71,"??????",6,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (72,"??????",6,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (73,"??????",6,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (74,"??????",6,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (75,"??????",6,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (76,"??????",6,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (77,"??????",6,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (78,"??????",6,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (79,"??????",6,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (80,"??????",6,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (81,"??????",6,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (82,"??????",6,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (83,"??????",6,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (84,"??????",6,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (85,"??????",7,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (86,"??????",7,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (87,"??????",7,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (88,"??????",7,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (89,"??????",7,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (90,"??????",7,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (91,"??????",7,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (92,"??????",7,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (93,"??????",7,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (94,"??????",7,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (95,"??????",7,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (96,"??????",7,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (97,"??????",7,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (98,"??????",7,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (99,"??????",8,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (100,"??????",8,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (101,"??????",8,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (102,"??????",8,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (103,"??????",8,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (104,"??????",8,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (105,"??????",8,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (106,"??????",8,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (107,"??????",8,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (108,"??????",8,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (109,"??????",8,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (110,"??????",8,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (111,"??????",8,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (112,"??????",8,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (113,"??????",9,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (114,"??????",9,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (115,"??????",9,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (116,"??????",9,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (117,"??????",9,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (118,"??????",9,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (119,"??????",9,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (120,"??????",9,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (121,"??????",9,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (122,"??????",9,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (123,"??????",9,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (124,"??????",9,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (125,"??????",9,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (126,"??????",9,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (127,"??????",10,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (128,"??????",10,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (129,"??????",10,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (130,"??????",10,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (131,"??????",10,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (132,"??????",10,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (133,"??????",10,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (134,"??????",10,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (135,"??????",10,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (136,"??????",10,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (137,"??????",10,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (138,"??????",10,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (139,"??????",10,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (140,"??????",10,14);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (141,"??????",11,1);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (142,"??????",11,2);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (143,"??????",11,3);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (144,"??????",11,4);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (145,"??????",11,5);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (146,"??????",11,6);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (147,"??????",11,7);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (148,"??????",11,8);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (149,"??????",11,9);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (150,"??????",11,10);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (151,"??????",11,11);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (152,"??????",11,12);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (153,"??????",11,13);
insert into AcademicBackground (ID, type, school_ID, major_ID) values (154,"??????",11,14);

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

INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("???????????? ????????????", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ?????? ??????", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ??????", 1, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("???????????? ????????????", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ?????? ??????", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ?????? ??????", 4, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("???????????? ?????? ??????", 20, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ?????????", 20, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("?????? ?????? ??????", 20, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("???????????? ?????? ??? ?????? ??????", 20, true, '2022-12-31');
INSERT INTO EducationType (name, department, mandatory, due_date) VALUES ("???????????? ?????? ??? ?????? ??????", 20, true, '2022-12-31');


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

INSERT INTO RecruitingType(ID, type) VALUES (1,"?????????");
INSERT INTO RecruitingType(ID, type) VALUES (2,"????????? ?????? ?????????");
INSERT INTO RecruitingType(ID, type) VALUES (3,"????????? ?????? ??????");
INSERT INTO Recruitingtype(ID, type) VALUES (4,"????????? ?????? ?????????");
INSERT INTO RecruitingType(ID, type) VALUES (5,"????????? ?????? ??????");
INSERT INTO RecruitingType(ID, type) VALUES (6,"??????");

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

INSERT INTO VacationType (ID, name, vacation_time) VALUES (1,'????????????','24:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (2,'??????','24:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (3,'??????','24:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (4,'????????????','72:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (5,'????????????','48:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (6,'????????????','24:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (7,'????????????','24:00:00');
INSERT INTO VacationType (ID, name, vacation_time) VALUES (8,'????????????','24:00:00');

INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (3, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (3, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (3, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (5, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (5, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (5, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (6, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (6, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (6, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (7, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (7, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (7, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (8, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (8, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (8, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (8, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (10, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (10, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (11, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (11, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (11, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (11, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (12, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (12, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (12, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (12, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (14, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (14, 1,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (1, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (2, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (3, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (4, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (5, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (6, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (7, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (8, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (9, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (10, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (11, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (12, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (13, 5,'2022-12-31 23:59:59');
INSERT INTO VacationAvailable (employee_ID, vacation_type, remaining_time) VALUES (14, 5,'2022-12-31 23:59:59');

INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (14, 1, '2022-01-28');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (6, 7, '2022-02-03');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (6, 1, '2022-02-04');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (10, 2, '2022-02-08');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (9, 3, '2022-03-18');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (14, 4, '2022-01-31');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (6, 4, '2022-06-30');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (11, 3, '2022-07-07');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (10, 4, '2022-07-20');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (8, 3, '2022-08-31');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (14, 1, '2022-08-31');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (9, 1, '2022-09-07');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (9, 7, '2022-09-08');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (13, 2, '2022-10-06');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (1, 1, '2022-10-24');
INSERT INTO VacationHistory (employee_ID, vacation_type,created_at) VALUES (10, 2, '2022-11-02');

INSERT INTO Payment (employee_ID, salary) VALUES (1, 560000000);
INSERT INTO Payment (employee_ID, salary) VALUES (2, 210000000);
INSERT INTO Payment (employee_ID, salary) VALUES (3, 187000000);
INSERT INTO Payment (employee_ID, salary) VALUES (4, 150000000);
INSERT INTO Payment (employee_ID, salary) VALUES (5, 117000000);
INSERT INTO Payment (employee_ID, salary) VALUES (6, 90000000);
INSERT INTO Payment (employee_ID, salary) VALUES (7, 79000000);
INSERT INTO Payment (employee_ID, salary) VALUES (8, 75000000);
INSERT INTO Payment (employee_ID, salary) VALUES (9, 56000000);
INSERT INTO Payment (employee_ID, salary) VALUES (10, 45000000);
INSERT INTO Payment (employee_ID, salary) VALUES (11, 35000000);
INSERT INTO Payment (employee_ID, salary) VALUES (12, 27000000);
INSERT INTO Payment (employee_ID, salary) VALUES (13, 26000000);
INSERT INTO Payment (employee_ID, salary) VALUES (14, 42000000);

INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (1, 550000000, 560000000,'2022-10-01 09:23:16');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (2, 190000000, 210000000, '2022-11-01 15:41:13');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (3, 160000000, 187000000, '2022-10-01 10:01:44');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (4, 123000000, 150000000, '2022-11-01 11:00:01');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (5, 85000000, 117000000, '2022-11-02 13:21:59');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (6, 78000000, 90000000, '2022-11-02 13:54:22');
INSERT INTO PaymentHistory (employee_ID, prev_salary, current_salary, created_at) VALUES (7, 56000000, 79000000, '2022-11-02 15:12:04');

INSERT INTO Incentive (type, employee_ID, given_date, amount) VALUES ("??????", 1, '2022-09-10', 2000000);
INSERT INTO Incentive (type, employee_ID, given_date, amount) VALUES ("?????????", 1, '2022-10-15', 20000000);
INSERT INTO Incentive (type, employee_ID, given_date, amount) VALUES ("?????????", 3, '2022-10-15', 10000000);
INSERT INTO Incentive (type, employee_ID, given_date, amount) VALUES ("?????????", 2, '2022-10-15', 5000000);
INSERT INTO Incentive (type, employee_ID, given_date, amount) VALUES ("?????????", 4, '2022-10-15', 5000000);


INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (10, '2022-12-01 08:55:00', '2022-12-01 18:11:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (9, '2022-12-01 08:48:00', '2022-12-01 18:15:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (10, '2022-12-02 08:50:00', '2022-12-02 20:45:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (11, '2022-12-02 08:40:00', '2022-12-02 18:10:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (12, '2022-12-02 09:00:00', '2022-12-02 18:30:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (13, '2022-12-02 08:35:00', '2022-12-02 18:09:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (4, '2022-12-02 07:55:00', '2022-12-02 17:49:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (5, '2022-12-02 08:44:00', '2022-12-02 18:11:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (10, '2022-12-03 08:45:00', '2022-12-03 18:18:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (8, '2022-12-03 08:50:00', '2022-12-03 18:10:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (11, '2022-12-03 08:52:00', '2022-12-03 18:03:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (13, '2022-12-03 08:41:00', '2022-12-03 18:44:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (12, '2022-12-04 08:26:00', '2022-12-04 18:03:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (9, '2022-12-04 08:12:00', '2022-12-04 18:22:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (7, '2022-12-04 08:57:00', '2022-12-04 18:16:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (10, '2022-12-05 08:37:00', '2022-12-05 17:51:00');
INSERT INTO CommuteTime (employee_ID, start_time, end_time) VALUES (6, '2022-12-05 08:19:00', '2022-12-05 18:08:00');

-- ?????? ?????? ?????? ?????? ??????
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
DROP FUNCTION IF EXISTS getAcceptableEmployeeNumber//
CREATE FUNCTION getAcceptableEmployeeNumber(departmentID int) RETURNS int
BEGIN
	declare ret int;
    declare gap int;
    -- ret: ????????? ?????? ???
    select count(D.ID) into ret
	from Department D
	inner join DepartmentMember DM on D.id=DM.department_ID
    where D.ID=departmentID
	group by D.ID;
    -- cap : ???????????? ???????????? ???????????? capacity
    select O.capacity into gap
	from Department D
	inner join Office O on D.office_ID=O.ID
	where D.ID=departmentID;

    return gap-ret;
END//
DELIMITER ;

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

-- ???????????? 3 (?????????) ????????? ?????? ?????? ?????? ????????????
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

-- ???????????? 4 (?????????) ?????? ?????? ????????? ?????? ?????? (?????? ????????? ???????????? ?????? ????????? ?????? ?????? ??????)
DELIMITER //
DROP PROCEDURE IF EXISTS AllEmployeesInChildDepartments//
CREATE PROCEDURE AllEmployeesInChildDepartments(root_department_ID int)
BEGIN
	WITH RECURSIVE child_departments (department_ID) AS
    (
		SELECT root_department_ID
        UNION ALL
        SELECT h.child_department FROM DepartmentHierarchy AS h
        JOIN child_departments AS c ON c.department_ID=h.parent_department
    )
    SELECT * FROM Employee AS e
    WHERE e.ID IN (SELECT employee_ID AS ID FROM DepartmentMember NATURAL JOIN child_departments);
END//
DELIMITER ;

-- ?????? ????????? ?????? ????????? ?????? ????????? ???
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

-- ?????? ???????????? ?????? ????????? ???????????? ??????
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

-- ?????????1 (?????????) Applicant??? pass ???????????? ??????????????? ??????
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

-- ??????????????? ?????? ?????? ??????
set global log_bin_trust_function_creators = 0;
