# Retail Sales Data Warehouse & Business Intelligence Platform

A SQL-centric end-to-end retail analytics platform designed to simulate a real-world analytics engineering and business intelligence workflow. The project focuses on data warehousing, ETL processing, advanced SQL analytics, and interactive BI reporting using PostgreSQL, Python, and Power BI. 

---

# Project Overview

This project ingests raw retail transaction data, preprocesses and standardizes it using Python, loads it into a PostgreSQL staging layer, transforms it into a dimensional warehouse model using advanced SQL, and delivers business insights through Power BI dashboards.

The primary focus of this project includes:

* Advanced SQL development
* Data warehousing concepts
* Star schema modeling
* Analytical query optimization
* KPI engineering
* Business intelligence reporting

Unlike basic dashboard projects, this project emphasizes warehouse architecture and analytical SQL workflows similar to production-grade BI systems.

---

# Objectives

The project was designed to solve the following business problems:

* Analyze retail sales performance
* Identify top-performing products and regions
* Track customer purchasing behavior
* Measure profitability trends
* Build reusable KPI models
* Enable executive-level reporting
* Simulate a warehouse-driven analytics pipeline

---

# Tech Stack

## Database & Warehousing

* PostgreSQL
* SQL

## Data Processing

* Python
* Pandas

## Business Intelligence

* Power BI
* DAX

## Version Control

* Git
* GitHub

---

# System Architecture

```text
Raw CSV Files
        ↓
Python ETL Preprocessing
        ↓
PostgreSQL Staging Layer
        ↓
SQL Data Transformations
        ↓
Dimensional Warehouse Model
        ↓
Advanced SQL Analytics
        ↓
Power BI Semantic Model
        ↓
Interactive Business Dashboards
```

---

# Data Warehouse Architecture

The warehouse was designed using a dimensional modeling approach following star schema principles.

## Star Schema Design

```text
                dim_customer
                      |
                      |
dim_product ---- fact_sales ---- dim_date
```

---

# Fact Table

## `fact_sales`

The fact table stores transactional sales metrics.

### Measures

* sales
* quantity
* discount
* profit

### Foreign Keys

* customer_id
* product_id
* order_date

---

# Dimension Tables

## `dim_customer`

Contains descriptive customer attributes.

### Attributes

* customer_id
* customer_name
* segment
* city
* state
* region

---

## `dim_product`

Contains descriptive product information.

### Attributes

* product_id
* category
* sub_category
* product_name

---

## `dim_date`

Supports time-series analytics and KPI reporting.

### Attributes

* order_date
* year
* month
* quarter

---

# ETL Pipeline

## Step 1 — Raw Data Ingestion

Retail transaction CSV files were collected and loaded into the preprocessing pipeline.

---

## Step 2 — Python Preprocessing

Python Pandas was used for lightweight preprocessing tasks such as:

* Standardizing column names
* Duplicate removal
* Date conversion
* Null handling
* Exporting cleaned datasets

### Example Operations

```python
sales.columns = (
    sales.columns
    .str.lower()
    .str.replace(' ', '_')
)

sales.drop_duplicates(inplace=True)

sales['order_date'] = pd.to_datetime(
    sales['order_date']
)
```

---

## Step 3 — PostgreSQL Staging Layer

Cleaned data was loaded into PostgreSQL staging tables.

The staging layer isolates raw ingested data before warehouse transformations.

### Example

```sql
CREATE TABLE stg_sales (
    order_id VARCHAR(50),
    order_date DATE,
    customer_id VARCHAR(50),
    sales NUMERIC(10,2)
);
```

---

## Step 4 — Dimensional Modeling

SQL transformations were used to create:

* Dimension tables
* Fact tables
* Analytical warehouse structures

The project required resolving:

* Duplicate business keys
* Relationship cardinality issues
* Dimension uniqueness constraints

This mirrors real-world warehouse engineering workflows.

---

# Advanced SQL Analytics

A major focus of this project was implementing advanced analytical SQL logic.

