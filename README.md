# 📊 Superstore Sales Analytics — Advanced SQL Joins & KPI Dashboard
### Data Analytics & Business Intelligence — Task 2
**Maincrafts Technology Company Internship | June 2026**

---

## 🧑‍💼 About This Project

This project is the second case study completed as part of the **Data Analytics & Business Intelligence Internship at Maincrafts Technology Company**. Building on Task 1, this task moves into relational data analysis — working with multiple related datasets, SQL JOIN operations, calculated business KPIs, and a structured management dashboard.

**Intern:** Roshan Kumar S  
**College:** Guru Nanak College, Chennai — BSc Data Analytics (Batch 2024–27)  
**Internship:** Maincrafts Technology Company  
**Task:** Task 2 — Advanced Data Analysis, SQL Joins & Business KPI Dashboard  
**Period:** June 2026  

---

## 🎯 Project Objective

To combine the **Orders** and **Customers** datasets using SQL JOIN operations, calculate key business KPIs, and analyse 9,994 Superstore sales transactions across four U.S. regions, three product categories, and 793 unique customers (FY 2014–2017) — delivering a structured BI dashboard and a data-driven business summary report for management.

---

## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|------|---------|
| **MySQL Workbench** | Relational JOINs and KPI extraction |
| **Microsoft Excel** | Pivot tables, calculated columns, comparative analysis |
| **Power BI Desktop** | KPI-based interactive dashboard |
| **Kaggle** | Dataset source |

---

## 📁 Project Structure

```
Maincrafts_Task2_Roshan_Kumar/
│
├── README.md                                          # Project overview (this file)
├── Customers.xlsx                                      # Customers table (Customer_ID, Name, Region, Segment)
├── Orders.xlsx                                         # Orders table (Order_ID, Date, Sales, Profit, Discount)
├── Orders_Customers.xlsx                               # Joined dataset + Pivot Table KPI analysis
├── Queries.sql                                         # SQL JOIN & KPI queries — MySQL Workbench
├── Task2_Business_Summary_Report_Roshan_Kumar.pdf      # Full business summary report
├── Superstore_KPI_Dashboard_Roshan_Kumar.pbix          # Power BI KPI dashboard
└── Dashboard_Screenshot.png                            # Dashboard preview image
```

---

## 📊 Dataset

- **Source:** Kaggle Superstore Sales Dataset
- **Structure:** Two related tables — **Orders** (Order_ID, Order_Date, Customer_ID, Product_Category, Sales, Quantity, Profit, Discount) and **Customers** (Customer_ID, Customer_Name, Region, Segment) — combined via SQL JOIN on `Customer_ID`
- **Records:** 9,994 transactions across 793 unique customers
- **Period:** January 2014 – December 2017

---

## 🗄️ Part A — SQL Analysis (MySQL)

Combined the Orders and Customers tables using an **INNER JOIN** on `Customer_ID`, then calculated KPIs directly in SQL:

```sql
-- Combine Orders and Customers
SELECT
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    o.Product_Category,
    o.Sales,
    o.Profit
FROM Orders o
INNER JOIN Customers c
ON o.Customer_ID = c.Customer_ID;

-- 1. Total Sales by Region
SELECT c.Region, SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region;

-- 2. Profit Margin by Category
SELECT Product_Category,
       SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM Orders
GROUP BY Product_Category;

-- 3. Monthly Sales Trend
SELECT MONTH(Order_Date) AS Month,
       SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY Month
ORDER BY Month;

-- 4. Top 5 Customers by Revenue
SELECT c.Customer_Name,
       SUM(o.Sales) AS Total_Revenue
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;
```

**Output:** `Queries.sql`

---

## 📈 Part B — Excel Advanced Analysis

Built comparative pivot tables and calculated KPI columns on the joined dataset:

**Pivot Tables:**
- Sales by Region and Segment
- Profit by Category and Region
- Monthly Sales Trend
- Top 10 Customers

**Calculated Columns (using IF, SUMIFS, COUNTIFS):**
- `Profit Margin = Profit / Sales`
- `Average Order Value (AOV) = Total Sales / Total Orders`

**Output:** `Orders_Customers.xlsx`

