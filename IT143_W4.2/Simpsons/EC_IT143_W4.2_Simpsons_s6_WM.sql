TRUNCATE TABLE dbo.Simpsons_Transaction_Count;

INSERT INTO dbo.Simpsons_Transaction_Count
(
    Member_name,
    Number_of_Transactions
)
SELECT 
    Member_name,
    Number_of_Transactions
FROM dbo.vw_Simpsons_Transaction_Count;