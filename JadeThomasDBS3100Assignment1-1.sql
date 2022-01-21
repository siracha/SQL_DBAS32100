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
 
 --1.Print the total amount, the average dollar value of service visits (parts and labour costs) and the number of those visits for Acura, Mercedes and --Jaguar car makes that are sold between September 2015 and December 2018 inclusive (5 marks).
 
SELECT sum(partscost)+ sum(laborcost) AS "total amount", 
round(avg(partscost)+ avg(laborcost),2) AS "average $ value",
carmake
FROM S5.servinv s
JOIN S5.car c ON s.custname = c.custname
JOIN S5.saleinv si ON c.carserial = si.carserial
WHERE c.carmake IN ('JAGUAR', 'ACURA', 'MERCEDES') 
AND si.saledate >= '2015/09/01' AND si.saledate <='2019/01/01'
GROUP BY carmake
ORDER BY "total amount";

---output---
/* total amount, average labor costs, CARMAKE
14611	608.79	ACURA
23872.21	746.01	MERCEDES
45143	3009.53	JAGUAR */

