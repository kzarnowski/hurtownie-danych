-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 09:21:54.569

-- tables
-- Table: BookSales
CREATE TABLE BookSales (
    SalesID int  NOT NULL,
    DateID int  NOT NULL,
    ClientID int  NOT NULL,
    CarrierID int  NOT NULL,
    ProductID int  NOT NULL,
    Client_ClientID int  NOT NULL,
    Carrier_CarrierID int  NOT NULL,
    Product_ISBN char(13)  NOT NULL,
    Date_DateID int  NOT NULL,
    CONSTRAINT BookSales_pk PRIMARY KEY  (SalesID)
);

-- Table: Carrier
CREATE TABLE Carrier (
    CarrierID int  NOT NULL,
    NIP char(10)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Name varchar(30)  NOT NULL,
    CONSTRAINT Carrier_pk PRIMARY KEY  (CarrierID)
);

-- Table: Client
CREATE TABLE Client (
    ClientID int  NOT NULL,
    FirstName varchar(20)  NOT NULL,
    LastName varchar(20)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Phone varchar(12)  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY  (ClientID)
);

-- Table: Date
CREATE TABLE Date (
    DateID int  NOT NULL,
    Day char(2)  NOT NULL,
    Month char(2)  NOT NULL,
    Year char(4)  NOT NULL,
    Quarter char(1)  NOT NULL,
    Weekday varchar(10)  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (DateID)
);

-- Table: Product
CREATE TABLE Product (
    ISBN char(13)  NOT NULL,
    Publisher varchar(30)  NOT NULL,
    Title varchar(30)  NOT NULL,
    Author varchar(30)  NOT NULL,
    Pages int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ISBN)
);

-- foreign keys
-- Reference: BookSales_Carrier (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Carrier
    FOREIGN KEY (Carrier_CarrierID)
    REFERENCES Carrier (CarrierID);

-- Reference: BookSales_Client (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Client
    FOREIGN KEY (Client_ClientID)
    REFERENCES Client (ClientID);

-- Reference: BookSales_Date (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- Reference: BookSales_Product (table: BookSales)
ALTER TABLE BookSales ADD CONSTRAINT BookSales_Product
    FOREIGN KEY (Product_ISBN)
    REFERENCES Product (ISBN);

-- sequences
-- Sequence: BookSales_seq
CREATE SEQUENCE BookSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Carrier_seq
CREATE SEQUENCE Carrier_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

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

-- End of file.

