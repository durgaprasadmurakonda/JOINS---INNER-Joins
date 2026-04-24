use d12;
show tables;

-- orders,order_id,customer_id,product_name,amount,order_date

create table customers(custmer_id int,c_name varchar(30),city varchar(20));
select*
from customers;

create table orders(order_id int,customer_id int ,
product_name varchar(25),amount int,order_date date);

insert into  customers (custmer_id, c_name, city) values
(1, 'Ravi Teja', 'Hyderabad'),
(2, 'Suresh Babu', 'Vijayawada'),
(3, 'Lakshmi Narayana', 'Guntur'),
(4, 'Durga Prasad', 'Chennai'),
(5, 'Venkatesh Reddy', 'Tirupati'),
(6, 'Moniya', 'Madurai'),
(7, 'Karthik ', 'Coimbatore'),
(8, 'Srinivas Rao', 'Visakhapatnam'),
(9, 'Padma Priya', 'Warangal'),
(10, 'Rajesh Naidu', 'Nellore');


INSERT INTO orders (order_id, customer_id, product_name, amount, order_date) VALUES
(101, 1, 'Mobile Phone', 15000, '2024-01-10'),
(102, 5, 'Laptop', 55000, '2024-01-12'),
(103, 2, 'Television', 25000, '2024-01-15'),
(104, 1, 'Refrigerator', 30000, '2024-01-18'),
(105, 3, 'Mobile Phone', 18000, '2024-01-20'),
(106, 4, 'Air Conditioner', 40000, '2024-01-22'),
(107, 3, 'Washing Machine', 20000, '2024-01-25'),
(108, 5, 'Laptop', 60000, '2024-01-28'),
(109, 6, 'Mobile Phone', 20000, '2024-01-30'),
(110, 6, 'Television', 22000, '2024-02-02');

select *
from orders;

-- 🟡 INTERMEDIATE → ADVANCED INNER JOIN QUESTIONS

-- 1.Get customer names and product names for all orders

select*
from customers c
inner join orders o
on c.custmer_id = o.customer_id;

-- 2. Find customers who placed orders with amount greater than 20000

select*
from customers c
inner join orders o
on c.custmer_id = o.customer_id and amount>20000;

-- 3.Get customer name, city, and product name where city is 'Hyderabad'

select c_name,city,product_name
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where city = 'hyderabad';

-- 4. Find all orders where product name starts with 'S' and amount is greater than 10000

select*
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where product_name like 'S%' and amount > 10000;

-- 5. Get customers who ordered products between amount 10000 and 50000
select*
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where amount between 10000 and 50000;

-- 6.Find customer names who ordered either 'Laptop' or 'Mobile Phone'
select custmer_id,c_name , product_name
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where product_name in ('Laptop' ,'Mobile Phone');

-- 7.Get top 5 highest order amounts with customer names

select c_name ,amount
from customers c
inner join orders o
on c.custmer_id = o.customer_id 
 order by amount desc
limit 5;

-- 8.Skip first 5 highest orders and get next 5 records with customer name and amount

select c_name, amount
from customers c
inner join orders o
on c.custmer_id = o.customer_id 
 order by amount desc
limit 5 offset 5;

-- 9.Find customers whose name starts with 'A' and who placed orders greater than 30000

select*
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where c_name like 'A%' and amount > 30000;

--  🔥 (Advanced)

-- 10. Get customer name, city, product name where
-- : city is 'Vijayawada' OR 'Visakhapatnam'
-- amount > 20000
-- product name contains 'Pro'
-- show only 3 records after skipping first 2 records

select c_name,city,product_name
from customers c
inner join orders o
on c.custmer_id = o.customer_id
where city in ('Vijayawada','Visakhapatnam') and amount >20000 and product_name like '%Pro%'
 order by amount desc limit 3 offset 2 ;





