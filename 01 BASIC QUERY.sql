-- BASIQ SQL
--PLAYLIST : https://www.youtube.com/playlist?list=PLUaB-1hjhk8FE_XZ87vPPSfHqb6OcM0cF
/* 
Link Tutorial
1. https://youtu.be/RSlqWnP-Dy8?si=Ug6tBD9mlPMHcF5p
2. https://youtu.be/PyYgERKq25I?si=fQFkDIY2yeF0JjZh
3. https://youtu.be/A9TOuDZTPDU?si=wyRWpI-8dKjdRdJ-
4. https://youtu.be/LXwfzIRD-Ds?si=5OkKfET3b_f_8Pfr
*/

-- Melihat semua data yang ada di tabel dbo.EmployeeDemographics
--SELECT * FROM dbo.EmployeeDemographics



-- Melihat jumlah masing - masing Gender
--SELECT Gender, COUNT(*) AS Number FROM dbo.EmployeeDemographics GROUP BY Gender

-- Menampilkan data jumlah masing - masing Gender dengan syarat Age diatas atau sama dengan 50
--SELECT Gender, COUNT(*) as Total FROM dbo.EmployeeDemographics WHERE Age >= 50 GROUP BY Gender;

-- Menampilkan jumlah masing - masing Gender serta diurutkan berdasarkan Gender yang paling banyak
-- SELECT Gender, COUNT(Gender) AS Gender_Count FROM EmployeeDemographics GROUP BY Gender ORDER BY Gender_Count ASC



-- Menampilkan data yang FirstName nya berawalan huruf U
--SELECT * FROM dbo.EmployeeDemographics WHERE FirstName LIKE 'U%';

-- Menampilkan data dengan filter LastName nya tidak bernilai NULL 
--SELECT * FROM dbo.EmployeeDemographics WHERE LastName IS NULL;

-- Menampilkan data dengan syarat FirstName nya berawalan huruf "A" dan LastName nya tidak NULL, data diurutkan berdasarkan FirstName dari A-Z
--SELECT EmployeeID, FirstName, LastName FROM dbo.EmployeeDemographics WHERE FirstName LIKE 'A%' AND LastName IS NOT NULL ORDER BY FirstName

-- Menampilkan jumlah total FirstName yang berawalan "A" dan Age diatas 40
--SELECT COUNT(*) AS TOTAL_FIRSTNAME_STARTEDBY_A FROM dbo.EmployeeDemographics WHERE FirstName LIKE '%A' AND Age >= 40;


