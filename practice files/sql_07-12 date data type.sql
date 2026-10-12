{sir}
-------------------------DRL-----------------------------------------------------
SELECT * FROM hr.employees;

SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.LOCATIONS;

SELECT * FROM HR.COUNTRIES;

SELECT * FROM HR.REGIONS;

-----------------------------where-------------------------------------------------
SELECT * FROM hr.employees
where department_id = 90;

SELECT employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 90;

SELECT employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 50;

SELECT ROWID,employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 90;

-----------------------Operator---------------------------------------------------------------------------------------------------------------------------------------------
-----1) not equal to operator

SELECT * FROM hr.employees
where department_id <> 50;

SELECT * FROM hr.employees
where department_id != 50;


--- Extract those employee detail having salary gratter than 15000

SELECT * FROM hr.employees
where salary > 15000;

-------- 

select * from hr.employees
where department_id in (10,60,80);

select * from hr.employees
where department_id not in (10,60,80);

select * from hr.employees
where department_id = 50
and salary > 5000;

select * from hr.employees
where department_id = 50
or salary > 5000;

-- between 
select * from hr.employees
where hire_date between '01-01-05' and '31-12-06';


SELECT * FROM hr.employees
where department_id is null;
-----------------------------------------------------------------------------------------------------------------------------
----(ME)---------------

Create table employee_detail
(
employee_id number,
Fname varchar(20),
Lname varchar(20),
DOJ date
);

select * from employee_detail;

Insert into employee_detail values(1001,'Ram','J',to_date('11/11-2025','dd-mm-yyyy'));

insert into employee_detail values(1002,'shyam','j',to_date('05-11-2025','dd-mm-yyyy'));



create table clg
(
clg_id number,
std_name varchar(25),
std_lastname varchar(30),
mobile_number number,
DOJ date
);

select * from clg;

insert into clg values(11,'anurag','singh',909089788,to_date('2025-11-05','yyyy-mm-dd'));
insert into clg values(12,'krishna','pandit',8261778890,to_date('2025-04-11','yyyy-mm-dd'));

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------DRL----------------------------------------------------------------------------------------------------------
select * from hr.employee;
select * from hr.departments;
select * from hr.location;
select * from hr.country;
select * from hr.regions;




































