USE practice2

--1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.
SELECT FirstName,LastName,Salary FROM Employees
WHERE SALARY>(SELECT Salary FROM Employees
WHERE LastName='BULL')


--2. Find the names (first_name, last_name) of all employees who works in the IT department.
SELECT *FROM Employees
SELECT *FROM Departments
SELECT *FROM Locations
SELECT Firstname,LastName FROM Employees WHERE DepartmentID IN  (SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')


--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 
Hint : Write single-row and multiple-row subqueries
SELECT Firstname,LastName FROM Employees WHERE ManagerID IN(SELECT ManagerID FROM Departments WHERE ManagerID>0 
AND LocationID IN (SELECT LocationID FROM Locations WHERE CountryID='US'))

----4. Find the names (first_name, last_name) of the employees who are managers.


--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary
SELECT Firstname,LastName FROM Employees WHERE Salary>(SELECT AVG(Salary) FROM Employees)


--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.
SELECT Firstname,LastName FROM Employees WHERE Salary = (SELECT MIN(Salary) FROM Employees)


--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.
SELECT Firstname,LastName,Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees) AND
DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName LIKE 'IT%')


--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell.
SELECT Firstname,LastName,Salary FROM Employees WHERE Salary > (SELECT Salary FROM Employees WHERE LastName='Bell')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT Firstname,LastName,Salary FROM Employees WHERE Salary = ALL (SELECT MIN(Salary)FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department.
SELECT Firstname,LastName,Salary FROM Employees WHERE Salary > ALL (SELECT AVG(Salary)FROM Employees)


--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of
all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 
SELECT Firstname,LastName,Salary FROM Employees WHERE Salary > ALL (SELECT Salary FROM Employees WHERE JobId='SH_CLERK') ORDER BY Salary


--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.
SELECT *FROM Employees
SELECT firstname,lastname,salary,departmentID FROM Employees WHERE DepartmentID NOT IN (SELECT ManagerID FROM Employees)


--13. Write a query to display the employee ID, first name, last names, and department names of all employees.
SELECT ALL e.EmployeeID,e.Firstname,e.LastName,d.Departmentname FROM Employees AS e 
join Departments AS d ON e.DepartmentID=d.DepartmentID

---14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.
SELECT ALL e.EmployeeID,e.Firstname,e.Lastname,e.salary FROM Employees AS E WHERE Salary > (SELECT AVG(Salary) FROM Employees as e join Departments as d ON 
e.DepartmentID=d.DepartmentID) 

--15. Write a query to fetch even numbered records from employees table.
SELECT *FROM Employees WHERE EmployeeID % 2=0


--16. Write a query to find the 5th maximum salary in the employees table.
SELECT *FROM Employees E1
WHERE 5 =(SELECT COUNT(DISTINCT SALARY) FROM Employees E2 WHERE e2.Salary>e1.Salary )

OR

select DISTINCT(Salary)from (select DENSE_RANK() over(order by Salary desc) as 'rank',* from Employees) tbl where rank ='5'

----17. Write a query to find the 4th minimum salary in the employees table.
SELECT *FROM Employees E1 
WHERE 4 =(SELECT COUNT(DISTINCT SALARY)FROM Employees E2 WHERE e2.Salary<e1.Salary)

OR

select DISTINCT(Salary)from (select DENSE_RANK() over(order by Salary ASC) as 'rank',* from Employees) tbl where rank ='4'

--18. Write a query to select last 10 records from a table.
SELECT *FROM(SELECT TOP 10 *FROM Employees ORDER BY EmployeeID DESC) SUB ORDER BY EmployeeID ASC


--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 
SELECT *FROM Employees WHERE DepartmentID  NOT in (SELECT DepartmentID from Departments) 

--20. Write a query to get 3 maximum salaries. 
SELECT TOP 3 Salary FROM Employees ORDER BY Salary DESC

OR

SELECT DISTINCT(SALARY) FROM(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC)AS 'RANK',*FROM Employees) tb1 WHERE RANK<=3

--21. Write a query to get 3 minimum salaries.
SELECT TOP 3 SALARY FROM Employees ORDER BY SALARY ASC

OR

SELECT DISTINCT(SALARY) FROM(SELECT DENSE_RANK() OVER(ORDER BY SALARY ASC)AS 'RANK',*FROM Employees) tb1 WHERE RANK<=3

--22. Write a query to get nth max salaries of employees.

SELECT DISTINCT(SALARY) FROM(SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC)AS 'RANK',*FROM Employees) tb1 WHERE RANK<=10