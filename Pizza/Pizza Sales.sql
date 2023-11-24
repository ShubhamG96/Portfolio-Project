use Pizza
select * from [Pizza Sales]
------------------------------------------------------------------ KPI ----------------------------------------------------------------------------------
Select ROUND(SUM(total_price), 2) AS "Revenue" FROM [Pizza Sales];
select ROUND(SUM(total_price), 2) /  ROUND(COUNT(Distinct order_id),2) as "Average Orders" from [Pizza Sales]
select sum(quantity) as "Total Pizza sold" from [Pizza Sales]
select count(distinct(order_id)) as " Total Order Placed" from [Pizza Sales]
select sum(quantity) /count(distinct order_id) as "Avg Pizzas per Order" from [Pizza Sales]
--------------------------------------------------------------------- Trend ------------------------------------------------------------------------------
select DATENAME(DW,order_date) as "Order day" , count(distinct order_id) as "Total orders"  
	from  [Pizza Sales] 
		group by DATENAME(DW,order_date) 

select DATENAME(Month,order_date) as "Order Month", count(distinct order_id) as "Total orders" from [Pizza Sales]
	group by DATENAME(Month,order_date) 
		order by "Total orders" DESC
------------------------------------------------------------- Percentage of sales by Pizza Category -----------------------------------------------------
select Pizza_category,Round(sum(Total_price),2) as "Total Price",
Cast(sum(total_price) * 100 / (select sum(total_price) from [Pizza Sales]) as decimal(10,2)) as "Sale Percentage"
from [Pizza Sales] group by Pizza_category order by "Sale Percentage" desc
--------------------------------------------------- Percentage of sales by Pizza Size --------------------------------------------------------------------
select pizza_size,Round(sum(Total_price),2) as "Total Price",
Cast(sum(total_price) * 100 / (select sum(total_price) from [Pizza Sales]) as decimal(10,2)) as "Sale Percentage"
from [Pizza Sales] group by pizza_size order by "Sale Percentage" desc

---------------------------------------------------- Pizza by Total Sale ------------------------------------------------------------------
select  pizza_name, round(sum(total_price),2) as "Revenue" from [Pizza Sales] 
group by pizza_name order by "Revenue" desc
---------------------------------------------------- Top 5 Sellers Pizza by Total Sale ------------------------------------------------------------------
select Top 5 pizza_name, round(sum(total_price),2) as "Revenue" from [Pizza Sales] 
group by pizza_name order by "Revenue" desc

--------------------------------------------------- Worst 5 Sellers Pizza by Total Sale -----------------------------------------------------------------
select Top 5 pizza_name, round(sum(total_price),2) as "Revenue" from [Pizza Sales] 
group by pizza_name order by "Revenue" asc

----------------------------------------------------- Pizza Sold by Total Quantity ----------------------------------------------------------------------
select pizza_name, SUM(quantity) as "Total Quantity Sold" from [Pizza Sales]
group by pizza_name order by "Total Quantity Sold" DESC
---------------------------------------------------- Top 5 Pizza Sold by Quantity ----------------------------------------------------------------------
select Top 5 pizza_name,sum(quantity) as "Quantity Sold" from [Pizza Sales] 
group by pizza_name order by "Quantity Sold" desc
---------------------------------------------------- Worst 5 Pizza Sold by Quantity -------------------------------------------------------------------
select Top 5 pizza_name,sum(quantity) as "Quantity Sold" from [Pizza Sales] 
group by pizza_name order by "Quantity Sold" asc
----------------------------------------------------- Pizza by Total Order ----------------------------------------------------------------------------
select pizza_name,count(order_id) As "Order Placed" from [Pizza Sales] 
group by pizza_name order by "Order Placed" desc
---------------------------------------------------- Top 5 Pizza Ordered -----------------------------------------------------------------------------
select Top 5 pizza_name,count(order_id) as "order Placed" from [Pizza Sales]
group by pizza_name order by   "order Placed" desc
---------------------------------------------------- Worst  5 Pizza Ordered --------------------------------------------------------------------------
select Top 5 pizza_name,count(order_id) as "order Placed" from [Pizza Sales]
group by pizza_name order by   "order Placed" asc



