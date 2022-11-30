-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/WIumc0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Employee` (
    `human_ID` int  NOT NULL ,
    `ID` int AUTO_INCREMENT NOT NULL ,
    `current_position` int  NOT NULL ,
    `entrance_date` date  NOT NULL ,
    `quit_date` date  NOT NULL ,
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

