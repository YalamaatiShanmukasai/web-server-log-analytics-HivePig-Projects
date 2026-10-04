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

The following screenshots are grouped and captioned according to what each project execution screen demonstrates. They are the visual evidence for the Hadoop, HDFS, Pig, Hive, partitioning, bucketing, and final-analysis stages described in this project.

### 1. Hadoop Environment Setup

Starting Hadoop services with `start-all.sh` and verifying HDFS/YARN daemons with `jps`.

![Hadoop Environment Setup](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(1).jpeg)

### 2. HDFS Input Directory and Dataset Upload

Creating the HDFS input directory and uploading the web server log dataset.

![HDFS Input Directory and Dataset Upload](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM%20(2).jpeg)

### 3. Pig Environment and Dataset Loading

Loading the web server log data into Pig and defining the input schema.

![Pig Environment and Dataset Loading](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.54%20PM.jpeg)

### 4. Pig Job Execution

Executing the Pig script and showing Hadoop/MapReduce job processing.

![Pig Job Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM%20(1).jpeg)

### 5. Pig Total Record Count

Displaying the total number of records processed by Pig.

![Pig Total Record Count](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.55%20PM.jpeg)

### 6. Pig URL Frequency Analysis

Grouping requests by URL and calculating URL access frequency.

![Pig URL Frequency Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM%20(1).jpeg)

### 7. Pig Top URL Results

Displaying the most frequently requested URLs.

![Pig Top URL Results](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.09.59%20PM.jpeg)

### 8. Pig HTTP Method Analysis

Grouping log records by HTTP method and counting requests.

![Pig HTTP Method Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(1).jpeg)

### 9. Pig Client Error Analysis

Filtering and displaying client-side HTTP errors such as 404 responses.

![Pig  Client Error Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(2).jpeg)

### 10. Pig Server Error Analysis

Filtering and displaying server-side HTTP errors such as 500 responses.

![Pig  Server Error Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM%20(3).jpeg)

### 11. Pig Error Summary

Reviewing the error-analysis output from the processed logs.

![Pig Error Summary](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.00%20PM.jpeg)

### 12. Hive Environment Setup

Starting Hive and preparing the web log analysis environment.

![Hive Environment Setup](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(1).jpeg)

### 13. Hive External Table Creation

Creating the external Hive table for the web server log dataset.

![Hive External Table Creation](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(2).jpeg)

### 14. Hive Table Data Verification

Querying the Hive table and viewing stored log records.

![Hive Table Data Verification](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM%20(3).jpeg)

### 15. Hive URL Request Count

Grouping records by URL and calculating request counts.

![Hive URL Request Count](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.01%20PM.jpeg)

### 16. Hive HTTP Status Analysis

Grouping records by HTTP status code to identify successful and error responses.

![Hive HTTP Status Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(1).jpeg)

### 17. Hive HTTP Method Analysis

Analyzing GET, POST and other HTTP methods using HiveQL.

![Hive HTTP Method Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(2).jpeg)

### 18. Hive Error Analysis

Identifying 404 and 500 error records through Hive queries.

![Hive Error Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM%20(3).jpeg)

### 19. Hive Response-Time Analysis

Analyzing response-time information from the web server logs.

![Hive Response-Time Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.02%20PM.jpeg)

### 20. Hive Final Query Results

Displaying consolidated Hive query results for the log dataset.

![Hive Final Query Results](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(1).jpeg)

### 21. Hive External Table Execution

Showing successful execution of the Hive external-table/query workflow.

![Hive External Table Execution](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(2).jpeg)

### 22. Partitioning Optimization

Creating or demonstrating Hive partitioning by HTTP status.

![Partitioning Optimization](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM%20(3).jpeg)

### 23. Partitioned Data Analysis

Querying the partitioned Hive data for efficient analysis.

![Partitioned Data Analysis](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.03%20PM.jpeg)

### 24. Bucketing Optimization

Creating or demonstrating Hive bucketing using the client IP field.

![Bucketing Optimization](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM%20(1).jpeg)

### 25. Bucketed Data Query

Querying bucketed data to demonstrate optimized organization of records.

![Bucketed Data Query](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM%20(2).jpeg)

### 26. Final Analytics Output

Showing final web log analytics results and key findings.

![Final Analytics Output](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.04%20PM.jpeg)

### 27. Project Execution Evidence

Additional terminal evidence from the completed Hadoop, Pig and Hive workflow.

![Project Execution Evidence](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.05%20PM.jpeg)

### 28. Complete Project Workflow

Final execution evidence covering data processing, analysis and results.

![Complete Project Workflow](https://raw.githubusercontent.com/YalamaatiShanmukasai/web-server-log-analytics-hive-pig/main/WhatsApp%20Image%202026-10-04%20at%208.10.06%20PM.jpeg)
## Project Files

```text
web-server-log-analytics-hive-pig/
|
├── web_logs.csv
├── web_logs.pig
├── web_logs.hql
└── README.md
```

| File | Description |
|---|---|
| [`web_logs.csv`](./web_logs.csv) | Web server log dataset |
| `web_logs.pig` | Pig Latin processing and analysis script |
| `web_logs.hql` | HiveQL analysis queries |
| `README.md` | Project documentation |

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

> Screenshots are displayed from the previously uploaded project evidence repository while the new repository is being organized.
