--------------------------------------------- DRL ------------------------------------------------------------------------------------------------

select * from hr.employees;
select * from hr.departments;
select * from hr.locations;
select * from hr.countries;
select * from hr.regions;

-----------------------------------------------------where condition---------------------------------------------------------------------------------------------
select * from hr.employees
Where department_id = 90;

select employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id=90;

select employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id=50;


select employee_id,first_name,last_name,hire_date,salary from hr.employees
where department_id=30;

------------------------------------------operator----------------------------------------------------------------
<, >, <=,>=, <>,!=

-------------------------not equal to---------------------------------
select * from hr.employees
where department_id <>50;


select * from hr.employees 
where department_id !=50;

---------------->-----------------
extract those employee detail having salary is greater than 15000

select * from hr.employees
where salary > 15000;

-------- in--------

select * from hr.employees
where department_id in(10,40,80);

-----------------not in-----------------
select * from hr.employees
where department_id not in (10,40,80);

---------AND-----------------------------

select * from hr.employees
where department_id in(10,40,60,80)
and salary >5000;

select * from hr.employees
where department_id= 60
and salary >15000;


------- or-------------------
select * from hr.employees
where department_id=40
or salary > 20000;

select * from hr.employees
where department_id in (10,20,50)
or salary > 20000;

-----between----------------------------
select * from hr.employees
where hire_date between to_date('01-10-2002','dd-mm-yyyy')and to_date('01-10-2004','dd-mm-yyyy');

--or we can  write this upper statement like this also----
SELECT *
FROM hr.employees
WHERE hire_date BETWEEN
      DATE '2002-10-01'
  AND DATE '2004-11-01';
  
  ------------------ practice-- hr.employee------------
  
---employees whose job_id is IT_PROG
  
  select * from hr.employeeS
  where job_id='IT_PROG';
  
  
 --- all employee details
 select * from hr.employees
 
 
 ---employees hired after 01-Jan-2002
 
 select * from hr.employees
 where hire_date > to_date('01-jan-2002','dd-mon-yyyy');
 
 
 ---- extract all employees whose manager_id is NULL.
 select * from hr.employees
 where manager_id is null;
 
 
 ------extract employees whose salary is less 8000
 
 select * from hr.employees
 where salary<8000;
 
 
 -----extract employees whose salary is greater equal to 5000.
 select * from hr.employees
 where salary >=5000;
 
 
 ------extract employees whose salary is greater than 10000.
 select * from hr.employees
 where salary >10000;
 
 ---------extract employees whose salary is greater than 15000
  select * from hr.employees
 where salary >15000;
 
 ----employees whose salary is greater than 120000 and job_id=AD_VP
 select * from hr.employees
 where salary>12000
 and JOB_id = 'AD_VP';
 
 ------------employees whose salary is greater than 120000 and department_id (10,20,30,40,80)
 select * from hr.employees
 where salary>12000
 and department_id in(10,20,30,40,80);
 
SELECT * FROM hr.employees
order by employee_id desc;

select * from hr.employees
order by salary,employee_id;



SELECT * FROM hr.employees
where department_id = 50
order by salary ;

 
 
 -------------select * from hr.departments--------------------------
 ---all records---
 select *from hr.departments;
 
 
 -----extract only department_id and department_name
 select department_id, department_name
FROM hr.departments;


---extract the departments located in location_id 2700
select * from hr.departments
where location_id=2700;


---departments where manager_id is NULL
select * from hr.departments
where manager_id is null;


--- departments with department_id > 100
select * from hr.departments
where department_id>100;


--- departments with department_id <50
select * from hr.departments
where department_id <50;


--- all department_id
select department_id from hr.departments;


---extract all location_id
select location_id from hr.departments;


---extract all department_name from hr.departments
select department_name from hr.departments;


--- extract all departments located in location_id 1700 or 1400
SELECT *FROM hr.departments
WHERE location_id IN (1700, 1400);


---extract all departments where manager_id is NOT NULL.
SELECT *FROM hr.departments
WHERE manager_id IS NOT NULL;


------- extract all departments located in location_id 1400,1700,2500,2700
SELECT *FROM hr.departments
WHERE location_id IN (1400,1700,2500,2700);


------extract all department in location id > 2300
SELECT *FROM hr.departments
WHERE location_id>2300;


----extract the departments with no manager and located in 1700
select *from hr.departments
where manager_id is null
and location_id = 1700;


---extract all manager_id from hr.employees
select manager_id from hr.employees;


---- extract all departments located not in location id 1400,1700
select * from hr.departments
where location_id not in(1400,1700);



-----extract all departments with department_id <80
select * from hr.departments
where department_id <80;



----extract all departments with department_id grater than 40 and location id 1700,2700

select * from hr.departments
where department_id>40
and location_id in(1700,2700);


SELECT * FROM hr.departments
order by manager_id desc;

SELECT * FROM hr.departments
order by location_id desc;


----------------select * from hr.locations------------------------------

1.----extract all records---
Select * from hr.locations;

2.--extract location_id, city, and country_id

select location_id, city, country_id from hr.locations;


3.---extract all locations where city = 'Seattle'

select * from hr.locations 
where city = 'Seattle';


4.---- extract all location where city roma

select * from hr.locations 
where city = 'Roma';

5.---locations where state_province is NULL

select * from hr.locations 
where state_province is null;


6.---locations where country_idis US
select * from hr.locations 
where country_id='US';

7.----extract all locations with postal_code is NULL
select * from hr.locations 
where postal_code is null;


8.----extract all locations where country id in Uk or CA
select * from hr.locations 
where country_id in('UK','CA');


9.---entract all locations with location_id between 1200 and 2000

select * from hr.locations
where location_id between 1200 and 2000;

10.---extract the locations where city is tokyo

select * from hr.locations
where city = 'Tokyo';

11.----extract all locations where country id not in JP,CN,US,CA

select * from hr.locations 
where country_id not in('JP','CN','US','CA');

12.-----ectract all postal code--
select postal_code from hr.locations;


13.---- extract all street address and city

select street_address,city
from hr.locations;


14.----extract all country id
select country_id 
from hr.locations;


15.-----extract locations where city is either London or Seattle

select * from hr.locations
where city in('London', 'Seattle');


SELECT * FROM hr.locations
order by country_id desc;


--------------------select * from hr.regions;------------------------
1.--extract  all records from hr.regions
select * from hr.regions;

2.---only region_id and region_name

select region_id, region_name
from hr.regions;


3.---extract regions where region_name is Americas
select * from hr.regions
where region_name='Americas';

4.---extract all region id
select region_id 
from hr.regions;


5. ---- extract all region name 
select region_name 
from hr.regions; 


6.--- extract the region where region_id = 1
select * from hr.regions
where region_id=1;


7.-----extract all regions where region_id is less than 4

select * from hr.regions
where region_id<4;

8.-----extract all regions where region_id is greter than 4
select * from hr.regions
where region_id>4;

9.------extract all regions where region_id is not equal to 2

select * from hr.regions
where region_id <> 2;

10. ----extract all regions where region_id is in 4,5
select * from hr.regions
where region_id in(4,5);
