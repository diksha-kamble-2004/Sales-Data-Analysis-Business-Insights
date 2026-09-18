create database Retail_Sales_db;

use Retail_Sales_db;


select * from global_superstore_cleaned;

select `Order ID`, `Customer Name`, Category, Sales 
from global_superstore_cleaned;

-- Q1.Which orders belong to the Technology category?

select `Order ID`
from global_superstore_cleaned
where Category = 'Technology';

-- Q2.Which Technology orders had sales greater than 500?

select `Order ID`, Sales
from global_superstore_cleaned
where Category = 'Technology' and sales>500;


-- Q3.What are the top 10 highest-value orders?

select `Order ID`
from global_superstore_cleaned
order by `Order ID` desc
limit 10;

-- Q4.Which product category generates the highest total sales?

select * from global_superstore_cleaned;
select Category, sum(Sales) as Highest_Total_Sales
from global_superstore_cleaned
group by Category;

-- Q5.Which regions generate the highest total sales, and how do they compare with each other??

select region, sum(sales) as Total_Sales
from global_superstore_cleaned
group by region
order by Total_Sales desc;


-- Q6. Who are the top 10 customers by total sales?

select `Customer Name`, sum(Sales) AS Total_Sales
from global_superstore_cleaned
group by  `Customer Name`
order by Total_Sales Desc
limit 10;

select * from global_superstore_cleaned;
-- Q7.Which customer segment generates the highest average order value?

select segment, sum(Sales) / count(distinct `Order ID`) as Avg_Order_Values   -- COUNT(DISTINCT Order ID) → number of unique orders
from global_superstore_cleaned
group by segment
order by Avg_Order_Values desc;

-- Q8. Which sub-categories generate the highest sales within each category?

select `sub-category`, sum(Sales) as highest_sales_each_Cat
from global_superstore_cleaned
group by `sub-category`
order by highest_sales_each_Cat desc;

-- Q9.Which shipping mode is most preferred, and which category is most frequently purchased through it?
select * from global_superstore_cleaned;

select `Ship Mode`, count(Category) as frequently_purchased
from global_superstore_cleaned
group by `Ship Mode`, category
order by frequently_purchased desc;


-- Q10.Which region, customer segment, product category, and shipping mode combination should the company prioritize to maximize sales?

select region, segment, category, `ship mode`, sum(Sales) as Highest_Sales
from global_superstore_cleaned
group by region, segment,category, `ship mode`
order by Highest_Sales desc;

-- Observation: The West region has the highest total sales for the Consumer 
-- segment in the Furniture category using Standard Class shipping, with total sales of 3,809.

-- Business Insight
-- Insight: This combination appears to be the strongest sales-performing combination among 
-- the Region, Segment, Category, and Shipping Mode combinations analyzed.

-- Recommendation
-- Recommendation: The company should focus more marketing and promotional efforts on Consumer 
-- customers purchasing Furniture in the West region. It can also maintain sufficient Furniture inventory 
-- and continue supporting Standard Class shipping for this customer group.

-- Advance part Business_Problems

-- 11.Management wants to identify the customers generating the highest total sales so they can understand their most valuable customers.

SELECT `Customer Name`,SUM(Sales) AS Total_Sales
FROM global_superstore_cleaned
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC;

-- 12.Management wants to identify customers who have placed more than 5 orders.

select`Customer Name`, count(distinct `Order ID`) as Number_of_Orders
from global_superstore_cleaned
group by `Customer Name`
order by Number_of_Orders desc;

-- 13.Which sub-categories generate the highest total sales, and how many orders do they receive?

select `Sub-Category`, sum(Sales) as Total_Sales, count(distinct `Order ID`) as Number_of_Orders
from global_superstore_cleaned
group by `Sub-Category`
order by Total_Sales desc;

-- 14.Management wants to identify which sub-categories generate sales above the average sales of all sub-categories?

select `Sub-Category`, sum(Sales) as Total_Sales
from global_superstore_cleaned
group by `Sub-Category`
having sum(Sales) > (
    select avg(Total_Sales)
    from (
        select sum(Sales) as Total_Sales
        from global_superstore_cleaned
        group by `Sub-Category`
    ) as subcategory_sales
)
order by Total_Sales desc;

-- 15. Management wants to identify which states generate sales above the average sales across all states?

