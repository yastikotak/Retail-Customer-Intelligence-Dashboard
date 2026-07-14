-- ==========================================
-- RFM Segmentation
-- ==========================================

DROP VIEW IF EXISTS vw_rfm_segmentation;

CREATE VIEW vw_rfm_segmentation AS

WITH customer_rfm AS
(
    SELECT

        dc.customer_key,

        dc.customerid,

        MAX(dd.full_date) AS last_purchase_date,

        (
            SELECT MAX(full_date)
            FROM dim_date
        ) - MAX(dd.full_date) AS recency,

        COUNT(DISTINCT f.invoiceno) AS frequency,

        SUM(f.revenue) AS monetary

    FROM fact_sales f

    JOIN dim_customer dc
        ON f.customer_key = dc.customer_key

    JOIN dim_date dd
        ON f.date_key = dd.date_key

    GROUP BY
        dc.customer_key,
        dc.customerid
)

SELECT

    *,

    NTILE(5) OVER (ORDER BY recency DESC) AS recency_score,

    NTILE(5) OVER (ORDER BY frequency) AS frequency_score,

    NTILE(5) OVER (ORDER BY monetary) AS monetary_score

FROM customer_rfm;