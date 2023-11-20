SELECT s.vehicle_id, d.driver_name, d.license_plate, count(1) as cnt
FROM fleet_mgmt_data
GROUP BY s.vehicle_id, d.driver_name, d.license_plate
ORDER BY cnt DESC

