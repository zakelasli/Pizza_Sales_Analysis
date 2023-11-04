SELECT * 
FROM [Pizza Sales].dbo.pizza_sales$

-- Total revenue  
Select Sum(total_price) As total_revenue
From [Pizza Sales].dbo.pizza_sales$

-- Avg order value 
SELECT SUM(total_price) / COUNT (DISTINCT order_id) AS AVG_Order_Value
From [Pizza Sales].dbo.pizza_sales$

-- Total pizzas solds
SELECT SUM(quantity) AS Total_pizzas_Solds
From [Pizza Sales].dbo.pizza_sales$

-- Total orders 
SELECT COUNT(DISTINCT order_id) AS Total_pizzas_orders
From [Pizza Sales].dbo.pizza_sales$

-- AVG Pizzas per order 
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS AVG_Pizzas_per_order
FROM [Pizza Sales].dbo.pizza_sales$

-- Daily trend for total orders
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_orders
From pizza_sales$
Group by DATENAME(DW, order_date);


-- daily trend HOURS
SELECT DATEPART(HOUR, order_time) as order_hour, COUNT(DISTINCT order_id) as Total_orders
From pizza_sales$
Group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

-- Percentage of sales by pizza category
SELECT pizza_category,ROUND (SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales$), 2) AS Pizza_by_Category
From pizza_sales$
Group by pizza_category
order by Pizza_by_Category desc

-- Percentage of sales by pizza Size

SELECT pizza_size,ROUND (SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales$), 2) AS Pizza_by_Size
From pizza_sales$
Group by pizza_size
order by Pizza_by_Size desc

-- Total Pizza sales by category

SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sales_by_Category
From [Pizza Sales].dbo.pizza_sales$
Group by pizza_category
Order by Total_Pizza_Sales_by_Category Desc;

-- Top 5 best sellers by pizzas sold
SELECT Top 5 pizza_name, sum(quantity) as Total_pizzas_solds
From pizza_sales$
Group by pizza_name
Order by Total_pizzas_solds Desc;

-- Bottom 5 worst sellers by pizzas total sold
SELECT Top 5 pizza_name, sum(quantity) as Total_pizzas_solds
From pizza_sales$
Group by pizza_name
Order by Total_pizzas_solds Asc;




