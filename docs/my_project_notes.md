Tables imported:
1. customers
2. orders
3. order_items
4. products
5. payments

Source:
Olist Ecommerce Dataset

Database:
ecommerce_analytics

Notes:
Raw CSV imported successfully.

Row count of each tables
customers : 99441
Products : 32951
orders : 99441
order_items : 112650
payments : 103886

Join Structure

customers.customer_id = orders.customer_id

orders.order_id = order_items.order_id

order.items.product_id = products.product_id

orders.order_id = payments.order_id


Schema audit started.
Join validation successful.
No missing customers/products.

Date columns imported as VARCHAR.
Source values valid ISO timestamps.
Creating clean DATETIME columns for analytics.

Issue found: blank date strings in source data.
Handled using NULLIF() + STR_TO_DATE().
Dates cleaned successfully.

Date cleaning completed.
2965 orders missing delivered date.
Delivery duration ranges 0–210 days.
Potential delay outliers exist.

Indexes added for performance.
Late delivered orders: 7,827 (~8.1%).
Delivered orders: 96,476.
Some duplicate indexes detected from reruns.

beauty_health (beleza_saude) → #1 revenue driver  
watches_gifts → high value category  
bed_bath_table → high volume category
Low volume but high margin potential
Good for targeting premium customers
Demand is seasonal


Customer cohort analysis created.
Tracking retention by months since first purchase.
Will be used for retention KPI and LTV modeling.

RFM Insight:
Majority of customers have frequency = 1 → one-time buyers.
Very few repeat customers (max frequency = 16).
High recency values (up to 773 days) indicate many inactive customers.
Business relies heavily on new customer acquisition rather than retention.

Recency Calculation:
Recency is calculated as the difference between the latest purchase date in dataset and customer's last purchase date.
Used CTE to optimize performance instead of repeated subquery.

Observation:
High recency values indicate many inactive customers.
Frequency mostly = 1 confirms low retention.

Key Insights RFM segmentation:
1. Majority of customers fall into Regular / At Risk segments → indicates weak retention.
2. VIP customers are very limited → high-value users are rare but critical.
3. Opportunity to convert “Potential Loyal” into VIP through targeted campaigns.
4. High At Risk population suggests need for re-engagement strategies.

Large Regular + At Risk → many customers are not strongly engaged
Very small VIP (970) → top customers are rare (normal in real business)


Find products that are frequently bought together
Insight:
Same-category pairs were initially dominant, indicating multiple items from same category per order.
After filtering, cross-category relationships revealed stronger business insights for recommendation systems.

Association rules:
| Metric         | Meaning                                           |
| -------------- | ------------------------------------------------- |
| **Support**    | How often A & B occur together                    |
| **Confidence** | If A bought → probability B also bought           |
| **Lift**       | Strength of relationship (independent vs related) |

Exanple:
100 orders total

A appears in 20 orders
B appears in 10 orders
A+B together = 8 orders
So,
Support = 8 / 100 = 0.08
Confidence (A → B) = 8 / 20 = 0.40
Lift = 0.40 / (10/100) = 4.0


Lift Value	Meaning
= 1	No relationship
> 1	Positive association
2–5	Strong
5–10	Very strong
10+	🚨 Rare / suspicious / niche

“Market Basket Analysis revealed limited strong product associations due to sparse co-purchase behavior in the dataset. High lift values observed were driven by low-frequency product combinations rather than consistent purchasing patterns.”



POWER BI:
FINAL Model should look like this:
           dim_customers
                |
                |
dim_products — fact_sales — dim_date
                |
                |
         rfm_segments


📊 Executive Summary
Total revenue reached 13.59M
Customer base: 96K
Repeat rate is low (12.35%) → retention issue

📉 Trend Insight
Revenue peaked in early 2018
Sharp drop at end (possible incomplete data or seasonality)

🛍 Product Insight
Top categories:
beleza_saude
relogios_presentes
Revenue concentrated in few categories

👥 Customer Insight
Majority customers are non-repeat
Indicates low loyalty

⚠️ Business Problem
Low repeat rate
Heavy dependency on new customers

💡 Recommendations
Improve retention campaigns
Loyalty programs
Personalized offers
Cross-sell using MBA insights

