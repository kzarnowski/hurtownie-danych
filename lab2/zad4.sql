-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 10:31:38.409

-- tables
-- Table: Client
CREATE TABLE Client (
    ClientID int  NOT NULL,
    NIP char(10)  NOT NULL,
    Name varchar(20)  NOT NULL,
    Address varchar(40)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (ClientID)
);

-- Table: Date
CREATE TABLE Date (
    DateID int  NOT NULL,
    Day char(2)  NOT NULL,
    Month char(2)  NOT NULL,
    Year char(4)  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (DateID)
);

-- Table: Fruite
CREATE TABLE Fruite (
    FruiteID int  NOT NULL,
    Name varchar(20)  NOT NULL,
    Price decimal(10,2)  NOT NULL,
    CategoryID int  NOT NULL,
    FruiteCategory_CategoryID int  NOT NULL,
    CONSTRAINT Fruite_pk PRIMARY KEY  (FruiteID)
);

-- Table: FruiteCategory
CREATE TABLE FruiteCategory (
    CategoryID int  NOT NULL,
    CategoryName varchar(20)  NOT NULL,
    CONSTRAINT FruiteCategory_pk PRIMARY KEY  (CategoryID)
);

-- Table: Sales
CREATE TABLE Sales (
    ID int  NOT NULL,
    ClientID int  NOT NULL,
    DateID int  NOT NULL,
    FruiteID int  NOT NULL,
    Amount decimal(10,2)  NOT NULL,
    Quantity decimal(10,2)  NOT NULL,
    Client_ClientID int  NOT NULL,
    Fruite_FruiteID int  NOT NULL,
    Date_DateID int  NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY  (ID)
);

-- foreign keys
-- Reference: Fruite_FruiteCategory (table: Fruite)
ALTER TABLE Fruite ADD CONSTRAINT Fruite_FruiteCategory
    FOREIGN KEY (FruiteCategory_CategoryID)
    REFERENCES FruiteCategory (CategoryID);

-- Reference: FruitesSales_Client (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT FruitesSales_Client
    FOREIGN KEY (Client_ClientID)
    REFERENCES Client (ClientID);

-- Reference: FruitesSales_Date (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT FruitesSales_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- Reference: FruitesSales_Fruite (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT FruitesSales_Fruite
    FOREIGN KEY (Fruite_FruiteID)
    REFERENCES Fruite (FruiteID);

-- sequences
-- Sequence: Client_seq
CREATE SEQUENCE Client_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Date_seq
CREATE SEQUENCE Date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruiteCategory_seq
CREATE SEQUENCE FruiteCategory_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Fruite_seq
CREATE SEQUENCE Fruite_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Sales_seq
CREATE SEQUENCE Sales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

