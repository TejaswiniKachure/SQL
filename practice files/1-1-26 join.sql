select * from hr.employees
order by department_id;

select * from hr.departments;

select * from hr.locations;


---- Extract all the employee detail with respective department name
-- inner join
-- left outer
-- right outer
-- full outer
---------------------- Inner------------------------------------------------------------------
select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e,hr.departments d
where e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,city
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id
right join hr.locations l
on d.LOCATION_ID = l.LOCATION_ID;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e,  hr.departments d
where e.department_id(+) = d.department_id;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e right join  hr.departments d
on e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id;

select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e,  hr.departments d
where e.department_id = d.department_id(+);

-------------------------------------------Self join------------------------------------------------------
SELECT manager_name,count(*) FROM (select e2.manager_id,e1.first_name as manager_name,e2.employee_id,e2.first_name
from hr.employees e1, hr.employees e2
where e1.employee_id=e2.manager_id)
group by manager_name
;




------------------------------------------------------------------------------------------------------------
select employee_id,first_name,last_name,salary,d.department_id,DEPARTMENT_NAME
from hr.employees e full join  hr.departments d
on e.department_id = d.department_id
order by e.department_id;



select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e inner join  hr.departments d
on e.department_id = d.department_id;


select *
from hr.employees e cross join  hr.departments d;

select employee_id,first_name,last_name,salary,e.department_id,DEPARTMENT_NAME
from hr.employees e , hr.departments d;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---inner join

--Display EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME.
SELECT e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_NAME       --e and d are table aliases:e → HR.EMPLOYEES d → HR.DEPARTMENTS
FROM HR.EMPLOYEES e                                         --Start from the EMPLOYEES table.
INNER JOIN HR.DEPARTMENTS d                                 --Join the DEPARTMENTS table with EMPLOYEES.
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;                       --Match rows where:   Employee’s DEPARTMENT_ID     equals Department’s DEPARTMENT_ID
       

select e.employee_id,e.first_name,d.department_id 
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id


--Display FIRST_NAME, JOB_ID, DEPARTMENT_NAME of employees.

select e.first_name,e.job_id,d.department_name 
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

select * from hr.departments

--extract EMPLOYEE_ID, FIRST_NAME, LOCATION_ID
select e.employee_id, e.first_name, d.location_id
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

---EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, DEPARTMENT_NAME

select e.employee_id, e.first_name, e.manager_id,d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

-- extract EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME and those emp  even if they are not assigned to any department
select e.employee_id, e.first_name, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id = d.department_id;

select e.employee_id, e.first_name, d.department_name
from hr.employees e
left outer join hr.departments d
on e.department_id = d.department_id;

select e.employee_id, e.first_name, d.department_name
from hr.employees e
right outer join hr.departments d
on e.department_id = d.department_id;

--LEFT JOIN → all rows from left table
--RIGHT JOIN → all rows from right table
--FULL JOIN → all rows from both tables

--display all the employees details there salary  greater than 5000 with there department name oreder by salary

select e.first_name,e.last_name,e.salary,d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
where salary >5000;


--display first_name, last_name, and department_name for employees working in department 50, ordered by first_name.
select e.first_name,e.last_name ,d.department_name 
from hr.employees e
inner join  hr.departments d
on e.department_id= d.department_id
where d.department_id=50
order by e.first_name

--display all department records there manager_id is not null with shows there employees name
select d.department_id,d.department_name,d.manager_id,e.first_name,e.last_name
from hr.departments d
join hr.employees e
on d.department_id=e.department_id
where d.manager_id is not null

----Display DEPARTMENT_NAME, CITY, TOTAL NUMBER OF EMPLOYEES for departments in cities starting with ‘S’



-- extract  (f_nname ,L-name) manager name ,manager id and no of emp but only those managers who manage more than 5 employees.
select * from hr.employees
select * from hr.departments

select  m.first_name,m.last_name, m.FIRST_NAME || ' ' || m.LAST_NAME AS MANAGER_NAME,
       e.MANAGER_ID,
       COUNT(e.EMPLOYEE_ID) AS NUM_EMPLOYEES
FROM HR.EMPLOYEES e
INNER JOIN HR.EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID
GROUP BY m.FIRST_NAME, m.LAST_NAME, e.MANAGER_ID
having COUNT(e.EMPLOYEE_ID) in (4,5)
ORDER BY NUM_EMPLOYEES DESC;





























