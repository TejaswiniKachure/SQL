
-----CREATE TABLE--


--1
create table Salespeople
(
 Snum number primary key,
 Sname varchar2(20),
 City varchar2(20),
 Comm number
 );
 
 select * from Salespeople;
 

 
 insert into salespeople values(1001,'Peel','London',.12);
 insert into salespeople values(1002,'Serres','San Jose',.13);
 insert into salespeople values(1004,'Monika','London',.11);
 insert into salespeople values(1007,'Rifkin','Barcelona',.15);
 insert into salespeople values(1003,'Axelrod','New York',.10);
 insert into salespeople values(1005,'Franc','London',.26); 
 
 --2
Create table Customers
( Cnum number primary key,
  Cname varchar2 (20),
  City varchar2(20),
  Rating number,
  Snum number,
  constraint fk_customers_Snum
  foreign key (Snum) references salespeople(Snum)
) 
select * from customers;
insert into customers values(2001,'Hoffman','London',100,1001);
insert into customers values(2002,'Giovanni','Rome',200,1003);
insert into customers values(2003,'Liu','San Jose',200,1002);
insert into customers values(2004,'Grass','Berlin',300,1002);
insert into customers values(2006,'Clemens','London',100,1001);
insert into customers values(2008,'Cisneros','San Jose',300,1007);
insert into customers values(2007,'Pereira','Rome',100,1004);

select * from customers;

--3
create table orders
(
Onum number primary key,
Amt number(10,2),
Odate date,
Cnum number,
Snum number,
constraint fk_orders_Cnum
foreign key (Cnum) references Customers (Cnum),

constraint fk_orders_Snum
foreign key (Snum) references Salespeople(Snum)
);

select * from orders;