---

## 📉 Part C — Power BI KPI Dashboard

Built a structured, filterable KPI dashboard featuring:

- 📌 **KPI Cards** — Total Sales ($2.30M), Total Profit ($286K), Profit Margin (12.47%), Total Customers (793)
- 📊 **Bar Chart** — Sales by Region (West leads)
- 📈 **Column Chart** — Profit by Category
- 📉 **Line Chart** — Monthly Sales Trend (2014–2017)
- 🥧 **Pie Chart** — Segment Distribution
- 👥 **Table** — Top Customers by Revenue
- 🔽 **Slicers** — Region, Product Category, Date, Customer Segment

**Output:** `Superstore_KPI_Dashboard_Roshan_Kumar.pbix`

![Dashboard Preview](Dashboard_Screenshot.png)

---

## 📝 Part D — Business Summary Report

A professional 3-page business summary report covering:

- ✅ Which region generates the highest revenue?
- ✅ Which category has the highest profit margin?
- ✅ Are discounts reducing profitability?
- ✅ Which customer segment is most valuable?
- ✅ Is there a seasonal sales trend?
- ✅ KPI overview, regional and category performance, customer analysis
- ✅ 5 strategic recommendations for business growth

**Output:** `Task2_Business_Summary_Report_Roshan_Kumar.pdf`

---

## 🔍 Key Business Findings

| Finding | Insight |
|---------|---------|
| **Best Region** | West — $764,634 (33.3% of total sales) |
| **Worst Region** | South — $402,032 (17.5%) — growth opportunity |
| **Most Profitable Category** | Technology — 17.40% margin ($145,455 profit) |
| **Least Profitable Category** | Furniture — 2.49% margin ($18,451 profit) — urgent review needed |
| **Discount Impact** | Heavily discounted orders swing from +16–47% margin to −40% to −180% losses |
| **Most Valuable Segment** | Consumer — $1,161,401 (50.6% of total sales) |
| **Peak Months** | November ($352,461), December ($325,294), September ($307,650) |
| **Weakest Month** | February — $59,751 |
| **Top Customer** | Sean Miller — $25,043.05 |
| **Overall Profit Margin** | 12.47% |

---

## 📌 KPI Overview

| Metric | Value |
|--------|-------|
| Total Sales | $2,297,201 |
| Total Profit | $286,397 |
| Total Orders | 9,994 |
| Total Unique Customers | 793 |
| Average Order Value (AOV) | $229.86 |
| Overall Profit Margin | 12.47% |

---

## 💡 Top 5 Recommendations

1. **Launch a targeted South region growth plan** — South contributes only 17.5% of revenue and needs focused marketing and customer engagement initiatives
2. **Conduct a Furniture profitability review** — 2.49% margin despite $741,720 in sales signals excessive discounting or high costs
3. **Strengthen planning for seasonal demand peaks** — prepare inventory, staffing, and campaigns ahead of the September–December peak
4. **Establish a key customer retention programme** — Top 10 customers generate $153,811 (6.7% of total revenue)
5. **Develop segment-focused growth strategies** — Corporate (30.7%) and Home Office (18.7%) together represent nearly half of revenue and warrant tailored campaigns

---

## 🏆 Key Learning Outcomes

Through this project I developed hands-on proficiency in:

- Working with relational databases and multiple related datasets
- Performing SQL JOIN operations (INNER JOIN) across Orders and Customers tables
- Calculating business KPIs such as Profit Margin and Average Order Value
- Building comparative pivot table analysis in Excel
- Designing a structured, filterable KPI dashboard in Power BI
- Interpreting multi-dimensional business performance and writing structured recommendations

---

## 📜 Certification

This project was completed as **Task 2** of the **Data Analytics & Business Intelligence Virtual Internship** at **Maincrafts Technology Company**, June 2026.

---

## 🔗 Connect With Me

- **LinkedIn:** [Roshan Kumar S](https://linkedin.com/in/roshankumars)
- **GitHub:** [github.com/roshankumars0205](https://github.com/roshankumars0205)
- **Email:** roshankumars0205@gmail.com

---

*⭐ If you found this project useful, feel free to star the repository!*
