**E-Commerce Furniture Dataset 2024: Sales Analysis & Prediction**

---
**Project Overview**
---
This project focuses on analyzing an E-commerce furniture dataset (2024) comprising 2000 products scraped from AliExpress. The primary aim is to understand product pricing dynamics, discount patterns, and sales performance. Additionally, the project builds insights using Excel, Python, SQL and Power BI.

---
**Objective**
---
To predict the number of furniture items sold using available product attributes.
However, a major portion of the analysis began with the data cleanining due to large missing values, followed by exploratory analysis and dashboard development.

---
**Dataset Overview**
---
Columns:
    -	product_title
    -	original_price
    -	price
    -	sold
	-	tag_text
This dataset provides insights into consumer buying patters and market trendswithin online furniture retail.

---
**Challenges Indentified**
---
Over 1516 missing values were found in the original_price column. Only ~484 entries had complete information, which was insuffucient for Machine Learning modeling or meaningful statistcal analysis.
Machine learning algorithms require more complete data, using only 484 rows would reduce accuracy and reliability.

---
**Data Cleaning & Preparation**
---

To resolve missing values:

Approach
-	Predicted missing original_price values using Multiple Linear Regression (MLR)
-	Dependent variable: original_price
-	Independent variables: price, sold, tag_text
-	MLR method was selected because:
	Traditional ML models were not suitable due to small available training data.
	MLR provides stable, interpretable outputs suitable for numeric imputation.

Outcome
-	All 1516 missing values were successfully predicted.
-	The dataset became complete and analysis-ready.
-	Each stage of;
	    Missing value identification
	    MLR modeling
	    Value prediction
	    Result validation
	was documented in separate sheets within one Excel file for transparency and reproducibility.
    
---
**QL Analysis**
---

SQL queries were written to analyze:
-	Sales distribution
-	Price ranges
-   Shipping mode breakdown
-	Revenue distribution patterns

This enabled verification of trends before modeling or visualization.

---
**Power BI Dashboard**
---

An interactive dashboard was built using DAX measures.
-	Top 10 contributors to total sales.
-	Top 10 best-selling products.

---
**Key Insights**
---

-	Free Shipping products generated ~2 million in total revenue.
-	94% of all products offer Free Shipping, and 6% have additional shipping costs.
-	The average discount across all products is 53.28%
-	Significant dependence on discounted pricing for sales conversions.

---
**Conclusion**
---

This project successfully demonstrates:
-	End-to-end data cleaning, imputation, analysis and visualization.
-	Practical use of MLR to solve missing-value problems in real-world datasets.
-	Integration of Python + SQL + Power BI for a complete project workflow.
-	Clear insights into pricing strategy, discounting and shipping impact on sales.

The cleaned dataset, dashboards, SQL queries, Python notebooks and Top 10 products CSV are organized for easy reference and reproducibility.


🔗 Connect With Me

👉 LinkedIn: [www.linkedin.com/in/ponnaluri-sravan-kumar-b06567339](https://www.linkedin.com/in/ponnaluri-sravan-kumar-b06567339/)

