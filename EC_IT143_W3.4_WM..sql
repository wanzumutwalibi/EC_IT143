/*
Assignment: 3.4 AdventureWorks—Create Answers
Author: Wanzu Mutwalibi
Date: 07/23/2026
Database: AdventureWorks2022

Description:
This script answers eight AdventureWorks business and metadata questions.
Each question is documented with the original author and SQL solution.
*/

USE AdventureWorks2022;
GO

Question 1
Category: Business User Question - Marginal Complexity
Original Author: Soneni Chirozvi

Question:
Which five products have the highest list price?

SELECT TOP 5
    ProductID,
    Name AS ProductName,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO

Question 2
Category: Business User Question - Marginal Complexity
Original Author: Soneni Chirozvi

Question:
Which employees have the highest VacationHours?

SELECT TOP 10
    BusinessEntityID,
    JobTitle,
    VacationHours
FROM HumanResources.Employee
ORDER BY VacationHours DESC;
GO

Question 3
Category: Business User Question - Moderate Complexity
Original Author: Carlton Ochieng

Question:
Which sales territory generated the highest total sales revenue?

SELECT TOP 1
    st.Name AS SalesTerritory,
    SUM(soh.TotalDue) AS TotalSalesRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalSalesRevenue DESC;
GO

Question 4
Category: Business User Question - Moderate Complexity
Original Author: Emanaimo Akpanessien

Question:
Which product category contains the greatest number of products?

SELECT TOP 1
    pc.Name AS ProductCategory,
    COUNT(p.ProductID) AS NumberOfProducts
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY NumberOfProducts DESC;
GO

Question 5
Category: Business User Question - Increased Complexity
Original Author: Emanaimo Akpanessien

Question:
Which customer has spent the highest total amount across
all completed sales orders?

SELECT TOP 1
    c.CustomerID,
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS TotalPurchaseAmount
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
GROUP BY
    c.CustomerID,
    p.FirstName,
    p.LastName
ORDER BY TotalPurchaseAmount DESC;
GO

Question 6
Category: Business User Question - Increased Complexity
Original Author: Emanaimo Akpanessien

Question:
Which vendor provides the most products?

SELECT TOP 1
    v.BusinessEntityID,
    v.Name AS VendorName,
    COUNT(DISTINCT pv.ProductID) AS NumberOfProducts
FROM Purchasing.Vendor AS v
INNER JOIN Purchasing.ProductVendor AS pv
    ON v.BusinessEntityID = pv.BusinessEntityID
GROUP BY
    v.BusinessEntityID,
    v.Name
ORDER BY NumberOfProducts DESC;
GO

Question 7
Category: Metadata Question
Original Author: Emanaimo Akpanessien

Question:
Which columns are defined in the Production.Product table
according to INFORMATION_SCHEMA.COLUMNS?

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
AND TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION;
GO

Question 8
Category: Metadata Question
Original Author: Soneni Chirozvi

Question:
Which tables belong to the Sales schema according to
INFORMATION_SCHEMA.TABLES?

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales'
AND TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO