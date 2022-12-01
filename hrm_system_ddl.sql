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
    `ID` int  NOT NULL ,
    `type` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `Applicant` (
    `human_ID` int  NOT NULL ,
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
    `type` int  NOT NULL ,
    `employee_ID` int  NOT NULL ,
    PRIMARY KEY (
        `ID`
    )
);

CREATE TABLE `EducationType` (
    `ID` int AUTO_INCREMENT NOT NULL ,
    `name` varchar(100)  NOT NULL ,
    `department` int  NOT NULL ,
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
    `name` varchar(200)  NOT NULL ,
    `description` text  NOT NULL ,
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
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (1, 'Fionna Argile', '1979-02-23', '970-117-1132', 'fargile0@yahoo.com', 127);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (2, 'Fidela Paddemore', '1989-02-17', '726-145-6047', 'fpaddemore1@merriam-webster.com', 125);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (3, 'Tad Humfrey', '1988-01-29', '183-261-5404', 'thumfrey2@seesaa.net', 158);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (4, 'Armin Roughsedge', '1981-10-15', '567-218-9266', 'aroughsedge3@usa.gov', 161);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (5, 'Lind Fardoe', '1977-06-17', '437-657-8462', 'lfardoe4@sohu.com', 119);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (6, 'Ortensia Huffa', '1972-04-15', '968-751-4339', 'ohuffa5@ifeng.com', 138);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (7, 'Jeremiah Raitt', '1977-04-14', '716-585-3790', 'jraitt6@guardian.co.uk', 159);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (8, 'Marcia Caulket', '1988-07-02', '216-966-8510', 'mcaulket7@cornell.edu', 157);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (9, 'Mortimer Klimes', '1973-08-10', '520-712-7063', 'mklimes8@about.com', 150);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (10, 'Marge Sargent', '1981-04-03', '864-898-2548', 'msargent9@virginia.edu', 119);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (11, 'Terri Godlee', '1989-02-12', '886-358-1964', 'tgodleea@google.co.jp', 174);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (12, 'Kathlin Ebbins', '1986-11-29', '817-219-6185', 'kebbinsb@blog.com', 181);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (13, 'Arlyn McArdell', '1980-11-13', '269-176-0754', 'amcardellc@naver.com', 177);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (14, 'Delila Massel', '1987-02-23', '987-385-7768', 'dmasseld@networksolutions.com', 149);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (15, 'Brendis Lightowlers', '1995-10-11', '105-439-2863', 'blightowlerse@icio.us', 196);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (16, 'Norah Eskrigg', '1994-08-10', '855-836-5819', 'neskriggf@cbslocal.com', 174);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (17, 'Joann Coling', '1972-04-03', '251-545-2571', 'jcolingg@nyu.edu', 140);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (18, 'Iolande Newtown', '1982-03-09', '858-801-6920', 'inewtownh@spotify.com', 106);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (19, 'Mahala Garnam', '1989-06-24', '974-652-7048', 'mgarnami@newsvine.com', 150);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (20, 'Pattie Longman', '1979-11-22', '659-563-1962', 'plongmanj@simplemachines.org', 180);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (21, 'Daile Brickwood', '1984-10-26', '724-497-9665', 'dbrickwoodk@blogtalkradio.com', 143);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (22, 'Robb McNish', '1986-03-29', '886-529-1211', 'rmcnishl@businessweek.com', 145);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (23, 'Frannie Mityashin', '1989-07-14', '394-872-5279', 'fmityashinm@csmonitor.com', 191);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (24, 'Latisha Farragher', '1975-12-22', '939-854-4440', 'lfarraghern@google.co.uk', 153);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (25, 'Aime Scorah', '1972-03-24', '328-212-5003', 'ascoraho@mit.edu', 114);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (26, 'Osgood Larmet', '1979-05-30', '290-686-9164', 'olarmetp@narod.ru', 162);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (27, 'Selie McPhail', '1992-07-21', '307-141-8819', 'smcphailq@slideshare.net', 119);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (28, 'Silvain Marioneau', '1977-12-05', '484-957-2660', 'smarioneaur@nba.com', 162);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (29, 'Pauli Klesl', '1974-09-30', '526-448-5123', 'pklesls@harvard.edu', 118);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (30, 'Alecia Cogzell', '1995-04-07', '189-371-0845', 'acogzellt@globo.com', 194);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (31, 'Babs Children', '1981-10-19', '482-957-7550', 'bchildrenu@icq.com', 123);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (32, 'Burlie Cattroll', '1979-10-21', '500-190-2365', 'bcattrollv@dyndns.org', 192);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (33, 'Norrie Acland', '1985-08-15', '918-307-5714', 'naclandw@noaa.gov', 198);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (34, 'Ania O''Hone', '1989-09-30', '489-915-5197', 'aohonex@t.co', 170);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (35, 'Pall Armitt', '1981-08-24', '166-595-9568', 'parmitty@squarespace.com', 103);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (36, 'Ileana Dmitr', '1983-07-22', '317-290-5396', 'idmitrz@goo.gl', 156);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (37, 'Kip Wyldbore', '1983-10-16', '639-842-4528', 'kwyldbore10@sbwire.com', 149);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (38, 'Anet Bahia', '1974-05-22', '181-111-0372', 'abahia11@behance.net', 192);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (39, 'Eliza Kleinplac', '1977-11-26', '493-204-3943', 'ekleinplac12@issuu.com', 158);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (40, 'Nestor Garshore', '1984-12-18', '546-713-0940', 'ngarshore13@sciencedaily.com', 180);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (41, 'Peggy Climance', '1984-09-17', '994-147-9191', 'pclimance14@theatlantic.com', 105);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (42, 'Worthington Hartridge', '1983-01-21', '820-904-1977', 'whartridge15@bigcartel.com', 123);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (43, 'Bonita Jiru', '1973-05-24', '985-228-9773', 'bjiru16@yandex.ru', 106);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (44, 'Rory Eye', '1989-12-07', '175-663-6704', 'reye17@feedburner.com', 143);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (45, 'Kyle Beatey', '1982-02-26', '315-539-6517', 'kbeatey18@google.com.au', 113);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (46, 'Pincas Satterlee', '1976-04-20', '870-105-1858', 'psatterlee19@freewebs.com', 105);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (47, 'Alwyn Beadell', '1989-03-17', '171-174-9975', 'abeadell1a@buzzfeed.com', 124);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (48, 'Brittany Neno', '1977-01-07', '618-532-6139', 'bneno1b@pbs.org', 123);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (49, 'Gerri Devennie', '1979-10-21', '533-108-7100', 'gdevennie1c@barnesandnoble.com', 171);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (50, 'Lari Biddlecombe', '1976-07-16', '428-115-4104', 'lbiddlecombe1d@over-blog.com', 143);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (51, 'Netta Tchir', '1993-02-22', '740-941-8017', 'ntchir1e@moonfruit.com', 164);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (52, 'Leonard Corr', '1971-04-29', '412-454-8803', 'lcorr1f@histats.com', 186);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (53, 'Scarlet Burkhill', '1986-03-15', '366-155-6274', 'sburkhill1g@mysql.com', 103);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (54, 'Romona Wedgbrow', '1990-09-17', '511-828-9386', 'rwedgbrow1h@alexa.com', 112);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (55, 'Veronica Mose', '1994-09-09', '116-133-2449', 'vmose1i@themeforest.net', 189);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (56, 'Faythe Moukes', '1971-12-09', '535-480-3891', 'fmoukes1j@blog.com', 126);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (57, 'Nathalia Ley', '1990-05-20', '262-372-4256', 'nley1k@mapquest.com', 152);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (58, 'Darelle Branston', '1978-12-30', '970-765-1983', 'dbranston1l@google.fr', 132);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (59, 'Lyssa Radmer', '1980-02-16', '370-613-8377', 'lradmer1m@virginia.edu', 168);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (60, 'Lucila Morforth', '1990-12-03', '760-978-8908', 'lmorforth1n@tinypic.com', 115);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (61, 'Deeann Assiter', '1994-05-14', '710-535-1837', 'dassiter1o@weibo.com', 110);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (62, 'Quentin Race', '1970-05-26', '317-877-7443', 'qrace1p@blogger.com', 122);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (63, 'Josey Jude', '1972-08-18', '894-283-4852', 'jjude1q@instagram.com', 112);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (64, 'Arliene Karpman', '1972-10-30', '803-104-8254', 'akarpman1r@shareasale.com', 139);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (65, 'Bryce Valentino', '1981-09-01', '594-458-8970', 'bvalentino1s@china.com.cn', 189);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (66, 'Gene Lightowlers', '1983-02-08', '129-279-9134', 'glightowlers1t@diigo.com', 128);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (67, 'Gates Letty', '1994-07-13', '851-720-0169', 'gletty1u@house.gov', 196);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (68, 'Orion Himsworth', '1974-09-18', '798-937-7502', 'ohimsworth1v@dedecms.com', 136);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (69, 'Coriss Vairow', '1981-07-19', '168-789-0234', 'cvairow1w@ameblo.jp', 138);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (70, 'Adina Bolden', '1983-06-26', '909-467-5235', 'abolden1x@qq.com', 174);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (71, 'Maryanne Quilter', '1993-06-01', '832-418-9877', 'mquilter1y@jigsy.com', 162);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (72, 'Chaim Goodinson', '1982-04-16', '848-412-8407', 'cgoodinson1z@blogs.com', 122);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (73, 'Babette Clopton', '1995-04-20', '958-868-1662', 'bclopton20@smh.com.au', 192);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (74, 'Lark Thow', '1981-03-02', '457-278-5839', 'lthow21@latimes.com', 190);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (75, 'Bancroft Allkins', '1976-12-08', '759-198-2089', 'ballkins22@dailymail.co.uk', 146);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (76, 'Maddie Davydkov', '1981-09-25', '349-375-9266', 'mdavydkov23@devhub.com', 187);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (77, 'Edouard Chadbourne', '1993-04-23', '146-435-4597', 'echadbourne24@yelp.com', 198);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (78, 'Hagen Margett', '1989-06-13', '812-398-8378', 'hmargett25@buzzfeed.com', 128);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (79, 'Cherri Leathe', '1972-03-19', '989-214-9554', 'cleathe26@statcounter.com', 158);
insert into Human (id, name, birth_date, phone_number, email, academic_background) values (80, 'Marley Ricson', '1985-03-20', '625-226-8729', 'mricson27@cisco.com', 189);
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

insert into Department (ID, name, Office_ID) values (1,"Quality",1);
insert into Department (ID, name, Office_ID) values (2,"Quality Assurance",2);
insert into Department (ID, name, Office_ID) values (3,"Quality Management",3);
insert into Department (ID, name, Office_ID) values (4,"Production",4);
insert into Department (ID, name, Office_ID) values (5,"Production Management",5);
insert into Department (ID, name, Office_ID) values (6,"Production Technology",6);
insert into Department (ID, name, Office_ID) values (7,"Material",7);
insert into Department (ID, name, Office_ID) values (8,"Sales",8);
insert into Department (ID, name, Office_ID) values (9,"Technology",9);
insert into Department (ID, name, Office_ID) values (10,"Accounting",10);
insert into Department (ID, name, Office_ID) values (11,"Personnel",11);
insert into Department (ID, name, Office_ID) values (12,"Research",12);
insert into Department (ID, name, Office_ID) values (13,"Marketing",13);
insert into Department (ID, name, Office_ID) values (14,"Management",14);
insert into Department (ID, name, Office_ID) values (15,"Legal",15);
insert into Department (ID, name, Office_ID) values (16,"Customer",16);

insert into DepartmentHierarchy (parent_department, child_department) values (1,2);
insert into DepartmentHierarchy (parent_department, child_department) values (1,3);
insert into DepartmentHierarchy (parent_department, child_department) values (4,5);
insert into DepartmentHierarchy (parent_department, child_department) values (4,6);

insert into Major (ID, name) values (1,"korean");
insert into Major (ID, name) values (2,"english");
insert into Major (ID, name) values (3,"math");
insert into Major (ID, name) values (4,"physics");
insert into Major (ID, name) values (5,"biology");
insert into Major (ID, name) values (6,"history");
insert into Major (ID, name) values (7,"art");
insert into Major (ID, name) values (8,"computer science");
insert into Major (ID, name) values (9,"electrical engineering");
insert into Major (ID, name) values (10,"mechanical engineering");
insert into Major (ID, name) values (11,"management");
insert into Major (ID, name) values (12,"economy");
insert into Major (ID, name) values (13,"statistics");
insert into Major (ID, name) values (14,"architecture");

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
