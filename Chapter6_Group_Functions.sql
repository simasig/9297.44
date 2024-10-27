---Chapter 6 --- Group Functions

---SUM , AVG , MIN , MAX , COUNT


SELECT p.ProductID , p.ProductName , p.CategoryID , p.UnitPrice
FROM products p


SELECT SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p


---Operand data type nvarchar is invalid for sum operator.

SELECT SUM( p.ProductName) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p



SELECT MIN( p.ProductName) AS "MIN", MAX(ProductName) AS"MAX",COUNT(p.ProductName) AS "COUNT"
FROM products p


SELECT c.CustomerID , c.Region
FROM customers c


SELECT DISTINCT c.Region
FROM customers c

---COUNT(Column)
---COUNT(*)
---COUNT(DISTINCT column)


SELECT COUNT(c.CustomerID) , COUNT(c.Region),COUNT(*)
,COUNT(DISTINCT region)
FROM customers c

---COPY TABLE PRODUCTS
SELECT top 10 *
INTO new_pro
FROM products

SELECT *
FROM new_pro

UPDATE new_pro
set UnitPrice = null
WHERE CategoryID =2


SELECT COUNT(*) , COUNT(unitprice)
FROM new_pro


SELECT *,ISNULL(unitprice,0)
FROM new_pro

SELECT AVG(unitprice),AVG(ISNULL(unitprice,0)), SUM(UNITPRICE)/COUNT(*)
FROM new_pro



SELECT SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid = 1



SELECT SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid = 5


SELECT SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid IN ( 1,5)

---GROUP BY 


SELECT SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID


SELECT p.CategoryID,SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID


SELECT p.CategoryID,P.SupplierID--,SUM( p.UnitPrice) AS "SUM", AVG(unitprice) AS"AVG"
--,MIN( p.UnitPrice) AS "MIN", MAX(unitprice) AS"MAX",COUNT(p.UnitPrice) AS "COUNT"
FROM products p
WHERE categoryid IN ( 1,5)



SELECT p.CategoryID,AVG(UnitPrice)
FROM products p
WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID



SELECT p.CategoryID,COUNT(*)
FROM products p
WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID


SELECT p.CategoryID,supplierid,COUNT(*)
FROM products p
WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID,supplierid



SELECT p.CategoryID,COUNT(*)
FROM products p
--WHERE categoryid IN ( 1,5)
GROUP BY p.CategoryID



SELECT p.ProductID,COUNT(*)
FROM products p
--WHERE categoryid IN ( 1,5)
GROUP BY p.ProductID


SELECT *
FROM Customers


SELECT count(*), COUNT(customerid)
FROM Customers



SELECT Country, COUNT(customerid)
FROM Customers
GROUP BY country


SELECT Country,city, COUNT(customerid)
FROM Customers
GROUP BY country,City


SELECT orderdate , orderid
FROM orders



SELECT COUNT( orderid)
FROM orders


SELECT YEAR(orderdate) AS YY,COUNT( orderid)
FROM orders


SELECT YEAR(orderdate) AS YY,COUNT( orderid)
FROM orders
GROUP BY OrderDate


SELECT YEAR(orderdate) AS YY,COUNT( orderid)
FROM orders
GROUP BY YEAR(orderdate)




SELECT YEAR(orderdate) AS YY,MONTH(orderdate) AS MM,COUNT( orderid) AS count_orders
FROM orders
GROUP BY YEAR(orderdate),MONTH(orderdate) 
ORDER BY YY,MM



SELECT YEAR(orderdate) AS YY,MONTH(orderdate) AS MM,COUNT( orderid) AS count_orders
FROM orders
WHERE YEAR(orderdate)=1997
GROUP BY YEAR(orderdate),MONTH(orderdate) 
ORDER BY YY,MM


--An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.




YEAR(orderdate) AS YY,MONTH(orderdate) AS MM,COUNT( orderid) AS count_orders
FROM orders
WHERE YEAR(orderdate)=1997
AND COUNT( orderid)>35
GROUP BY YEAR(orderdate),MONTH(orderdate) 
ORDER BY YY,MM


--HAVING

SELECT YEAR(orderdate) AS YY,MONTH(orderdate) AS MM,COUNT( orderid) AS count_orders
FROM orders
WHERE YEAR(orderdate)=1997
GROUP BY YEAR(orderdate),MONTH(orderdate) 
HAVING COUNT( orderid)>35
ORDER BY YY,MM