insert into orders values(3001,	 18.69,  to_date ('03-Oct-96 12:30','DD-MON-YY HH24:MI'),	2008,	1007);
insert into orders values(3003,  767.19, to_date ('03-Oct-96 13:45','DD-MON-YY HH24:MI'), 2001,  1001);
insert into orders values(3002,  1900.10,to_date ('03-Oct-96 12:05','DD-MON-YY HH24:MI'), 2007,  1004);
insert into orders values(3005,  5160.45, to_date('03-Oct-96 14:00','DD-MON-YY HH24:MI'), 2003,  1002);
insert into orders values(3006,  1098.16, to_date('03-Oct-96 13:37','DD-MON-YY HH24:MI'), 2008,  1007);
insert into orders values(3009,  1713.23, to_date('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3007,  75.75,  to_date ('04-Oct-96 16:02','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3008,  4723.00, to_date('05-Oct-96 12:07','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3010,  1309.95, to_date('06-Oct-96 13:12','DD-MON-YY HH24:MI'), 2004,  1002);
insert into orders values(3011,  9891.88, to_date('06-Oct-96 13:09','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3012,  3455.78, to_date('04-Oct-96 15:21','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3013,  1245.98, to_date('04-Oct-96 16:32','DD-MON-YY HH24:MI'), 2002,  1003);
insert into orders values(3014,  3721.53, to_date('05-Oct-96 12:45','DD-MON-YY HH24:MI'), 2006,  1001);
insert into orders values(3015,  734.50, to_date('06-Oct-96 13:16','DD-MON-YY HH24:MI'), 2004,  1002);
insert into orders values(3016,  1729.67, to_date('06-Oct-96 13:07','DD-MON-YY HH24:MI'), 2006,  1001);

select * from orders;


--1.	List all customers with a rating of 100.
select * from customers
where rating=100


--2.	Find all records in the Customer table with NULL values in the city column.


   select * from customers
   where city is null;

--3.	Find the largest order taken by each salesperson on each date.

select  snum, trunc(odate) as order_date, max(amt) as largest_order
from orders
group by snum,odate
order by snum,odate
 

--4.	Arrange the Orders table by descending customer number.
 select * from orders
 order by Cnum desc;

--5.	Find which salespeople currently have orders in the Orders table.
    select s.snum,s.sname
    from salespeople s
    inner join orders o
    on s.snum=o.snum

--6.	List names of all customers matched with the salespeople serving them.
     select c.cname,s.sname
     from customers c
     inner join salespeople s
     on c.snum=s.snum 
select * from salespeople
select * from customer
--7.	Find the names and numbers of all salespeople who had more than one customer.

    select s.snum,s.sname
    from salespeople s
    inner join customers c
    on s.snum=c.snum
    group by s.snum,s.sname
    having count(*)>1;


--8.	Count the orders of each of the salespeople and output the results in descending order.
   select s.snum,s.snum,count(o.onum) as count
   from salespeople s
   inner join orders o
   on s.snum=o.snum
   group by s.snum,s.sname
   order by count desc;


--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
    select * from customers
    where (
    select count(*)
    from customers
    where city ='san josh'
    )>0;
   

--10.	Match salespeople to customers according to what city they lived in.
 select s.sname,s.city ,c.city 
 from salespeople s
 inner join customers c
 on s.city= c.city 


select * from salespeople
--11. Find the largest order taken by each salesperson.

1  select snum,max(amt) as max_amount
  from orders
  group by snum;
 
 select * from orders
 --or
 
2 select o.snum,max(amt) as max_amount
 from orders o
 inner join salespeople s
 on o.snum=s.snum
 group by o.snum;
 

--12. Find customers in San Jose who has a rating above 200.          

 select * from customers
 where city ='San Jose'
  and rating > 200;
 

--13. List the names and commissions of all salespeople in London.

select sname,comm 
from salespeople
where city='landon';


--14. List all the orders of salesperson Monika from the Orders table.
   select o.*
   from orders o
   inner join salespeople s
   on o.snum=s.snum
   where s.sname='Monika';
   

--15. Find all customers with orders on October 3.

select * from orders 
select c.*
from customers c
join orders o
on c.cnum = o.cnum
where to_char(o.odate, 'DD-MON') = '03-OCT';

select c.*
from customers c
join orders o
on c.cnum = o.cnum
where to_char(o.odate, 'DD-MONTH') = '03-OCTOBER';

SELECT DISTINCT c.*
FROM customers c
JOIN orders o
ON c.cnum = o.cnum
WHERE TRUNC(o.odate) = DATE '1996-10-03';


--16. Give the sums of the amounts from the orders table, grouped by date, 
      select odate,sum(amt) as total_amt
      from orders
      group by odate;


--17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.

select odate
from orders
group by odate
having sum(amt) >= max(amt) + 2000;
    
       
--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.  ??
 select distinct o1.*
from orders o1
join orders o2
on o1.amt > o2.amt
where trunc(o2.odate) = to_date ('06-Oct-96 12:30','DD-MON-YY HH24:MI');  

 


--19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300. 
select *
from SALESPEOPLE s
where exist (
  select
  from CUSTOMERS c
  where c.snum = s.snum
  and c.rating = 300
);

 


--20. Find all pairs of customers having the same rating. 
select * from customers

select
    c1.cnum,
    c1.cname,
    c1.rating,
    c2.cnum,
    c2.cname,
    c2.rating
from customers c1
join customers c2
on c1.rating = c2.rating
and c1.cnum < c2.cnum;


--21. Find all customers with CNUM, 1000 above the SNUM of Serres.

select *from CUSTOMERS
where cnum > (
  select snum + 1000
  from SALESPEOPLE
  where sname = 'Serres'
);


select c.* 
from customers c
inner join salespeople s
on c.cnum > s.snum +1000
where s.sname='Serres'

select * from salespeople
select * from customers
--22. Give the salespeople’s commissions as percentage instead of decimal numbers.


 select sname,comm*100 as comm_percentage
 from salespeople;
 
 
--23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.

select snum, trunc(odate), max(amt)
from orders
group by snum, trunc(odate)
having max(amt) >= 3000;

--24. List the largest orders on October 3, for each salesperson.


select snum,odate ,max(amt)from orders
where  to_char(odate, 'DD-MON') = '03-OCT'
group by snum,odate

--25. Find all customers located in cities where Serres (SNUM 1002) has customers.

select * from customers 
where city in (select city from salespeople
where snum =1002 )


--26. Select all customers with a rating above 200.00.
select * from customers
where rating >200;

--27. Count the number of salespeople currently listing orders in the Orders table.
SELECT COUNT(DISTINCT SNUM)
FROM ORDERS;

--28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.
       select c.Cname,s.comm    
       from customers c
       inner join salespeople s
       on c.snum=s.snum
       where s.comm > 0.12;


--29. Find salespeople who have multiple customers.

   select s.snum,s.sname
   from salespeople s
   inner join customers c
   on s.snum=c.snum
   group by s.snum,s.sname 
   having count(*)>1;    --multiple hai so we write >1


--30. Find salespeople with customers located in their city.

     select  distinct s.* 
     from salespeople s
     inner join customers c
     on s.snum=c.snum
     and  s.city=c.city 




--31. Find all salespeople whose name starts with ‘P’ and the fourth character is ‘I’.
 select * from salespeople 
 where sname like 'p___I%';
 
--32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
 select * from orders
 where cnum=
 (      
 select cname from customers
 where cname='Cisnersos')




--33. Find the largest orders for ‘Serres’ and ‘Rifkin’.
select s.sname, max(o.amt)
from salespeople s
join orders o
on s.snum = o.snum
where s.sname in ('Serres','Rifkin')
group by s.sname;





--34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.

select snum,sname,comm,city
 from salespeople

--35. Select all customers whose names fall in between ‘A’ and ‘G’ alphabetical range.
   select * from customers
   where cname  between 'A' and 'G';

--36. Select all the possible combinations of customers that you can assign.
select
    c1.cnum ,
    c1.cname,
    c2.cnum,
    c2.cname
from customers c1
join customers c2
on c1.cnum < c2.cnum;



--37. Select all orders that are greater than the average for October 4.
select *
from orders
where amt > (
    select avg(amt)
    from orders
    where trunc(odate) = to_date('4-OCT-96','DD-MON-YY')
);



--38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.

select c1.*
from customers c1
where rating = (
    select max(c2.rating)
    from customers c2
    where c2.city = c1.city
);


--39. Write a query that totals the orders for each day and places the results in descending order.
select
    trunc(odate) as order_date,
    sum(amt) as total_amount
from orders
group by trunc(odate)
order by total_amount desc;


--40. Write a select command that produces the rating followed by the name of each customer in San      
select
    rating,
    cname
from customers
where city = 'San Jose';


--41. Find all orders with amounts smaller than any amount for a customer in San Jose.

select * from orders
where amt < any (
    select amt
    from orders o
    join customers c
    on o.cnum = c.cnum
    where c.city = 'San Jose'
);


--42. Find all orders with above average amounts for their customers.

select * from orders o1
where amt > (
    select avg(o2.amt)
    from orders o2
    where o2.cnum = o1.cnum
);


--43. Write a query that selects the highest rating in each city.

select city, max(rating) as highest_rating
from customers
group by city;


--44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
select
    o.onum,
    c.cname as customer_name,
    s.sname as salesperson_name,
    o.amt,
    s.comm,
    o.amt * s.comm as commission
from orders o
join customers c
    on o.cnum = c.cnum
join salespeople s
    on o.snum = s.snum
where c.rating > 100;


--45. Count the customers with rating above San Jose’s average.
select count(*) as no_customers
from customers
where rating > (
    select avg(rating)
    from customers
    where city = 'San Jose'
);

--46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.

select s1.sname, s2.sname
from salespeople s1, salespeople s2;

--or
select
    s1.snum as salesperson1_no,
    s1.sname as salesperson1_name,
    s2.snum as salesperson2_no,
    s2.sname as salesperson2_name
from salespeople s1
cross join salespeople s2;


--47. Find all salespeople that are located in either Barcelona or London.

select * from salespeople
where city in ('Barcelona', 'London');

--48. Find all salespeople with only one customer.
select s.snum, s.sname
from salespeople s
join  customers c
on s.snum = c.snum
group by s.snum, s.sname
having count(*) = 1;

--or
select
    s.snum,
    s.sname,
    s.city,
    s.comm,
    count(c.cnum) as num_customers
from salespeople s
left join customers c
    on s.snum = c.snum
group by s.snum, s.sname, s.city, s.comm
having count(c.cnum) = 1;


--49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.

select
    c1.cnum, 
    c1.cname, 
    c2.cnum,
    c2.cname,
    c1.snum 
from customers c1
join customers c2
    on c1.snum = c2.snum
   and c1.cnum < c2.cnum;

--50. Write a query that will give you all orders for more than $1000.00.

select *from orders
where amt > 1000;


--51. Write a query that lists each order number followed by the name of the customer who made that order.
select o.onum, c.cname
from orders o
inner join customers c 
on o.cnum = c.cnum;



--52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, 
--one using a join and one a correlated subquery. Which solution is more elegant?

select distinct s.snum,s.sname
from salespeople s
join customers c
    on s.city = c.city
where s.snum not in (c.snum);


--53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
select * from customers

--54. Write2 queries that will produce all orders taken on October3 or October 4.

select * from orders
where trunc(odate) in (to_date('03-OCT-96','DD-MON-YY'), 
                        to_date('04-OCT-96','DD-MON-YY'));

--55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
select o1.onum, o2.onum, c.cname
from orders o1
inner join orders o2
on o1.cnum = o2.cnum
and o1.onum < o2.onum
inner join customers c
on o1.cnum = c.cnum;

--56. Find only those customers whose ratings are higher than every customer in Rome.

select * from customers
where rating > (
    select max(rating)
    from customers
    where city = 'Rome'
);


--57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.

select* from customers
where rating > 100
or city = 'Rome';


--58. Find all rows from the Customer table for which the salesperson number is 1001.

 select * from customers
 where snum=1001;
 
 
--59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
select snum, sum(amt)
from orders
group by snum
having sum(amt) > (select max(amt) from orders);
       
       


--or      
select s.snum, s.sname,
sum(o.amt) as total_orders
from salespeople s
inner join orders o
on s.snum = o.snum
group by s.snum, s.sname
having sum(o.amt) > (
select max(amt) from orders
);


--60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.

select * from orders 
where amt=0 or amt is not null




--61. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.

select s.sname, c.cname
from salespeople s
join customers c
on s.sname < c.cname
where c.rating < 200;

--62. List all salespeople’s names and the commission they have earned.


select s.sname, sum(o.amt * s.comm) as commission_earned
from salespeople s
join orders o ON s.snum = o.snum
group by s.sname;


--63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. 
--Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.


select cname, city
from customers
where rating = (
    select rating
    from customers
    where cnum = 2001   --------this is Hoffman's CNUM
);

--64. Find all salespeople for whom there are customers that follow them in alphabetical order.

select distinct s.sname
from salespeople s
inner join customers c
on c.snum = s.snum
where c.cname > s.sname;

--65. Write a query that produces the names and ratings of all customers of all who have above average orders.

select distinct c.cname, c.rating
from customers c
inner join orders o
on c.cnum = o.cnum
where o.amt > (select avg(amt) from orders);

--66. Find the sum of all purchases from the Orders table.
select sum(amt)
from orders;


--67. Write a select command that produces the order number, amount, and date for all rows in the Order table.

select onum, amt, odate
from orders;


--68. Count the number of not null rating fields in the Customer table including duplicates.
select count(rating)
from customers;


--69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.
select o.onum, s.sname, c.cname
from orders o
join salespeople s on o.snum = s.snum
join  customers c on o.cnum = c.cnum;

--70. List the commissions of all salespeople servicing customers in London.

select distinct s.comm
from salespeople s
join customers c 
on s.snum = c.snum
where c.city = 'London';

--71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city. ??
select *
from salespeople s
where not s.city =(
    select c.city
    from customers c
    where c.snum = s.snum
);


--72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.

--73. Write a query that selects all customers serviced by Peel or Motika.

select c.*
from customers c
inner join  salespeople s 
on c.snum = s.snum
where s.sname in ('Peel','Monika');

--74. Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once.).
select 
    trunc(odate) as order_date,
    count(distinct snum) as num_salespeople
from orders
group by trunc(odate)
order by trunc(odate);

--75. Find all orders attributed to salespeople in London.

select o.*from orders o
inner join salespeople s on o.snum = s.snum
where  s.city = 'London';


------76. Find all orders by customers not located in the same cities as their salespeople.
select o.*
from orders o
inner join customers c 
on o.cnum = c.cnum
inner join salespeople s 
on o.snum = s.snum
where c.city not in(s.city);


--77. Find all salespeople who have customers with more than one current order.

select distinct s.snum, s.sname
from salespeople s
join orders o
on s.snum = o.snum
group by s.snum, s.sname, o.cnum
having count(o.onum) > 1;

--78. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has 
--at least one other customer (besides the customer being selected) with orders in the Orders table.

select distinct c.*
from customers c
join customers c2
  on c.snum = c2.snum
join orders o
  on c2.cnum = o.cnum
where c.cnum not in c2.cnum;

--79. Write a query that selects all customers whose name begins with ‘C’.

select *from customers
where cname like 'C%';

--80. Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  
--for the city (city) the highest rating is : (rating). ?????

--81.Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.

select distinct snum
from orders;

--82. Write a query that lists customers in descending order of rating. Output the rating field first, 
--followed by the customers’ names and numbers.

select rating, cname, cnum
from customers
order by rating desc;

--83. Find the average commission for salespeople in London.

select avg(comm) as avg_commission
from salespeople
where city = 'London';

--84. Find all orders credited to the same salesperson that services Hoffman.

select * from orders
where snum = (
    select snum
    from customers
    where cnum = 2001  
);

--85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.

select * from salespeople
where comm between 0.10 and 0.12;

--86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10

select sname, city
from salespeople
where city = 'London'
  and comm > 0.10;

--87. What will be the output from the following query?
--SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));
 
 
select * from orders
where amt < 1000
   or not (odate =to_date ('10/03/1996','dd/mm/yyyy') and cnum > 2003);

--88. Write a query that selects each customer’s smallest order.

select cnum, min(amt)
from orders
group by cnum;


--89. Write a query that selects the first customer in alphabetical order whose name begins with ‘G’.

select *from 
(
    select * from customers
    where cname like 'G%'
    order by cname
) 
where rownum = 1;


--90. Write a query that counts the number of different not NULL city values in the Customers table.

select count(distinct city)
FROM customers;

--91. Find the average amount from the Orders table.

select avg(amt)
from orders;

--92. What would be the output from the following query?
--SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);


