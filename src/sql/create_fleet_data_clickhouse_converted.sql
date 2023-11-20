CREATE VIEW fleet_mgmt_data_conv AS
SELECT 
    s.vehicle_id,
    s.engine_temperature,
    s.average_rpm,
    l.location['latitude'] as latitude,
    l.location['longitude'] as longitude,
    l.ts as ts,
    FROM_UNIXTIME(cast(ts/1000, 'UInt64')) as dt,
    d.driver_name,
    d.license_plate
FROM fleet_mgmt_sensors as s
INNER JOIN fleet_mgmt_location as l
    ON s.vehicle_id = l.vehicle_id
INNER JOIN fleet_mgmt_description as d
    ON s.vehicle_id = d.vehicle_id