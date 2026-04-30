USE ecommerce_analytics;

-- RFM ANALYSIS
-- R = Recency → how recent customer purchased
-- F = Frequency → how many orders
-- M = Monetary → how much money spent



-- Purpose: create RFM metrics per customer
SELECT
    c.customer_unique_id,

    -- Recency (days since last purchase)
    DATEDIFF(MAX(o.purchase_dt), MAX(o.purchase_dt)) AS recency_placeholder,

    -- Frequency
    COUNT(DISTINCT o.order_id) AS frequency,

    -- Monetary
    ROUND(SUM(oi.price),2) AS monetary

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id

GROUP BY c.customer_unique_id;

-- getting recency zero for all customers. correct recency calculation on final
-- Purpose: correct recency calculation
--  DATEDIFF(  (
-- 				SELECT MAX(purchase_dt) FROM orders),
 --   		 MAX(o.purchase_dt)
--          ) AS recency 


-- Purpose: Final RFM table
SELECT 
	c.customer_unique_id,
	
	-- Recency: (days since last purchase)
	DATEDIFF(
				(	SELECT 
						MAX(purchase_dt)
			  	 	FROM orders), 
			 	MAX(o.purchase_dt)
			 ) AS recency,
	
	-- Frequency: number of order
	COUNT(DISTINCT o.order_id) AS frequency,
	
	-- Monetary: total spend
	ROUND(SUM(oi.price),2) AS monetary

FROM customers c 
JOIN orders o 
	ON c.customer_id = o.customer_id
JOIN order_items oi 
	ON o.order_id = oi.order_id
	
GROUP BY c.customer_unique_id;



	