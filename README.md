# 📊 E-Commerce Analytics (SQL + Power BI)

## 1. Business Problem

E-commerce businesses generate massive volumes of transactional data, but without proper analysis it becomes difficult to:

* Understand customer behavior
* Improve customer retention
* Identify high-performing products
* Detect revenue trends
* Increase repeat purchases
* Optimize cross-selling opportunities

The company required a centralized analytics solution to transform raw transaction data into actionable business insights for decision-making.

---

# 2. Project Objective

The objective of this project was to perform end-to-end e-commerce analytics using SQL and Power BI to:

* Analyze sales performance
* Segment customers using RFM analysis
* Measure customer retention using cohort analysis
* Identify product and category performance
* Discover product associations using Market Basket Analysis
* Build interactive dashboards for business stakeholders

The project simulates a real-world analytics workflow used by e-commerce and retail companies.

---

# 3. Dataset Overview

The dataset contains transactional e-commerce data including:

* Customers
* Orders
* Order Items
* Products
* Payments
  
## Data & Files Note

- Full dataset is not uploaded due to size constraints
- A sample dataset is provided for reference
- Power BI (.pbix) file is not included due to size limits
- Dashboard screenshots are available in the images folder
- Full project files can be shared upon request
---
## 📂 Project Structure

```
E-commerce-analysis-project/
│
├── sql/
│   ├── 01_setup.sql
│   ├── 03_data_audit.sql
│   ├── ...
│   ├── 14_market_basket_analysis.sql
│   ├── 15_association_rules.sql
│
├── data/
│   ├── raw_data/
│   ├── clean_data/
│   ├── output/
│
├── powerbi/
│   ├── ecommerce_dashboard.pbix
│
├── docs/
│   ├── insights_and_recommendations.txt
│   ├── manager_summary.txt
│
|__ images/
|   |__ screenshots.png
|
|
└── README.md
```
---
### Key Business Areas Covered:

* Revenue Analysis
* Customer Behavior
* Retention Analysis
* Product Analytics
* Cross-Selling Opportunities

### Example Columns:

* Order ID
* Customer ID
* Purchase Date
* Product Category
* Price
* Payment Value
* Delivery Dates

---

# 4. Tools & Technologies

| Tool        | Purpose                            |
| ----------- | ---------------------------------- |
| SQL (MySQL) | Data cleaning & transformation     |
| DBeaver     | SQL execution & data validation    |
| Power BI    | Dashboard creation & visualization |
| CSV         | Data export & sample datasets      |

### SQL Concepts Used:

* Joins
* CTEs
* Window Functions
* Aggregations
* Date Functions
* Cohort Analysis
* RFM Analysis
* Market Basket Analysis
* Indexing
* Derived Columns

---

# 5. Data Cleaning Process

The dataset was cleaned and transformed using SQL before loading into Power BI.

### Cleaning & Validation Steps:

* Checked duplicate records
* Validated relationships between tables
* Verified null values
* Standardized date formats
* Converted VARCHAR date columns into DATE format
* Validated foreign key mappings
* Created derived analytical columns

### Derived Columns Created:

* Purchase Date
* Delivery Days
* Late Delivery Flag
* Cohort Month
* Month Number
* RFM Scores

### Performance Optimization:

* Added indexes for faster query execution
* Created fact and dimension tables for reporting

---

# 6. KPI Definitions

| KPI                       | Definition                                  |
| ------------------------- | ------------------------------------------- |
| Total Revenue             | Total sales generated                       |
| Total Orders              | Number of orders placed                     |
| Total Customers           | Unique customers                            |
| Average Order Value (AOV) | Revenue per order                           |
| Repeat Rate               | Percentage of repeat customers              |
| Retention Rate            | Percentage of returning customers over time |
| RFM Score                 | Customer behavior scoring model             |
| Lift                      | Strength of product association             |

---

# 7. Dashboard Overview

The Power BI dashboard was designed to provide insights for management, marketing, and operations teams.

---

## 📊 Executive Dashboard

Provides high-level business performance metrics:

* Revenue
* Orders
* Customers
* AOV
* Revenue trends
* Category performance
</br>
<img width="597" height="335" alt="01_Executive_dashboard" src="https://github.com/user-attachments/assets/bf703865-c2f7-4ea7-bd99-816cb1396a54" />

