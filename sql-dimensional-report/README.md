# E-Commerce SQL Dimensional Report

## Project Overview

This project analyzes e-commerce sales data using PostgreSQL. It demonstrates dimensional modeling, SQL aggregations, window functions, Common Table Expressions (CTEs), and query optimization to generate useful business insights.

## Objectives

* Identify top-performing products by revenue.
* Analyze monthly revenue and month-over-month growth.
* Build a dimensional model for sales analytics.
* Generate category and product revenue summaries.
* Improve query performance using indexes and execution plans.

## Technologies Used

* PostgreSQL
* SQL
* pgAdmin / SQL Shell (psql)
* Git and GitHub

## Project Structure

```text
sql-dimensional-report/
├── schema.sql
├── data.sql
├── queries.sql
├── star_schema.sql
├── transform.sql
├── window_functions.sql
├── cte_mom_report.sql
├── rollup_analysis.sql
├── views.sql
├── optimization.sql
└── README.md
```

## Features

### 1. Database Schema

Creates the tables required to store products, customers, orders, and order items.

### 2. Sales Analysis

Uses aggregation, filtering, grouping, and joins to analyze sales performance.

### 3. Dimensional Modeling

Implements a star-schema approach for analytical reporting.

### 4. Window Functions

Uses `RANK()`, `DENSE_RANK()`, and `LAG()` to rank products and compare monthly revenue.

### 5. Month-over-Month Report

Calculates monthly revenue, previous-month revenue, and percentage growth.

### 6. ROLLUP Analysis

Generates product-level revenue, category subtotals, and the grand total.

### 7. Views

Creates reusable views for monthly and product revenue reports.

### 8. Query Optimization

Uses `EXPLAIN` to inspect query execution plans and indexes to support efficient queries.

## How to Run

1. Install PostgreSQL.

2. Create the database:

   ```sql
   CREATE DATABASE ecommerce_analytics;
   ```

3. Connect to the database:

   ```text
   \c ecommerce_analytics
   ```

4. Execute the SQL files in the following order:

   ```text
   schema.sql
   data.sql
   queries.sql
   star_schema.sql
   transform.sql
   window_functions.sql
   cte_mom_report.sql
   rollup_analysis.sql
   views.sql
   optimization.sql
   ```

5. Run the reports and inspect the results in SQL Shell (psql).

Run each file using the PostgreSQL `\i` command with its full file path.

## Sample Results

* Total delivered revenue: ₹108,000 in the earlier e-commerce database exercise.
* Product revenue rankings identify the top-selling products.
* Monthly reports show revenue changes across 2025.
* ROLLUP reports provide category subtotals and overall revenue.

*Note: The sample results depend on the dataset loaded into the database.*
