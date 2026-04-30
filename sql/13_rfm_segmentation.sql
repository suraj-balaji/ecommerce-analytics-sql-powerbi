USE ecommerce_analytics;

-- RFM SEGMENTATION

-- Purpose: to counting the customer segments. create seperated table for above query.
-- create rfm_segment teble.
CREATE TABLE rfm_segments AS 

-- Purpose: Assign customer segments based on RFM scores

WITH max_date AS (
			SELECT MAX(purchase_dt) AS max_dt
			FROM orders
				  ),                 -- create CTE for better performance and avoid slow query run
				  
	 rfm_base AS  (
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
					),
					
	 rfm_scored AS (
			SELECT 
				customer_unique_id,
	
				recency,
				frequency,
				monetary,
	
				-- Recency score (LOW recency = GOOD) (5 -> 1)
				NTILE(5) OVER(ORDER BY recency DESC) AS r_score,
	
				-- Frequency score (HIGH = GOOD) 
				NTILE(5) OVER(ORDER BY frequency ASC) AS f_score,
	
				-- Monetary score (HIGH = GOOD)
				NTILE(5) OVER(ORDER BY monetary ASC) AS m_score
	
			FROM rfm_base
					)
					
 SELECT 
	customer_unique_id,
	recency,
	frequency,
	monetary,
	r_score,
	f_score,
	m_score,
	
	-- assign customer segments based on rfm_scored
	CASE 
	-- recency score low and frequency and monetary high are VIP customers.
		-- Scoring logic:
				-- Recency	: DESC (lower recency = better → score 5)
				-- Frequency: ASC (higher frequency = better → score 5)
				-- Monetary	: ASC (higher spend = better → score 5)
		
		WHEN r_score >= 4 AND f_score >= 4 AND m_score >=4 THEN 'VIP'
		
		WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal'                   -- ignores monetary
		
		WHEN r_score <= 2 AND f_score >= 3 THEN 'AT Risk'                 -- “At Risk” = recoverable customers
		
		WHEN r_score  = 1 AND f_score <= 2 THEN 'Lost'                    -- “Lost” = worst of worst
		
		ELSE 'Regular'
	END AS customer_segment
	
FROM rfm_scored;




-- Purpose : customers by customer Segments 

SELECT
	customer_segment,
	COUNT(*) AS customers
FROM rfm_segments
GROUP BY customer_segment;


-- Purpose: Create Index for rfm_segments
CREATE INDEX idx_rfm_customer ON rfm_segments(customer_unique_id);
	