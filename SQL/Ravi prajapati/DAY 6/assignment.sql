USE practice2

SELECT *FROM Employees
SELECT *FROM Incentive



--1.Select employee details from employee table if data exists in incentive table ?
SELECT *FROM Employees
WHERE EmployeeID IN(SELECT EmployeeID FROM Incentive)

--2.Find Salary of the employee whose salary is more than Roy Salary
SELECT FirstName,LastName,Salary FROM Employees
WHERE SALARY>(SELECT Salary FROM Employees
WHERE FirstName= 'ROY')


--3.Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount.
CREATE VIEW EMPLOYEE_ALL_INFO
AS 
SELECT Firstname,Lastname,Salary,JoiningDate,IncentiveDate,IncentiveAmount FROM Employees E
LEFT OUTER JOIN Incentive I ON E.EmployeeID=I.EmployeeID

SELECT *FROM EMPLOYEE_ALL_INFO

---4.Create a view to select Select first_name, incentive amount from employee and incentives table for 
those employees who have incentives and incentive amount greater than 3000

CREATE VIEW EMPLOYEE_AMO
AS
SELECT Firstname,Incentiveamount FROM Employees E JOIN Incentive I ON E.EmployeeID=I.EmployeeID
WHERE IncentiveAmount>3000

SELECT *FROM EMPLOYEE_AMO

--5.Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW EMPLOYEE_LONDON
AS
SELECT FirstName+', '+LastName NAME,JobId,E.DepartmentID,D.DepartmentName FROM Employees E JOIN Departments D  ON E.DepartmentID=D.DepartmentID
WHERE E.DepartmentID=(SELECT DepartmentID FROM Departments WHERE LOCATIONID=(SELECT LocationID FROM Locations WHERE City='LONDON'))

SELECT *FROM EMPLOYEE_LONDON

--6.Create a View to get the department name and number of employees in the department.
CREATE VIEW TOTAL_EMP
AS
SELECT D.DepartmentID,D.departmentName,COUNT(*) 'TOTAL NO EMP' FROM Employees E,Departments D
WHERE E.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentID,D.DepartmentName

SELECT *FROM TOTAL_EMP

--7.Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history

CREATE VIEW DEPT_DIFF
AS
SELECT E.EmployeeID,E.JobID,DATEDIFF(dd,j.StartDate,j.EndDate)'diff of day' FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID
join JobHistory j ON E.EmployeeID=J.EmployeeID WHERE j.DepartmentID=90

SELECT *FROM DEPT_DIFF

--8.Write a View to display the department name, manager name, and city
CREATE VIEW MANG_DEP_CITY
AS
SELECT DISTINCT D.DepartmentName,M.FIRSTNAME,L.CITY FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID
JOIN Employees M ON E.ManagerID=M.ManagerID JOIN Locations L ON d.LocationID=L.LocationID 

SELECT *FROM MANG_DEP_CITY


--9.Create a View to display department name, name (first_name, last_name),
hire date, salary of the manager for all managers whose experience is more than 15 years

CREATE VIEW MAN_EXP_15_YEAR
AS
SELECT D.Departmentname,M.Firstname+','+M.Lastname NAME,M.JoiningDate,M.salary FROM Employees E JOIN Employees M ON
E.ManagerID=M.EmployeeID JOIN Departments D ON E.DepartmentID=D.DepartmentID 
WHERE DATEDIFF(YYYY,m.JoiningDate,GETDATE())>15

SELECT *FROM MAN_EXP_15_YEAR

