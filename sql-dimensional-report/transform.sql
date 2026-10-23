
INSERT INTO dim_date (
    date_key, full_date, day, month, month_name, quarter, year
)
SELECT DISTINCT
    TO_CHAR(d, 'YYYYMMDD')::INT,
    d,
    EXTRACT(DAY FROM d)::INT,
    EXTRACT(MONTH FROM d)::INT,
    TO_CHAR(d, 'FMMonth'),
    EXTRACT(QUARTER FROM d)::INT,
    EXTRACT(YEAR FROM d)::INT
FROM (
    SELECT order_date AS d FROM orders
) dates
ON CONFLICT (date_key) DO NOTHING;

INSERT INTO dim_customer (
    customer_id, customer_name, city
)
SELECT customer_id, customer_name, city
FROM customers
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO dim_product (
    product_id, product_name, category, current_price
)
SELECT product_id, product_name, category, price
FROM products
ON CONFLICT (product_id) DO NOTHING;

INSERT INTO fact_sales (
    order_id, date_key, customer_key, product_key,
    quantity, unit_price, revenue
)
SELECT
    o.order_id,
    TO_CHAR(o.order_date, 'YYYYMMDD')::INT,
    dc.customer_key,
    dp.product_key,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN dim_customer dc ON o.customer_id = dc.customer_id
JOIN dim_product dp ON oi.product_id = dp.product_id
WHERE o.status = 'Delivered'
AND NOT EXISTS (
    SELECT 1
    FROM fact_sales fs
    WHERE fs.order_id = o.order_id
      AND fs.product_key = dp.product_key
);
