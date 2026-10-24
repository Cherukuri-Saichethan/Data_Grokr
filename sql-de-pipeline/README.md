# SQL DE Pipeline

## Overview

A PostgreSQL-based data engineering project demonstrating incremental dimension updates, range partitioning, bulk loading, indexing, query optimization, and historical dimension tracking.

## Technologies

* PostgreSQL
* SQL
* Git and GitHub

## Features

* MERGE-based customer dimension updates
* Range-partitioned fact table
* COPY-based CSV bulk-loading template
* Composite and partial indexes
* EXPLAIN ANALYZE query profiling
* ACID transaction example
* Slowly Changing Dimensions (SCD Type 1 and Type 2)
* E-commerce sales reporting

## Project Files

* `schema.sql` — tables and range partitions
* `data.sql` — sample data
* `merge_upsert.sql` — insert/update dimension pipeline
* `partitioning.sql` — partitioning examples
* `bulk_load.sql` — CSV bulk-loading template
* `indexes_optimization.sql` — indexes and query plan
* `scd.sql` — historical customer tracking
* `queries.sql` — business reports

## Setup

1. Install PostgreSQL.
2. Create a database named `sql_de_pipeline`.
3. Connect to the database.
4. Run `schema.sql`, followed by `data.sql`.
5. Run the remaining scripts individually as needed.

Example database creation:

```sql
CREATE DATABASE sql_de_pipeline;
```

Execute SQL files in PostgreSQL using `psql`'s `\i` command.

## Learning Outcomes

* Relational data modeling
* Incremental data processing
* Table partitioning
* Bulk data loading
* Query optimization
* Transaction management
* Historical dimension tracking

## Author

Cherukuri Sai Chethan
