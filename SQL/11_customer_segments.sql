DROP VIEW IF EXISTS vw_customer_segments;

CREATE VIEW vw_customer_segments AS

SELECT
    *,
    CASE

        WHEN recency_score >= 4
         AND frequency_score >= 4
         AND monetary_score >= 4
            THEN 'Champions'

        WHEN frequency_score >= 4
         AND monetary_score >= 4
            THEN 'Loyal Customers'

        WHEN recency_score >= 4
         AND frequency_score >= 3
            THEN 'Potential Loyalists'

        WHEN recency_score <= 2
         AND frequency_score >= 3
            THEN 'At Risk'

        ELSE 'Others'

    END AS customer_segment

FROM vw_rfm_segmentation;