/* Menggabung tabel EmployeeDemographics untuk mendapatkan irisan yang sama pakai EmployeeSalary menggunakan
kolom EmployeeID sehingga menampilkan kolom yang memiliki persamaan di EmployeeID
*/
SELECT *
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


/* Menggabung tabel EmployeeDemographics dengan EmployeeSalary menggunakan
kolom EmployeeID tetapi apabila ada yang tidak sama EmployeeID nya maka
akan dijadikan NULL
*/
SELECT *
FROM sqltutorial.dbo.EmployeeDemographics
FULL OUTER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

/* Mempertahankan yang kanan */
SELECT * FROM sqltutorial.dbo.EmployeeDemographics
RIGHT OUTER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

/* Mempertahankan yang kiri*/
SELECT * FROM sqltutorial.dbo.EmployeeDemographics
LEFT OUTER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


/* Mengambil hanya pada kolom tertentu dengan mempertahankan yang kiri */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM sqltutorial.dbo.EmployeeDemographics
LEFT OUTER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


-- Mengambil data EmployeeID, FirstName, LastName, JobTitle, dan Salary dengan menggunakan INNER JOIN
-- akan menghasilkan data irisan dari kedua tabel EmployeeDemographics dan EmployeeSalary
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName LIKE 'd%'
ORDER BY Salary DESC;


-- Untuk mengetahui jenis jenis pekerjaan yang ada di JobTitle
SELECT DISTINCT JobTitle
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY JobTitle



-- Untuk mengetahui rata - rata gaji dari masing - masing jenis pekerjaan
-- dan mengurutkannya mulai dari rata - rata gaji terbesar
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AverageSalary DESC


-- Untuk melihat rata - rata gaji setiap pekerjaan dengan syarat
-- JobTitle dan Salary tidak boleh NULL
-- diurutkan dari rata - rata gaji yang terbesar
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE Salary IS NOT NULL AND JobTitle IS NOT NULL
GROUP BY JobTitle
ORDER BY AverageSalary DESC


-- Untuk mengetahui rata - rata gaji dari pekerjaan Professor
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Professor'
GROUP BY JobTitle
ORDER BY AverageSalary DESC

/* sumber : https://youtu.be/9URM1_2S0ho?si=rRwNOiaAHAOoGcxi */