## SQL Concepts Implemented

### Core SQL

* SELECT
* JOIN operations
* GROUP BY
* ORDER BY
* Aggregate functions
* CASE statements

### Intermediate SQL

* Subqueries
* Common Table Expressions (CTEs)
* Multi-table joins
* Data transformations

### Advanced SQL

* Window Functions
* RANK()
* Running totals
* Cohort analysis
* Churn analysis
* KPI calculations
* Revenue segmentation
* Customer ranking

---

# Example SQL Analytics

## Customer Revenue Ranking

```sql
SELECT
    customer_id,
    SUM(sales) AS total_sales,

    RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank

FROM fact_sales
GROUP BY customer_id;
```

---

## Running Revenue Calculation

```sql
SELECT
    order_date,

    SUM(sales) AS daily_sales,

    SUM(SUM(sales)) OVER(
        ORDER BY order_date
    ) AS cumulative_sales

FROM fact_sales
GROUP BY order_date;
```

---

## Profit Margin KPI

```sql
SELECT
    ROUND(
        (SUM(profit) / SUM(sales)) * 100,
        2
    ) AS profit_margin
FROM fact_sales;
```

---

# Power BI Semantic Modeling

The warehouse was connected to Power BI using PostgreSQL integration.

Relationships were established between:

* Fact tables
* Dimension tables

to recreate the warehouse star schema inside the BI semantic layer.

---

# DAX Measures Implemented

## KPIs

* Total Revenue
* Total Profit
* Total Orders
* Profit Margin
* Average Order Value
* Customer Count

### Example

```DAX
Total Revenue =
SUM('public fact_sales'[sales])
```

---

# Dashboards

## Executive Overview Dashboard

Provides executive-level KPI reporting.

### Features

* Revenue trend analysis
* Regional sales analysis
* Profitability KPIs
* Category contribution
* Interactive slicers

---

## Customer Analytics Dashboard

Focuses on customer behavior analytics.

### Features

* Top customers
* Customer segmentation
* Repeat purchase analysis
* Geographic sales analysis

---

## Product Analytics Dashboard

Analyzes product-level performance.

### Features

* Top-selling products
* Category profitability
* Product revenue trends
* Product contribution analysis

---

# Key Business Insights

The platform enables:

* Identification of high-value customers
* Profitability analysis by category
* Regional performance comparison
* Sales trend analysis
* Customer behavior analysis
* Executive KPI monitoring

---

# Repository Structure

```text
retail-data-platform/
│
├── dashboards/
│   └── retail_analytics_dashboard.pbix
│
├── data/
│   ├── raw/
│   └── processed/
│
├── python/
│   └── preprocess.py
│
├── screenshots/
│
├── sql/
│   ├── schema/
│   │   ├── create_staging_tables.sql
│   │   ├── create_dimensions.sql
│   │   └── create_fact_table.sql
│   │
│   ├── analytics/
│   │   ├── business_kpis.sql
│   │   └── window_functions.sql
│   │
│   └── transformations/
│
├── README.md
└── requirements.txt
```

---

# Dataset

Dataset used:

* Superstore Retail Dataset

---

# Future Enhancements

## Data Engineering

* Apache Airflow orchestration
* Incremental ETL pipelines
* Automated scheduling

## Cloud & Warehousing

* Snowflake integration
* AWS S3 ingestion
* Cloud warehouse deployment

## Analytics Engineering

* dbt transformations
* Materialized views
* Query optimization

## DevOps

* Docker containerization
* CI/CD pipelines

---

# Skills Demonstrated

## SQL & Warehousing

* Data Warehousing
* Star Schema Modeling
* Fact & Dimension Design
* Advanced SQL Analytics
* Window Functions
* KPI Engineering

## Data Engineering

* ETL Pipelines
* Data Cleaning
* PostgreSQL
* Data Transformation

## Business Intelligence

* Power BI
* DAX
* Dashboard Development
* Semantic Modeling

---

# Author

**Tanishq Jadhav**
