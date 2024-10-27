---Chapter 5 --- JOIN TABLES
---INNER JOIN ,OUTER JOIN, CROSS JOIN,SELF JOIN


---INNER JOIN
/*
SELECT *|a.col1,a.col2,b.col,.....
FROM table1 a [INNER] JOIN table2 b
ON a.column=b.column
WHERE condition/s
ORDER BY column [ASC|DESC]

*/

SELECT * FROM Categories
SELECT * FROM Products


SELECT *
FROM categories c INNER JOIN  products p
ON c.CategoryID = p.CategoryID



SELECT p.ProductID ,p.ProductName ,p.CategoryID ,c.CategoryName,p.UnitPrice
FROM categories c INNER JOIN  products p
ON c.CategoryID = p.CategoryID


--Ambiguous column name 'CategoryID'.

SELECT ProductID ,ProductName ,CategoryID ,c.CategoryName,p.UnitPrice
FROM categories c INNER JOIN  products p
ON c.CategoryID = p.CategoryID


SELECT p.ProductID ,p.ProductName ,p.CategoryID ,c.CategoryName,p.UnitPrice
FROM categories c  JOIN  products p
ON c.CategoryID = p.CategoryID



SELECT p.ProductID ,p.ProductName ,p.CategoryID ,c.CategoryName,p.UnitPrice
FROM categories c  JOIN  products p
ON c.CategoryID = p.CategoryID
WHERE p.UnitPrice <=10
ORDER BY unitprice DESC


---Joining more than 2 tables
/*
SELECT *|a.col1,a.col2,b.col,.....
FROM table1 a [INNER] JOIN table2 b
ON a.column=b.column
	[INNER] JOIN  table3 c
ON c.column=a|b.column
	[INNER] JOIN  table4 d
ON d.column=a|b|c.column
	[INNER] JOIN  table..
ON ........
WHERE condition/s
ORDER BY column [ASC|DESC]

*/

SELECT c.CustomerID ,c.CompanyName,o.OrderID
	,o.OrderDate ,o.EmployeeID ,e.lastname,e.FirstName
FROM customers c JOIN orders o
ON c.CustomerID = o.CustomerID
	JOIN employees e
ON e.EmployeeID =o.EmployeeID
WHERE c.CustomerID ='alfki'


SELECT products.ProductID ,products.ProductName ,products.CategoryID 
	,categories.CategoryName,products.UnitPrice
FROM categories   JOIN  products 
ON categories.CategoryID = products.CategoryID



SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e JOIN orders o
ON e.EmployeeID = o.EmployeeID
	JOIN Customers c
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '1998-02-01' AND '1998-02-28'
AND o.CustomerID LIKE '%[AC]%'


SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e JOIN orders o
ON e.EmployeeID = o.EmployeeID
	JOIN Customers c
ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) =1998
AND MONTH(o.orderdate) =2
AND o.CustomerID LIKE '%[AC]%'

---OUTER JOIN
----LEFT , RIGHT , FULL


/*
SELECT *|a.col1,a.col2,b.col,.....
FROM table1 a [LEFT|RIGHT|FULL][INNER|OUTER] JOIN table2 b
ON a.column=b.column
WHERE condition/s
ORDER BY column [ASC|DESC]

*/

CREATE TABLE dep
(depid INT,
 depname VARCHAR(20)
 )

 CREATE TABLE emp
 (empid INT,
  empname VARCHAR(25),
  depid INT
  )


  SELECT * FROM DEP
  SELECT * FROM EMP

  INSERT INTO dep
  VALUES(10 ,'IT'),
		(20,'HR'),
		(30,'DA')

