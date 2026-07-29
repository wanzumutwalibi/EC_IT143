SELECT 
    Member_name,
    COUNT(*) AS Number_of_Transactions
FROM dbo.FBS_Visa_Costomo
GROUP BY Member_name;