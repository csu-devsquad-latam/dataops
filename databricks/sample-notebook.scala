// Databricks notebook source
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types._
import org.apache.spark.sql.{Row}

val dataDF = Seq(
  ("America/New_York", "2021-05-01 10:50:00"),
  ("Europe/Lisbon", "2021-02-15 10:05:00"),
  ("Europe/Madrid", "2021-03-07 10:00:00"),
  ("Europe/London", "2023-02-13 10:00:00"),
  ("America/Sao_Paulo", "2022-05-08 10:00:00"),
  ("America/Sao_Paulo", "2022-02-02 10:55:00"),
  ("America/Sao_Paulo", "2026-02-05 10:05:00"),
  ("Africa/Nairoui", "2021-02-17 15:00:01")
).toDF("OriginTz", "Time")

// COMMAND ----------

display(dataDF)

// COMMAND ----------
