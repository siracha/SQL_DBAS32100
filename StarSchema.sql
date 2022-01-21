/*
StarSchema.sql
Juan Diaz
S5_diazjua
Create and load the star schema
*/

/*
clear tables and sequences
*/
DROP TABLE fact_donations CASCADE CONSTRAINTS PURGE;

DROP TABLE dim_volunteer CASCADE CONSTRAINTS PURGE;

DROP TABLE dim_address CASCADE CONSTRAINTS PURGE;

DROP TABLE dim_day CASCADE CONSTRAINTS PURGE;

DROP SEQUENCE dim_volunteer_id;

DROP SEQUENCE dim_address_id;

DROP SEQUENCE dim_day_id;

/*
create dimension tables and fact table  
*/

CREATE TABLE dim_volunteer (
     v_id                    NUMBER PRIMARY KEY
    ,volunteer_id           NUMBER
    ,volunteer_first_name   VARCHAR2(16)
    ,volunteer_last_name    VARCHAR2(16)
    ,group_leader           NUMBER
);

CREATE TABLE dim_address (
     a_id               NUMBER PRIMARY KEY
    ,address_id         NUMBER
    ,unit_number        VARCHAR2(6)
    ,street_number      NUMBER
    ,street_name        VARCHAR2(24)
    ,street_type        VARCHAR2(12)
    ,street_direction   CHAR(1)
    ,postal_code        CHAR(7)
    ,city               VARCHAR(16)
    ,province           CHAR(2)
); 

CREATE TABLE dim_day (
     t_id    NUMBER PRIMARY KEY
    ,t_day   VARCHAR(3)
);

CREATE TABLE fact_donations (
     v_id NUMBER 
        REFERENCES dim_volunteer (v_id)
    ,a_id NUMBER
        REFERENCES dim_address (a_id)
    ,t_id NUMBER
        REFERENCES dim_day (t_id)
    ,sum_donation NUMBER(7,1)
    ,avg_donation NUMBER(7,1)
);

/*
create sequences
*/

CREATE SEQUENCE dim_volunteer_id;

CREATE SEQUENCE dim_address_id;

CREATE SEQUENCE dim_day_id;

/*
create dimtables
extracting
*/

INSERT INTO dim_volunteer
    SELECT
        dim_volunteer_id.NEXTVAL
        ,volunteer_id
        ,first_name
        ,last_name
        ,group_leader
    FROM
        prc.volunteer;
        
INSERT INTO dim_address
    SELECT
        dim_address_id.NEXTVAL
        ,address_id
        ,unit_num
        ,street_number
        ,street_name
        ,street_type
        ,street_direction
        ,postal_code
        ,city
        ,province
    FROM
        prc.address;
        
INSERT INTO dim_day
    SELECT
         dim_day_id.NEXTVAL
        ,t_day
    FROM
        (
            SELECT
                SUBSTR(donation_date, 1, 3) AS t_day
            FROM
                prc.donation
        );
        
COMMIT;

/*
PL/SQL block to create the fact table
transforming and loading
donation date, sum of donation per donor, avg of donations
*/

DECLARE
    TYPE arr_donations IS
        TABLE OF fact_donations%rowtype;
    donations arr_donations;
    CURSOR cr IS
    SELECT
         v_id
        ,a_id
        ,t_id
        ,SUM(donation_amount) AS sum_donation
        ,AVG(donation_amount) AS avg_donation
    FROM
        prc.donation    d
        INNER JOIN dim_volunteer    v ON d.volunteer_id = v.v_id
        INNER JOIN dim_address      a ON d.address_id = a.a_id
        INNER JOIN dim_day         t ON t.t_day = SUBSTR(d.donation_date, 1, 3)
    GROUP BY
         v_id
        ,a_id
        ,t_id;
        
BEGIN
    OPEN cr;
    FETCH cr BULK COLLECT INTO donations;
    CLOSE cr;
    
    FORALL i IN 1..donations.LAST
        INSERT INTO fact_donations VALUES(
             donations(i).v_id
            ,donations(i).a_id
            ,donations(i).t_id
            ,donations(i).sum_donation
            ,donations(i).avg_donation
        );
    COMMIT;
END;
