-- ==========================================
-- Customer Segment Summary View
-- ==========================================

DROP VIEW IF EXISTS vw_customer_segment_summary;

CREATE VIEW vw_customer_segment_summary AS

SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM vw_customer_segments
GROUP BY customer_segment
ORDER BY total_customers DESC;