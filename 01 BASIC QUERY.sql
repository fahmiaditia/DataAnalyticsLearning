--SELECT * FROM dbo.EmployeeDemographics

--SELECT Gender, COUNT(*) AS Number FROM dbo.EmployeeDemographics GROUP BY Gender

--SELECT * FROM dbo.EmployeeDemographics WHERE FirstName LIKE '%U%';

--DELETE FROM dbo.EmployeeDemographics

--SELECT * FROM dbo.EmployeeDemographics WHERE LastName IS NULL;

--SELECT * FROM dbo.EmployeeDemographics;

--SELECT Gender, COUNT(*) as Total FROM dbo.EmployeeDemographics WHERE Age >= 50 GROUP BY Gender;

--SELECT EmployeeID, FirstName, LastName FROM dbo.EmployeeDemographics WHERE FirstName LIKE 'A%' AND LastName IS NOT NULL ORDER BY FirstName

--SELECT COUNT(*) AS TOTAL_FIRSTNAME_STARTEDBY_A FROM dbo.EmployeeDemographics WHERE FirstName LIKE '%A' AND Age >= 40;