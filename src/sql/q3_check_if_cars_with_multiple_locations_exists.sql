SELECT *,
COUNT(1) OVER (PARTITION BY d.license_plate) as cnt
FROM 
(
    SELECT distinct
    d.license_plate,
    latitude,
    longitude,
    FROM fleet_mgmt_data
) 
ORDER BY cnt