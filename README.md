## DEC - project 3
## Fleet management - streaming data


This project consisting implementation of ingesting stream data from fleet management sources.

This project is done with Confluetn, Kafka, Clickhouse, Perset and Python technologies.


Objective was to extract data to answer these questions:
 - What is a current location of certain car?
 - Detect pattern in fleet movement
 - Excessive usage of cars
 - Detect abnormal engine work
 - Report drivers activity
 - Other machine learning applications:
    - Predictive maintenance

This application and final reports could be used by Fleet Manager, Analysts or Fleet Maintenance Department

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
### Data sources

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
Three kafka topics for fleet data consumption:
![kafka-topics](/doc/kafka_topics.png)

Data consumption:
![data-throughtput](/doc/data_throughtput.png)


---
### Transformation

Output tables if form of precalculated report views or sql queries:
![fleet-mgmnt-data](/doc/fleet_mgmt_data.png)
### Preset visualization

Data ingestion in time:
![data-ingestion-in-time](/doc/data_ingestion_in_time.png)

Top 10 sesnsor usage by driver:
![top10-sensor-read-by-driver](/doc/top10_sensor_read_by_driver.png)

Usage distribution on calendar:

![calendar-report](/doc//calendar_report.png)


---
### Testing and GitHub Actions

Check if Clickhouse connection works and required tables exists by running in command line:
> pytest tests

![pytest](/doc/pytest.png)


The tests are also invoked during pull request to main brach using GitHub Actions:

![github-actions](/doc/github_actions.png)
