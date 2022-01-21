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
 
 --JadeThomasDBS3100Assignment1-1.sql
 
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


--JadeThomasDBS3100Assignment1-2.sql

SELECT s.custname AS "name",
CASE count(s.saleinvno)
    WHEN 1
        THEN 'One time buyer'
    WHEN 2
        THEN 'Two time buyer'
    ELSE
      'frequent buyer'
END AS "type of buyer"
FROM SI.car car
JOIN SI.saleinv s
ON s.carserial = car.carserial
WHERE car.carmake = 'MERCEDES'
GROUP BY s.custname
ORDER BY "type of buyer"
; 



----OUTPUT----



/* name                 type of buyer 
-------------------- --------------
BERNARDO SIQUEIRA    One time buyer
JIN HWAN OH          One time buyer
LUKA TRESKA          One time buyer
.
.
.
JORDAN SHEDLETZKY    One time buyer
JACK BROWN           One time buyer
JIE DONG             Two time buyer

71 rows selected.  */


--JadeThomasDBS3100Assignment1-3.sql

SELECT p.custname, p.carmake, p.carmodel
FROM SI.prospect p
INTERSECT
SELECT car.custname, car.carmake, car.carmodel
FROM SI.car car
;


----OUTPUT-----


/* 

CUSTNAME             CARMAKE    CARMODEL  
-------------------- ---------- ----------
AMANDEEP             LAND ROVER R70       
BHAVAY GROVER        LAND ROVER RRS       
MATTHEW VILJAKAINEN  LAND ROVER G4        
PATRICK SIMMONS      LAND ROVER SPORT     
SMARTH ARORA         LAND ROVER EVOQUE    
VALERIYA             LAND ROVER SPORT     

6 rows selected. 


 */
 
 --JadeThomasDBS3100Assignment1-5.sql
 
 
 SELECT s.carserial AS serial, 
c.carlistprice AS price, carmodel AS model,
sum(s.carsaleprice) OVER () 
AS "cumulative sale price totals"
FROM SI.saleinv s
JOIN SI.car c
ON c.carserial = s.carserial
WHERE c.carmake = 'JAGUAR'
;

-----output
/* SERIAL,		 PRICE, MODEL, cumulative sale price totals
J16CLX0 	14948.7	LX	3381859.32
J15BTTT2	95000	TTT4	3381859.32
J10YCOO0	227500	COOL	3381859.32
.
.
.
J17SEPA6	80000	EPACE	3381859.32
J18WEPA9	150000	E-PACE	3381859.32
J18WXF09	61000	XF0	3381859.32 */