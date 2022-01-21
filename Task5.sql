--5.1 Create views that shows: the average and sum of the donations by day, month, year
CREATE OR REPLACE VIEW "Donations by date" AS
SELECT don.sum_donation, don.avg_donation, dim_day.t_day
FROM fact_donations don
JOIN dim_day ON don.t_id = dim_day.t_id
ORDER BY dim_day.t_day;


--5.2 Create views that shows: the average and sum of the donations by address, postal code
CREATE OR REPLACE VIEW "Donations by address" AS
SELECT don.sum_donation as sum_of_dons, don.avg_donation as avg_of_dons, addr.street_number as num, addr.province as prov,
addr.city as city, addr.street_name as street,
addr.street_direction as dir, addr.street_type as type, addr.unit_number as unit_num, addr.postal_code as postal_code
FROM fact_donations don
JOIN dim_address addr ON don.a_id = addr.address_id
GROUP BY addr.street_number, addr.province, addr.city, addr.street_name, addr.street_direction, 
addr.street_type, addr.postal_code, don.sum_donation, don.avg_donation, 
addr.unit_number 
ORDER BY addr.unit_number, addr.street_name, addr.street_number;


--5.3 Create views that shows: the average and sum of the donations by volunteer and volunteer group leader
CREATE OR REPLACE VIEW "Donations by volunteer" AS
SELECT don.sum_donation as sum_of_dons, don.avg_donation as avg_of_dons, vol.volunteer_first_name + vol.volunteer_last_name as volunteer,
vol.group_leader as group_leader
FROM fact_donations don JOIN dim_volunteer vol
ON don.v_id = vol.v_id
ORDER BY volunteer, group_leader;