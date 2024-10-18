use pizzadb;
select * from pizza_sales;

-- Total Revenue KPI
select sum(total_price) as Total_Revenue from pizza_sales;



-- Average Order values KPI
select * from pizza_sales;
select sum(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales;



-- Total Pizza Sold KPI;
select * from pizza_sales;
-- select count(pizza_id) as Total_Pizza_Sold from pizza_sales;
select sum(quantity) as Total_Pizza_sold from pizza_sales;



-- Total Orders placed KPI
select count(distinct order_id) as Total_Orders_Placed from pizza_sales;



-- Average Pizza per Order KPI
SELECT 
    SUM(quantity) / COUNT(DISTINCT order_id) AS Average_Pizza_per_Order
FROM
    pizza_sales;


    
-- Daily Trend for Total Orders - Bar Chat
describe pizza_sales;
select order_date from pizza_sales;
UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y')
WHERE STR_TO_DATE(order_date, '%d-%m-%Y') IS NOT NULL;
ALTER TABLE pizza_sales
MODIFY COLUMN order_date DATE;
select dayname(order_date) as order_day, count(distinct order_id) as Daily_Total_Orders from pizza_sales
group by dayname(order_date);



-- Monthly Trend for Total Orders
select monthname(order_date) as Month_Name, count(distinct order_id) as Monthly_Total_Orders from pizza_sales
group by monthname(order_date);

-- % of Sales by Pizza Category
select * from pizza_sales;
select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT_Pizza_category 
from pizza_sales
group by pizza_category;



-- Percentage of Sales by Pizza Size
select pizza_size, sum(total_price) as Total_Sales, sum(total_price)*100 / (select sum(total_price) from pizza_sales) as PCT_Pizza_Size
from pizza_sales
group by pizza_size;



-- Top 5 Best sellers by Revenue,Total Quantity and Total Orders.
select pizza_name, sum(total_price) as Top_5_Sellers_Revenue from pizza_sales
group by pizza_name
order by Top_5_Sellers_Revenue desc limit 5;

select pizza_name, sum(quantity) as Top_5_Sellers_Quantity from pizza_sales
group by pizza_name
order by Top_5_Sellers_Quantity desc limit 5;

select pizza_name, count(distinct order_id) as Top_5_Sellers_Orders from pizza_sales
group by pizza_name
order by Top_5_Sellers_Orders desc limit 5;


-- Bottom 5 Best seller by Revenue, Total Quanttiy and Total Orders.
select pizza_name, sum(total_price) as Bottom_5_Sellers_Revenue from pizza_sales
group by pizza_name
order by Bottom_5_Sellers_Revenue asc limit 5;

select pizza_name, sum(quantity) as Bottom_5_Sellers_Quantity from pizza_sales
group by pizza_name
order by Bottom_5_Sellers_Quantity asc limit 5;

select pizza_name, count(distinct order_id) as Bottom_5_Sellers_Orders from pizza_sales
group by pizza_name
order by Bottom_5_Sellers_Orders asc limit 5;
commit;