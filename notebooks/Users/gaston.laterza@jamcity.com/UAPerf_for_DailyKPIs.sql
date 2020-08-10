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
  calendar_dt,              
  application_family_name,
  market_cd,
  user_source_type_cd,
  country_iso_3              AS country,
  channel_name,
  channel_type_cd,
  promotion_name,
  mvp_campaign_type,
  SUM(expense_amt)           AS expense_amt,
  SUM(adn_installs)          AS adn_installs
FROM pr_analytics_agg.fact_promotion_expense_daily
WHERE 
  calendar_dt BETWEEN date_sub(CURRENT_DATE, 91) AND CURRENT_DATE AND
  application_cd IN (2113, 2114, 2115, 2116, 2155)
GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9
ORDER BY 1, 11 DESC


-- DIMENSIONES QUE ME FALTAN:
--  payer indicator
--  A.DEVICE_FAMILY_NAME,
--  A.DEVICE_MODEL_NAME,
--  A.OS_VERSION_NAME,
--  A.APPLICATION_VERSION_VAL,

-- METRICAS A CALCULAR:
-- CPI  cost per install
-- ARPI  Revenue sobre installs

-- COMMAND ----------

SELECT
  DISTINCT (promotion_name)
FROM pr_analytics_agg.fact_promotion_expense_daily
WHERE 
  YEAR(calendar_dt) = 2020 AND
  application_cd IN (2113, 2114, 2115, 2116, 2155)

-- COMMAND ----------

