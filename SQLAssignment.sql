CREATE DATABASE SQL_ASSIGNMENT1;

CREATE TABLE Customer
(
Customer_ID INTEGER NOT NULL PRIMARY KEY,
FirstName VARCHAR(40) NOT NULL,
LastName VARCHAR(40),
City VARCHAR(40),
Country VARCHAR(40),
Phone VARCHAR(10) --need to make it as unique
);

ALTER TABLE Customer                               --Making Phone Number as Unique
ADD CONSTRAINT UQ_Customer_Phone
UNIQUE(Phone);

INSERT INTO Customer(Customer_ID,FirstName,LastName,City,Country,Phone) --Country is Common for all, We can make it as DEFAULT CONTRAINT later.
VALUES(1,'Manasi','Nyayapati','Bhubaneswar','India','8093549654'),
(2,'Aditya','Mishra','Balugaon','India','9337671718'),
(3,'Rahul','Agrawal','Bangalore','India','9878256452'),
(4,'Sweety','Behera','Kolkata','India','9876547892');
-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Orders
(
Order_ID INTEGER NOT NULL PRIMARY KEY,
OrderDate datetime Not null,
OrderNumber VARCHAR(10) UNIQUE,
CustomerID INTEGER FOREIGN KEY REFERENCES Customer(Customer_ID),
TotalAmount decimal(12,2)
);

INSERT INTO Orders(Order_ID,OrderDate,OrderNumber,CustomerID,TotalAmount)
VALUES(10,01/02/2020,'AWB111674',1,2000),
(11,05/06/2020,'AWB111386',3,8000),
(12,01/09/2021,'AWB165444',3,1000),
(13,03/08/2022,'AWB145555',2,20000);

---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Product
(
ProductOrg_ID INTEGER NOT NULL PRIMARY KEY,
ProductName VARCHAR(50),
UnitPrice decimal(12,2),
Package VARCHAR(30)
);

ALTER TABLE Product
ADD SupplierID INTEGER;

INSERT INTO Product(ProductOrg_ID,ProductName,UnitPrice,Package)
VALUES(21,'Airpod',2240.00,'Amazon'),
(22,'SmartWatch',3500.00,'Flipkart'),
(23,'Television',63000.00,'Amazon'),
(24,'RedMi Mobile',35000.00,'Meesho');

--------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE OrderItems
(
OrderItemsOrg_ID INTEGER NOT NULL PRIMARY KEY,
OrderForeign_ID INTEGER FOREIGN KEY REFERENCES Orders(Order_ID),
ProductForeign_ID INTEGER FOREIGN KEY REFERENCES Product(ProductOrg_ID),
UnitPrice decimal(12,2),
Quantity INTEGER CHECK(Quantity>0)  --A quntity cannot be zero, but A person can place multiple Orders.
);

INSERT INTO OrderItems(OrderItemsOrg_ID,OrderForeign_ID,ProductForeign_ID,UnitPrice,Quantity)
VALUES(20,10,50,4999,1),
(21,11,60,7999,2),
(22,12,70,8999,4),
(23,13,80,9999,1);

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
--A) To create Index for Customer Table
CREATE NONCLUSTERED INDEX IndexCustomerName
ON Customer(FirstName,Lastname);

--B) To create Indexex for Order Table
CREATE NONCLUSTERED INDEX IndexOrderCustomerID --Foreign Key can be duplicate
ON Orders(CustomerID);

CREATE NONCLUSTERED INDEX IndexOrderOrderDate 
ON Orders(OrderDate);

--c) To create Indexex for Product Table
CREATE NONCLUSTERED INDEX IndexProductSupplierID 
ON Product(SupplierID);

CREATE NONCLUSTERED INDEX IndexProductName 
ON Product(ProductName);

--D) To create Indexex for OrderItems Table
CREATE NONCLUSTERED INDEX IndexOrderItemsOrderId 
ON OrderItems(OrderForeign_ID);

CREATE NONCLUSTERED INDEX IndexOrderItemsProductID
ON OrderItems(ProductForeign_ID);
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
--1)Design the Above database with following table by Applying PK and FK
--Completed This Part.

--2)Insert records in all tables
--Completed This Part.

--3)In Customer table FirstName attribute should not access null value
--Completed This Part.

--4)In Orders table OrderDate should not access null value.
--Completed This Part.

--5)display all Customer details.

SELECT C.Customer_ID,C.FirstName,C.LastName,C.City,C.Country,C.Phone
FROM Customer C;

--6) Display all tables present in the database.
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM OrderItems;

--7)Write a query to Display country whose name starts with A or I.

INSERT INTO Customer(Customer_ID,FirstName,LastName,City,Country,Phone) -- Inserting a new value
VALUES(6,'Asmita','Kapoor','Pune','America','8165758103');

SELECT Country
FROM Customer
WHERE FirstName LIKE 'A%' OR 'I%';

--8)Write a query to display name of customer whose third character is i.

SELECT FirstName,LastName,Country
FROM Customer
WHERE FirstName LIKE '__i%';