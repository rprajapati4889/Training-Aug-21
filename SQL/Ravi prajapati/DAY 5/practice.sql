
/* join Clause */

/* it used to combine related data from multiple tables */
/* 4 types of joins */
/* inner join
outer join
cross join 
self join */


/*1.  inner join */
/* it allow to give common data from diffrent sourse tables*/
/* Retrives records from multiple table after comparing values present in a common column. */
/* Retrives only those rows that satify the join condition. */

select * from JobHistory

/*SELECT ProductID, Purchasing.Vendor.BusinessEntityID, Name
FROM Purchasing.ProductVendor INNER JOIN Purchasing.Vendor
    ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
WHERE StandardPrice > $10
  AND Name LIKE N'F%'
  
  SELECT pv.ProductID, v.BusinessEntityID, v.Name
FROM Purchasing.ProductVendor AS pv 
INNER JOIN Purchasing.Vendor AS v
    ON (pv.BusinessEntityID = v.BusinessEntityID)
WHERE StandardPrice > $10
    AND Name LIKE N'F%';
  */


select e.EmployeeID,j.JobID,j.StartDate,j.EndDate from Employees e join JobHistory j on e.EmployeeID = j.EmployeeID where j.startDate>'1990-01-01';

/* outer join */
/* display the result set contain all the rows from one table and the matching  rows from another table */
/* display null for the col of the related table where it does not find matching records. */

/* 1. left outer join */
/* it take all rows of left table and take all common rows btw 2 tbls*/

select e.EmployeeID,j.JobID,j.StartDate,j.EndDate from Employees e left outer join JobHistory j on e.EmployeeID = j.EmployeeID;

/* 2. right outer join */
/* it take all rows of right table and take all common rows btw 2 tbls*/
select * from Employees
select e.EmployeeID,j.JobID,j.StartDate,j.EndDate from JobHistory j right outer join Employees e on j.EmployeeID = e.EmployeeID;

/* 3. full outer join */
/* it take all rows of both table and take all common rows btw 2 tbls*/
select e.EmployeeID,j.JobID,j.StartDate,j.EndDate from Employees e full outer join JobHistory j on e.EmployeeID = j.EmployeeID;


/* Cross Join */
/* Is also Known as the cartesian Product */
/* Join Each row from one table with each row of the other table */
select e.EmployeeID,j.JobID,j.StartDate,j.EndDate from Employees e  cross join JobHistory j

/* Self Join */
/* dout  */
/* A table is joined with itself */
/* one row in table correlates with other rows in same table */
/* we use 2 alias with same table name */

select j.JobID,j.StartDate,j.EndDate,e.DepartmentID from JobHistory e,JobHistory j where e.JobID=j.JobID;