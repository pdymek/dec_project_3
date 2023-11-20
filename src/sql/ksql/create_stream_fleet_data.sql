CREATE STREAM fleet_data AS
SELECT
    s.vehicle_id,
    s.engine_temperature,
    s.average_rpm,
    l.location,
    d.driver_name,
    d.license_plate
FROM sensors s
INNER JOIN location l
WITHIN 1 HOUR
    ON s.vehicle_id = l.vehicle_id
INNER JOIN description d
WITHIN 1 HOUR
    ON s.vehicle_id = d.vehicle_id    
;