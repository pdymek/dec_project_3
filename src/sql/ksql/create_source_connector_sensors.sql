    CREATE SOURCE CONNECTOR IF NOT EXISTS SENSORS WITH (
    'connector.class'          = 'DatagenSource',
    'kafka.api.key'            = '<my-kafka-api-key>',
    'kafka.api.secret'         = '<my-kafka-api-secret>',
    'kafka.topic'              = 'fleet_mgmt_sensors',
    'quickstart'               = 'fleet_mgmt_sensors',
    'maxInterval'              = '10',
    'tasks.max'                = '1',
    'output.data.format'       = 'JSON'
);