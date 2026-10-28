-- ============================================================
-- Project: MySQL SQL Practice
-- File: 01_employee_salary_analysis.sql
-- Purpose: Practice filtering, aggregate functions, subqueries,
--          and department-level analysis.
-- Database: newquery
--
-- IMPORTANT:
-- This script assumes your employee table is named `emp` and
-- contains: name, dept, salary, age, city.
-- If your actual table is named `employess`, replace `emp`
-- throughout this file with that exact table name.
-- ============================================================

USE newquery;

-- 1. View all employee records
SELECT *
FROM emp;

-- 2. Employees earning more than the average salary
SELECT *
FROM emp
WHERE salary > (
    SELECT AVG(salary)
    FROM emp
);

-- 3. Employees earning less than the average salary
SELECT *
FROM emp
WHERE salary < (
    SELECT AVG(salary)
    FROM emp
);

-- 4. Employee(s) with the highest salary
SELECT *
FROM emp
WHERE salary = (
    SELECT MAX(salary)
    FROM emp
);

-- 5. Employee(s) with the lowest salary
SELECT *
FROM emp
WHERE salary = (
    SELECT MIN(salary)
    FROM emp
);

-- 6. Employees earning more than the minimum salary
SELECT *
FROM emp
WHERE salary > (
    SELECT MIN(salary)
    FROM emp
);

-- 7. Employees earning less than the maximum salary
SELECT *
FROM emp
WHERE salary < (
    SELECT MAX(salary)
    FROM emp
);

-- 8. Employees older than the average employee age
SELECT name, dept, age
FROM emp
WHERE age > (
    SELECT AVG(age)
    FROM emp
);

-- 9. Employees earning more than the average salary (selected columns)
SELECT name, dept, salary
FROM emp
WHERE salary > (
    SELECT AVG(salary)
    FROM emp
);

-- 10. Employees working in departments where at least one employee
--     earns more than 70,000
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    WHERE salary > 70000
);

-- 11. Employees working in departments where at least one employee
--     earns less than 40,000
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    WHERE salary < 40000
);

-- 12. Employees working in departments that have an employee
--     based in Chennai
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    WHERE city = 'Chennai'
);

-- 13. Employees in departments where no employee earns over 70,000
SELECT *
FROM emp
WHERE dept NOT IN (
    SELECT dept
    FROM emp
    WHERE salary > 70000
);

-- 14. Employee(s) with the highest salary (name and salary)
SELECT name, salary
FROM emp
WHERE salary = (
    SELECT MAX(salary)
    FROM emp
);

-- 15. Employee(s) with the lowest salary (name and salary)
SELECT name, salary
FROM emp
WHERE salary = (
    SELECT MIN(salary)
    FROM emp
);

-- 16. Employees earning more than 50% of the maximum salary
SELECT *
FROM emp
WHERE salary > (
    SELECT MAX(salary) * 0.50
    FROM emp
);

-- 17. Employees whose salary is strictly between the minimum
--     and maximum salaries
SELECT *
FROM emp
WHERE salary > (SELECT MIN(salary) FROM emp)
  AND salary < (SELECT MAX(salary) FROM emp);

-- 18. Employees in departments with an average salary above 50,000
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    GROUP BY dept
    HAVING AVG(salary) > 50000
);

-- 19. Employees in departments with more than two employees
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    GROUP BY dept
    HAVING COUNT(*) > 2
);

-- 20. Employees in departments with a combined salary above 150,000
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    GROUP BY dept
    HAVING SUM(salary) > 150000
);

-- 21. Employees in departments where the highest salary is above 70,000
SELECT *
FROM emp
WHERE dept IN (
    SELECT dept
    FROM emp
    GROUP BY dept
    HAVING MAX(salary) > 70000
);

-- 22. Employees living in cities where at least one IT employee lives
SELECT *
FROM emp
WHERE city IN (
    SELECT DISTINCT city
    FROM emp
    WHERE dept = 'IT'
);

-- 23. Employees living in cities where at least one employee earns over 60,000
SELECT *
FROM emp
WHERE city IN (
    SELECT DISTINCT city
    FROM emp
    WHERE salary > 60000
);
