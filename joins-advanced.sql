-- Block 1 — INNER JOIN: Employees and Departments

-- Display employees along with their department information
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Display employee name, job, and department name
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    e.job_id,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Display employees working in department 60
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.department_id = 60;

-- Display employees working in departments whose name starts with 'S'
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name LIKE 'S%';

-- Display employee name, salary, and department name
SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Find employees whose department has a matching department record
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
ORDER BY e.department_id;

-- Block 2 — LEFT JOIN: All Departments and Their Employees

-- Display all departments along with their employees
SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name,
    e.last_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
ORDER BY d.department_id;

-- Find departments that have no employees
SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Count employees in every department
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY d.department_id;

-- Display all departments and employees earning more than 10000
SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name,
    e.salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
   AND e.salary > 10000
ORDER BY d.department_id;

-- INNER JOIN: only departments with matching employees
SELECT
    d.department_id,
    d.department_name,
    e.employee_id
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id;
    
-- LEFT JOIN: all departments, whether they have employees or not
SELECT
    d.department_id,
    d.department_name,
    e.employee_id
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id;
    
-- Block 3 — RIGHT JOIN: All Employees and Departments

-- Display all departments along with their employees
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
ORDER BY d.department_id;

-- Display all departments even if no employee is assigned
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;
    
-- Find departments that do not have any employees
SELECT
    d.department_id,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- Display department and employee information
SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name,
    e.salary
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
ORDER BY d.department_id;

-- Display all departments from department 50 onward
SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id >= 50
ORDER BY d.department_id;

-- Using LEFT JOIN
SELECT
    d.department_id,
    d.department_name,
    e.employee_id
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id;
    
-- Using RIGHT JOIN
SELECT
    d.department_id,
    d.department_name,
    e.employee_id
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;
    
-- Block 4 — FULL OUTER JOIN: All Rows from Both Tables

-- Display all employees and all departments,
-- including records that do not have a match
SELECT
    e.employee_id,
    e.first_name,
    e.department_id AS employee_department_id,
    d.department_id AS department_department_id,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Display employee and department information
-- while preserving unmatched records from both tables
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    d.department_id,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
ORDER BY d.department_id;

-- Find employees without a matching department
-- and departments without any matching employee
SELECT
    e.employee_id,
    e.first_name,
    e.department_id AS employee_dept_id,
    d.department_id AS department_dept_id,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL
   OR d.department_id IS NULL;
   
-- Compare all three outer joins

-- Left Join
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;
    
-- Right Join
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;
    
-- Full Outer Join
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Display the source of each unmatched record
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    CASE
        WHEN e.employee_id IS NULL THEN 'Department has no employee'
        WHEN d.department_id IS NULL THEN 'Employee has no department'
        ELSE 'Matched'
    END AS match_status
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;

commit;

/*
JOIN SUMMARY

INNER JOIN
    ? Only matching rows

LEFT JOIN
    ? All rows from LEFT table
    ? Matching rows from RIGHT table

RIGHT JOIN
    ? All rows from RIGHT table
    ? Matching rows from LEFT table

FULL OUTER JOIN
    ? All rows from BOTH tables
    ? Matching rows are combined
    ? Unmatched columns become NULL
*/

-- Block 5 — SELF JOIN: Employee and Manager

-- Display each employee along with their manager
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    m.employee_id AS manager_id,
    m.first_name AS manager_name
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- Display employee and manager salaries
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    e.salary AS employee_salary,
    m.first_name AS manager_name,
    m.salary AS manager_salary
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- Find employees whose salary is greater than their manager's salary
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    e.salary AS employee_salary,
    m.first_name AS manager_name,
    m.salary AS manager_salary
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- Display employee and manager names
SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m.first_name || ' ' || m.last_name AS manager
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- Display all employees, including those without a manager
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;
    
-- Display employee ID, manager ID and corresponding manager name
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    e.manager_id,
    m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id
ORDER BY e.employee_id;