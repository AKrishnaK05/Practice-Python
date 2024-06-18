create database amazon;
use amazon;
create table customer(
cid int PRIMARY KEY,
cname varchar(25) NOT NULL,
age int(3),
address varchar(50)
);

create table products(
pid int PRIMARY KEY,
pname varchar(25) NOT NULL,
price int NOT NULL,
stock int,
location varchar(30) check(location in ("Mumbai","Delhi"))
);

create table orders(
oid int PRIMARY KEY,
pid int,
cid int NOT NULL,
amt int NOT NULL,
foreign key(cid) references customer(cid),
foreign key(pid) references products(pid)
);

create table payment(
pay_id int(3) primary key,
oid int(3),
amount int(10) not null,
mode varchar(30) check(mode in('upi','credit','debit')),
status varchar(30),
foreign key(oid) references orders(oid)
);

insert into products values(1,'HP Laptop',50000,15,'Mumbai'),(2,'Realme Mobile',20000,30,'Delhi'),(3,'Boat earpods',3000,50,'Delhi'),(4,'Levono Laptop',40000,15,'Mumbai'),(5,'Charger',1000,0,'Mumbai'),(6, 'Mac Book', 78000, 6, 'Delhi'),(7, 'JBL speaker', 6000, 2, 'Delhi');
insert into customer values(101,'Ravi',30,'fdslfjl'),(102,'Rahul',25,'fdslfjl'),(103,'Simran',32,'fdslfjl'),(104,'Purvesh',28,'fdslfjl'),(105,'Sanjana',22,'fdslfjl');
insert into orders values(10001,3,102,2700),(10002,2,104,18000),(10003,5,105,900),(10004,1,101,46000);
insert into payment values(1,10001,2700,'upi','completed'),(2,10002,18000,'credit','completed'),(3,10003,900,'debit','in process');

-- SELECT
-- SELECT with DISTINCT clause
select Distinct cname,address
from customer;

-- SELECT all columns
select * from products;

-- Select by column name
select pid,pname
from products;

-- SELECT with LIKE(%)
select * 
from customer
where cname like "%Ra%";

-- SELECT with CASE
select cid,cname,
case when cid> 102 then 'pass' else 'fail' end as 'Remark'
from customer;

-- SELECT with IF
select cid,cname,
if(cid > 102,'pass','fail')as 'Remark'
from customer;

-- SELECT with LIMIT
select * 
from customer
order by cid
limit 3;

-- SELECT with WHERE
select * 
from customer 
where cname = "Ravi"; 

-- Group By using Having
select cname, Count(*) as Number
from customer
group by cname
having number >=1;

-- Group By using CONCAT
select location, group_concat(distinct pname) as product_name
from products
group by location;

-- Order By
-- Ascending
select pid, pname, price
from products
order by price asc;

-- Descending
select pid,pname,price 
from products
order by pname desc;

-- Having By
select pid,pname,stock
from products
group by pid,pname,stock
having stock <10;

-- Questions
-- Write a query to find the total stock of products for each location.
select location, SUM(stock) as total_stock
from products
group by location;

-- Write a query to retrieve all products ordered by their price in descending order.
select * 
from products
order by price desc;

-- Write a query to find the locations where the total stock of products is greater than 20.
select location, SUM(stock) as total_stock
from products
group by location
having total_stock > 20;

-- String functions
select char_length("Hello, World!");

-- ASCII(str)
select ASCII('A');

-- CONCAT(str1,str2)
select CONCAT('Hello',' ','World');

-- INSTR(str,substr)
select INSTR('Hello, World','o');

-- LCASE(str) or LOWER(str)
select LCASE('HELLO');

-- UCASE(str) or UPPER(str)
select UCASE('hello');

-- SUBSTR(str,start,length)
select SUBSTR('Hello, World!',8,5);

-- LPAD(str,len,padstr)
select LPAD('Hello',10,'*');

-- RPAD(str,len,padstr)
select RPAD('Hello',10,'*');

-- TRIM(str), RTRIM(str), LTRIM(str)
select TRIM('Hello, World!');
SELECT RTRIM('Hello, World!');
SELECT LTRIM('Hello, World!');

-- CURRENT_DATE()
select current_date() as Today;

-- DATEDIFF(date1,date2)
select datediff('2024-04-19','2023-05-20') as day_difference;

-- DATE(expression)
select date('2023-05-01 12:34:56') AS result;

-- CURRENT_TIME()
select current_time() as now;

-- LAST_DAY(date)
select last_day('2023-05-03') as last_day_0f_month;

-- SYSDATE()
select sysdate() as 'Timestamp';

-- ADDDATE()
select adddate('2023-05-01', INTERVAL 7 DAY) as one_week_later;

-- NUMERIC FUNCTIONS
-- AVG(expression)
select avg(price) as avg_price
from products;

-- COUNT(expression)
select count(*) as total_products
from products;

-- POW(base,exponent)
select pow(2,3) as result;

-- MIN(expression)
select min(price) as min_price
from products;

-- MAX(expression)
select max(price) as max_price
from products;

-- ROUND(number,[decimals])
select round(5.2345,3) as result;

-- SQRT(number)
select sqrt(49) as result;

-- Floor(number)
select floor(5.6) as result;