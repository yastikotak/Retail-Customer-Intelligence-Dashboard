-- ==========================================
-- Executive KPI Dashboard
-- ==========================================

DROP VIEW IF EXISTS vw_executive_kpis;

CREATE VIEW vw_executive_kpis AS

SELECT

    COUNT(DISTINCT customer_key) AS total_customers,

    COUNT(DISTINCT invoiceno) AS total_orders,

    COUNT(*) AS total_transactions,

    SUM(quantity) AS total_units_sold,

    ROUND(SUM(revenue),2) AS total_revenue,

    ROUND(AVG(revenue),2) AS average_transaction_value,

    ROUND(
        SUM(revenue) /
        COUNT(DISTINCT invoiceno),
        2
    ) AS average_order_value,

    ROUND(
        SUM(revenue) /
        COUNT(DISTINCT customer_key),
        2
    ) AS revenue_per_customer

FROM fact_sales;