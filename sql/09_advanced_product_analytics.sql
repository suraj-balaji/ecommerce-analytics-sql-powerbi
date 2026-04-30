USE ecommerce_analytics;

-- Top Products by Revenue

-- Purpose: Highest revenue products

SELECT 
	p.product_category_name,
	COUNT(*) AS items_sold,
	ROUND(SUM(oi.price),2) AS revenue
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- Top Products by Avg Price

-- Purpose: Highest Aeg price products

SELECT 
	p.product_category_name,
	COUNT(*) AS items_Sold,
	ROUND(AVG(oi.price),2) AS avg_price
FROM order_items oi
JOIN products p 
	ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY avg_price DESC 
LIMIT 10;


-- Monthly Product Ranking
-- Purpose: Highest product on months

WITH product_data AS (
				       SELECT 
					       	o.order_year,
					       	o.order_month,
							p.product_category_name,
							ROUND(SUM(oi.price),2) AS revenue,
							RANK() OVER(
										PARTITION BY o.order_year, o.order_month
														ORDER BY SUM(oi.price) DESC) AS rnk
							FROM orders O 
							JOIN order_items oi
								ON o.order_id = oi.order_id
							JOIN products p
								ON oi.product_id = p.product_id
							GROUP BY o.order_year,
						 			 o.order_month,
						 			 p.product_category_name
					)
SELECT *
FROM product_data 
WHERE rnk <= 3;
						 
