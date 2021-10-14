# Databricks notebook with python

# COMMAND ----------

input_data = spark.createDataFrame([
    ('America/New_York', '2021-03-02 10:05:00'),
    ('Europe/Lisbon', '2020-02-02 10:00:00'),
    ('Europe/Madrid', '2021-02-17 10:00:00'),
    ('Europe/London', '2021-06-02 12:00:00'),
    ('America/Sao_Paulo', '2021-05-06 10:00:00'),
    ('America/Sao_Paulo', '2024-07-11 10:00:00'),
    ('America/Sao_Paulo', '2021-02-01 10:00:00'),
    ('Africa/Nairoui', '2025-12-02 13:04:01')],
    ['OriginTz', 'Time'])

# COMMAND -----------

display(input_data)
