WITH monthly_sales AS (
    SELECT
        d.year,
        d.month,
        d.month_name,
        SUM(f.revenue) AS revenue
    FROM fact_sales f
    JOIN dim_date d ON f.date_key = d.date_key
    GROUP BY d.year, d.month, d.month_name
),
monthly_growth AS (
    SELECT
        year,
        month,
        month_name,
        revenue,
        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_revenue
    FROM monthly_sales
)
SELECT
    year,
    month,
    month_name,
    revenue,
    previous_revenue,
    ROUND(
        (revenue - previous_revenue) * 100.0
        / NULLIF(previous_revenue, 0),
        2
    ) AS mom_growth_percentage
FROM monthly_growth
ORDER BY year, month;