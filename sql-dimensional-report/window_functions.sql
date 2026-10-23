
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', d.full_date)::DATE AS sales_month,
        SUM(f.revenue) AS monthly_revenue
    FROM fact_sales f
    JOIN dim_date d ON f.date_key = d.date_key
    GROUP BY DATE_TRUNC('month', d.full_date)
),
sales_comparison AS (
    SELECT
        sales_month,
        monthly_revenue,
        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    TO_CHAR(sales_month, 'YYYY-MM') AS month,
    monthly_revenue,
    previous_month_revenue,
    ROUND(
        (monthly_revenue - previous_month_revenue)
        * 100.0 / NULLIF(previous_month_revenue, 0),
        2
    ) AS mom_growth_percentage
FROM sales_comparison
ORDER BY sales_month;