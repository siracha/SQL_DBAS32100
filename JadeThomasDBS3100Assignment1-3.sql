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