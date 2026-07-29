CREATE VIEW dbo.vw_Simpsons_Transaction_Count
AS
SELECT 
    Member_name,
    COUNT(*) AS Number_of_Transactions
FROM dbo.FBS_Visa_Costomo
GROUP BY Member_name;