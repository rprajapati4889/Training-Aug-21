USE practice2

--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

CREATE VIEW ALL_DEP_ADD
AS
(
SELECT d.DepartmentID,L.LocationID,STREETADDRESS,CITY,STATEPROVINCE,CountryID FROM Locations L join Departments d on L.locationID=d.LocationID)
SELECT *FROM ALL_DEP_ADD


--2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
CREATE VIEW ALL_EMP
AS
(
SELECT FirstName+','+LastName name, DepartmentID FROM Employees )

SELECT *FROM ALL_EMP

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW SUPP3
AS
(SELECT E.firstname+' '+E.lastname name,E.jobid,D.departmentID,D.Departmentname FROM Employees E JOIN Departments D 
ON E.DepartmentID=D.DepartmentID JOIN Locations L ON L.LocationID=D.LocationID WHERE City='LONDON')

SELECT *FROM SUPP3

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
CREATE VIEW SUPP4
AS
(SELECT EmployeeID,Lastname,ManagerID FROM Employees)

SELECT *FROM SUPP4

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'
CREATE VIEW SUPP5
AS
(SELECT E.firstname,E.lastname,e.joiningdate FROM Employees E JOIN Employees E1 ON (E1.FirstName='JOHN')
WHERE E1.JoiningDate<E.JoiningDate)

SELECT *FROM SUPP5

--6. Write a query to get the department name and number of employees in the department
CREATE VIEW SUPP6
AS
(SELECT D.Departmentname,COUNT(*) 'no of emp' FROM Departments D INNER JOIN Employees E ON E.DepartmentID=D.DepartmentID 
GROUP BY D.DepartmentID,DepartmentName)
SELECT *FROM SUPP6


--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
CREATE VIEW SUPP7
AS
(SELECT E.EmployeeID,E.JobID,DATEDIFF(dd,j.StartDate,j.EndDate)'diff of day' FROM Employees E JOIN Departments D ON E.DepartmentID=D.DepartmentID
join JobHistory j ON E.EmployeeID=J.EmployeeID WHERE j.DepartmentID=90)

SELECT *FROM SUPP7

---8. Write a query to display the department ID, department name and manager first name.

CREATE VIEW SUP8
AS
(SELECT DepartmentID,Departmentname,ManagerID FROM Departments)
SELECT *FROM SUP8

--9. Write a query to display the department name, manager name, and city.
CREATE VIEW SUP9
AS
(SELECT D.Departmentname,D.ManagerID,L.CITY FROM Departments D JOIN Locations L ON D.LocationID=L.LocationID)

SELECT *FROM SUP9


--10. Write a query to display the job title and average salary of employees. 

---11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

