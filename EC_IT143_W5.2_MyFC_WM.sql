/*
NAME:    EC_IT143_W5.2_MyFC_WM.sql
PURPOSE: Final Project: My Communities Analysis - Create Answers

MODIFICATION HISTORY:
Ver      Date         Author              Description
1.0      07/30/2026   Wanzu Mutwalibi    Initial script creation answering 4 MyFC questions.
*/

USE [MyFC];
GO

-- Q1: Which players belong to each team?
-- Author: Wanzu Mutwalibi

SELECT 
    t.t_code AS Team_Code,
    p.pl_name AS Player_Name
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
ORDER BY t.t_code, p.pl_name;
GO


-- Q2: What positions do the players have?
-- Author: Wanzu Mutwalibi

SELECT
    pos.p_name AS Position,
    COUNT(p.pl_id) AS Total_Players
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY pos.p_name
ORDER BY Total_Players DESC;
GO


-- Q3: What is the total salary for each player?
-- Author: Wanzu Mutwalibi

SELECT
    p.pl_name AS Player_Name,
    SUM(f.mtd_salary) AS Total_Salary
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
GROUP BY p.pl_name
ORDER BY Total_Salary DESC;
GO


-- Q4: What is the total monthly salary paid to players on each team?
-- Author: Wanzu Mutwalibi

SELECT
    t.t_code AS Team_Code,
    SUM(f.mtd_salary) AS Total_Monthly_Salary
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN dbo.tblPlayerFact AS f
    ON p.pl_id = f.pl_id
GROUP BY t.t_code
ORDER BY Total_Monthly_Salary DESC;
GO