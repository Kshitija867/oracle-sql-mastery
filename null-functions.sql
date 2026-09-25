-- Null-Functions Practice - NVL, NVL2 & NULLIF

-- Block 1 — NVL Fundamentals

-- Display commission percentages from the EMPLOYEES table
SELECT first_name, commission_pct FROM employees;

-- Replace NULL commission percentages with 0
SELECT first_name, NVL(commission_pct, 0) AS value FROM employees;

-- Replace a NULL value with 0
SELECT NVL(NULL, 0) AS value FROM dual;

-- Return the original value when it is not NULL
SELECT NVL(100, 0) AS value FROM dual;

-- Replace a NULL text value with a default string
SELECT NVL(NULL, 'Not Available') AS value FROM dual;

-- Display commission percentage and replace NULL with a readable value
SELECT first_name, NVL(TO_CHAR(commission_pct), 'No Commission') AS commission FROM employees;

-- Block 2 — Practical NVL with Employee Data

-- Display salary and commission percentage
SELECT first_name, salary, commission_pct FROM employees;

-- Replace NULL commission percentages with 0
SELECT first_name, salary, NVL(commission_pct, 0) as commission_pct FROM employees;

-- Calculate commission amount and treat NULL commission as 0
SELECT first_name, salary, NVL(commission_pct, 0) AS commission_pct, salary * NVL(commission_pct, 0) as commission_amount FROM employees;

-- Calculate total income including commission
SELECT first_name, salary, NVL(commission_pct, 0) AS commission_pct, salary + (salary * NVL(commission_pct, 0)) AS total_income FROM employees;

-- Display a readable value when commission percentage is NULL
SELECT first_name, NVL(TO_CHAR(commission_pct), 'No Commission') AS commission FROM employees;

-- Display employees whose commission percentage is NULL
SELECT first_name, salary, NVL(commission_pct, 0) AS commission_pct FROM employees WHERE commission_pct IS NULL;

-- Block 3 — NVL2 Fundamentals

-- Display whether the commission percentage is NULL or not
SELECT first_name, commission_pct, NVL2(commission_pct, 'I am value', 'I am null') As status FROM employees;

-- Identify employees who have a commission percentage
SELECT first_name, commission_pct, NVL2(commission_pct, 'Yes', 'No') AS has_commission FROM employees;

-- Return 1 when commission exists and 0 when it is NULL
SELECT first_name, commission_pct, NVL2(commission_pct, 1, 0) AS commission_exists FROM employees;

-- Calculate income based on whether commission exists
SELECT last_name, salary,commission_pct, NVL2( commission_pct, salary + (salary * commission_pct), salary) AS income FROM employees;

-- Display different salary labels based on commission availability
SELECT first_name, salary, NVL2(commission_pct, 'Salary + Commission', 'Salary Only') AS income_type FROM employees;

-- Compare NVL and NVL2 using commission percentage
SELECT first_name, commission_pct, NVL(commission_pct, 0) AS nvl_result, NVL2(commission_pct, 'Has Commission', 'No Commission') AS nvl2_result FROM employees;

-- NVL
-- ? Give me the original value,
--   or replace NULL with another value.
--
-- NVL2
-- ? Give me one result if NOT NULL,
--   and a different result if NULL.

-- Block 4 — NULLIF Practice

-- If these two values are equal, turn the first one into NULL. Otherwise, give me the first value.
-- Eg - 
SELECT NULLIF(10, 10) FROM dual;
SELECT NULLIF(10, 20) FROM dual;

-- create a new table 
CREATE TABLE emp_temp AS SELECT employee_id, manager_id FROM employees WHERE department_id = 80;

SELECT * FROM emp_temp;

-- Modify some data
UPDATE emp_temp SET employee_id = 100 WHERE manager_id = 100;

-- Apply NULLIF / Return NULL when employee ID and manager ID are equal
SELECT employee_id, manager_id, NULLIF(employee_id, manager_id) AS data FROM emp_temp;

-- Return NULL when both values are equal
SELECT NULLIF(100, 100) AS result FROM dual;

-- Display employee IDs that differ from their manager IDs
SELECT employee_id, manager_id, NULLIF(employee_id, manager_id) AS different_id FROM emp_temp WHERE employee_id <> manager_id;

-- Block 5 — NVL, NVL2 and NULLIF Comparison

-- Compare NVL, NVL2 and NULLIF with NULL and equal values
SELECT NVL(NULL, 10) AS nvl_result, 
       NVL2(NULL, 10, 20) AS nvl2_result, 
       NULLIF(10, 10) AS nullif_result 
FROM dual;       

-- Compare the functions when values are present or different
SELECT
    NVL(10, 20) AS nvl_result, 
    NVL2(10, 20, 30) AS nvl2_result, 
    NULLIF(10, 20) AS nullif_result
FROM dual;

-- Compare the three NULL-handling functions using commission data
SELECT 
    first_name, 
    commission_pct,
    NVL(commission_pct, 0) AS nvl_result, 
    NVL2(commission_pct, 'Has Commission', 'No Commission') AS nvl2_result, 
    NULLIF(commission_pct, 0) AS nullif_result
FROM employees;

-- Compare NVL and NVL2 when calculating employee income
SELECT
    last_name,
    salary, 
    commission_pct, 
    salary + (salary * NVL(commission_pct, 0)) AS nvl_income,
    NVL2(
        commission_pct, 
        salary + (salary * commission_pct),
        salary
    ) AS nvl2_income
FROM employees
WHERE last_name LIKE 'B%';

-- Return NULL when salary and commission percentage values are equal
SELECT 
    first_name,
    salary,
    commission_pct,
    NULLIF(salary, commission_pct) AS nullif_result
FROM employees;
    
-- Compare the purpose of all three functions using simple values
SELECT 
    NVL(NULL, 'Default') AS nvl_result,
    NVL2(NULL, 'Present', 'Missing') AS nvl2_example,
    NULLIF('Same', 'Same') AS nullif_example
FROM dual;

commit;
--NVL
--? NULL? Replace it.
--
--NVL2
--? NULL or NOT NULL? Choose between two results.
--
--NULLIF
--? Equal? Return NULL.
--   Different? Return the first value.
    
-- Oracle SQL Practice Session from 6 Sept