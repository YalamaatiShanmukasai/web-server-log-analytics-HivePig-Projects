-- Web Server Log Analytics using Apache Hive
-- Dataset: web_logs.csv

CREATE DATABASE IF NOT EXISTS web_log_analytics;
USE web_log_analytics;

DROP TABLE IF EXISTS web_logs_raw;

CREATE TABLE web_logs_raw (
    ip STRING,
    timestamp STRING,
    method STRING,
    page STRING,
    status INT,
    response_time_ms INT,
    user_agent STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH 'web_logs.csv'
OVERWRITE INTO TABLE web_logs_raw;

SELECT COUNT(*) AS total_requests FROM web_logs_raw;

SELECT method, COUNT(*) AS requests
FROM web_logs_raw
GROUP BY method
ORDER BY requests DESC;

SELECT status, COUNT(*) AS requests
FROM web_logs_raw
GROUP BY status
ORDER BY status;

SELECT page, COUNT(*) AS requests
FROM web_logs_raw
GROUP BY page
ORDER BY requests DESC;

SELECT status, COUNT(*) AS errors
FROM web_logs_raw
WHERE status IN (404, 500)
GROUP BY status
ORDER BY status;

SELECT method, ROUND(AVG(response_time_ms), 2) AS avg_response_time_ms
FROM web_logs_raw
GROUP BY method;

SELECT ip, COUNT(*) AS requests
FROM web_logs_raw
GROUP BY ip
ORDER BY requests DESC
LIMIT 10;

SELECT user_agent, COUNT(*) AS requests
FROM web_logs_raw
GROUP BY user_agent
ORDER BY requests DESC;