--93. Find all customers who are not located in San Jose & whose rating is above 200.

select * from customers
where city not in 'San Jose'
and rating > 200;

--94. Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);


---or
select * from salespeople 
where comm =0.13;


--95. Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);

SELECT * FROM orders
WHERE NOT ((odate = TO_DATE ('03-OCT-1996', 'DD-MON-YYYY') AND snum > 1002) OR amt > 2000);


--96. Which salespeople attend to customers not in the city they have been assigned to?


select distinct s.snum, s.sname, s.city as salesperson_city, c.city as customer_city
from salespeople s
inner join customers c
on s.snum = c.snum
where s.city not in c.city;

---97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?

select distinct s.snum, s.sname, s.comm, c.cname, c.rating
from salespeople s
inner join customers c
on s.snum = c.snum
where s.comm > 0.11
and c.rating < 250;

--98. Which salespeople have been assigned to the same city but get different commission percentages?

select city from salespeople
group by city
having count(distinct comm) > 1;

--99. Which salesperson has earned the most by way of commission?


--100.  Does the customer who has placed the maximum number of orders have the maximum rating?

select o.cnum,c.cname,c.rating,count(o.cnum)
from orders o 
inner join customers c 
on c.cnum=o.cnum 
group by o.cnum,c.cname,c.rating
order by c.rating desc;


