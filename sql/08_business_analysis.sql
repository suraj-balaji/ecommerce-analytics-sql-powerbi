USE ecommerce_analytics;


-- Monthly Revenue
-- Purpose: Monthly revenue trend using CTE

WITH monthly_sales AS (
		SELECT 
			order_year,
			order_month,
			ROUND(SUM(pay.payment_value),2) AS revenue
		FROM orders AS o
		JOIN payments AS pay
			ON o.order_id = pay.order_id
		GROUP BY order_year,
				 order_month
		)
SELECT *
FROM monthly_sales
ORDER BY order_year,
		 order_month;

-- Top Customers Rank

-- Purpose: Rank highest revenue customers

SELECT *
FROM (
      SELECT
			c.customer_unique_id,
			ROUND(SUM(pay.payment_value),2) AS revenue,
			RANK() OVER(ORDER BY SUM(pay.payment_value) DESC) AS customer_rank
	  FROM customers AS c
	  JOIN orders AS o
	  		ON c.customer_id = o.customer_id
	  JOIN payments AS pay 
	   		ON o.order_id = pay.order_id
	  GROUP BY c.customer_unique_id
	 ) x
WHERE customer_rank <= 10;
			

-- Repeat Customer Rate

-- Purpose: Customers with more than 1 order

SELECT COUNT(*) AS repeated_customer
FROM (
		SELECT 
			c.customer_unique_id,
			COUNT(DISTINCT o.order_id) AS total_orders
		FROM customers c 
		JOIN orders o 
			ON c.customer_id = o.customer_id
		GROUP BY customer_unique_id
		HAVING COUNT(DISTINCT o.order_id) > 1
	) x
;
		
-- Late Orders by Month
-- Purpose: Monthly late shipment counts

SELECT 
	order_year,
	order_month,
	COUNT(*) AS late_orders
FROM orders
WHERE is_late = 1
GROUP BY order_year,
		 order_month
ORDER BY late_orders DESC ;
