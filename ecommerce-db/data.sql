
INSERT INTO customers (customer_name, email, city) VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Bengaluru'),
('Priya Kumar', 'priya@gmail.com', 'Mysuru'),
('Amit Verma', 'amit@gmail.com', 'Chennai'),
('Sneha Reddy', 'sneha@gmail.com', 'Hyderabad'),
('Kiran Rao', 'kiran@gmail.com', 'Bengaluru');

INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 55000, 10),
('Smartphone', 'Electronics', 25000, 20),
('Headphones', 'Accessories', 2000, 50),
('Office Chair', 'Furniture', 7000, 15),
('Keyboard', 'Accessories', 1500, 30),
('Monitor', 'Electronics', 12000, 12);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-10-01', 'Delivered'),
(2, '2026-10-02', 'Delivered'),
(1, '2026-10-05', 'Pending'),
(3, '2026-10-07', 'Shipped'),
(4, '2026-10-10', 'Delivered'),
(5, '2026-10-12', 'Cancelled');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 55000),
(1, 3, 2, 2000),
(2, 2, 1, 25000),
(3, 5, 2, 1500),
(4, 4, 1, 7000),
(5, 6, 2, 12000),
(6, 3, 1, 2000);
