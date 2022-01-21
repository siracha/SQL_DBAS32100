--/*=============================================================================
 --|   Assignment:  ASSIGNMENT 1
 --|
 --|       Author:  Jade Thomas
 --|     Language:  SQL
 --|
 --|        Class:  DBAS32100 Database Management
 --|   Instructor:  Michael McKee
 --|     Due Date:  February 10 at 11:59 PM
 --*===========================================================================*/
 
SELECT c.carmodel,count(s.laborcost) AS "total spent"
FROM SI.servinv s
--WHERE c.carmake = 'TOYOTA'
JOIN SI.car c
ON S.carserial = c.carserial
GROUP BY ROLLUP(c.carmodel)
;

/*

CARMODEL total spent
-------- -----------
VEYRON             2
PRIUS              4
CHARGER            2
.
.
.
YARIS              2
                 560

183 rows selected. 


*/