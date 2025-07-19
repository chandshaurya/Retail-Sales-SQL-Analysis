# SQL Retail Sales Analysis

# Project Overview
This project focuses on performing a comprehensive retail sales analysis using SQL. The primary goal is to extract meaningful insights from sales data, identify key trends, and answer crucial business questions to support data-driven decision-making in a retail environment. The analysis covers various aspects, from sales performance by category and customer behavior to profitability and time-based trends.

# Features and Analysis
Sales Performance Tracking: Analyze total sales by category, monthly sales trends, and average order values.

Customer Behavior Analysis: Identify unique customers, top customers by sales, and analyze purchasing patterns based on gender and age.

Operational Insights: Determine optimal sales shifts (Morning, Afternoon, Evening) based on order volume.

Profitability Analysis: Calculate gross profit from sales and cost of goods sold (COGS).

Data Cleaning: Identify and handle missing values to ensure data integrity.

Key Business Question Answering: Provide SQL queries to address specific business problems.

# Technologies Used
SQL (MySQL): For database creation, data manipulation, and querying.

# Database Schema
The retail_sales table is the core of this project, storing detailed information about each transaction.

SQL

CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

# Data Cleaning
The initial data cleaning step involves removing any rows with NULL values across any of the columns to ensure the accuracy of the analysis.

SQL

Delete from retail_sales
    where transaction_id is NULL or
          sale_date is NULL or
          sale_time is NULL or
          customer_id is NULL or
          gender is NULL or
          age is NULL or
          category is NULL or
          quantity is NULL or
          price_per_unit is NULL or
          cogs is NULL or
          total_sale is NULL;
# Exploratory Data Analysis (EDA)
Initial exploration of the dataset provided fundamental insights:

Total Unique Customers: Count of distinct customers in the dataset.

Total Sales Transactions: Total number of recorded sales.

Number of Categories: Distinct product categories available.

Category Names: Listing of all unique product categories.

# Key Business Questions & Insights
This project addresses several critical business questions:

1. Sales on a Specific Date: Retrieve all sales records for '2022-11-05'.

2. Category-Specific Sales with Quantity Filter: Identify transactions for 'Clothing' category with quantity greater than or equal to 4 in November 2022.

3. Total Sales by Category: Calculate the aggregate total_sale for each product category.

4. Average Age for Specific Category Purchasers: Find the average age of customers who bought items from the 'Beauty' category.

5. High-Value Transactions: List all transactions where the total_sale exceeds 1000.

6. Transactions by Gender and Category: Determine the number of transactions made by each gender within each category.

7. Monthly Average Sales & Best-Selling Month: Calculate the average sales for each month and identify the best-selling month for each year.

8. Top 5 Customers by Sales: Identify the top 5 customers based on their accumulated total_sale.

9. Unique Customers per Category: Count the number of unique customers who purchased from each product category.

10. Sales by Shift: Categorize sales into 'Morning' (<=12), 'Afternoon' (Between 12 & 17), and 'Evening' (>17) shifts and count orders per shift.

# Data Summary & Key Metrics
1. Total Revenue: Overall sum of total_sale across all transactions.

2. Average Order Value: Average total_sale per transaction.

3. Most Purchased Category: The category with the highest total_sale amount.

4. Customer Retention Analysis: Identify customers with more than one purchase.

5. Profit Calculation: Calculate the profit (total_sale - cogs) for each transaction and the overall total profit.

6. Time Series Trends: Analyze monthly sales trends (total_sale grouped by YYYY-MM).



Data Import: Populate the retail_sales table with your retail sales data. (The SQL provided assumes data will be loaded into this table.)

Run Queries: Execute the SQL queries provided in the project to perform data cleaning, EDA, and answer the business questions.

This project offers a foundational analysis for understanding retail sales data and can be extended with more complex queries and visualization tools for deeper insights.
