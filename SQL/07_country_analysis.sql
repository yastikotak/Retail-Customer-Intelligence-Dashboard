-- ==========================================
-- Country-wise Sales Analysis
-- ==========================================

DROP VIEW IF EXISTS vw_country_sales;

CREATE VIEW vw_country_sales AS

SELECT

    c.country,

    SUM(f.revenue) AS total_revenue,

    SUM(f.quantity) AS total_units_sold,

    COUNT(DISTINCT f.invoiceno) AS total_orders,

    COUNT(DISTINCT f.customer_key) AS unique_customers,

    ROUND(
        SUM(f.revenue) /
        COUNT(DISTINCT f.invoiceno),
        2
    ) AS average_order_value

FROM fact_sales f

JOIN dim_country c
ON f.country_key = c.country_key

GROUP BY

    c.country

ORDER BY

    total_revenue DESC;