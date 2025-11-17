-------------------- EMP TABLE --------------------
---------- PART - A ----------

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum 
--respectively. Expected Output:
SELECT MAX(SALARY) AS MAXIMUM_SAL, MIN(SALARY) AS MINIMUM_SAL
FROM EMP

--2. Display Total, and Average salary of all employees. 
--Label the columns Total_Sal and Average_Sal, respectively. Expected Output:
SELECT SUM(SALARY) AS TOTAL_SAL, AVG(SALARY) AS AVERAGE_SAL 
FROM EMP

--3. Find total number of employees of EMPLOYEE table. Expected Output:
SELECT COUNT(EID) AS TOTAL_EMPLOYEE
FROM EMP

--4. Find highest salary from Rajkot city. Expected Output:
SELECT MAX(SALARY) 
FROM EMP
WHERE CITY = 'RAJKOT'

--5. Give maximum salary from IT department. Expected Output:
SELECT MAX(SALARY)
FROM EMP 
WHERE DEPARTMENT = 'IT'

--6. Count employee whose joining date is after 8-Feb-91. Expected Output:
SELECT COUNT(EID)
FROM EMP
WHERE JOININGDATE > '1991-02-08'

--7. Display average salary of Admin department. Expected Output:
SELECT AVG(SALARY)
FROM EMP
WHERE DEPARTMENT = 'ADMIN'

--8. Display total salary of HR department. Expected Output:
SELECT SUM(SALARY)
FROM EMP
WHERE DEPARTMENT = 'HR'

--9. Count total number of cities of employee without duplication. Expected Output:
SELECT COUNT(DISTINCT CITY)
FROM EMP

--10. Count unique departments. Expected Output:
SELECT COUNT(DISTINCT DEPARTMENT)
FROM EMP

--11. Give minimum salary of employee who belongs to Ahmedabad. Expected Output:
SELECT CITY, MIN(SALARY)
FROM EMP
WHERE CITY = 'AHMEDABAD'

--12. Find city wise highest salary. Expected Output:
SELECT CITY, MAX(SALARY)
FROM EMP
GROUP BY CITY

--13. Find department wise lowest salary. Expected Output:
SELECT DEPARTMENT, MIN(SALARY)
FROM EMP
GROUP BY DEPARTMENT

--14. Display city with the total number of employees belonging to each city. Expected Output:
SELECT CITY, COUNT(EID)
FROM EMP
GROUP BY CITY

--15. Give total salary of each department of EMP table. Expected Output:
SELECT DEPARTMENT, SUM(SALARY)
FROM EMP
GROUP BY DEPARTMENT

--16. Give average salary of each department of EMP table without displaying 
--the respective department name. Expected Output:
SELECT DEPARTMENT, AVG(SALARY)
FROM EMP
GROUP BY DEPARTMENT

--17. Count the number of employees for each department in every city. Expected Output:
SELECT DEPARTMENT, CITY, COUNT(EID)
FROM EMP
GROUP BY DEPARTMENT, CITY

--18. Calculate the total salary distributed to male and female employees. Expected Output:
SELECT GENDER, SUM(SALARY)
FROM EMP
GROUP BY GENDER

--19. Give city wise maximum and minimum salary of female employees. Expected Output:
SELECT CITY, MAX(SALARY), MIN(SALARY)
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY CITY

--20. Calculate department, city, and gender wise average salary. Expected Output:
SELECT DEPARTMENT, CITY, GENDER, AVG(SALARY)
FROM EMP
GROUP BY DEPARTMENT, CITY, GENDER


---------- PART - B ----------

--1. Count the number of employees living in Rajkot. Expected Output:
SELECT COUNT(EID)
FROM EMP
WHERE CITY = 'RAJKOT'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. Expected Output:
SELECT MAX(SALARY) - MIN(SALARY) AS DIFFERENCE_SAL
FROM EMP

--3. Display the total number of employees hired before 1st January, 1991. Expected Output:
SELECT COUNT(EID)
FROM EMP
WHERE JOININGDATE < '1991-01-01'


---------- PART - C ----------

--1. Count the number of employees living in Rajkot or Baroda. Expected Output:
SELECT CITY, COUNT(EID)
FROM EMP
WHERE CITY IN ('RAJKOT', 'BARODA')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. Expected Output:
SELECT COUNT(EID)
FROM EMP
WHERE JOININGDATE < '1991-01-01' AND DEPARTMENT = 'IT'

--3. Find the Joining Date wise Total Salaries. 
--Expected Output: (Will show 15 distinct rows since no two employees share a joining date in this data)
SELECT JOININGDATE, SUM(SALARY)
FROM EMP
GROUP BY JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’. Expected Output:
SELECT DEPARTMENT, CITY,MAX(SALARY)
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT, CITY



-------------------- SALES_DATA TABLE --------------------
---------- PART - A ----------

