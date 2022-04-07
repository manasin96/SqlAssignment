--1)write a query to display the orders placed by customer with phone number 030-0074321

SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Product;

UPDATE Customer SET Phone = '0300074321'
WHERE Customer_ID = 3;

SELECT ord.Quantity AS ORDERS_PLACED
FROM OrderItems ord
INNER JOIN
Customer c
ON
c.Customer_ID = ord.OrderItemsOrg_ID
WHERE Phone ='0300074321';

--2)fetching all the products which are available under Category ‘Seafood’.

SELECT ProductName AS PRODUCTS
FROM Product
WHERE Package ='SeaFood';

--3)Display the orders placed by customers not in London

SELECT * 
FROM Customer
WHERE City NOT IN('LONDON');

--4)select all the order which are placed for the product Chai.

SELECT * 
FROM Product
WHERE ProductName ='CHAI';

--5)Write a query to display the name , department name and rating  of any given employee

CREATE TABLE Department
(
DeptID INTEGER PRIMARY KEY,
DepartmentName VARCHAR(30),
EmployeeRating INTEGER
);

INSERT INTO Department(DeptID,DepartmentName,EmployeeRating)
VALUES(201,'HR',10),
(202,'BUHR',8),
(203,'CFMG',10),
(204,'OUTSOURCE',5);

SELECT * FROM Employee;
SELECT * FROM Department;

SELECT E.FirstName AS EMP_NAME , D.DepartmentName AS DEPT_NAME,D.EmployeeRating
FROM Employee E 
INNER JOIN 
Department D
ON E.EmployeeId = D.DeptID;