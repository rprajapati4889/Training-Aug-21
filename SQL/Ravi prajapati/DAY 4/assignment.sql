SELECT * FROM Employees
--query
SELECT FirstName +' ' +LastName AS 'Name' ,Salary, RANK() OVER(ORDER BY Salary)'Salary Rank' FROM Employees

--query
SELECT *FROM
(SELECT FirstName +' ' +LastName AS 'Name' ,Salary, Sal_Rank= RANK() OVER(ORDER BY Salary DESC)FROM Employees) temp
WHERE Sal_Rank=4



--query
SELECT DepartmentID,total_salary=SUM(Salary) FROM Employees
GROUP BY DepartmentID


--query
SELECT DepartmentID,total_salary=SUM(Salary) FROM Employees
GROUP BY DepartmentID
ORDER BY total_salary DESC

--query
SELECT DISTINCT DepartmentID, dept_max_salary=MAX(salary) OVER(PARTITION BY DepartmentID) FROM Employees
ORDER BY dept_max_salary ASC

--query
SELECT DISTINCT DepartmentID, dept_min_salary=MIN(salary) OVER(PARTITION BY DepartmentID) FROM Employees
ORDER BY dept_min_salary ASC

--query
SELECT *FROM
(SELECT DepartmentID,total_dept_salary=SUM(Salary) FROM Employees
GROUP BY DepartmentID) temp
WHERE total_dept_salary >50000
ORDER BY total_dept_salary DESC

or 

SELECT *FROM
(SELECT DISTINCT DepartmentID,total_dept_salary=SUM(Salary) OVER(PARTITION BY DepartmentID) FROM Employees
) temp
WHERE total_dept_salary >50000
ORDER BY total_dept_salary DESC
