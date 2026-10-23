
-- 1. Calculate revenue by product
SELECT
    p.product_name,
    p.category,
    SUM(f.quantity) AS units_sold,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC;

-- 2. Rank products by revenue
SELECT
    product_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM (
    SELECT
        p.product_name,
        SUM(f.revenue) AS total_revenue
    FROM fact_sales f
    JOIN dim_product p ON f.product_key = p.product_key
    GROUP BY p.product_name
) sales;

-- 3. Dense rank products by revenue
SELECT
    product_name,
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS dense_rank
FROM (
    SELECT
        p.product_name,
        SUM(f.revenue) AS total_revenue
    FROM fact_sales f
    JOIN dim_product p ON f.product_key = p.product_key
    GROUP BY p.product_name
) sales;

-- 4. Find the top three products
WITH product_sales AS (
    SELECT
        p.product_name,
        SUM(f.revenue) AS total_revenue
    FROM fact_sales f
    JOIN dim_product p ON f.product_key = p.product_key
    GROUP BY p.product_name
),
ranked_products AS (
    SELECT
        product_name,
        total_revenue,
        DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS sales_rank
    FROM product_sales
)
SELECT *
FROM ranked_products
WHERE sales_rank <= 3
ORDER BY sales_rank;