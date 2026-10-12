create table Employees
(
employee_id number,
First_name varchar2(20),
Last_name varchar2(20),
Email varchar2(20),
salary number
);

select * from employees;

drop table employees;

insert into employees values(100,'Steven','King','sking@gmail.com',24000);
insert into employees values(101,'Neena','Kochhar','nkochhar@gmail.com',20000);
insert into employees values(102,'Lex', 'De Haan','ldehaan@gmail.com',17000);
insert into employees values(103,'Alexander','Hunold','ahunold@gmail.com',9000);
insert into employees values(104,'Bruce', 'Ernst','bernst@gmail.com',6000);
insert into employees values(105,'David', 'Austin','daustin@gmail.com',4800);
insert into employees values(106,'Valli', 'Pataballa','vpatabal@gmail.com',4800);

delete from employees
where employee_id=100;


--Q1. Write a query to generate following output.


select *  hr.from employees


select  employee_id,first_name ||' '|| last_name as full_name,email,salary
 from hr.employees
 
 
--Q2.Write a query to display job_id and number of manager under particular job. Show only those jobs that have more than one manager.
select job_id,
       count(DISTINCT manager_id) AS no_of_managers
from hr.employees
where manager_id IS NOT NULL
group by job_id
having count(DISTINCT manager_id)>1  ;


---- this query only for find it_prog job_id and no_of_manager 
select job_id,
       count(distinct manager_id) as no_of_managers
from hr.employees
where job_id = 'IT_PROG'
group by job_id;


-----select * from hr.employees


--Q3. Display the country name and number of employees those working in particular city that count of employee is greater than 30.
(Hint: Using Equijoin and Group by )

select co.country_name,
       count(e.employee_id) as employee_count
from hr.employees e
join hr.departments d
  on e.department_id = d.department_id
join hr.locations l
  on d.location_id = l.location_id
join hr.countries co
  on l.country_id = co.country_id
group by co.country_name
having count(e.employee_id) > 30
order by employee_count desc;



--Q4. Display cities name and number of departments present those cities. And exculde departments there are no any employees.

select l.city,
       count(distinct d.department_id) as department_count
from hr.departments d
join hr.locations l
  on d.location_id = l.location_id
join hr.employees e
  on d.department_id = e.department_id
group by l.city
order by department_count desc;


--Q5. Display the salary range and number of employees how are salary in between of range. 
(Hint : Job_Grade table , Equijoin , Group by )
SELECT
    CASE
        WHEN SALARY BETWEEN 2000 AND 3000 THEN '2000 - 3000'
        WHEN SALARY BETWEEN 3001 AND 5000 THEN '3001 - 5000'
        WHEN SALARY BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        ELSE 'Above 10000'
    END AS SALARY_RANGE,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM hr.EMPLOYEES
GROUP BY
    CASE
        WHEN SALARY BETWEEN 2000 AND 3000 THEN '2000 - 3000'
        WHEN SALARY BETWEEN 3001 AND 5000 THEN '3001 - 5000'
        WHEN SALARY BETWEEN 5001 AND 10000 THEN '5001 - 10000'
        ELSE 'Above 10000'
    END

select low_sal,hig_sal,
count(*) as number_of_employees
from ( select
case
when salary between 1000 and 2999  then 1000
when salary between 3000 and 4999  then 3000
when salary between 5000 and 9999  then 5000
when salary between 10000 and 14999 then 10000
when salary between 15000 and 19999 then 15000
when salary between 20000 and 25000 then 20000
end as low_sal,
case
  
when salary between 1000 and 2999  then 2999
when salary between 3000 and 4999  then 4999
when salary between 5000 and 9999  then 9999
when salary between 10000 and 14999 then 14999
when salary between 15000 and 19999 then 19999
when salary between 20000 and 25000 then 25000
end as hig_sal
from hr.employees
)
group by low_sal, hig_sal
order by low_sal;


select count(*) 
from hr.employees
where salary >= 5000
and salary < 10000;



--Q6. Display Year list and number of Employees join in particular year.
(Hint: Group by and To_Char Function)


select * from hr.employees

select  to_char (hire_date,'yyyy') as year,
count(employee_id)as no_of_employees
from hr.employees
group by to_char (hire_date,'yyyy')
order by year;

----or 
select extract(year from hire_date) as year,
count(employee_id)as no_of_employees
from hr.employees
group by extract(year from hire_date)
order by year;



--Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers how have more than 5 employees under working. Result sort by manager_ID



select e.manager_id,
       m.first_name || ' ' || m.last_name as full_name,
       count(e.employee_id) as No_of_employee
from hr.employees e
join hr.employees m
  on e.manager_id = m.employee_id
group by e.manager_id, m.first_name, m.last_name
having count(e.employee_id) > 5
order by e.manager_id;



select manager_id,first_name||' '|| last_name as manager_full_name,
count(employee_id) as number_of_employees
from hr.employees
having count(employee_id) >5
group by manager_id,first_name,last_name
order by manager_id
