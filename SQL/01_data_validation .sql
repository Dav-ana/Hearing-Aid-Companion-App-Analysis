-- Preview data
SELECT TOP 10 *
FROM app_event_logs;

-- Total row count
SELECT COUNT(*) AS total_rows
FROM app_event_logs;

-- Row count and null check
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
    SUM(CASE WHEN event_name IS NULL THEN 1 ELSE 0 END) AS null_event_name,
    SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS null_timestamp,
    SUM(CASE WHEN phone_os IS NULL THEN 1 ELSE 0 END) AS null_phone_os,
    SUM(CASE WHEN hearing_aid_model IS NULL THEN 1 ELSE 0 END) AS null_hearing_aid_model
FROM app_event_logs;

-- Distinct event names count
SELECT COUNT(DISTINCT event_name) AS event_amount
FROM app_event_logs;

-- Distinct event names list
SELECT DISTINCT event_name
FROM app_event_logs;

-- Distinct OS values
SELECT DISTINCT phone_os
FROM app_event_logs;

-- Distinct model values
SELECT DISTINCT hearing_aid_model
FROM app_event_logs;

-- Date range check
SELECT 
    MIN(timestamp) AS start_date, 
    MAX(timestamp) AS end_date
FROM app_event_logs;

