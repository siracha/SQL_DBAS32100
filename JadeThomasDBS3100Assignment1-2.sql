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
JAMES CUMMING        One time buyer
HADYA ADNAN          One time buyer
DANIEL DIAS          One time buyer
OMAR ELBANBY         One time buyer
SYED ABDI            One time buyer
RITA ATTOUI          One time buyer
STANLEY LEE          One time buyer
ZACHARY CRUMP        One time buyer

name                 type of buyer 
-------------------- --------------
AUSTIN PEREIRA       One time buyer
ABDUL BASIT          One time buyer
AREL CLEMENTE        One time buyer
SOJIN LEE            One time buyer
KEVINK               One time buyer
OMAR AL-MITWALLY     One time buyer
THOMAS QUINTARD      One time buyer
NESHAN               One time buyer
MOHAMED              One time buyer
NICK ROSE            One time buyer
KEVIN BARKER         One time buyer

name                 type of buyer 
-------------------- --------------
JOSHUA PINKNEY       One time buyer
JONATHAN PEFHANY     One time buyer
DANIEL DENNIS        One time buyer
ANNA JIANG           One time buyer
JUAN MENDIOLA        One time buyer
STEVEN BAN           One time buyer
ROBERT C             One time buyer
CORY SVENSSON        One time buyer
PAT WALTON           One time buyer
ALISSA NONATO        One time buyer
LAURA MARTINEZ       One time buyer

name                 type of buyer 
-------------------- --------------
JUNG HYUN RHOE       One time buyer
E LOMBARD            One time buyer
GE PHOENIX           One time buyer
RAJNEET KAUR         One time buyer
RICHARD GOMEZ        One time buyer
MARK DENNIS          One time buyer
KAREN YOUNG          One time buyer
JASON                One time buyer
STEFAN SLE           One time buyer
DAVID BERNACKI       One time buyer
LEI WANG X           One time buyer

name                 type of buyer 
-------------------- --------------
KENNY                One time buyer
MATTHEW ROHALY       One time buyer
ZACHARY DEAN         One time buyer
DEJAN P              One time buyer
UPASANA KHARBANDA    One time buyer
RAJINDER SINGH       One time buyer
JESUS AMIGLEO        One time buyer
PALLAV               One time buyer
ANKUSH BALI          One time buyer
SUKHVEER.D           One time buyer
PETER KANAREK        One time buyer

name                 type of buyer 
-------------------- --------------
LUCAS NGUYEN         One time buyer
JOHN HOYLE           One time buyer
MARY SOUCHIE         One time buyer
ROBERT LICZNER       One time buyer
DANIEL SAULNIER      One time buyer
TOM HOPE             One time buyer
MIKE VIAU2           One time buyer
RODRIGO LIMA         One time buyer
NIZETTE ROBAS        One time buyer
PHILIP PEDERSEN      One time buyer
ROBERTFE             One time buyer

name                 type of buyer 
-------------------- --------------
CATHERINE OWUSU      One time buyer
SHUKUR SAHIBDAD      One time buyer
JORDAN SHEDLETZKY    One time buyer
JACK BROWN           One time buyer
JIE DONG             Two time buyer

71 rows selected.  */

