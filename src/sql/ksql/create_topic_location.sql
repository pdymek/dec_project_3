CREATE STREAM location (
    vehicle_id INT,
    location STRUCT<latitude DOUBLE, longitude DOUBLE>
) WITH (
    KAFKA_TOPIC = 'fleet_mgmt_location',
    VALUE_FORMAT = 'JSON',
    PARTITIONS = 1
);