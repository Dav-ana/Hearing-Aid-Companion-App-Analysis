SELECT
COUNT(DISTINCT CASE WHEN event_name = 'app_open' THEN user_id END) AS app_open_event,
COUNT(DISTINCT CASE WHEN event_name = 'account_setup' THEN user_id END) AS account_setup_event,
COUNT(DISTINCT CASE WHEN event_name = 'bluetooth_search' THEN user_id END) AS bluetooth_search_event,
COUNT(DISTINCT CASE WHEN event_name = 'device_paired' THEN user_id END) AS device_paired_event,
CAST(ROUND(100.0 * (COUNT(DISTINCT CASE WHEN event_name = 'bluetooth_search' THEN user_id END) - 
COUNT(DISTINCT CASE WHEN event_name = 'device_paired' THEN user_id END)) / 
COUNT(DISTINCT CASE WHEN event_name = 'bluetooth_search' THEN user_id END), 1) AS DECIMAL(5,1)) AS dropoff_search_to_paired_percent,
(SELECT 
COUNT(DISTINCT user_id) AS aha_moment_users 
FROM app_event_logs 
WHERE event_name = 'volume_adjust' AND user_id IN 
( SELECT DISTINCT user_id FROM app_event_logs WHERE event_name = 'device_paired' )) AS  aha_moment_users, 
CAST(ROUND(100.0 * 
    (SELECT COUNT(DISTINCT user_id)
     FROM app_event_logs
     WHERE event_name = 'volume_adjust'
     AND user_id IN (
         SELECT DISTINCT user_id 
         FROM app_event_logs 
         WHERE event_name = 'device_paired'))
    / COUNT(DISTINCT CASE WHEN event_name = 'device_paired' THEN user_id END)
, 1) AS DECIMAL(5,1)) AS aha_moment_percent
FROM app_event_logs;
