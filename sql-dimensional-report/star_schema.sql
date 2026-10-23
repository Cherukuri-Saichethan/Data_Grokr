
DROP TABLE IF EXISTS fact_sales CASCADE;
DROP TABLE IF EXISTS dim_date CASCADE;
DROP TABLE IF EXISTS dim_customer CASCADE;
DROP TABLE IF EXISTS dim_product CASCADE;

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(15) NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT UNIQUE NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id INT UNIQUE NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    current_price NUMERIC(10,2) NOT NULL
);

CREATE TABLE fact_sales (
    sales_key SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    date_key INT REFERENCES dim_date(date_key),
    customer_key INT REFERENCES dim_customer(customer_key),
    product_key INT REFERENCES dim_product(product_key),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    revenue NUMERIC(12,2) NOT NULL
);