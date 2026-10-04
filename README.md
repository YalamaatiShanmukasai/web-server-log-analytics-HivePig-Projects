# Web Server Log Analytics using Hadoop, Pig and Hive

## Project Overview

This project demonstrates web server log analytics using the Hadoop ecosystem. The workflow uses HDFS for storage, Apache Pig for log processing and aggregation, and Apache Hive for structured analysis using HiveQL.

## Objectives

- Store web server log data in HDFS.
- Clean and transform logs using Pig Latin.
- Analyze URLs, HTTP methods, status codes, errors, and response behavior.
- Demonstrate Hive external tables, partitioning, and bucketing.
- Document the execution evidence and results.

## Technologies Used

- Apache Hadoop / HDFS
- Apache Pig
- Apache Hive
- HiveQL
- Pig Latin
- MapReduce
- Ubuntu Linux
- CSV
- GitHub

## Dataset

The project includes `web_logs.csv`.

| Field | Description |
|---|---|
| `ip` | Client IP address |
| `timestamp` | Request date and time |
| `method` | HTTP request method |
| `page` | Requested URL/page |
| `status` | HTTP response status code |
| `response_time_ms` | Response time in milliseconds |
| `user_agent` | Browser/client |

## Project Workflow

```text
Web Server Log Data
        |
        v
      HDFS
        |
        v
   Apache Pig
        |
        v
Cleaning + Transformation + Aggregation
        |
        v
    Apache Hive
        |
        v
  HiveQL Analysis
        |
        v
Results and Insights
```

## Hadoop / HDFS Implementation

The dataset is stored in HDFS before processing.

Example commands:

```bash
start-all.sh
jps
hadoop fs -mkdir /input
hadoop fs -put web_logs.csv /input
hadoop fs -ls /input
```

The uploaded project evidence includes Hadoop service startup and daemon verification.

## Pig Latin Processing

Pig is used for loading, filtering, grouping, and aggregating the web server logs.

### Main Processing Tasks

- Load the dataset and define the schema.
- Count total records.
- Calculate URL request frequency.
- Analyze HTTP methods.
- Filter **400** client errors.
- Filter **500** server errors.
- Execute Pig processing through Hadoop/MapReduce.

Source file:

```text
web_logs.pig
```

## Hive Analysis

Hive is used for structured analysis using HiveQL.

### Main Analysis Tasks

- Create an external Hive table.
- Verify table data.
- Count URL requests.
- Analyze HTTP status codes.
- Analyze HTTP methods.
- Analyze errors.
- Review final query results.

Source file:

```text
web_logs.hql
```

## Partitioning

The project demonstrates Hive partitioning using HTTP status:

```sql
PARTITIONED BY (status INT)
```

This organizes data by status values for more targeted querying.

## Bucketing

The project demonstrates Hive bucketing using the client IP field:

```sql
CLUSTERED BY (ip) INTO 4 BUCKETS
```

## Project Findings

The project execution evidence demonstrates:

- Frequently accessed URLs can be identified from web logs.
- GET and POST request patterns can be analyzed.
- HTTP **400** and **500** errors can be isolated for troubleshooting.
- Hive external tables provide structured access to log data.
- Partitioning and bucketing can be used to organize data for analytics.

## Project Screenshots

The screenshots below are captioned according to the **actual commands and output visible in each image**.

### 1. Hadoop Environment Setup and Daemon Verification
Starts Hadoop with `start-all.sh` and verifies NameNode, DataNode, ResourceManager, NodeManager and SecondaryNameNode using `jps`.

![Hadoop Environment Setup and Daemon Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(1).jpeg)

### 2. Hive Bucketing Table Creation
Creates `web_logs_bucket` using `CLUSTERED BY (ip) INTO 4 BUCKETS`.

![Hive Bucketing Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(2).jpeg)

### 3. Hadoop Service Startup
Shows Hadoop daemon startup using `start-all.sh`.

![Hadoop Service Startup](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM.jpeg)

### 4. Hive HTTP Status Analysis
Runs `SELECT status, COUNT(*) FROM web_logs GROUP BY status` and displays status-code counts.

![Hive HTTP Status Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM%20(1).jpeg)

### 5. Hive Partitioned Table Creation
Creates `web_logs_part` with `PARTITIONED BY (status INT)`.

![Hive Partitioned Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM.jpeg)

### 6. Hive URL Request Analysis
Executes URL grouping and displays the most requested URLs.

![Hive URL Request Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM%20(1).jpeg)

### 7. Hive HTTP Method Analysis
Runs the Hive query grouping requests by HTTP method; output includes GET and POST counts.

![Hive HTTP Method Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM.jpeg)

### 8. Hive URL Frequency Query Execution
Runs the Hive URL-frequency query with MapReduce execution details.

![Hive URL Frequency Query Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(1).jpeg)

### 9. Hive External Table and Data Verification
Creates/uses the external `web_logs` table and displays sample records.

