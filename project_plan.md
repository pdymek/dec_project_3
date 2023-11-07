The project would like to simulate of steam generated data and following processing to obtain near-real-time data warehouse for analytics purpose.
The `faker` package on Kafka producer will provide data and acts as sample machine with sensors for IOT system.

- Objective of the project (What would you like people to do with the data you have produced?)
  - Monitoring up-to-date state of factory
  - Short-term and long-term reporting (efficiency, scrap, machines availability)
  - Integrate data in one single source of truth
- Consumers of your data (What users would find your dataset useful?)
  - Production managers
  - Production maintenance
  - Analysts
- Datasets your team have selected (What datasets are you sourcing from?)
  - Mock manufacturing data generated with `faker` packaged in `KafkaProducer`
- Solution architecture (How does data flow from source to serving?)
  - Kafka -> Confluent -> Clickhouse -> Preset (set on AWS)
- Breakdown of tasks (How is your project broken down? Who is doing what?)
  - One person project
