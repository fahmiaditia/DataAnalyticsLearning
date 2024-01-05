/* Menggabung tabel EmployeeDemographics dengan EmployeeSalary menggunakan
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


https://youtu.be/9URM1_2S0ho?si=IC1i-A6hojKwp9JL
Sampai di 5:24 