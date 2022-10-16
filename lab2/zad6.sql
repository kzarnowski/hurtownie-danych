-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 11:28:49.948

-- tables
-- Table: Availability
CREATE TABLE Availability (
    ID int  NOT NULL,
    WarehouseID int  NOT NULL,
    ProductID int  NOT NULL,
    Quantity int  NOT NULL,
    DateID int  NOT NULL,
    Warehouse_WarehouseID int  NOT NULL,
    Date_DateID int  NOT NULL,
    Product_ProductID int  NOT NULL,
    CONSTRAINT Availability_pk PRIMARY KEY  (ID)
);

-- Table: Date
CREATE TABLE Date (
    DateID int  NOT NULL,
    Day char(2)  NOT NULL,
    Month char(2)  NOT NULL,
    Year char(4)  NOT NULL,
    CONSTRAINT Date_pk PRIMARY KEY  (DateID)
);

-- Table: Product
CREATE TABLE Product (
    ProductID int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Brand varchar(30)  NOT NULL,
    StartDateID int  NOT NULL,
    EndDateID int  NOT NULL,
    Date_DateID int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ProductID)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    WarehouseID int  NOT NULL,
    Address varchar(40)  NOT NULL,
    Country varchar(20)  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY  (WarehouseID)
);

-- foreign keys
-- Reference: Availability_Date (table: Availability)
ALTER TABLE Availability ADD CONSTRAINT Availability_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- Reference: Availability_Product (table: Availability)
ALTER TABLE Availability ADD CONSTRAINT Availability_Product
    FOREIGN KEY (Product_ProductID)
    REFERENCES Product (ProductID);

-- Reference: Availability_Warehouse (table: Availability)
ALTER TABLE Availability ADD CONSTRAINT Availability_Warehouse
    FOREIGN KEY (Warehouse_WarehouseID)
    REFERENCES Warehouse (WarehouseID);

-- Reference: Product_Date (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Date
    FOREIGN KEY (Date_DateID)
    REFERENCES Date (DateID);

-- sequences
-- Sequence: Availability_seq
CREATE SEQUENCE Availability_seq
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

-- Sequence: Product_seq
CREATE SEQUENCE Product_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Warehouse_seq
CREATE SEQUENCE Warehouse_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

