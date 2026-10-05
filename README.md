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

The screenshots are arranged in project workflow order. Exact duplicate screenshots and the unrelated Waste IoT screenshot have been removed.

### 1. Hadoop Environment Setup and Daemon Verification

![Hadoop Environment Setup and Daemon Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(1).jpeg)

### 2. Hadoop Cluster Startup and JPS Verification

![Hadoop Cluster Startup and JPS Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM.jpeg)

### 3. Pig Script Loading, Cleaning and URL Grouping

![Pig Script Loading, Cleaning and URL Grouping](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM.jpeg)

### 4. Pig Job Execution and Aggregation

![Pig Job Execution and Aggregation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.06%20PM.jpeg)

### 5. Pig URL Frequency Results

![Pig URL Frequency Results](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(2).jpeg)

### 6. Pig Aggregation Output

![Pig Aggregation Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM.jpeg)

### 7. Pig Error Analysis — 404 and 500 Responses

![Pig Error Analysis — 404 and 500 Responses](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM.jpeg)

### 8. Hive External Table Creation

![Hive External Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(3).jpeg)

### 9. Hive Table Data Verification

![Hive Table Data Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(2).jpeg)

### 10. Hive Total Record Count

![Hive Total Record Count](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM.jpeg)

### 11. Hive URL Request Analysis

![Hive URL Request Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(1).jpeg)

### 12. Hive URL Frequency Results

![Hive URL Frequency Results](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM%20(1).jpeg)

### 13. Hive HTTP Method Analysis

![Hive HTTP Method Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM.jpeg)

### 14. Hive HTTP Status Analysis

![Hive HTTP Status Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM%20(1).jpeg)

### 15. Hive Data Cleaning and Transformation

![Hive Data Cleaning and Transformation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(1).jpeg)

### 16. Hive Partitioning

![Hive Partitioning](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM.jpeg)

### 17. Hive Bucketing

![Hive Bucketing](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(2).jpeg)

### 18. Pig Input Processing and Job Statistics

![Pig Input Processing and Job Statistics](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-projects/main/WhatsApp%20Image%202026-10-04%20at%208.10.06%20PM.jpeg)

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
