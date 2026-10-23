SELECT
    COALESCE(p.category, 'ALL CATEGORIES') AS category,
    COALESCE(p.product_name, 'ALL PRODUCTS') AS product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY ROLLUP(p.category, p.product_name)
ORDER BY category, product_name;
