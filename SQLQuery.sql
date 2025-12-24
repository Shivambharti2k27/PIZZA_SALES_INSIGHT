SELECT * FROM pizza_sales


--Total Revenue:
SELECT SUM(total_price) as Total_Revenue from pizza_sales


--Average Order Value
SELECT SUM(total_price)/ COUNT( DISTINCT order_id) as Avg_order_value from pizza_sales


-- Total Pizzas Sold
SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD FROM pizza_sales


-- Total Orders
SELECT COUNT(DISTINCT order_id) as Total_orders from pizza_sales


-- Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) as decimal(10,2))/ CAST(COUNT(DISTINCT order_id) as decimal(10,2)) AS DECIMAL(10,2)) 
as Average_pizzas_per_order from pizza_sales



--Daily Trend for Total Orders.
SELECT DATENAME(DW,order_date) as day , COUNT(DISTINCT order_id) as Total_orders 
from pizza_sales
group by DATENAME(DW,order_date)
order by Total_orders DESC


-- Monthly Trend for Orders.
SELECT DATENAME(MONTH,order_date) as month ,COUNT(DISTINCT order_id)as Total_orders
from pizza_sales
group by DATENAME(MONTH,order_date)
order by Total_orders Desc

-- % of Sales by Pizza Category
SELECT pizza_category ,sum(total_price) as total_sales,sum(total_price)*100/ (select sum(total_price)  from pizza_sales)as PCT
from pizza_sales
GROUP BY pizza_category


-- % of Sales by Pizza Category Of January
SELECT pizza_category ,sum(total_price) as total_sales,sum(total_price)*100/ (select sum(total_price)  from pizza_sales)as PCT
from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category


-- % of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) as total_revenue,
SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_size
order by pizza_size


 --Total Pizzas Sold by Pizza Category
 select pizza_category,sum(quantity)as pizza_sold from pizza_sales
 group by pizza_category
 order by pizza_sold DESC

 --Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC





--Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC



 --Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

--Top 5 Pizzas of classic category by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC
