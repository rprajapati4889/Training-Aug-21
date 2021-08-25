CREATE DATABASE Practicedb
USE Practicedb

CREATE TABLE countries
(
countryID int CONSTRAINT pkcountryID PRIMARY KEY,
countryname VARCHAR(50) CHECK( countryname IN('INDIA','CHINA','ITALY')),
regionID int CONSTRAINT unregionID UNIQUE
)

INSERT INTO countries values(105,'INDIA',56)
SELECT *FROM countries

CREATE TABLE jobhistory
(
employeeID int PRIMARY KEY,
startdate DATE,
enddate DATE,
jobID int,
departmentID int
)

INSERT INTO jobhistory values(108,'12/02/2000','12/02/2021',59,98)
SELECT *FROM jobhistory

CREATE TABLE jobs
(
jobID int PRIMARY KEY,
jobtitle varchar(50) DEFAULT'',
min_salary int DEFAULT 8000,
max_salary int DEFAULT NULL
)

INSERT INTO jobs values(59,'ios developer',15000,8000)
SELECT *FROM jobs

CREATE TABLE departments
(
departmentID int PRIMARY KEY,
departmentname varchar(50)
)
INSERT INTO departments values(41,'developer')
SELECT *FROM departments


CREATE TABLE employees
(
employeeID int CONSTRAINT unempID UNIQUE,
firstname varchar(100),
lastname varchar(100),
email varchar(50),
phonenumber varchar(10),
hiredate DATE,
jobID int CONSTRAINT fkjobID FOREIGN KEY REFERENCES dbo.jobs(jobID) ,
salary int,
commission int,
managerID int,
departmentID int CONSTRAINT fkdepartmentID FOREIGN KEY REFERENCES dbo.departments(departmentID)

)

INSERT INTO employees values(57,'RAVI','PRAJAPATI','ravip4968421@gmail.com','8487878292','1/1/2020',52,15000,8000,22,41)
SELECT *FROM employees

ALTER TABLE jobhistory
ADD CONSTRAINT fk_job_id FOREIGN KEY (jobID) REFERENCES dbo.jobs(jobID)

ALTER TABLE jobhistroy
DROP CONSTRAINT fk_job_id

ALTER TABLE jobhistory
ADD location varchar(100)
