INSERT INTO dim_customer (customer_id, customer_name, city, email)
VALUES
(1, 'Rahul Sharma', 'Bengaluru', '[rahul@gmail.com](mailto:rahul@gmail.com)'),
(2, 'Priya Kumar', 'Mysuru', '[priya@gmail.com](mailto:priya@gmail.com)'),
(3, 'Amit Verma', 'Chennai', '[amit@gmail.com](mailto:amit@gmail.com)')
ON CONFLICT (customer_id) DO NOTHING;

INSERT INTO dim_product (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Headphones', 'Accessories', 3000),
(103, 'Monitor', 'Electronics', 15000)
ON CONFLICT (product_id) DO NOTHING;

INSERT INTO fact_orders
(customer_id, product_id, order_date, quantity, unit_price)
VALUES
(1, 101, '2025-02-10', 1, 60000),
(2, 102, '2025-03-15', 2, 3000),
(1, 103, '2025-05-20', 2, 15000),
(3, 101, '2026-01-12', 1, 60000),
(2, 103, '2026-04-18', 1, 15000);