--1. Display Total Sales Amount by Region. Expected Output:
SELECT REGION, SUM(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY REGION

--2. Display Average Sales Amount by Product. Expected Output:
SELECT PRODUCT, AVG(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY PRODUCT

--3. Display Maximum Sales Amount by Year. Expected Output:
SELECT YEAR, MAX(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR

--4. Display Minimum Sales Amount by Region and Year. Expected Output:
SELECT YEAR, REGION, MIN(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR, REGION

--5. Count of Products Sold by Region. Expected Output:
SELECT REGION, COUNT(PRODUCT)
FROM SALES_DATA
GROUP BY REGION

--6. Display Sales Amount by Year and Product. Expected Output:
SELECT YEAR, PRODUCT, SUM(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR, PRODUCT

--7. Display Regions with Total Sales Greater Than 5000. Expected Output:
SELECT REGION, SUM(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY REGION
HAVING SUM(SALES_AMOUNT) > 5000

--8. Display Products with Average Sales Less Than 10000. Expected Output:
SELECT PRODUCT, AVG(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY PRODUCT
HAVING AVG(SALES_AMOUNT) < 1000

--9. Display Years with Maximum Sales Exceeding 500. Expected Output:
SELECT YEAR, MAX(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR
HAVING MAX(SALES_AMOUNT) > 500

--10. Display Regions with at Least 3 Distinct Products Sold. Expected Output:
SELECT REGION, COUNT(PRODUCT)
FROM SALES_DATA
GROUP BY REGION
HAVING COUNT(PRODUCT) > 3

--11. Display Years with Minimum Sales Less Than 1000. Expected Output:
SELECT YEAR, MIN(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR
HAVING MIN(SALES_AMOUNT) < 1000 

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount. Expected Output:
SELECT REGION, SUM(SALES_AMOUNT)
FROM SALES_DATA
WHERE YEAR = '2023'
GROUP BY REGION
ORDER BY SUM(SALES_AMOUNT)

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years. Expected Output:
SELECT TOP 1 REGION, MIN(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY REGION

--14. Find the Product with the Highest Sales Across All Regions in 2023. Expected Output:
SELECT TOP 1 PRODUCT, MAX(SALES_AMOUNT)
FROM SALES_DATA
WHERE YEAR = '2023'
GROUP BY PRODUCT
ORDER BY MAX(SALES_AMOUNT) DESC 

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000. Expected Output:
SELECT REGION, SALES_AMOUNT
FROM SALES_DATA
WHERE PRODUCT = 'TV' AND YEAR > '2023' AND SALES_AMOUNT > 1000


---------- PART - B ----------

--1. Display Count of Orders by Year and Region, Sorted by Year and Region. Expected Output:
SELECT YEAR, REGION, COUNT(PRODUCT) 
FROM SALES_DATA
GROUP BY YEAR, REGION
ORDER BY YEAR, Region

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region. Expected Output:
SELECT REGION, MAX(SALES_AMOUNT)
FROM SALES_DATA
WHERE SALES_AMOUNT > 1000
GROUP BY Region
ORDER BY Region

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending. Expected Output:
SELECT YEAR, SUM(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR
HAVING SUM(SALES_AMOUNT) < 10000

--4. Display Top 3 Regions by Total Sales Amount in Year 2024. Expected Output:
SELECT TOP 3 REGION, SUM(SALES_AMOUNT)
FROM SALES_DATA
WHERE YEAR = '2024' 
GROUP BY Region

--5. Find the Year with the Lowest Total Sales Across All Regions. Expected Output:
SELECT TOP 1 YEAR, SUM(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY YEAR
ORDER BY SUM(SALES_AMOUNT) 


----------- PART - C ----------

--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name. Expected Output:
SELECT PRODUCT, AVG(SALES_AMOUNT)
FROM SALES_DATA
GROUP BY PRODUCT
HAVING AVG(Sales_Amount) BETWEEN 1000 AND 2000
ORDER BY PRODUCT

--2. Display Years with More Than 1 Orders from Each Region. Expected Output:
SELECT YEAR, COUNT(PRODUCT)
FROM SALES_DATA
GROUP BY YEAR
HAVING COUNT(PRODUCT) > 1

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 
--sort by amount in descending. Expected Output:
SELECT REGION, AVG(SALES_AMOUNT) 
FROM SALES_DATA
WHERE YEAR = '2023'
GROUP BY REGION
HAVING AVG(SALES_AMOUNT) > 1500

--4. Find out region wise duplicate product. Expected Output:
SELECT REGION, PRODUCT, COUNT(PRODUCT) 
FROM SALES_DATA
GROUP BY Region, PRODUCT
HAVING COUNT(PRODUCT) > 1

--5. Find out year wise duplicate product. Expected Output:
SELECT YEAR, PRODUCT, COUNT(PRODUCT)
FROM SALES_DATA
GROUP BY YEAR, PRODUCT
HAVING COUNT(PRODUCT) > 1
