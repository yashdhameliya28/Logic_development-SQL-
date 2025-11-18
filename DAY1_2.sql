---------- PART - A ----------


--1. Combine information from Person and 
--Department table using cross join or Cartesian product.
SELECT P.PersonName, D.DepartmentName
FROM PERSON P
CROSS JOIN DEPT D

--2. Find all persons with their department name
SELECT P.PersonName, D.DepartmentName
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID

--3. Find all persons with their department name & code.
SELECT P.PersonName, D.DepartmentName, D.DepartmentCode
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID

--4. Find all persons with their department code and location.
SELECT P.PersonName, D.Location, D.DepartmentCode
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID

--5. Find the detail of the person who belongs to Mechanical department.
SELECT	P.PersonID AS PERSONID,
		P.PersonName AS PERSONNAME,
		D.DepartmentID AS DEPARTMENTID,
		P.Salary AS SALARY,
		P.JoiningDate AS JOININGDATE,
		P.City AS CITY
FROM PERSON P
INNER JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'MECHANICAL'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.
SELECT	P.PersonName AS PERSONNAME,
		D.DepartmentCode AS DEPARTMENTCODE,
		P.Salary AS SALARY
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.City = 'AHMEDABAD'

--7. Find the person's name whose department is in C-Block.
SELECT P.PERSONNAME AS PERSONNAME
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.Location = 'C-BLOCK'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT	P.PERSONNAME AS PERSONNAME,
		P.SALARY AS SALARY,
		D.DEPARTMENTNAME
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE P.City = 'JAMNAGAR'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
SELECT	P.PERSONID AS PERSONID,
		P.PERSONNAME AS PERSONNAME,
		D.DEPARTMENTID AS DEPARTMENTID,
		P.SALARY AS SALARY,
		P.JOININGDATE AS JOININGDATE,
		P.CITY AS CITY
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'CIVIL' AND P.JoiningDate > '1-AUG-2001'

--10. Display all the person's name with the department whose joining date 
--difference with the current date is more than 365 days.		
SELECT	P.PERSONNAME AS PERSONNAME,
		D.DEPARTMENTNAME AS DEPARTMENTNAME
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE DATEDIFF(DAY, P.JoiningDate, GETDATE()) > 365

--11. Find department wise person counts.
SELECT	D.DEPARTMENTNAME AS DEPARTMENTNAME,
		COUNT(P.PERSONID) AS PERSON_COUNT
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName

--12. Give department wise maximum & minimum salary with department name
SELECT	D.DEPARTMENTNAME AS DEPARTMENTNAME,
		MAX(P.SALARY) AS MAX_SAL,
		MIN(P.SALARY) AS MIN_SAL
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName

--13. Find city wise total, average, maximum and minimum salary.
SELECT	P.CITY AS CITY,
		SUM(P.SALARY) AS TOTAL_SAL,
		AVG(P.SALARY) AS AVG_SAL,
		MAX(P.SALARY) AS MAX_SAL,
		MIN(P.SALARY) AS MIN_SAL
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.City

--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT	AVG(SALARY) AS AVGSALARY_AHMEDABAD
FROM PERSON 
WHERE CITY = 'AHMEDABAD'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.
SELECT
	P.PERSONNAME + 'LIVES IN ' + P.CITY + 'AND WORKS IN' + D.DEPARTMENTNAME + 'DEPARTMENT.'
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID


---------- PART - B ----------


--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly
SELECT
	P.PERSONNAME + 'EARNS' + CAST(P.Salary AS VARCHAR(20)) + 'FROM ' + D.DEPARTMENTNAME + 'DEPARTMENT MONTHLY.'
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID

--2. Find city & department wise total, average & maximum salaries. 
SELECT	P.CITY AS CITY,
		D.DEPARTMENTNAME AS DEPARTMENTNAME,
		SUM(P.SALARY) AS TOTAL_SAL,
		AVG(P.SALARY) AS AVG_SAL,
		MAX(P.SALARY) AS MAX_SAL
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.City, D.DepartmentName

--3. Find all persons who do not belong to any department. 
SELECT	P.PERSONNAME AS PERSONNAME,
		D.DEPARTMENTID AS DEPARTMENTID
FROM PERSON P
LEFT JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000.
SELECT	D.DepartmentName AS DEPTNAME,
		SUM(P.SALARY) AS TOTAL_SAL
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(P.Salary) > 100000


---------- PART - C ----------


--1. List all departments who have no person.
SELECT	D.DEPARTMENTNAME AS DEPTNAME
FROM DEPT D
LEFT JOIN PERSON P
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PersonID) = 0

--2. List out department names in which more than two persons are working
SELECT	D.DEPARTMENTNAME AS DEPTNAME,
		COUNT(P.PERSONID) AS PERSON_COUNT
FROM DEPT D
LEFT JOIN PERSON P
ON P.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(P.PERSONID) > 2

--3. Give a 10% increment in the computer department employee’s salary.
UPDATE P
SET P.Salary = P.Salary + P.Salary * 0.10
FROM PERSON P
JOIN DEPT D
ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'COMPUTER'


