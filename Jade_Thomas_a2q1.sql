--jadethomas_a2q1
SELECT c.custname, COUNT(car.carserial)
FROM si.customer c
JOIN si.car car ON  c.custname = car.custname
WHERE c.custname = c.custname
GROUP BY car.carserial, c.custname
ORDER BY c.custname