INSERT INTO emp
VALUES (1,'Moshe',10),
		(2,'Yafa',30),
		(3,'Avi',null),
		(4,'Noam',30)


  SELECT * FROM DEP
  SELECT * FROM EMP


  SELECT *
  FROM emp JOIN dep
  ON emp.depid = dep.depid


    SELECT *
  FROM emp LEFT OUTER JOIN dep
  ON emp.depid = dep.depid


  SELECT *
  FROM emp LEFT  JOIN dep
  ON emp.depid = dep.depid


  SELECT *
  FROM emp RIGHT  JOIN dep
  ON emp.depid = dep.depid


    SELECT *
  FROM emp FULL  JOIN dep
  ON emp.depid = dep.depid



    SELECT *
  FROM DEP LEFT  JOIN EMP
  ON emp.depid = dep.depid


  SELECT c.CustomerID
  FROM customers c  


    SELECT DISTINCT o.CustomerID
  FROM orders o  


   SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c JOIN orders o
  ON c.CustomerID = o.CustomerID



  SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c LEFT JOIN orders o
  ON c.CustomerID = o.CustomerID


    SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c LEFT JOIN orders o
  ON c.CustomerID = o.CustomerID
  ORDER BY OrderID


    SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c RIGHT JOIN orders o
  ON c.CustomerID = o.CustomerID


    SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c FULL JOIN orders o
  ON c.CustomerID = o.CustomerID


  SELECT c.CustomerID,c.CompanyName, o.OrderID , o.OrderDate
  FROM customers c LEFT JOIN orders o
  ON c.CustomerID = o.CustomerID
  WHERE o.OrderID IS NULL
  ORDER BY OrderID


   SELECT *
  FROM customers c LEFT JOIN orders o
  ON c.CustomerID = o.CustomerID
  WHERE o.OrderID IS NULL
  ORDER BY OrderID


     SELECT C.*
  FROM customers c LEFT JOIN orders o
  ON c.CustomerID = o.CustomerID
  WHERE o.OrderID IS NULL
  ORDER BY OrderID



  ---CROSS JOIN 
  SELECT * FROM dep
  SELECT * FROM emp


  SELECT *
  FROM emp CROSS JOIN dep


  --NON ANSI JOIN

  /*
NON ANSI JOIN	| ANSI JOIN 
-------------	| ----------
	
	,			|	JOIN
	WHERE		|	ON
	AND			|	WHERE


  */

  --NON ANSI CROSS JOIN
    SELECT *
  FROM emp , dep

  
  SELECT * FROM DEP
  SELECT * FROM EMP

---ANSI INNER JOIN
  SELECT *
  FROM emp JOIN dep
  ON emp.depid = dep.depid


  ---NON ANSI INNER JOIN
  SELECT *
  FROM emp , dep
  WHERE emp.depid = dep.depid



  SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e JOIN orders o
ON e.EmployeeID = o.EmployeeID
	JOIN Customers c
ON c.CustomerID = o.CustomerID
WHERE c.CustomerID ='alfki'


SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e , orders o,Customers c
WHERE e.EmployeeID = o.EmployeeID
AND c.CustomerID = o.CustomerID
AND c.CustomerID ='alfki'


SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e , orders o,Customers c
WHERE e.EmployeeID = o.EmployeeID
AND c.CustomerID = o.CustomerID
AND 1=1
AND c.CustomerID ='alfki'


  SELECT *
  FROM emp JOIN dep
  ON emp.depid = dep.depid
--CROSS JOIN
  SELECT *
  FROM emp , dep
  WHERE 1=1

    SELECT *
  FROM emp JOIN dep
  ON 1=1


    SELECT *
  FROM emp JOIN dep
  ON emp.EMPID=1


    SELECT *
  FROM emp JOIN dep
  ON emp.depid = emp.depid


 SELECT e.EmployeeID,e.LastName,e.FirstName
,o.OrderID , o.OrderDate , o.CustomerID, c.CompanyName
FROM Employees e JOIN orders o
ON e.EmployeeID = o.EmployeeID
	JOIN Customers c
ON O.CustomerID = o.CustomerID
WHERE c.CustomerID ='alfki'




SELECT c.CustomerID , c.CompanyName
,o.OrderID , o.OrderDate
,CONCAT_WS(' ',e.EmployeeID,e.LastName,e.FirstName) AS FullEmployee
FROM customers c JOIN orders o
ON c.CustomerID = o.CustomerID
	JOIN employees e
ON e.EmployeeID = o.EmployeeID



SELECT c.CustomerID , c.CompanyName
,o.OrderID , o.OrderDate
,CONCAT_WS(' ',e.EmployeeID,e.LastName,e.FirstName) AS FullEmployee
FROM customers c LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
	LEFT JOIN employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY orderid



SELECT c.CustomerID , c.CompanyName
,o.OrderID , o.OrderDate
,CONCAT_WS(' ',e.EmployeeID,e.LastName,e.FirstName) AS FullEmployee
FROM  orders o RIGHT JOIN  customers c
ON c.CustomerID = o.CustomerID
	LEFT JOIN employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY orderid


SELECT c.CustomerID , c.CompanyName
,o.OrderID , o.OrderDate
,CONCAT_WS(' ',e.EmployeeID,e.LastName,e.FirstName) AS FullEmployee
FROM  orders o  JOIN employees e
ON e.EmployeeID = o.EmployeeID
	RIGHT JOIN  customers c
ON c.CustomerID = o.CustomerID
ORDER BY orderid


---Self Joins


SELECT EmployeeID , LastName , ReportsTo, LastName
FROM employees


SELECT emp.EmployeeID AS empid , emp.LastName  AS empname
, mng.EmployeeID AS mngid , mng.LastName AS mngname
FROM employees emp join employees mng
ON EMP.ReportsTo = mng.EmployeeID


SELECT emp.EmployeeID AS empid , emp.LastName  AS empname
, mng.EmployeeID AS mngid , mng.LastName AS mngname
FROM employees emp LEFT JOIN employees mng
ON EMP.ReportsTo = mng.EmployeeID


