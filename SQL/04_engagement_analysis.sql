    WITH pairing_status AS (
    SELECT 
        user_id,
        event_name,
        CASE WHEN user_id IN (
            SELECT DISTINCT user_id 
            FROM app_event_logs 
            WHERE event_name = 'device_paired')
        THEN 'Paired'
        ELSE 'Not Paired'
        END AS pairing_status
    FROM app_event_logs
)
SELECT 
    pairing_status,
    COUNT(DISTINCT CASE WHEN event_name = 'volume_adjust' THEN user_id END) AS volume_adjust_users,
    CAST(ROUND(100.0 * COUNT(DISTINCT CASE WHEN event_name = 'volume_adjust' THEN user_id END)  / COUNT (DISTINCT user_id)
, 1) AS DECIMAL(5,1)) AS volume_adjust_percent,
    COUNT(DISTINCT CASE WHEN event_name = 'program_change' THEN user_id END) AS program_change_users,
    CAST(ROUND(100.0 * COUNT(DISTINCT CASE WHEN event_name = 'program_change' THEN user_id END)  / COUNT (DISTINCT user_id)
, 1) AS DECIMAL(5,1)) AS program_change_percent,
    COUNT(DISTINCT CASE WHEN event_name = 'battery_alert' THEN user_id END) AS battery_alert_users,
     COUNT(DISTINCT user_id) AS user_count,  
   CAST(ROUND(100.0 * COUNT(DISTINCT CASE WHEN event_name = 'battery_alert' THEN user_id END)  / COUNT (DISTINCT user_id)
, 1) AS DECIMAL(5,1)) AS battery_alert_percent
FROM pairing_status
GROUP BY pairing_status;