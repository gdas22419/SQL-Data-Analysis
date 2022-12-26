/*
joins
(INNER) JOIN: Returns records that have matching values in both tables
LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
*/


USE DEMO_DATABASE;

SELECT * FROM "DEMO_DATABASE"."PUBLIC"."BROKER";
SELECT * FROM "DEMO_DATABASE"."PUBLIC"."MKS_COMPLAIN";
SELECT * FROM "DEMO_DATABASE"."PUBLIC"."PRODUCT";

--- INNER JOIN
--- The INNER JOIN keyword selects records that have matching values in both tables.
SELECT * FROM PRODUCT AS PR
INNER JOIN MKS_COMPLAIN AS MKS
ON PR.PRODUCT_ID = MKS.BROKERID;

--- LEFT JOIN
SELECT * FROM PRODUCT AS PR
LEFT JOIN MKS_COMPLAIN AS MKS
ON PR.PRODUCT_ID = MKS.BROKERID;

/*
The LEFT JOIN keyword returns all records from the left table (table1),
and the matching records from the right table (table2). 
The result is 0 records from the right side, if there is no match.
*/

--- RIGHT JOIN
SELECT * FROM PRODUCT AS PR
RIGHT JOIN MKS_COMPLAIN AS MKS
ON PR.PRODUCT_ID = MKS.BROKERID;
/*
The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records
from the left table (table1). The result is 0 records from the left side, if there is no match.
*/

--- FULL JOIN
SELECT * FROM PRODUCT AS PR
FULL JOIN MKS_COMPLAIN AS MKS
ON PR.PRODUCT_ID = MKS.BROKERID;

/* The FULL OUTER JOIN keyword returns all records 
when there is a match in left (table1) or right (table2) table records.
*/

--- UNION OPERATER
/*
The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
*/

--- GROUP BY 
SELECT BROKERID,COUNT(*) `COUNT` FROM "DEMO_DATABASE"."PUBLIC"."MKS_COMPLAIN"
GROUP BY BROKERID ;

--- HAVING CLAUSE
/*
The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
*/

