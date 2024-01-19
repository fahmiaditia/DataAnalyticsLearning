-- ################################### MATERI JOIN #######################################
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
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


-- Mengambil data EmployeeID, FirstName, LastName, JobTitle, dan Salary dengan menggunakan INNER JOIN
-- akan menghasilkan data irisan dari kedua tabel EmployeeDemographics dan EmployeeSalary
SELECT sqltutorial.dbo.EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON sqltutorial.dbo.EmployeeDemographics.EmployeeID = sqltutorial.dbo.EmployeeSalary.EmployeeID
WHERE FirstName LIKE 'd%'
ORDER BY Salary DESC;


-- Untuk mengetahui jenis jenis pekerjaan yang ada di JobTitle
SELECT DISTINCT JobTitle
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY JobTitle;



-- Untuk mengetahui rata - rata gaji dari masing - masing jenis pekerjaan
-- dan mengurutkannya mulai dari rata - rata gaji terbesar
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON sqltutorial.dbo.EmployeeDemographics.EmployeeID = sqltutorial.dbo.EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AverageSalary DESC;


-- Untuk melihat rata - rata gaji setiap pekerjaan dengan syarat
-- JobTitle dan Salary tidak boleh NULL
-- diurutkan dari rata - rata gaji yang terbesar
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON sqltutorial.dbo.EmployeeDemographics.EmployeeID = sqltutorial.dbo.EmployeeSalary.EmployeeID
WHERE Salary IS NOT NULL AND JobTitle IS NOT NULL
GROUP BY JobTitle
ORDER BY AverageSalary DESC;


-- Untuk mengetahui rata - rata gaji dari pekerjaan Professor
SELECT JobTitle, AVG(Salary) AS AverageSalary
FROM sqltutorial.dbo.EmployeeDemographics
INNER JOIN sqltutorial.dbo.EmployeeSalary
ON sqltutorial.dbo.EmployeeDemographics.EmployeeID = sqltutorial.dbo.EmployeeSalary.EmployeeID
WHERE JobTitle = 'Professor'
GROUP BY JobTitle
ORDER BY AverageSalary DESC;

/* sumber : https://youtu.be/9URM1_2S0ho?si=rRwNOiaAHAOoGcxi */




-- ################################### MATERI UNION #######################################

-- Coba run kode ini untuk melihat struktur kolom pada tabel
SELECT * FROM sqltutorial.dbo.EmployeeDemographics;
SELECT * FROM sqltutorial.dbo.WarehouseEmployeeDemographics;

-- Menggabungkan dua tabel menggunakan UNION pada tabel yang identik
-- tapi menghilangkan data yang sama persis
SELECT * FROM sqltutorial.dbo.EmployeeDemographics
UNION
SELECT * FROM sqltutorial.dbo.WarehouseEmployeeDemographics
ORDER BY EmployeeID;

-- Menggabungkan dua tabel menggunakan UNION pada tabel yang identik
-- tapi tanpa menghilangkan data yang sama persis
SELECT * FROM sqltutorial.dbo.EmployeeDemographics
UNION ALL
SELECT * FROM sqltutorial.dbo.WarehouseEmployeeDemographics


-- Masih bisa di UNION meski beda kolom, karena kolom mempunyai
-- tipe data yang sama
SELECT EmployeeID, FirstName, Age
FROM sqltutorial.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM sqltutorial.dbo.EmployeeSalary





-- ################################### MATERI CASE STATEMENT #######################################

-- Menggunakan Case Stement seperti menggunakan IF ELSE
SELECT FirstName, Age,
CASE
	WHEN Age > 30 THEN 'Tua'
	WHEN Age BETWEEN 27 AND 30 THEN 'Muda'
	ELSE 'Remaja'
	END
FROM sqltutorial.dbo.EmployeeDemographics
ORDER BY FirstName;



-- Menandai senioritas menggunakan range Salary
SELECT FirstName, JobTitle, Salary,
CASE 
	WHEN Salary > 2000 THEN 'Professional' 
	WHEN Salary BETWEEN 1500 AND 2000 THEN 'Intermediate Employee'
	ELSE 'Rookie'
END AS 'Seniority'
FROM sqltutorial.dbo.EmployeeDemographics
	JOIN sqltutorial.dbo.EmployeeSalary
ON
	EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle IS NOT NULL AND Salary IS NOT NULL
ORDER BY FirstName;


-- Melakukan penambahan gaji kepada JobTitle yang mengandung kata Senior
SELECT FirstName, JobTitle, Salary,
CASE
	WHEN JobTitle LIKE '%Senior%' THEN Salary + (Salary * 0.5)
	ELSE 0
END AS 'After pay raise 5%'
FROM sqltutorial.dbo.EmployeeDemographics
	JOIN sqltutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle IS NOT NULL AND Salary IS NOT NULL
ORDER BY FirstName;



