-- ==========================================
-- Customer Lifetime Value (CLV)
-- ==========================================

DROP VIEW IF EXISTS vw_customer_lifetime_value;

CREATE VIEW vw_customer_lifetime_value AS

SELECT

    dc.customer_key,

    dc.customerid,

    dc.first_order_date,

    dc.last_order_date,

    dc.total_orders,

    COUNT(DISTINCT f.invoiceno) AS completed_orders,

    SUM(f.revenue) AS lifetime_revenue,

    SUM(f.quantity) AS lifetime_units,

    ROUND(AVG(f.revenue),2) AS average_transaction_value,

    ROUND(
        SUM(f.revenue) /
        COUNT(DISTINCT f.invoiceno),
        2
    ) AS average_order_value

FROM dim_customer dc

JOIN fact_sales f
ON dc.customer_key = f.customer_key

GROUP BY

    dc.customer_key,
    dc.customerid,
    dc.first_order_date,
    dc.last_order_date,
    dc.total_orders

ORDER BY

    lifetime_revenue DESC;