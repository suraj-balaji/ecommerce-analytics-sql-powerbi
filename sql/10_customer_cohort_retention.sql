USE ecommerce_analytics;


-- CUSTOMER COHORT + RETENTION ANALYSIS

-- First Purchase Per Customer
-- Purpose: find first purchase month of each customer

WITH first_purchase AS (
			SELECT
				c.customer_unique_id,
				MIN(o.purchase_dt) AS first_purchase_date
			FROM customers c 
			JOIN orders o
				ON c.customer_id = o.customer_id
			GROUP BY c.customer_unique_id
						)
SELECT *
FROM first_purchase;

-- Purpose: assign cohort month

WITH first_purchase AS (
			SELECT 
				c.customer_unique_id,
				MIN(o.purchase_dt) AS first_purchase_date
			FROM customers c 
			JOIN orders o
				ON c.customer_id = o.customer_id
			GROUP BY c.customer_unique_id
						)
SELECT
	customer_unique_id,
	DATE_FORMAT(first_purchase_date, '%Y-%m') AS cohort_month
FROM first_purchase;


 -- Retention Table
 -- Purpose: cohort retention

WITH first_purchase AS (
				SELECT 
					c.customer_unique_id,
					MIN(o.purchase_dt) AS first_purchase_date
				FROM customers c 
				JOIN orders o
					ON c.customer_id = o.customer_id
				GROUP BY c.customer_unique_id
						),
	 customer_order AS (
	 			SELECT 
	 				c.customer_unique_id,
	 				o.purchase_dt
	 			FROM customers c 
	 			JOIN orders o
	 				ON c.customer_id = o.customer_id
	 					)
SELECT 
	DATE_FORMAT(fp.first_purchase_date, '%Y-%m') AS cohort_month,
	TIMESTAMPDIFF(MONTH, fp.first_purchase_date, co.purchase_dt) AS month_number,
	COUNT(DISTINCT co.customer_unique_id) AS active_customer 
FROM first_purchase fp
JOIN customer_order co
	ON fp.customer_unique_id = co.customer_unique_id 
GROUP BY cohort_month,
		 month_number
ORDER BY cohort_month,
		 month_number;