---101.  Has the customer who has spent the largest amount of money been given the highest rating?
--102.  List all customers in descending order of customer rating.

select rating, cname, cnum
from customers
order by rating desc;

--103.  On which days has Hoffman placed orders?

select distinct o.odate
from orders o
inner join customers c
on o.cnum = c.cnum
where c.cname = 'Hoffman'
order by o.odate;

--104.  Do all salespeople have different commissions?

select count (distinct comm),
       count(*) 
from salespeople;

--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?

select s.*
from salespeople s
where s.snum not in (select o.snum
    from orders o
    where o.odate between to_date ('10-03-1996','DD-MM-YYYY') and to_date ('10-05-1996','DD-MM-YYYY')
);

---OR
select s.* from salespeople s
left join orders o
on s.snum = o.snum
and o.odate between to_date ('10-03-1996','DD-MM-YYYY') and to_date ('10-05-1996','DD-MM-YYYY')
where o.snum is null;


--106.  How many salespersons have succeeded in getting orders?

select count(distinct snum) 
 from orders;

select  distinct count(s.snum)
from salespeople s
 left join orders o
on s.snum=o.onum

 select * from orders
--107.  How many customers have placed orders?

select count(distinct cnum)
from orders;

--or
select count(distinct c.cnum)
from customers c
inner join orders o
on c.cnum = o.cnum;



