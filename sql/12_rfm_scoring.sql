USE ecommerce_analytics;

-- Purpose: Giving RFM scoring
-- create CTE
WITH max_date AS (
			SELECT MAX(purchase_dt) AS max_dt
			FROM orders
				  ),						-- use seperated cte for better performance, run once, avoid slow run

	rfm_base AS (                              
			SELECT 
				c.customer_unique_id,
				
				DATEDIFF(MAX(m.max_dt), MAX(o.purchase_dt)) AS recency,
						
				COUNT(DISTINCT o.order_id) AS frequency,
				
				ROUND(SUM(oi.price),2) AS monetary
				
			FROM customers c 
			JOIN orders o 
				ON c.customer_id = o.customer_id
			JOIN order_items oi
				ON o.order_id = oi.order_id
			CROSS JOIN max_date m
				
			GROUP BY c.customer_unique_id
					)
-- Purpose: Assign RFM scores (1–5)
					
SELECT 
	customer_unique_id,
	
	recency,
	frequency,
	monetary,
	
	-- Recency score (LOW recency = GOOD)
	NTILE(5) OVER(ORDER BY recency DESC) AS r_score,
	
	-- Frequency score (HIGH = GOOD)
	NTILE(5) OVER(ORDER BY frequency ASC) AS f_score,
	
	-- Monetary score (HIGH = GOOD)
	NTILE(5) OVER(ORDER BY monetary ASC) AS m_score
	
FROM rfm_base;
	
	
	
	
	
	
	
	
	
	