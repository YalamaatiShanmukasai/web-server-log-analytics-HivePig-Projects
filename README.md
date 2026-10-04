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

The repository contains the uploaded execution screenshots. Each image is described by the project activity it represents.

### Hadoop Environment Setup
Starting Hadoop services and verifying running daemons.

### HDFS Dataset Handling
Creating the input area and handling the log dataset in HDFS.

### Pig Dataset Loading
Loading the web log data into Pig and defining the input schema.

### Pig Job Execution
Executing Pig processing with Hadoop/MapReduce.

### Pig URL Frequency Analysis
Grouping requests by URL and calculating access frequency.

### Pig HTTP Method Analysis
Grouping and counting requests by HTTP method.

### 400 Client Error Analysis
Filtering client-side error records associated with HTTP 400 responses.

### 500 Server Error Analysis
Filtering server-side error records associated with HTTP 500 responses.

### Hive External Table Creation
Creating the external Hive table for the web server log dataset.

### Hive Table Data Verification
Viewing records from the Hive table.

### Hive URL Request Count
Calculating URL request counts using HiveQL.

### Hive HTTP Status Analysis
Counting and analyzing HTTP response status codes.

### Hive HTTP Method Analysis
Analyzing request methods using HiveQL.

### Hive Error Analysis
Identifying and analyzing HTTP error responses.

### Partitioning and Bucketing
Demonstrating Hive data-organization and optimization concepts.

## Source Files

| File | Description |
|---|---|
| `web_logs.csv` | Web server log dataset |
| `web_logs.pig` | Pig Latin processing script |
| `web_logs.hql` | HiveQL analysis script |
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
