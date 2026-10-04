-- Web Server Log Analytics using Apache Pig
-- Dataset: web_logs.csv
-- Columns: ip, timestamp, method, page, status, response_time_ms, user_agent

logs = LOAD 'web_logs.csv' USING PigStorage(',')
       AS (ip:chararray, timestamp:chararray, method:chararray,
           page:chararray, status:int, response_time_ms:int,
           user_agent:chararray);

total_requests = GROUP logs ALL;
total_count = FOREACH total_requests GENERATE COUNT(logs) AS total_requests;
DUMP total_count;

method_group = GROUP logs BY method;
method_count = FOREACH method_group GENERATE group AS method, COUNT(logs) AS requests;
DUMP method_count;

status_group = GROUP logs BY status;
status_count = FOREACH status_group GENERATE group AS status, COUNT(logs) AS requests;
DUMP status_count;

page_group = GROUP logs BY page;
page_count = FOREACH page_group GENERATE group AS page, COUNT(logs) AS requests;
page_count_sorted = ORDER page_count BY requests DESC;
DUMP page_count_sorted;

error_logs = FILTER logs BY status == 404 OR status == 500;
error_group = GROUP error_logs BY status;
error_count = FOREACH error_group GENERATE group AS status, COUNT(error_logs) AS errors;
DUMP error_count;

method_time_group = GROUP logs BY method;
avg_response = FOREACH method_time_group
               GENERATE group AS method,
                        AVG(logs.response_time_ms) AS avg_response_time_ms;
DUMP avg_response;

ip_group = GROUP logs BY ip;
ip_count = FOREACH ip_group GENERATE group AS ip, COUNT(logs) AS requests;
ip_count_sorted = ORDER ip_count BY requests DESC;
DUMP ip_count_sorted;
