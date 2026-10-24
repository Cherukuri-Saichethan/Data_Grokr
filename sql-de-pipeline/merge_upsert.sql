INSERT INTO customer_staging
(customer_id, customer_name, city, email)
VALUES
(1, 'Rahul Sharma', 'Bengaluru', '[rahul.new@gmail.com](mailto:rahul.new@gmail.com)'),
(4, 'Sneha Reddy', 'Hyderabad', '[sneha@gmail.com](mailto:sneha@gmail.com)'),
(5, 'Kiran Rao', 'Pune', '[kiran@gmail.com](mailto:kiran@gmail.com)');

MERGE INTO dim_customer AS target
USING customer_staging AS source
ON target.customer_id = source.customer_id
WHEN MATCHED THEN
UPDATE SET
customer_name = source.customer_name,
city = source.city,
email = source.email,
updated_at = CURRENT_TIMESTAMP
WHEN NOT MATCHED THEN
INSERT (customer_id, customer_name, city, email)
VALUES (
source.customer_id,
source.customer_name,
source.city,
source.email
);
