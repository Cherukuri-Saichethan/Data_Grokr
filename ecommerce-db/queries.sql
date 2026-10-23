
-- 1. Display all customers
SELECT * FROM customers;

-- 2. Products costing more than 5000
SELECT product_name, price
FROM products
WHERE price > 5000
ORDER BY price DESC;

-- 3. Top 3 most expensive products
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;

-- 4. Count customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 5. Average product price
SELECT AVG(price) AS average_price
FROM products;

-- 6. Number of products in each category
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- 7. Categories with average prices above 5000
SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 5000;

-- 8. Display orders with customer names
SELECT o.order_id, c.customer_name, o.order_date, o.status
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 9. Display all customers and their orders
SELECT c.customer_name, o.order_id, o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 10. Calculate total amount for each order
SELECT order_id, SUM(quantity * unit_price) AS order_total
FROM order_items
GROUP BY order_id
ORDER BY order_total DESC;

-- 11. Calculate total spending by each customer
SELECT c.customer_id, c.customer_name,
       COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_spending
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;

-- 12. Find the top-selling products by quantity
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 13. Classify orders using CASE WHEN
SELECT order_id,
       CASE
           WHEN status = 'Delivered' THEN 'Completed'
           WHEN status = 'Cancelled' THEN 'Unsuccessful'
           ELSE 'In Progress'
       END AS order_category
FROM orders;

-- 14. Convert customer names to uppercase
SELECT UPPER(customer_name) AS customer_name
FROM customers;

-- 15. Find orders placed in October 2026
SELECT *
FROM orders
WHERE order_date >= '2026-10-01'
  AND order_date < '2026-11-01'
ORDER BY order_date;

-- 16. Find products with low stock
SELECT product_name, stock
FROM products
WHERE stock < 20
ORDER BY stock;

-- 17. Count orders by status
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- 18. Find customers whose email is missing
SELECT customer_name, COALESCE(email, 'No email') AS email
FROM customers;

-- 19. Calculate revenue from delivered orders
SELECT COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS delivered_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered';

-- 20. Find customers with more than one order
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;