---

## 👥 Customer Analysis (RFM)

Analyzes customer behavior using:

* Recency
* Frequency
* Monetary value

### Customer Segments:

* VIP
* Loyal
* Regular
* At Risk
* Lost
</br>
<img width="595" height="337" alt="02_cutomer_analysis" src="https://github.com/user-attachments/assets/ca3f23c7-5827-4cbc-9350-4fa516b34349" />
---

## 🔁 Cohort Retention Analysis

Tracks customer retention over time using cohort-based analysis.

### Metrics Included:

* Month-wise retention
* Customer drop-off trends
* Retention heatmap
</br>
<img width="596" height="338" alt="03_cohort_analysis" src="https://github.com/user-attachments/assets/951922fe-7e90-4642-8ac9-8615bad7283d" />
---

## 📦 Product Analysis

Analyzes:

* Top-performing categories
* Revenue contribution
* Pricing trends
* Product performance
</br>
<img width="596" height="340" alt="04_product_analysis" src="https://github.com/user-attachments/assets/11419454-602f-484d-ad6a-a12abfd972bb" />

---

## 🧺 Market Basket Analysis

Identifies product associations using:

* Support
* Confidence
* Lift

### Business Goal:

Improve cross-selling and recommendation strategies.
</br>
<img width="596" height="335" alt="05_market_basket" src="https://github.com/user-attachments/assets/4c4194ac-8374-4cf6-a104-b31434b5e87a" />
---

# 8. Key Insights

## 📈 Revenue Insights

* Revenue is concentrated in a few high-performing categories.
* Sales trends showed strong growth periods with seasonal fluctuations.

---

## 👥 Customer Insights

* Majority of customers belong to "At Risk" and "Regular" segments.
* VIP customers contribute disproportionately high revenue despite low volume.
* Repeat purchase behavior is relatively low.

---

## 🔁 Retention Insights

* Customer retention drops sharply after the first purchase month.
* Very few customers return after Month 3.
* Indicates weak long-term customer engagement.

---

## 📦 Product Insights

* Some categories generate high revenue with lower order volume.
* High-priced categories do not always perform well.

---

## 🧺 Market Basket Insights

* Product combinations are highly diverse with low repeat frequency.
* Certain product pairs show strong lift values indicating niche cross-selling opportunities.

---

# 9. Root Cause Analysis

| Issue                       | Possible Cause                       |
| --------------------------- | ------------------------------------ |
| Low customer retention      | Weak post-purchase engagement        |
| High At-Risk customers      | Lack of loyalty strategy             |
| Low repeat purchases        | Limited customer retention campaigns |
| Weak product bundling       | Low cross-selling optimization       |
| Uneven category performance | Demand & pricing imbalance           |

The analysis suggests that customer retention and engagement require major business focus.

---

# 10. Business Recommendations

## 👥 Customer Retention

* Launch loyalty and rewards programs
* Implement personalized email campaigns
* Create post-purchase engagement workflows

---

## 📦 Product Optimization

* Focus on top-performing categories
* Reevaluate low-performing expensive categories
* Improve category-level marketing

---

## 🧺 Cross-Selling Strategy

* Recommend related products using association rules
* Introduce product bundling offers
* Use lift & confidence metrics for recommendations

---

## 📈 Data-Driven Decision Making

* Monitor retention KPIs regularly
* Track RFM movement over time
* Build customer lifecycle analytics

---

# 11. Expected Business Impact

Implementing the recommendations can lead to:

* Improved customer retention
* Higher customer lifetime value
* Increased repeat purchases
* Better cross-selling opportunities
* Revenue growth
* Improved customer engagement

### Long-Term Impact:

* Stronger customer loyalty
* More efficient marketing campaigns
* Better strategic product decisions

---

# 12. Future Improvements

Future enhancements may include:

* Customer Lifetime Value (CLV) prediction
* Sales forecasting
* Real-time dashboard integration
* Customer churn prediction
* Advanced recommendation systems
* Automated marketing segmentation

---


# 👤 Author

Suraj Balaji Bhagaye </br>
bhagayesuraj@gmail.com
</br>
Data Analytics | SQL | Power BI | Business Intelligence
