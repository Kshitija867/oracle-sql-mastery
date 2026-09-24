-- Block 1 — Table Creation, DDL & DML Practice 

-- Create Table T1 for value and datatype practice
CREATE TABLE t1 (
    output VARCHAR2(20)
);

-- DELETE TABLE 
DROP TABLE t1;

-- ADD a column
ALTER TABLE t1 ADD input VARCHAR(20);

-- check the table
DESC t1;

-- insert/update the new column
UPDATE t1 SET input = 'Decimal Value';

-- Modify a column
ALTER TABLE t1 MODIFY input VARCHAR(100);

-- Drop a column
ALTER TABLE t1 DROP COLUMN output;

-- ADD again 
ALTER TABLE t1 ADD output VARCHAR(20);

-- Insert a decimal value into T1
INSERT INTO t1 VALUES (123.456, 123);

-- Display the contents of T1
SELECT * FROM t1;

-- Insert another decimal value into T1
INSERT INTO t1 VALUES ('0.537', 'abc');

-- Change only one row
UPDATE t1 SET input = 'New Value' WHERE output = '123';

-- Change multiple columns in ONE specific row
UPDATE t1 SET output = '500.123', input = 'Updated Value' WHERE output = '123';

-- Display the stored values with their length
SELECT output, LENGTH(output) AS value_length FROM t1;

-- Permanently save the inserted records
commit;

-- Block 2 — T2 Table Creation and Data Manipulation

-- Create T2 for aggregate and window function practice
CREATE TABLE t2 (
    name VARCHAR(50),
    value NUMBER
);

-- Insert sample records into T
INSERT INTO t2 VALUES ('Akash', 500);
INSERT INTO t2 VALUES ('Rahul', 200);
INSERT INTO t2 VALUEs ('Sachin', 300);

-- Display all records
SELECT * FROM t2;

-- Permanently save the inserted records
COMMIT;

-- Display T2 records in descending order of value
SELECT * FROM t2 ORDER BY value DESC;

-- Calculate the total of all values
SELECT SUM(value) AS total_value FROM t2;

-- Calculate basic aggregate statistics
SELECT
   AVG(value) AS average_value,
   MIN(value) AS minimum_value,
   MAX(value) AS maximum_value
FROM t2;

-- Count the number of records in T2
SELECT COUNT(*) AS total_records FROM t2;

-- Display each value along with the overall total
SELECT name, value, SUM(value) OVER () AS total_value FROM t2;

-- Assign a unique sequential number based on value
SELECT name, value, ROW_NUMBER() OVER (ORDER BY value DESC) AS row_number FROM t2;

-- Assign a rank based on value
SELECT name, value, RANK() OVER (ORDER BY value DESC) AS rank FROM t2;

-- Assign a dense rank based on value
SELECT name, value, DENSE_RANK() OVER (ORDER BY value DESC) AS dense_rank FROM t2;

-- Add a duplicate value to demonstrate ranking behavior
INSERT INTO t2 VALUES ('Rohit', 300);

-- Compare ROW_NUMBER, RANK and DENSE_RANK
SELECT
    name,
    value,
    ROW_NUMBER() OVER (ORDER BY value DESC) AS row_number, 
    RANK() OVER (ORDER BY value DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY value DESC) AS dense_rank
FROM t2;   

-- Calculate the overall total while retaining each row
SELECT name, value, SUM(value) OVER () AS total_value FROM t2;

-- Display the total number of records alongside each row
SELECT name, value, COUNT(value) OVER () AS total_count FROM t2;

-- Display aggregate statistics alongside every record
SELECT
    name,
    value,
    SUM(value) OVER () AS total_sum,
    COUNT(value) OVER () AS total_count,
    MIN(value) OVER () AS minimum_value,
    ROUND(AVG(value) OVER (), 2) AS average_value
FROM t2;

commit;

-- Oracle SQL Practice Session from 6 Sept



