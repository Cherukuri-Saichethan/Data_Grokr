# E-commerce Database Management System

## Overview

A PostgreSQL-based database project for managing e-commerce customers, products, orders, and order items. It demonstrates SQL queries for analyzing product sales, customer spending, revenue, and order trends.

## Technologies

* PostgreSQL
* SQL
* Visual Studio Code

## Project Structure

```text
ecommerce-db/
├── schema.sql
├── data.sql
├── queries.sql
└── README.md
```

## Database Tables

* **customers:** Customer details and contact information.
* **products:** Product names, categories, prices, and stock.
* **orders:** Customer orders, dates, and statuses.
* **order_items:** Products, quantities, and prices associated with orders.

## SQL Concepts Covered

* SELECT, WHERE, ORDER BY, LIMIT, and aliases
* NULL handling with COALESCE
* COUNT, SUM, AVG, GROUP BY, and HAVING
* INNER JOIN and LEFT JOIN
* CASE WHEN and string functions
* Date filtering and revenue analysis
* Primary keys, foreign keys, and constraints

## How to Run

1. Install PostgreSQL.

2. Create the database:

   ```sql
   CREATE DATABASE ecommerce_db;
   ```

3. Connect to the database:

   ```text
   \c ecommerce_db
   ```

4. Execute the SQL files in this order:

   ```text
   \i 'C:/path/to/ecommerce-db/schema.sql'
   \i 'C:/path/to/ecommerce-db/data.sql'
   \i 'C:/path/to/ecommerce-db/queries.sql'
   ```

   Replace `C:/path/to/ecommerce-db/` with your actual project directory.

## Analysis

The SQL queries analyze customer spending, top-selling products, order status, product categories, and revenue from delivered orders.

## Learning Outcomes

* Database design and relationships
* Writing SQL queries
* Aggregating and analyzing data
* Using joins and constraints
* Generating business insights from relational data
