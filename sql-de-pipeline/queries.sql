SELECT
c.customer_name,
COUNT(*) AS total_orders,
SUM(o.quantity * o.unit_price) AS total_spend
FROM fact_orders o
JOIN dim_customer c ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spend DESC;

SELECT
p.product_name,
SUM(o.quantity) AS units_sold,
SUM(o.quantity * o.unit_price) AS total_revenue
FROM fact_orders o
JOIN dim_product p ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

SELECT
order_date,
SUM(quantity * unit_price) AS daily_revenue
FROM fact_orders
GROUP BY order_date
ORDER BY order_date;
