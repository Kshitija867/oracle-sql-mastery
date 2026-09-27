-- Joins

-- 1. Cross Join - gives cross product   - emp 1 had 5 rows and emp2 had 17 so 5x17  = 85 
SELECT * FROM emp1 CROSS JOIN emp2;

-- table alias
SELECT * FROM emp1 E1 CROSS JOIN emp2 E2;

-- all columns of E1
SELECT E1.* FROM emp1 E1 CROSS JOIN emp2 E2;

-- columns names 
SELECT E1.first_name, E2.department_id from emp1 E1 CROSS JOIN emp2 E2;

commit;
-- 2. Inner join
SELECT * FROM employees;
SELECT * FROM departments;

-- on clause to equate 
SELECT E.first_name, E.employee_id, E.salary, D.department_name FROM employees E INNER JOIN departments D ON E.department_id = D.department_id;

-- whose department id is null ( only one data)
SELECT * FROM employees
WHERE department_id IS NULL;

SELECT E.employee_id, E.first_name, E.department_id
FROM employees E
LEFT JOIN departments D
    ON E.department_id = D.department_id
WHERE D.department_id IS NULL;

-- CREATE tables 

-- table t1
CREATE TABLE t1 (srno INT);

INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (0);
INSERT INTO t1 VALUES (null);
INSERT INTO t1 VALUES (null);
INSERT INTO t1 VALUES (1);

SELECT * FROM t1;
commit;

-- table t2
CREATE TABLE t2 (srno INT);

INSERT INTO t2 VALUES (1);
INSERT INTO t2 VALUES (2);
INSERT INTO t2 VALUES (0);
INSERT INTO t2 VALUES (0);
INSERT INTO t2 VALUES (null);
INSERT INTO t2 VALUES (3);
INSERT INTO t2 VALUES (null);
INSERT INTO t2 VALUES (4);

SELECT * FROM t2;
commit;

-- inner join
SELECT * FROM t1 INNER JOIN t2 ON t1.srno = t2.srno;

-- Left outer join  - matching data and all data from left table
SELECT * FROM t1 LEFT OUTER JOIN t2 ON t1.srno = t2.srno;

-- Right outer join  - matching data and all data from right table
SELECT * FROM t1 RIGHT OUTER JOIN t2 ON t1.srno = t2.srno;

-- order by second col 
SELECT * FROM t1 RIGHT OUTER JOIN t2 ON t1.srno = t2.srno ORDER BY 2 DESC;

-- if dont want null values first
-- order by second col 
SELECT * FROM t1 RIGHT OUTER JOIN t2 ON t1.srno = t2.srno ORDER BY 2 DESC NULLS LAST;

-- FUll outer join 
SELECT * FROM t1 FULL OUTER JOIN t2 ON t1.srno = t2.srno ORDER BY 2 DESC NULLS LAST;