![Hive External Table and Data Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(2).jpeg)

### 10. Hive External Table Creation
Shows the Hive external-table definition using the `/logs` location.

![Hive External Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(3).jpeg)

### 11. Hive Total Record Count
Runs `SELECT COUNT(*) FROM web_logs` and shows a total of 1422 records.

![Hive Total Record Count](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM.jpeg)

### 12. Hive Data Cleaning and Transformation
Displays sample log records and creates `clean_logs` with type conversion and field cleaning.

![Hive Data Cleaning and Transformation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(1).jpeg)

### 13. Pig URL Frequency Results
Displays URL frequency results including `/cart`, `/home`, `/login`, `/checkout`, and `/products`.

![Pig URL Frequency Results](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(2).jpeg)

### 14. Pig Grouping Job Execution
Shows successful Pig GROUP BY/COMBINER execution and processing of 121 input records.

![Pig Grouping Job Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(3).jpeg)

### 15. Pig Log Loading and URL Grouping Commands
Shows Pig commands for loading the log file, filtering records, grouping by URL, counting, and dumping results.

![Pig Log Loading and URL Grouping Commands](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM.jpeg)

### 16. Additional Hadoop MapReduce Build and Execution
Shows Java mapper/reducer compilation, JAR creation, and Hadoop job execution for an additional MapReduce example.

![Additional Hadoop MapReduce Build and Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(1).jpeg)

### 17. Pig Dataset Processing Job
Shows successful Pig MAP_ONLY processing of 121 records from `web_logs_5kb.csv`.

![Pig Dataset Processing Job](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(2).jpeg)

### 18. Hadoop and Kafka Environment Setup
Shows Hadoop startup followed by navigation through the Kafka installation and project files.

![Hadoop and Kafka Environment Setup](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(3).jpeg)

### 19. Pig Total and Error-Related Output
Shows Pig MapReduce execution with the `(10,120)` output.

![Pig Total and Error-Related Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM.jpeg)

### 20. Pig URL Frequency Output
Shows Pig output for URL request counts: `/cart`, `/home`, `/login`, `/checkout`, and `/products`.

![Pig URL Frequency Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(1).jpeg)

### 21. Pig GROUP BY Job Execution Evidence
Shows successful Pig grouping/combiner execution and storage of five aggregated records.

![Pig GROUP BY Job Execution Evidence](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(2).jpeg)

### 22. Hive Data Cleaning and Transformation
Shows log records and the Hive `clean_logs` transformation query.

![Hive Data Cleaning and Transformation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(3).jpeg)

### 23. Pig HTTP Error Analysis
Displays Pig results for HTTP 404 and 500 errors: `(404,29)` and `(500,19)`.

![Pig HTTP Error Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM.jpeg)

### 24. Hadoop and Kafka Environment Setup
Shows Hadoop startup and Kafka/project directory contents.

![Hadoop and Kafka Environment Setup](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM%20(1).jpeg)

### 25. Pig Total and Error-Related Output
Shows Pig MapReduce execution with the `(10,120)` output.

![Pig Total and Error-Related Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM%20(2).jpeg)

### 26. Pig URL Frequency Output
Shows Pig URL request counts for `/cart`, `/home`, `/login`, `/checkout`, and `/products`.

![Pig URL Frequency Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM.jpeg)

### 27. Pig HTTP Error Analysis
Displays Pig HTTP error results `(404,29)` and `(500,19)`.

![Pig HTTP Error Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.05%20PM.jpeg)

### 28. Pig MAP_ONLY Job Execution
Shows successful Pig processing of 121 records from `web_logs_5kb.csv`.

![Pig MAP_ONLY Job Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-project/main/WhatsApp%20Image%202026-10-04%20at%208.10.06%20PM.jpeg)

## Source Files

| File | Description |
|---|---|
| `web_logs.csv` | Web server log dataset |
| [`web_logs.pig`](./web_logs.pig) | Pig Latin processing script |
| [`web_logs.hql`](./web_logs.hql) | HiveQL analysis script |
| `README.md` | Project documentation |
| `attachments (1).zip` | Project attachment archive |

## Team Members

1. Karri Sai Kiran
2. Kolli Tejesh Chowdary
3. Yalamaati Shanmuka Sai
4. Ponnamanda Mohana Lakshmi Srikrishna

## Conclusion

This project demonstrates web server log analytics using Hadoop, HDFS, Pig, and Hive. It covers data storage, processing, aggregation, error analysis, structured querying, partitioning, and bucketing.

## Repository

https://github.com/YalamaatiShanmukasai/web-server-log-analytics-project

### Project Files

- [web_logs.csv](./web_logs.csv) — dataset
- [web_logs.pig](./web_logs.pig) — Pig Latin script
- [web_logs.hql](./web_logs.hql) — HiveQL script
- [README.md](./README.md) — project documentation

All project screenshots are uploaded to this repository and are displayed directly from this repository.
