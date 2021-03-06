USE master
GO

DROP TABLE IF EXISTS Restaurant

CREATE DATABASE RESTAURANT
GO


USE RESTAURANT;
GO

CREATE TABLE RES_TABLES(
TABLE_ID INT NOT NULL PRIMARY KEY,
TABLE_NUMBER NUMERIC (2,0)
);


CREATE TABLE BRANCH_OFFICES(
BRANCH_ID INT NOT NULL PRIMARY KEY,
BRANCH_NAME VARCHAR (50),
PHONE_NUMBER NUMERIC (7,0),
BRANCH_ADDRESS VARCHAR (50)
);


CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT NOT NULL PRIMARY KEY,
CUSTOMER_NAME VARCHAR (50) NULL,
CUSTOMER_LASTNAME VARCHAR (50) NULL,
CUSTOMER_ADDRESS VARCHAR (50) NOT NULL,
PHONE_NUMBER NUMERIC (10,0) NOT NULL,
);


CREATE TABLE DISHES(
DISH_ID INT NOT NULL PRIMARY KEY,
DISH_NAME VARCHAR (50) NULL,
DISH_PRICE MONEY NOT NULL,
);


CREATE TABLE RESERVATIONS(
RESERVATION_ID INT NOT NULL PRIMARY KEY,
CUSTOMER_ID INT,
TABLE_ID INT,
RESERVATION_DATE DATE,
BRANCH_ID INT,
);


ALTER TABLE RESERVATIONS
ALTER COLUMN TABLE_ID INT


CREATE TABLE EMPLOYEES(
EMPLOYEE_ID INT NOT NULL PRIMARY KEY,
EMPLOYEE_NAME VARCHAR (50) NULL,
EMPLOYEE_LASTNAME VARCHAR (50) NULL,
PHONE_NUMBER NUMERIC (10) NOT NULL,
EMPLOYEE_ADDRESS VARCHAR (50) NULL,
JOB_POSITION VARCHAR (30) NOT NULL,
BRANCH_ID INT,
);


CREATE TABLE INVOICE(
INVOICE_ID INT NOT NULL PRIMARY KEY,
CUSTOMER_ID INT,
VISIT_DATE DATE,
);

CREATE TABLE INVOICE_DETAIL(
INVOICE_DETAIL_ID INT NOT NULL PRIMARY KEY,
INVOICE_ID INT,
EMPLOYEE_ID INT,
DISH_ID INT,
TABLE_ID INT,
);


ALTER TABLE RESERVATIONS
ADD CONSTRAINT FK_RESERVATION FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS
(CUSTOMER_ID);


ALTER TABLE RESERVATIONS
ADD CONSTRAINT FK_RESERVATION_TABLE FOREIGN KEY (TABLE_ID) REFERENCES RES_TABLES
(TABLE_ID);


ALTER TABLE INVOICE
ADD CONSTRAINT FK_CUSTOMER FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS
(CUSTOMER_ID);


ALTER TABLE RESERVATIONS
ADD CONSTRAINT FK_BRANCH FOREIGN KEY (BRANCH_ID) REFERENCES BRANCH_OFFICES
(BRANCH_ID);


ALTER TABLE INVOICE_DETAIL
ADD CONSTRAINT FK_INVOICE FOREIGN KEY (INVOICE_ID) REFERENCES INVOICE
(INVOICE_ID);


ALTER TABLE INVOICE_DETAIL
ADD CONSTRAINT FK_EMPLOYEE FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES
(EMPLOYEE_ID);


ALTER TABLE INVOICE_DETAIL
ADD CONSTRAINT FK_DISH FOREIGN KEY (DISH_ID) REFERENCES DISHES
(DISH_ID);


ALTER TABLE RESERVATIONS
ADD CONSTRAINT FK_TABLE FOREIGN KEY (TABLE_ID) REFERENCES RES_TABLES
(TABLE_ID);
