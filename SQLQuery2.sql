SELECT * FROM Customer
WHERE Country= 'GERMANY';

select * from Orders

update Orders
set OrderDate='20220402'
where Order_Id=10

CREATE TABLE Employee  --Creating additional employee table for the existing DB
(
EmployeeId INTEGER IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40)
);

INSERT INTO Employee(FirstName,LastName,City,Country,Phone)
VALUES ('Pooja','Sharma','Delhi','India','9876456223'),
('Aditya','Shankar','Kolkata','Indonesia','9876545634'),
('RAHUL','Agarawal','Luknow','India','9876543217'),
('Rohit','Sharma','WestLand','Germany','9876543216');

--2)Display the  full name of the employee  

SELECT FirstName,LastName
FROM Employee;

--3)Display the  customer details  who has Fax number

ALTER TABLE Customer
ADD FaxNumber INTEGER;

SELECT * FROM Customer 
WHERE FaxNumber like '[+]%'or FaxNumber like '%-%';

--4)display the customer details whose name holds second letter as U

SELECT * FROM Customer
WHERE LastName LIKE '%U'

--5)select order Details where unit price is greater than 10 and less than 20

SELECT * FROM OrderItems
WHERE UnitPrice > 10 AND UnitPrice < 20;

--6)Display order details which contains shipping date and arrange the order by date

SELECT OrderDate AS SHIPPING_DATE 
FROM Orders
ORDER BY OrderDate ASC;  -- Ascending order is default here

--7)Print the orders shipped by ship name 'La corned'abondance' between 2 dates(Choose dates of your choice)

SELECT *
FROM Orders
where OrderDate =''La corned abondance' AND 'OrderDate BETWEEN '2022-04-02' AND '2022-04-05' 
ORDER BY OrderDate ASC;

--8)Print the products supplied by 'Exotic Liquids'

SELECT * FROM Product;

UPDATE Product SET Package='Exotic Liquids'
WHERE ProductOrg_ID=23;

UPDATE Product SET ProductName='Russian Vodka'
WHERE ProductOrg_ID=23;

SELECT ProductName
FROM Product
WHERE Package ='EXOTIC LIQUIDS';

--9)print the average quantity ordered for every product
SELECT * FROM OrderItems;

SELECT AVG(Quantity) AS Avg_Quantity
FROM OrderItems
GROUP BY ProductForeign_ID;

--10)Print all the Shipping company name and the ship names if they are operational
CREATE TABLE tblShipping
(
ID INTEGER PRIMARY KEY,
ShipCompany VARCHAR(100),
ShipName VARCHAR(100),
IsOperational VARCHAR(10)
);

INSERT INTO tblShipping(ID,ShipCompany,ShipName,IsOperational)
VALUES(111,'Bluedart','Cloths','Yes'),
(112,'XpressBees','WelcomeKit','NO'),
(113,'Myntra','Utensils','Yes'),
(114,'Amazon','Mobile','Yes');

SELECT * FROM tblShipping;

SELECT ShipCompany, ShipName
From tblShipping
Where IsOperational = 'yes';

--11)Print all Employees with Manager Name

ALTER TABLE Employee
ADD ManagerName VARCHAR(30); 

SELECT * FROM Employee;

CREATE TABLE ManagerDetails
(
ManagerName VARCHAR(30)
);

INSERT INTO ManagerDetails(ManagerName)
VALUES('Sunder Picchai'),
('Satys Nadella'),
('Sundarram Bahuguna'),
('Kamala Pant');
SELECT * FROM Employee;
SELECT * FROM ManagerDetails;

SELECT E.FirstName AS EMPLOYEE_NAME, M.ManagerName AS MANAGER_NAME
FROM Employee E 
JOIN 
ManagerDetails M
ON E.FirstName=M.ManagerName;

--12)Print the bill for a given order id .bill should contain Productname, Categoryname,price after discount
SELECT * FROM Product;
SELECT * FROM OrderItems;

SELECT OI.OrderItemsOrg_ID,P.ProductName,P.Category,P.Discount
FROM Product P 
INNER JOIN 
OrderItems OI
ON P.ProductOrg_ID = OI.ProductForeign_ID;

--13)Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name
SELECT * FROM Product;
SELECT * FROM tblShipping;


SELECT SUM(UnitPrice) As Total_Price_Offered,ShipCompany 
FROM Product 
JOIN
tblShipping 
ON ProductOrg_ID = ID
GROUP BY SupplierID
HAVING Package ='exotic liquids' AND UnitPrice > 50;