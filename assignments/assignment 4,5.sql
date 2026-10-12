
--Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character.

select employee_id,(substr(first_name,1,1))||'.'||last_name Full_Name,salary,hire_date
FROM hr.employees
WHERE first_name like 'S%'
order by employee_id 

select * from hr.employees



--Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

select round(max(salary)) highest,
round(min(salary)) lowest,
round(sum(salary)) sum,
round(avg(salary)) avg
FROM hr.employees;


--Q3. Display following output .

SELECT last_name||' '||'earns'||to_char(salary,'$99999.00')||' '||'but wants'||' '||(to_char(salary*3,'$99999.00'))
FROM hr. employees;





--Q4. Determine the number of managers without listing them. Label the column  Number of Managers Hint: Use the MANAGER_ID column to determine the number of managers

select count(manager_id) number_of_managers
from hr.employees;

--Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE

select max(salary)-min(salary) as difference
from hr.employees;

--Q6. Display how many employees joined in each month
--Hint: Grouping by month and count the employees .use TO_CHAR functions also

select to_char(hire_date,'Month')month,count(employee_id)
from hr.employees
group by to_char(hire_date,'Month')
order by month;

--Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.


--using add months
select employee_id,first_name || ' ' || last_name as full_name,hire_date
from hr.employees
where trunc(months_between(sysdate, hire_date) / 12) > 10;


--or 
select employee_id,first_name||' '||last_name Full_name,hire_date
from hr.employees
where (to_char(hire_date)<sysdate-365*10);

--Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
---Hint: Commission column contain null values








--Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
--Hint: Grouping on department id


select department_id,count(manager_id)
from hr.departments
where department_id is not null
group by department_id;


select * from hr.departments


--Q10.Display job title and number of employees working those job and number of manager they perform job.


select * from hr.employees
select * from hr.jobs

select j.job_title as job_title,
       count(e.employee_id) as employees,
       count(distinct e.manager_id) as managers
from hr.employees e
join hr.jobs j
on e.job_id = j.job_id
where manager_id is not null
group by j.job_title
order by j.job_title;

--Q11. Display employee full name and pad both side asterisk sing 10 time .

select 
    lpad('*',10,'*') || first_name || ' ' || last_name || rpad('*',10,'*') as employee_details
from hr.employees;



--Q12. Display following output. (Hint: Use Months_between Function)

select
    employee_id,
    last_name,
    trunc((sysdate - hire_date) / 7)  as weeks,
    trunc(months_between(sysdate, hire_date)) as months,
    trunc(months_between(sysdate, hire_date) / 12) as year
from hr.employees
where employee_id in (100,101,102,103,104,105)
order by employee_id;
