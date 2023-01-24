use Swiggy
select * from food
select * from menu
select * from order_details
select * from orders
select * from restaurants
select * from users
--Looking For Who have Never Ordered Food--
select name from users where user_id NOT IN(select user_id from orders)

--Lookimg for Avearge Price of Food
select f_name, AVG(price) as 'Average_Price' from menu JOIN food on menu.f_id = food.f_id group by f_name;

---Looking Order Placed in july Month

select *,Month(date) as Month from orders where MONTH(date) LIKE '7';
select r_id,count(*) as 'Order Placed' from orders where month(date) like '7' group by r_id order by count(*) desc;

--Looking orders Placed in july Month along with Restaurant Name--
select r_name,count(*) as 'Orders_Placed' from orders join restaurants on orders.r_id=restaurants.r_id 
where month(date) like '7' group by r_name order by count(*) desc

--Looking for Revenue of Hotel---
select r_name,sum(amount) as 'Revenue' from orders join restaurants on orders.r_id=restaurants.r_id 
group by r_name order by sum(amount)desc;

---Looking for Revenue of Hotel Greater than 2000---
select r_name,sum(amount) as 'Revenue' from orders join restaurants on orders.r_id=restaurants.r_id
 group by r_name having sum(amount)>2000  order by sum(amount) desc

 ---Looking for Revenue of Hotel in july Greater than 1000---
 select r_name,sum(amount) as 'Revenue' from orders join restaurants on orders.r_id=restaurants.r_id
where MONTH(date) Like '7' group by r_name having sum(amount)>1000 order by sum(amount) desc

---Looking for all details of perticular customer---
select * from orders  inner join restaurants on orders.r_id=restaurants.r_id 
where user_id =(select user_id from users where name like 'Neha') 

select user_id,r_name,cuisine,type,f_name,amount,rating,date from orders join restaurants on orders.r_id=restaurants.r_id join order_details on order_details.order_id = orders.order_id
join food on food.f_id = order_details.f_id
where user_id =(select user_id from users where name like 'Neha')

----Restaurants with Loyal Customers Numbers---
select r_name,count(*) as 'Loyal Customers' from (select r_id,user_id,count(*) as 'Visited' from orders group by r_id,user_id
having count(*) >1) as h join restaurants on h.r_id =  restaurants.r_id 
group by h.r_id,r_name order by [Loyal Customers] desc 

---Revenu Growth of Swiggy by Month---
select MONTH(date) as 'Months',
sum(amount) as 'Total Revenue' from orders
group by  MONTH(date)
order by sum(amount) asc

---Favourite Food of each user---
select user_id,f_id,count(*) as 'Times' from orders join order_details on orders.order_id=order_details.order_id group by user_id,f_id

select r_name,f_name,user_id,count(*) as 'Times' from orders join order_details on orders.order_id=order_details.order_id 
join restaurants on orders.r_id=restaurants.r_id 
join food on food.f_id = order_details.f_id
group by user_id,r_name,f_name

