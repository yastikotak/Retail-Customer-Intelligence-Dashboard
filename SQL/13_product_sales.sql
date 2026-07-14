-- ==========================================
-- Product Sales Analysis View
-- ==========================================

DROP VIEW IF EXISTS vw_product_sales;

CREATE VIEW vw_product_sales AS

SELECT

    p.product_key,
    p.stockcode,
    p.description,

    SUM(f.revenue) AS total_revenue,

    SUM(f.quantity) AS total_units_sold,

    COUNT(DISTINCT f.invoiceno) AS total_orders

FROM fact_sales f

JOIN dim_product p
ON f.product_key = p.product_key

WHERE

    f.iscancelled = FALSE
    AND f.isreturn = FALSE

    AND p.description IS NOT NULL
    AND TRIM(p.description) <> ''

    AND LOWER(TRIM(p.description)) NOT IN (

        '?',
        'check',
        'damages',
        'dotcom postage',
        'postage',
        'manual',
        'adjustment',
        'bank charges',
        'samples'

    )

GROUP BY

    p.product_key,
    p.stockcode,
    p.description

ORDER BY

    total_revenue DESC;