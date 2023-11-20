## DEC - project 3
## Fleet management - streaming data


This project consisting implementation of ingesting stream data from fleet management sources.

This project is done with Confluetn, Kafka, Clickhouse, Perset and Python technologies.

---

| Author          | GitHub profile |
| ---           | --- |
|Pawel Dymek    | [pdymek](https://github.com/pdymek)|


The solutions is done with help of:
- Kafka connect datagen docs - https://github.com/confluentinc/kafka-connect-datagen/
- Resources provided during DEC courses - https://dataengineercamp.com/

---
### Solution architecture
![project-architecture](/doc/project_architecture.drawio.svg)

---
### Data source

The data comes from three following datagen sources:
- fleet_mgmt_description
- fleet_mgmt_location
- fleet_mgmt_sensors


List of sources and ingested fields:

![data-schema](/doc/datagen_sources.drawio.svg)



The data are organised in nested .json file.

Sample of .json data:

```
{
    "namespace": "fleet_mgmt",
    "name": "fleet_mgmt_location",
    "type": "record",
    "fields": [
        {
            "name": "vehicle_id",
            "type": {
                "type": "int",
                "arg.properties": {
                    "range": {
                        "min": 1000,
                        "max": 9999
                    }
                }
            }
        },
        {
            "name": "location",
            "type": {
                "type": "record",
                "name": "location",
                "fields": [
                    {
                        "name": "latitude",
                        "type": "double"
                    },
                    {
                        "name": "longitude",
                        "type": "double"
                    }
                ]
            },
            "arg.properties": {
                "options": [
                    {
                        "latitude": 37.416834,
                        "longitude": -121.975002
                    },
                    {
...
```
---
### Extraction

Sample ksql code for create source connector:

```sql
    CREATE SOURCE CONNECTOR IF NOT EXISTS LOCATION WITH (
    'connector.class'          = 'DatagenSource',
    'kafka.api.key'            = '<my-kafka-api-key>',
    'kafka.api.secret'         = '<my-kafka-api-secret>',
    'kafka.topic'              = 'fleet_mgmt_location',
    'quickstart'               = 'fleet_mgmt_location',
    'maxInterval'              = '10',
    'tasks.max'                = '1',
    'output.data.format'       = 'JSON'
);
```







![data-throughtput](/doc/data_throughtput.png)


---
### Transform


---
### Preset visualization

Data ingestion in time:
![data-ingestion-in-time](/doc/data_ingestion_in_time.png)

Top 10 sesnsor usage by driver:
![top10-sensor-read-by-driver](/doc/top10_sensor_read_by_driver.png)

Usage distribution on calendar:
![calendar-report](/doc//calendar_report.png)

### Testing

Check if Clickhouse connection works and required tables exists:
> pytest tests

![pytest](/doc/pytest.png)



