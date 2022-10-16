-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 10:49:33.195

-- tables
-- Table: Employee
CREATE TABLE Employee (
    EmployeeID int  NOT NULL,
    PESEL char(11)  NOT NULL,
    Address varchar(50)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY  (EmployeeID)
);

-- Table: Info
CREATE TABLE Info (
    ID int  NOT NULL,
    EmplyeeID int  NOT NULL,
    Salary decimal(10,2)  NOT NULL,
    ReviewID int  NOT NULL,
    Employee_EmployeeID int  NOT NULL,
    Review_ReviewID int  NOT NULL,
    CONSTRAINT Info_pk PRIMARY KEY  (ID)
);

-- Table: Review
CREATE TABLE Review (
    ReviewID int  NOT NULL,
    Grade int  NOT NULL,
    "Current" bit  NOT NULL,
    CONSTRAINT Review_pk PRIMARY KEY  (ReviewID)
);

-- foreign keys
-- Reference: FactTable_Employee (table: Info)
ALTER TABLE Info ADD CONSTRAINT FactTable_Employee
    FOREIGN KEY (Employee_EmployeeID)
    REFERENCES Employee (EmployeeID);

-- Reference: FactTable_Review (table: Info)
ALTER TABLE Info ADD CONSTRAINT FactTable_Review
    FOREIGN KEY (Review_ReviewID)
    REFERENCES Review (ReviewID);

-- sequences
-- Sequence: Employee_seq
CREATE SEQUENCE Employee_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Info_seq
CREATE SEQUENCE Info_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Review_seq
CREATE SEQUENCE Review_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

