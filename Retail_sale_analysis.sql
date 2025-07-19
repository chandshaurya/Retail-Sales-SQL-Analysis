-- SQL Retail Sales Analysis - P1

CREATE DATABASE sql_project1;
use sql_project1;

-- Create TABLE

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
            
 select * from retail_sales limit 25;
 
SELECT 
    COUNT(*) 
FROM retail_sales;

-- Data Cleaning 
-- there is null values in my dataset , i have to remove .

Delete from retail_sales 
   where transaction_id is NULL or
         sale_date is NULL or	 
		 sale_time is NULL or
		 customer_id is NULL or
		 gender is NULL or 
		 age is NULL or
		 category is NULL or
		 quantity is NULL or
		 price_per_unit is NULL  or
		 cogs is NULL or
		 total_sale  is NULL ;
         
select * from retail_sales;


-- DATA EXPLORATION

-- How many uniuque customers we have ?

select count(distinct customer_id) as total_no_of_customers from retail_sales; 

-- How many sales we have?

select count(*) as total_no_of_sales from retail_sales;

-- How many category we have?

select count(distinct category) from retail_sales;

-- Name of the category 

select distinct category from retail_sales;






-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

select * 
from retail_sales 
where  sale_date = '2022-11-05' ;

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select * 
from retail_sales
where category = 'Clothing' and  quantity >= 4 and  TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select  category, sum(total_sale)
from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select Round(avg(age),2)  as average_age
from retail_sales 
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * 
from retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select category,gender, count(*) as total_transaction
from retail_sales
group by category, gender
order by 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select year , month , average_sale 
from (
  select Year(sale_date) as year , 
       Month(sale_date) as month , 
       avg(total_sale) as average_sale,
       Rank() over(partition by year(sale_date) order by avg(total_sale) Desc) as ranks
  from retail_sales
  group by year ,month ) as t1
where ranks = 1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id , sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select category , count(distinct customer_id) as unique_customers
from retail_sales
group by category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale as 
(
 select * ,
 case 
    when hour(sale_time) < 12 then 'Morning'
    when  hour(sale_time) between 12 and 17 then 'Afternoon'
    else 'Eveninig'
 End as shift
 from retail_sales )
 
 select shift , count(*) as orders
 from hourly_sale
 group by shift;
 
 
 -- DATA SUMMARY 
 
 -- 1. Total revenue
 
 select sum(total_sale) as revenue
 from retail_sales;
 
 -- 2. Average order values
 
 SELECT Round(AVG(total_sale),2) AS avg_order_value 
 FROM retail_sales;
 
 -- 3. Most purchased Category
 
 select category, sum(total_sale) as Total_sale_amount
 from retail_sales
 group by category
 order by  Total_sale_amount desc 
 limit 1;
 
 -- Customer Retention analysis
 
 SELECT customer_id, COUNT(*) AS num_purchases
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Profit Calculation

select * , total_sale - cogs as profit
from retail_sales;

select Round(sum(total_sale - cogs),2) as profit 
from retail_sales;

-- Time series trends

SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, 
       SUM(total_sale) AS monthly_sales
FROM retail_sales
GROUP BY month
ORDER BY month;

 
 -- end of project1