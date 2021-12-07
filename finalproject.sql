--
-- File generated with SQLiteStudio v3.3.3 on Mon Dec 6 23:50:09 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Address
CREATE TABLE Address (address_ID INTEGER PRIMARY KEY NOT NULL, street VARCHAR(30) NOT NULL, city VARCHAR(30) NOT NULL, state VARCHAR(30) NOT NULL, zipcode INTEGER NOT NULL, email VARCHAR(50) NOT NULL, phone STRING NOT NULL);
INSERT INTO Address (address_ID, street, city, state, zipcode, email, phone) VALUES (123, 'Hillside Dr.', 'San Jose', 'CA', 23424, 'abc@gmail.com', '111-222-3333');

-- Table: Customer
CREATE TABLE Customer (customer_ID INTEGER PRIMARY KEY NOT NULL, lastName VARCHAR(30) NOT NULL, firstName VARCHAR(30) NOT NULL, address_ID INTEGER NOT NULL);

-- Table: Employee
CREATE TABLE Employee (employee_ID INTEGER PRIMARY KEY NOT NULL, lastName VARCHAR(30) NOT NULL, position VARCHAR(30) NOT NULL, salary INTEGER NOT NULL, address_ID INTEGER NOT NULL);

-- Table: Event
CREATE TABLE Event (event_ID INTEGER PRIMARY KEY NOT NULL, event_Name VARCHAR(50) NOT NULL, startDate DATE NOT NULL, endDate DATE NOT NULL, event_Description VARCHAR(100) NOT NULL);

-- Table: Event Ticket
CREATE TABLE "Event Ticket" (ticket_Number INTEGER PRIMARY KEY NOT NULL, event_ID INTEGER NOT NULL REFERENCES Event (event_ID));

-- Table: Invoice
CREATE TABLE Invoice (invoice_ID INTEGER PRIMARY KEY NOT NULL, product_ID INTEGER NOT NULL, employee_ID INTEGER NOT NULL, customer_ID INTEGER NOT NULL, total_Price INTEGER NOT NULL, ticket_Number INTEGER NOT NULL);

-- Table: Product
CREATE TABLE Product (product_ID INTEGER PRIMARY KEY NOT NULL, type VARCHAR(30) NOT NULL, brand VARCHAR(30) NOT NULL, yearMake INTEGER NOT NULL, price INTEGER NOT NULL);

-- Table: Stock
CREATE TABLE Stock (stock_ID INTEGER PRIMARY KEY NOT NULL, product_ID INTEGER NOT NULL REFERENCES Product (product_ID), quantity INTEGER NOT NULL, supply_ID INTEGER NOT NULL REFERENCES Supplying (supply_ID));

-- Table: Supplier
CREATE TABLE Supplier (supplier_ID INTEGER PRIMARY KEY NOT NULL, name VARCHAR(50) NOT NULL);

-- Table: Supplying
CREATE TABLE Supplying (supply_ID INTEGER PRIMARY KEY NOT NULL, supplier_ID INTEGER NOT NULL REFERENCES Supplier (supplier_ID), product_ID INTEGER NOT NULL REFERENCES Product (product_ID), quality VARCHAR (30) NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
