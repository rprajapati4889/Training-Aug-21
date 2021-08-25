CREATE DATABASE Carsalesdb
USE Carsalesdb

CREATE TABLE Employees
(
EmployeeID INT PRIMARY KEY IDENTITY(1,1),
Firstname VARCHAR(40) NOT NULL,
Lastname VARCHAR(40) NOT NULL,
Email VARCHAR(20) UNIQUE CONSTRAINT chkEmail CHECK(Email like'%@%.___'),
Phonenumber NUMERIC(10) UNIQUE CONSTRAINT ckphonenumber CHECK(Phonenumber between 1000000000 and 9999999999),
Salary MONEY NOT NULL
)

INSERT INTO Employees 
VALUES ('Ravi','Prajapati','ravip@gmail.com',8487878292,10000),
('Sam','Padhiayar','sg.pdhr@gmail.com',9265914307,12000),
('Yuvraj','Patel','uv.patel@gmail.com',9265914308,8000)
SELECT *FROM Employees

CREATE TABLE Inventory
(
  ItemID INT PRIMARY KEY IDENTITY(1,1),
  Itemname VARCHAR(20) NOT NULL,
  Itemqty INT NOT NULL
)

ALTER TABLE Inventory
ADD Price INT NOT NULL

INSERT INTO Inventory values('samsung',20,100000)
INSERT INTO Inventory values('oppo',80,200000)
INSERT INTO Inventory values('vivo',90,20000)
SELECT *FROM Inventory

CREATE TABLE Sales
(
Sno INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT UNIQUE,
Customername VARCHAR(20) NOT NULL,
EmployeeID INT CONSTRAINT fkEmpid FOREIGN KEY REFERENCES dbo.Employees(EmployeeID),
ItemID INT CONSTRAINT fkItemID FOREIGN KEY REFERENCES dbo.Inventory(ItemID),
Salesqty INT NOT NULL
)

INSERT INTO Sales VALUES(1,'Rahul',3,2,1)
INSERT INTO Sales VALUES(2,'Abhi',1,3,2)
INSERT INTO Sales VALUES(3,'Mohil',2,1,1)
SELECT *FROM Sales

