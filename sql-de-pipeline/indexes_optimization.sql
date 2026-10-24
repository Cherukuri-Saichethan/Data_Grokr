CREATE INDEX IF NOT EXISTS idx_orders_customer_date
ON fact_orders (customer_id, order_date);

CREATE INDEX IF NOT EXISTS idx_orders_product_date
ON fact_orders (product_id, order_date);

CREATE INDEX IF NOT EXISTS idx_orders_recent
ON fact_orders (order_date)
WHERE order_date >= DATE '2026-01-01';

ANALYZE fact_orders;

EXPLAIN ANALYZE
SELECT
product_id,
SUM(quantity * unit_price) AS total_revenue
FROM fact_orders
WHERE order_date >= DATE '2026-01-01'
GROUP BY product_id;
