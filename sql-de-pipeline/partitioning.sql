-- 1. View all partitions of the fact_orders table

SELECT
parent.relname AS parent_table,
child.relname AS partition_name
FROM pg_inherits
JOIN pg_class parent ON pg_inherits.inhparent = parent.oid
JOIN pg_class child ON pg_inherits.inhrelid = child.oid
WHERE parent.relname = 'fact_orders'
ORDER BY child.relname;

-- 2. Check how many orders exist in each partition

SELECT
tableoid::regclass AS partition_name,
COUNT(*) AS total_orders
FROM fact_orders
GROUP BY tableoid
ORDER BY partition_name;

-- 3. Calculate revenue by year

SELECT
EXTRACT(YEAR FROM order_date) AS order_year,
SUM(quantity * unit_price) AS total_revenue
FROM fact_orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

-- 4. Check partition pruning using EXPLAIN

EXPLAIN
SELECT *
FROM fact_orders
WHERE order_date >= DATE '2026-01-01'
AND order_date < DATE '2027-01-01';

-- 5. Display the order count for 2026

SELECT COUNT(*) AS orders_in_2026
FROM fact_orders
WHERE order_date >= DATE '2026-01-01'
AND order_date < DATE '2027-01-01';
