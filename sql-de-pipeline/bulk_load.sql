TRUNCATE TABLE customer_staging;

-- Run the following COPY command separately after creating customers.csv.
-- Replace the path with the absolute path to your CSV file.
-- CSV columns: customer_id,customer_name,city,email

-- COPY customer_staging (customer_id, customer_name, city, email)
-- FROM 'C:/path/to/customers.csv'
-- WITH (FORMAT CSV, HEADER TRUE);
