-- ==========================================
-- Monthly Revenue Trend View
-- ==========================================

DROP VIEW IF EXISTS vw_monthly_revenue;

CREATE VIEW vw_monthly_revenue AS

SELECT

    d.year,
    d.month,
    d.month_name,

    SUM(f.revenue) AS total_revenue,

    SUM(f.quantity) AS total_units_sold,

    COUNT(DISTINCT f.invoiceno) AS total_orders

FROM fact_sales f

JOIN dim_date d
ON f.date_key = d.date_key

GROUP BY

    d.year,
    d.month,
    d.month_name

ORDER BY

    d.year,
    d.month;