-- Extract 3 characters from 'vivekanand' starting 4 positions from the end
SELECT SUBSTR('vivekanand', -4, 3) FROM dual;

-- Extract 3 characters from 'Anup' starting from the 3rd character
SELECT SUBSTR('Anup', 3) FROM dual;

-- Find the position of the letter 'a' in 'vivekanand'
SELECT INSTR('vivekanand', 'a') FROM dual;

-- Find the length of the string 'vivekanand'
SELECT LENGTH('vivekanand') FROM dual;

SELECT LENGTH('anup') FROM dual;

-- Remove trailing spaces/characters from a string
SELECT RTRIM('vivekanand', 'and') FROM dual;

-- Replace occurrences of 'anand' with 'xyz' in the string
SELECT REPLACE('vivekanand', 'anand', 'xyz') FROM dual;

-- Pad the string 'vivekanand' with '*' characters on the right
SELECT RPAD('vivekanand', 15, '*') FROM dual;

-- Truncate a number to 2 decimal places
SELECT TRUNC(45.923, 2) FROM dual;

-- Specify 0 decimal places
SELECT TRUNC(45.923, 0) FROM dual;

-- Round a number to 2 decimal places
SELECT ROUND(45.923, 2) FROM dual;

SELECT ROUND(45.926, 2) FROM dual;

-- Practice ROUND with different decimal positions and TRUNC
SELECT ROUND(45.923, 2),
       ROUND(45.923, 1),
       ROUND(45.923, 0),
       ROUND(45.423, 0), 
       ROUND(45.923, -1),
       ROUND(44.423, -1),
       ROUND(444.923, -2),
       ROUND(44.423),
       ROUND(44.923),
       TRUNC(45.923, -1)
    FROM dual;
    
-- Practice TRUNC with different decimal positions
SELECT TRUNC(45.923, 2), 
       TRUNC(45.923),
       TRUNC(45.923, -1)
FROM dual;

-- Find the remainder when salary is divided by 5000
SELECT first_name, last_name, salary, MOD(salary, 5000) FROM employees WHERE job_id = 'SA_REP';

-- Display the current system date
SELECT SYSDATE FROM dual;

-- Display the current system timestamp
SELECT SYSTIMESTAMP FROM dual;

-- Display the current date
SELECT CURRENT_DATE FROM dual;

-- Display the current timestamp
SELECT CURRENT_TIMESTAMP FROM dual;

-- Retrieve employees hired before 1-Feb-2005
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date < '01-FEB-05';

-- Calculate approximate years since hire date for department 90 employees
SELECT last_name, ROUND((SYSDATE - hire_date) / 365, 2) AS years FROM employees WHERE department_id = 90;

-- NVL with NULL

-- Replace a NULL value with 0 using NVL
SELECT NVL(NULL, 0) AS VALUE FROM dual;

-- Replace NULL commission percentages with 0
SELECT NVL(commission_pct, 0) AS value FROM employees;

-- Display different values depending on whether commission percentage is NULL
SELECT commission_pct, NVL2(commission_pct, 'I am value', 'I am null') AS data FROM employees;

