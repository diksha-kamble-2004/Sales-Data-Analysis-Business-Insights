# Global Superstore Sales Analysis

## 📌 Project Overview

This project analyzes Global Superstore sales data to understand business performance across regions, product categories, customers, segments, shipping modes, and time periods.

The project follows an end-to-end data analysis workflow using:

- Python for data cleaning and Exploratory Data Analysis (EDA)
- MySQL for SQL-based business analysis
- Microsoft Excel for analysis, PivotTables, KPIs, and dashboard creation

The main goal is to convert raw sales data into meaningful business insights that can support better decision-making.

---

## 🎯 Business Problem

A retail business generates a large amount of sales data across different regions, customers, products, and time periods.

However, raw data alone does not clearly show:

- Which regions generate the most sales
- Which product categories perform well
- Which customers contribute the most revenue
- How sales change over time
- Which customer segments generate higher sales
- Which shipping modes are most frequently used
- Where the business may have opportunities for improvement

This project analyzes the data to answer these business questions and identify useful patterns.

---

## 🎯 Project Objectives

- Clean and prepare the raw sales dataset
- Perform Exploratory Data Analysis using Python
- Analyze sales performance across different business dimensions
- Use SQL to answer business-oriented questions
- Build Excel PivotTables and KPI summaries
- Create an interactive-style Excel sales dashboard
- Generate actionable business insights and recommendations

---

## 📊 Dataset

The project uses the **Global Superstore** dataset containing information about:

- Orders
- Customers
- Products
- Categories
- Sub-Categories
- Regions
- States
- Customer Segments
- Shipping Modes
- Sales
- Order Dates
- Ship Dates

The cleaned dataset used in the project is available in the `data/` folder.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python | Data cleaning and EDA |
| Pandas | Data manipulation |
| NumPy | Numerical analysis |
| Matplotlib | Data visualization |
| Seaborn | Statistical visualization |
| MySQL | SQL analysis |
| Microsoft Excel | Business analysis and dashboard |
| Jupyter Notebook | Python analysis |
| Git & GitHub | Version control and project sharing |

---

# 🔹 1. Python Exploratory Data Analysis

Python was used to understand the dataset and prepare it for further analysis.

### Data Cleaning

The following preprocessing steps were performed:

- Checked dataset structure and data types
- Identified missing values
- Handled missing Postal Code values
- Removed duplicate records
- Converted Order Date and Ship Date into datetime format
- Checked date formatting consistency
- Verified the cleaned dataset before analysis

### EDA Areas

The analysis covered:

- Region-wise sales
- State-wise sales
- Category-wise sales
- Sub-category-wise sales
- Customer segment sales
- Monthly sales trends
- Segment × Category analysis
- Region × Category analysis
- Shipping mode analysis
- Overall business performance

---

# 🔹 2. SQL Business Analysis

MySQL was used to perform business-oriented analysis on the cleaned dataset.

The SQL analysis includes:

- Overall sales and order analysis
- Region-wise sales performance
- Category and sub-category analysis
- Customer sales analysis
- Order analysis
- Sales contribution by category
- Monthly sales analysis
- Ranking sub-categories within categories
- Top customers within each region
- Customers performing above their regional average

### SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- GROUP BY
- HAVING
- ORDER BY
- COUNT()
- COUNT(DISTINCT)
- SUM()
- AVG()
- CASE WHEN
- Subqueries
- CTEs
- JOINs
- Window Functions
- RANK()
- LAG()

---

# 🔹 3. Excel Analysis

Microsoft Excel was used to perform business analysis and create a management-style dashboard.

### Excel Analysis

The workbook contains:

- Data validation checks
- Regional sales analysis
- Category × Segment analysis
- Monthly sales trend
- KPI summary
- Segment performance
- Category performance
- Sub-category performance
- Region × Category analysis
- Shipping mode analysis
- Region × Segment analysis

### Key KPIs

- Total Sales
- Total Orders
- Total Customers
- Average Order Value

### Excel Features Used

- Excel Tables
- SUMIFS
- COUNTA
- UNIQUE
- PivotTables
- Distinct Count
- PivotCharts
- KPI summaries
- Dashboard design

---

# 📈 Dashboard

The Excel dashboard provides a high-level view of sales performance.

### Dashboard Components

- Total Sales
- Total Orders
- Total Customers
- Average Order Value
- Sales by Region
- Sales by Product Category
- Monthly Sales Trend
- Sales by Customer Segment

---

# 🔍 Key Business Insights

Based on the analysis:

### Regional Performance

- West region generated the highest total sales.
- East region was the second-highest sales-generating region.
- South generated the lowest sales among the four regions.

### Product Performance

- Technology generated the highest sales among the three main categories.
- Furniture and Office Supplies also contributed significantly to overall sales.
- Phones was the highest-selling sub-category by sales.

### Customer Segment

- Consumer generated the highest sales among the three customer segments.
- Corporate and Home Office contributed the remaining share of sales.

### Shipping

- Standard Class was the most frequently used shipping mode.
- It also generated the highest total sales among the shipping modes.

### Regional Category Performance

- Technology was the highest-sales category in East, South, and West.
- Furniture generated the highest category sales in Central.

---

# 💡 Business Recommendations

Based on the observed sales patterns:

1. Focus on high-performing regions while identifying opportunities in lower-performing regions.

2. Continue analyzing Technology products because of their strong contribution to total sales.

3. Investigate high-performing sub-categories such as Phones to understand the factors driving their sales.

4. Analyze lower-performing categories and regions to identify possible improvement opportunities.

5. Maintain efficient Standard Class shipping operations while monitoring customer preferences across other shipping modes.

6. Monitor monthly sales trends to identify periods of higher and lower demand.

---

# 📁 Project Structure

```text
global-superstore-sales-analysis/
│
├── README.md
│
├── data/
│   └── global_superstore_cleaned.csv
│
├── python/
│   └── Global_Superstore_EDA.ipynb
│
├── sql/
│   └── Retail_Sales_SQL.sql
│
├── excel/
│   └── Global_Superstore_Analysis.xlsx
│
└── screenshots/
    ├── python_eda.png
    ├── sql_analysis.png
    └── excel_dashboard.png