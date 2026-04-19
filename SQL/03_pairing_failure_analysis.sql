-- Pairing failures by OS and model
SELECT 
    phone_os,
    hearing_aid_model,
    COUNT(*) AS pairing_failed_count,
 CAST(ROUND(100.0 * COUNT(*) / 
    (SELECT COUNT(*) 
     FROM app_event_logs 
     WHERE event_name = 'pairing_failed')
, 1) AS DECIMAL(5,1)) AS failure_percent
FROM app_event_logs
WHERE event_name = 'pairing_failed'
GROUP BY phone_os, hearing_aid_model
ORDER BY pairing_failed_count DESC; 

-- Failure rate per segment
SELECT 
phone_os, 
hearing_aid_model,
COUNT(DISTINCT user_id) AS user_count,
COUNT(DISTINCT CASE WHEN event_name = 'pairing_failed' THEN user_id END) AS pairing_failure_event,
CAST(ROUND(100.0 *  COUNT(DISTINCT CASE WHEN event_name = 'pairing_failed' THEN user_id END) / COUNT (DISTINCT user_id)
, 1) AS DECIMAL(5,1)) AS failure_rate_percent
FROM app_event_logs 
GROUP BY phone_os,hearing_aid_model
ORDER BY pairing_failure_event DESC; 


