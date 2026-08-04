/*
NAME:    EC_IT143_W5.2_Simpsons_WM.sql
PURPOSE: Final Project: My Communities Analysis - Create Answers

MODIFICATION HISTORY:
Ver      Date         Author              Description
1.0      07/30/2026   Wanzu Mutwalibi    Initial script creation answering 4 Simpsons questions.
*/

USE [Simpsons];
GO


-- Q1: How many employees are in each department?
-- Author: Wanzu Mutwalibi

SELECT
    Department,
    COUNT(Member_ID) AS Total_Employees
FROM dbo.Family_Data
GROUP BY Department
ORDER BY Total_Employees DESC;
GO


-- Q2: Which employees are currently active?
-- Author: Wanzu Mutwalibi

SELECT
    Name,
    Job_Title
FROM dbo.Family_Data
WHERE Status = 'Active';
GO


-- Q3: What are the total expenses by category?
-- Author: Wanzu Mutwalibi

SELECT
    Category,
    SUM(Amount) AS Total_Expenses
FROM dbo.Planet_Express
GROUP BY Category
ORDER BY Total_Expenses DESC;
GO


-- Q4: Which card member has the highest total spending?
-- Author: Wanzu Mutwalibi

SELECT
    Card_Member,
    SUM(Amount) AS Total_Spending
FROM dbo.Planet_Express
GROUP BY Card_Member
ORDER BY Total_Spending DESC;
GO