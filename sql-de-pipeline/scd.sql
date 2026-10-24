CREATE TABLE IF NOT EXISTS dim_customer_history (
customer_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
customer_id INT NOT NULL,
customer_name VARCHAR(100) NOT NULL,
city VARCHAR(100),
valid_from DATE NOT NULL,
valid_to DATE,
is_current BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO dim_customer_history
(customer_id, customer_name, city, valid_from, valid_to, is_current)
VALUES
(1, 'Rahul Sharma', 'Bengaluru', '2025-01-01', NULL, TRUE),
(2, 'Priya Kumar', 'Mysuru', '2025-01-01', NULL, TRUE);

BEGIN;

UPDATE dim_customer_history
SET valid_to = CURRENT_DATE,
is_current = FALSE
WHERE customer_id = 1
AND is_current = TRUE;

INSERT INTO dim_customer_history
(customer_id, customer_name, city, valid_from, valid_to, is_current)
VALUES
(1, 'Rahul Sharma', 'Hyderabad', CURRENT_DATE, NULL, TRUE);

COMMIT;
