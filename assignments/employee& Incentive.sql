
------------------------------------------------HW-----------------------------------------------------------------------------------------------------------------------------------
-- 1.	Write create table syntax for employee table and Incentive table.

-- Employee
Create Table Employee
( Emp_id number,
First_name varchar(20),
Last_name varchar(20),
Salary number,
Joining_date date,
Department varchar(20)
);
drop table Employee;

select * from Employee;

--2.2.	Writesyntax forinsert data into table of employee table.

Insert into Employee values (1,'John','Abraham',1000000,to_date('01-JAN-13','DD-MON-YY'),'Banking');
Insert into Employee values (2,'Michael','Clarke',800000,to_date('01-JAN-13','DD-MON-YY'),'Insurance');
Insert into Employee values (3,'Roy','Thomas',700000,to_date('01-FEB-13','DD-Mon-YY'),'Banking');
Insert into Employee values (4,'Tom','Jose',600000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
Insert into Employee values (5,'Jerry','Pinto',650000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
Insert into Employee values (6,'Philip','Mathew',750000,to_date('01-JAN-13','DD-MON-YY'),'Services');

select * from employee;
SELECT * FROM INCENTIVES


--DELETE FROM employee;
delete from employee
where emp_id in (4,5,6)
delete from employee
where emp_id=6
--Incentives

Create table Incentives
(
Employee_ref_id number,
Incentive_date date,
Incentive_amount number
);

select * from Incentives;

--2.Writesyntax for insert data into table of Incentive table

Insert into Incentives values (1,to_date('01-Feb-13','DD-MON-YY'),5000);
Insert into Incentives values (2,to_date('01-Feb-13','DD-MON-YY'),3000);
Insert into Incentives values (3,to_date('01-Feb-13','DD_MON_YY'),4000);
Insert into Incentives values (1,to_date('01-Jan-13','DD-MON-YY'),4500);
Insert into Incentives values (2,to_date('01-Jan-13','DD-MON-YY'),3500);

select * from Incentives;

--3.Get all employee details from the employee table.

Select * from employee;

--4.Get First_Name,Last_Name from employee table.

Select first_name,last_name from employee;

--5.	Get First_Name from employee table using alias name “Employee Name”

select first_name as "Employee Name" from employee;

--6.	Get First_Name from employee table in upper case

Select upper(first_name) from Employee;

--7.	Select first 3 characters of FIRST_NAME from EMPLOYEE

select substr( first_name,1,3) from employee;

--8.Get position of 'o' in name 'John' from employee table

select instr('John','o')from employee
where first_name = 'John';

--9.	Get FIRST_NAME from employee table after removing white spaces from right side.

select rtrim (first_name) from employee;

--10.	Get First_Name from employee table after replacing 'o' with '$'

 select replace(first_name,'o','$') from employee; 
 
--11.	Get First_Name and Last_Name as single column from employee table separated by a '_'
 select first_name ||'_'|| last_name as full_name from employee;
 --or
 select first_name ||'_'|| last_name from employee;

--12.	Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table

select first_name extract (year from Joining_date) as joing year

--13.	Get all employee details from the employee table order by First_Name Ascending
 select * from employee
 order by first_name asc;
 
--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
select * from employee
order by first_name asc,salary desc;


--15.	Get employee details from employee table whose employee name is “John”

select * from employee
where first_name='John';

--16.	Get employee details from employee table whose employee name are “John” and “Roy”

select * from employee
where first_name in ('John','Roy');

--17.	Get employee details from employee table whose employee name are not “John” and “Roy”.
select * from employee
where first_name not in ('John','Roy');

--18.	Get employee details from employee table whose first name starts with 'J'.
select * from employee
where first_name like 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.

select * from employee
where first_name like '%o%';

--20.	Get employee details from employee table whose first name ends with 'n'.
select * from employee
where first_name like '%n';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
select * from employee 
where first_name like '%n'
and length (first_name) = 4;

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
select * from  employee
where first_name like 'J%'
and length (first_name)=4;

--23.	Get employee details from employee table who’s Salary greater than 600000.
select * from employee 
where salary>600000;

--24.	Get employee details from employee table whose joining year is “2013”.
select * from employee
where  extract (year from joining_date)=2013; 

--25.	Get employee details from employee table whose joining month is “January”.
select * from employee 
where TO_CHAR(joining_date, 'Month') = 'January';

--26. Get employee details from employee table who joined before January 1st 2013.
SELECT * FROM employee
Where joining_date < DATE '2013-01-01';

--27. Get employee details from employee table who joined after January 31st
select * from employee
where joining_date > TO_DATE('31-JAN-2013','DD-MON-YYYY');



--28. Get Joining Date and Time from employee table
select TO_CHAR(joining_date,'DD-MON-YYYY HH24:MI:SS')
from employee;

--29. Get Joining Date, Time including milliseconds from employee table  --------
--select TO_CHAR(joining_date,'DD-MON-YYYY HH24:MI:SS)from employee;
select to_char(joining_date, 'dd-mon-yyyy hh24:mi:ss') as joining_datetime
from employee;

--30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.

select e.emp_id,
       e.first_name || ' ' || e.last_name as full_name,
       i.incentive_date - e.joining_date as date_difference
from employee e
join incentives i
on e.emp_id = i.employee_ref_id;


--or
select e.emp_id,i.incentive_date - e.joining_date as date_diff
from employee e
join incentives i
on e.emp_id = i.employee_ref_id;


select * from incentives
---31. Get department, total salary with respect to a department from employee table.
select department, sum(salary) total_salary from employee
group by  department;

--32. Get department, total salary with respect to a department from employee table order by total salary descending.
select department, sum(salary) total_salary from employee
group by department
order by total_salary desc;

---33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
select department,count(*) ,sum(salary) total_salary from employee
group by department
order by total_salary desc;

select department,count(department)no_of_employees ,sum(salary) total_salary from employee
group by department
order by total_salary desc;


select * from employee;
select * from Incentives;

--34. Get department wise average salary from employee table order by salary ascending?
select department, avg(salary) avg_salary from employee
group by department
order by avg_salary asc;

--35. Get department wise maximum salary from employee table order by salary ascending?

select department, max(salary)max_salary from employee
group by department
order by max_salary asc;

--36. Get department wise minimum salary from employee table order by salary ascending?

select department, max(salary)min_salary from employee
group by department
order by min_salary asc;

--37. Select no of employees joined with respect to year and month from employee table.
     select to_char(hire_date, 'YYYY') as year,
       to_char (hire_date, 'MM') as month,
       count(*) as no_of_employees
from employee 
   group by to_char(hire_date, 'YYYY'),
            to_char(hire_date, 'MM')
order by  year, month;


select * from employee

--38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
select department, sum(salary) total_salary from employee
group by department
having sum (salary) > 800000
order by total_salary desc;

--39. Select employee details from employee table if data in incentive table?
 select  distinct e.emp_id,e.first_name,e.last_name,e.salary 
 from employee e
 inner join incentives i
 on e.emp_id=  i.employee_ref_id
 order by e.emp_id
--or
SELECT DISTINCT e.*
FROM employee e
INNER JOIN incentives i
ON e.emp_id=i.employee_ref_id
order by e.emp_id

select * from employee
 select * from incentives
--40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table

select first_name,salary,
case
when first_name= 'John' then salary *0.29
when first_name= 'Roy' then salary  *0.10
     else salary *0.15
     end as salary_calculate
     from employee;

--41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.
 select first_name,salary,department,
 case
   when department='Banking' then 'Bank dept'
   when department='Insurance' then 'Insurance Dept'
   when department='Services' then 'services Dept'
    end as department_id
  from employee;
 

--42. Delete employee data from employee table who got incentives in incentive table 

DELETE FROM employee
WHERE emp_id IN (
    SELECT employee_ref_id
    FROM incentives
);
select * from employee

rollback;


--43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
 select * from employee
 select * from incentives
 
select e.first_name,i.incentive_amount,e.emp_id,i.employee_ref_id
from employee e
inner join incentives i
on e.emp_id=i.employee_ref_id;

--44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
select e.first_name,i.incentive_amount 
from employee e
inner join incentives i
on e.emp_id= i.employee_ref_id
where i.incentive_amount>3000;

--45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
select e.first_name,i.incentive_amount 
from employee e
full outer join incentives i
on e.emp_id= i.employee_ref_id

--46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and
 --set incentive amount as 0 for those employees who didn't get incentives.
  select e.first_name, nvl(i.incentive_amount,0)
  from employee e
  full outer join incentives i
  on e.emp_id= i.employee_ref_id
  
 
 
--47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
 select e.first_name,i.incentive_amount
 from employee e
 left join incentives i
 on e.emp_id=i.employee_ref_id
 

--48. Select max incentive with respect to employee from employee and incentives table using sub query.

select e.emp_id, e.first_name,
       (select max(i.incentive_amount)
        from incentives i
        where e.emp_id = i.employee_ref_id) as max_incentive
from employee e;



--or
select e.emp_id,e.first_name,e.last_name,m.max_incentive
from employee e
inner join (
        select employee_ref_id, max(incentive_amount) as max_incentive
        from incentives
        group by employee_ref_id
     ) m
on e.emp_id = m.employee_ref_id;




