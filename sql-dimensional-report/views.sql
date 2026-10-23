CREATE OR REPLACE VIEW product_revenue AS
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category;

CREATE OR REPLACE VIEW monthly_revenue AS
SELECT
    DATE_TRUNC('month', o.order_date)::DATE AS month,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY DATE_TRUNC('month', o.order_date)::DATE;