CREATE STREAM description (
    vehicle_id INT,
    driver_name VARCHAR,
    license_plate VARCHAR
) WITH (
    KAFKA_TOPIC = 'fleet_mgmt_description',
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 1
);