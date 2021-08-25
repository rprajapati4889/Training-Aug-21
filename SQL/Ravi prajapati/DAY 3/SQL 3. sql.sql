SELECT *FROM Employees
--query 1
SELECT FirstName 'First Name', LEN(FirstName) 'Name length' FROM Dbo.Employees
WHERE FirstName LIKE ('A%') OR FirstName LIKE ('J%') OR FirstName LIKE ('M%')
ORDER BY FirstName


--query 2
SELECT FirstName,
	CONCAT(FORMAT(Salary,'C'),REPLICATE('0',10-LEN(Salary))) AS Salary
FROM Employees

--query 3
SELECT EmployeeID, FirstName,LastName,HireDate FROM Employees
WHERE DATEPART(dd,HireDate) LIKE 07 OR DATEPART(mm,HireDate) LIKE 07


--query 4
SELECT FirstName, LEN(FirstName) AS 'First Name length',LastName FROM Employees
WHERE LastName LIKE '__%c%'

--query 5
SELECT RIGHT(PhoneNumber,4) AS 'last 4 digit of Phone No' FROM Employees

--query 6
SELECT REPLACE(PhoneNumber,'124','999') AS 'New No' FROM Employees

--query 7
SELECT HireDate,DATEPART(year,GETDATE())-DATEPART(year,HireDate) 'year in company' FROM Employees


--query 8
SELECT HireDate FROM Employees
WHERE DATENAME(WEEKDAY,HireDate) LIKE 'Monday'


--query 9
SELECT FirstName,HireDate FROM Employees
WHERE HireDate BETWEEN '1987/06/01' AND '1987/07/30'


--query 10
SELECT RIGHT(GETDATE(),7)+' '+
	DATENAME(MONTH,GETDATE())+' '+
	DATENAME(DAY,GETDATE())+' ,'+
	DATENAME(YYYY,GETDATE())


--query 11
SELECT FirstName,LastName,HireDate FROM Employees
WHERE DATENAME(month,HireDate) LIKE 'JUNE'


--query 12
SELECT FirstName,HireDate, Experience=DATEDIFF(year,HireDate,GETDATE()) FROM Employees


--query 13
SELECT FirstName,HireDate FROM Employees
WHERE DATEPART(year,HireDate) LIKE '1987'
