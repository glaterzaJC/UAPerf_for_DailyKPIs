-- Databricks notebook source
DESCRIBE TABLE pr_analytics_agg.fact_promotion_expense_daily

-- COMMAND ----------

SELECT 
  *
FROM pr_analytics_agg.fact_promotion_expense_daily
WHERE 
  YEAR(calendar_dt) = 2020 AND
  application_cd IN (2113, 2114, 2115, 2116, 2155)
LIMIT 10

-- COMMAND ----------

SELECT
  DISTINCT (user_source_type_cd)
FROM pr_analytics_agg.fact_promotion_expense_daily
WHERE 
  YEAR(calendar_dt) = 2020 AND
  application_cd IN (2113, 2114, 2115, 2116, 2155)

-- COMMAND ----------