select State, sum(Sales) as Total_Sales
from global_superstore_cleaned
group by State
having sum(Sales) > (
    select avg(Total_Sales)
    from (
        select sum(Sales) as Total_Sales
        from global_superstore_cleaned
        group by State
    ) as state_sales
)
order by Total_Sales desc;

-- 16.Management wants to understand how much each product category contributes to the company's overall sales?

select Category, sum(Sales) as Total_Sales,
round(sum(Sales) / (select sum(Sales) from global_superstore_cleaned) * 100, 2) as Sales_Contribution
from global_superstore_cleaned
group by Category
order by Sales_Contribution desc;

-- 17.Management wants to understand how monthly sales are changing over time and identify months where sales increased or decreased compared with the previous month?

with monthly_sales as (
    select date_format(`Order Date`, '%Y-%m') as Month, sum(Sales) as Monthly_Sales
    from global_superstore_cleaned
    group by date_format(`Order Date`, '%Y-%m')
)
select Month, Monthly_Sales,
lag(Monthly_Sales) over (order by Month) as Previous_Month_Sales,
Monthly_Sales - lag(Monthly_Sales) over (order by Month) as Sales_Change
from monthly_sales
order by Month;

-- 18. Management wants to rank sub-categories based on their total sales within each product category?
with subcategory_sales as (
    select Category, `Sub-Category`, sum(Sales) as Total_Sales
    from global_superstore_cleaned
    group by Category, `Sub-Category`
)
select Category, `Sub-Category`, Total_Sales,
rank() over (partition by Category order by Total_Sales desc) as Sales_Rank
from subcategory_sales
order by Category, Sales_Rank;

-- 19.Management wants to identify the top 3 customers by total sales within each region?
with customer_sales as (
    select Region, `Customer Name`, sum(Sales) as Total_Sales
    from global_superstore_cleaned
    group by Region, `Customer Name`
),
ranked_customers as (
    select Region, `Customer Name`, Total_Sales,
    rank() over (partition by Region order by Total_Sales desc) as Customer_Rank
    from customer_sales
)
select Region, `Customer Name`, Total_Sales, Customer_Rank
from ranked_customers
where Customer_Rank <= 3
order by Region, Customer_Rank;

-- 20.Management wants to identify customers whose total sales are higher than the average customer sales within their respective region?
with customer_sales as (
    select Region, `Customer Name`, sum(Sales) as Total_Sales
    from global_superstore_cleaned
    group by Region, `Customer Name`
),
regional_average as (
    select Region, avg(Total_Sales) as Regional_Average_Sales
    from customer_sales
    group by Region
)
select c.Region, c.`Customer Name`, c.Total_Sales, r.Regional_Average_Sales
from customer_sales c
join regional_average r
on c.Region = r.Region
where c.Total_Sales > r.Regional_Average_Sales
order by c.Region, c.Total_Sales desc;

-- Final SQL Business Case Study — Global Superstore

-- Management Scenario :
-- Management wants to understand the company's sales performance and identify the areas 
-- that should receive attention for future business planning.

-- Overall Performance
-- 1.What is the overall sales and order performance of the business?
select sum(Sales) as Total_Sales, count(distinct `Order ID`) as Total_Orders
from global_superstore_cleaned;

-- Regional Performance
-- 2.How does sales and order volume vary across different regions?
select Region, sum(Sales) as Total_Sales, count(distinct `Order ID`) as Total_Orders
from global_superstore_cleaned
group by Region
order by Total_Sales desc;

-- Product Performance
-- 3.Which product categories and sub-categories generate the highest sales?
select Category, `Sub-Category`, sum(Sales) as Total_Sales, count(distinct `Order ID`) as Total_Orders
from global_superstore_cleaned
group by Category, `Sub-Category`
order by Total_Sales desc;

-- Customer Performance
-- 4.Which customers generate the most sales, and which regions do they belong to?
select Region, `Customer Name`, sum(Sales) as Total_Sales, count(distinct `Order ID`) as Total_Orders
from global_superstore_cleaned
group by Region, `Customer Name`
order by Total_Sales desc;

-- Time Performance
-- 5.How do monthly sales change over time, and which months show the highest and lowest sales?
select date_format(`Order Date`, '%Y-%m') as Month, sum(Sales) as Monthly_Sales, count(distinct `Order ID`) as Total_Orders
from global_superstore_cleaned
group by date_format(`Order Date`, '%Y-%m')
order by Month;