--108.  On which date has each salesperson booked an order of maximum value?

select s.snum, s.sname, o.odate, o.amt
from salespeople s
inner join orders o
on s.snum = o.snum
where o.amt = (select max(amt)
from orders
where snum = s.snum
);

--109.  Who is the most successful salesperson?

select s.snum,s.sname,sum(o.amt) as total_sales
from salespeople s
inner join orders o
on s.snum = o.snum
group by s.snum, s.sname
having sum(o.amt) = (select max(sum_amt)
from (select sum(amt) as sum_amt
from orders
group by snum)
);

--110.  Who is the worst customer with respect to the company?

select c.cnum, c.cname, sum(o.amt) as total_orders
from customers c
left join orders o
on c.cnum = o.cnum
group by c.cnum, c.cname
order by total_orders asc;

--111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?

--112.  Which customers have the same rating?

select cname, rating from customers
where rating in ( 
select rating
from customers
group by rating
having count(*) > 1
)
order by rating;


--113.  Find all orders greater than the average for October 4th.

select * from orders
where amt > (select avg(amt)
from orders
where trunc(odate) = to_date('04-OCT-96','DD-MON-YY')
);

--114.  Which customers have above average orders?

select distinct c.cnum, c.cname
from customers c
inner join orders o
on c.cnum = o.cnum
where o.amt > (select avg(amt)
from orders
);

