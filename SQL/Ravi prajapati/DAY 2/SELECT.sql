SELECT *FROM Employees

SELECT FirstName , Lastname FROM Employees

SELECT FirstName AS Employee_Name FROM Employees

SELECT *FROM Employees WHERE FirstName='Steven'

SELECT *FROM Employees WHERE FirstName='Neena' OR FirstName='Lex'

SELECT *FROM Employees WHERE NOT FirstName='Neena' AND NOT FirstName='Lex'

SELECT *FROM Employees WHERE  Salary BETWEEN 5000 AND 8000

SELECT FirstName +' '+LastName AS Employeename,Salary, PF=0.12*Salary FROM Employees

SELECT *FROM Employees WhERE FirstName LIKE 'N%'

SELECT DISTINCT DepartmentID FROM Employees

SELECT *FROM Employees ORDER BY FirstName DESC

SELECT EmployeeID,FirstName,LastName,Salary FROM Employees ORDER BY Salary ASC

SELECT TOP (2) Salary FROM Employees



