CREATE STREAM sensors (
    vehicle_id INT,
    engine_temperature INT,
    average_rpm INT
) WITH (
    KAFKA_TOPIC = 'fleet_mgmt_sensors',
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 1
);