--115.  List all customers with ratings above San Jose’s average.

select * from customers
where rating > (select avg(rating)
from customers
where city = 'san jose'
);

--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest 
--order in the table.


select s.snum, s.sname, sum(o.amt) as total_orders
from salespeople s
inner join orders o
on s.snum = o.snum
group by s.snum, s.sname
having sum(o.amt) > (select max(amt) from orders);

--117.  Give names and numbers of all salesperson that have more than one customer.

select s.snum, s.sname
from salespeople s
inner join customers c
on s.snum = c.snum
group by s.snum, s.sname
having count(*) > 1;

--118.  Select all salesperson by name and numbers who have customers in their city whom they don’s the service.

select distinct s.snum, s.sname
from salespeople s
inner join customers c
  on s.city = c.city
where c.snum not in s.snum;

--119.  Which customers’ rating should be lowered?



-----120.  Is there a case for assigning a salesperson to Berlin?    ???????

select * from customers 
where city = 'Berlin';


--or
select distinct c.city
from customers c
left join salespeople s
  on c.city = s.city
where s.snum is null;

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?

select s.sname, s.comm, sum(o.amt) total_sales
from salespeople s
inner join orders o
on s.snum = o.snum
group by s.sname, s.comm
order by total_sales desc;

------122.  Dose the total amount in orders by customer in Rome and London exceeds the commission paid to salesperson in 
--London and New York by more than 5 times?

???????
select sum(o.amt) as total_order_amt
from orders o
join customers c
  on o.cnum = c.cnum
where c.city in ('Rome', 'London');



select sum(o.amt * s.comm)
from orders o
join salespeople s
  on o.snum = s.snum
where s.city in ('London', 'New York');


--123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
select s.sname, o.onum, o.amt, o.odate, c.city
from orders o
inner join salespeople s on o.snum = s.snum
inner join customers c on o.cnum = c.cnum
where (o.snum, o.amt) in (select snum, max(amt)
from orders
group by snum
);

--124.  Which salesperson(s) should be fired?

select s.snum, s.sname
from salespeople s
left join orders o

on s.snum = o.snum
where o.onum is null;



----------OR

SELECT s.snum, s.sname
FROM salespeople s
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.snum = s.snum
);


--125.  What is the total income for the company?
 
select sum(amt)
from orders;


