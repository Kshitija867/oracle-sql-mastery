--Set operations
SELECT * FROM employees WHERE department_id = 60;

--create similar as employee  ( but this wont work )
CREATE TABLE emp1 AS SELECT * FROM employees WHERE department_id = 60;

-- first - to create similar structure
CREATE TABLE emp1 AS SELECT * FROM employees WHERE 1=2;

-- second - to insert data of department_id 60 into emp1
INSERT INTO emp1 select * from employees where department_id=60;

SELECT * FROM emp1;

commit;

-- create another table emp2
CREATE TABLE emp2 AS SELECT * FROM employees WHERE 1=2;

-- insert data of dept 100
INSERT INTO emp2 select * from employees where department_id=100;

SELECT * FROM emp2;

commit;

-- union
SELECT * FROM emp1 UNION SELECT * FROM emp2;

-- if we want duplicate data
SELECT * FROM emp1 UNION ALL SELECT * FROM emp2;

--intersection - use intersect - it will get no records
SELECT * FROM emp1 INTERSECT SELECT * FROM emp2; 

--after inserting data of dept 60 in emp2 we wil get similar so intersect will show common data 
INSERT INTO emp2 select * from employees where department_id=60;
commit;

-- intersection 
SELECT * FROM emp1 INTERSECT SELECT * FROM emp2;

-- Session 27 sept 2026 
