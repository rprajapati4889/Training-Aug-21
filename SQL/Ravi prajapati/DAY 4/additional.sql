SELECT *,
 NTILE(2) OVER(ORDER BY SALARY)'part' FROM Employees



SELECT *,
 NTILE(5) OVER(ORDER BY SALARY)'part' FROM Employees



SELECT *,
 NTILE(5) OVER(ORDER BY SALARY)'part' FROM Employees
 ORDER BY SALARY


SELECT FirstName 'FNAME',JOBID,
 NTILE(3) OVER(PARTITION BY JOBID ORDER BY SALARY)'part' FROM Employees
 ORDER BY SALARY,part



SELECT COUNT(EmployeeID) AS 'Number',JobId,DepartmentID FROM Employees GROUP BY ROLLUP (JobId,DepartmentID) 

SELECT COUNT(EmployeeID) AS 'Number',JobId,DepartmentID FROM Employees GROUP BY CUBE (JobId,DepartmentID) ORDER BY COUNT(EmployeeID) DESC