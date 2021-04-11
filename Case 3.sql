############################################################### CASE 3 #######################

use employees;
select * from employees;
show tables;

#####################Years of service with the company.
########### First Strategy
#First catagory:employees with 10 years of service or more.
select distinct e.emp_no, e.first_name, e.last_name, e.hire_date,
d.from_date, d.to_date,
round ((20001231 - d.from_date)/10000) as years_of_service
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) >= 10 and (d.to_date > 20001231)
order by years_of_service desc ;

#Second catagory: employees with (7,8,9) years of service.
select distinct e.emp_no, e.first_name, e.last_name, e.hire_date,
d.from_date, d.to_date,
round ((20001231 - d.from_date)/10000) as years_of_service
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (7,8,9) and (d.to_date > 20001231)
order by years_of_service desc;

#Third catagory: employees with (4,5,6) years of service.
select distinct e.emp_no, e.first_name, e.last_name, e.hire_date,
d.from_date, d.to_date,
round ((20001231 - d.from_date)/10000) as years_of_service
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (4,5,6) and (d.to_date > 20001231)
order by years_of_service desc;

###################################################################################
#If their contracts are expiring soon (February 1, 2001) to convince them to stay.

select e.emp_no, e.first_name, e.last_name, e.hire_date,
d.from_date, d.to_date
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where (d.to_date > 20001231) and (d.to_date <= 20010201)
order by d.to_date desc;
#################################################################### Done
########### Second  Strategy
#First catagory:employees with 10 years of service or more.
select distinct(e.emp_no), e.first_name, e.last_name, 
e.hire_date, s.salary, 
d.from_date, d.to_date, round((20001231 - d.from_date)/10000) as emp_duration 
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (10,11,12,13,14,15) and (d.to_date > 20001231) 
order by d.from_date asc;
#Second catagory: employees with (7,8,9) years of service.
select distinct(e.emp_no), e.first_name, e.last_name, 
e.hire_date, s.salary, 
d.from_date, d.to_date, round((20001231 - d.from_date)/10000) as emp_duration 
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (7,8,9) and (d.to_date > 20001231) 
order by d.from_date asc;
#Third catagory: employees with (4,5,6) years of service.
select distinct(e.emp_no), e.first_name, e.last_name, 
e.hire_date, s.salary, 
d.from_date, d.to_date, round((20001231 - d.from_date)/10000) as emp_duration 
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (4,5,6) and (d.to_date > 20001231) 
order by d.from_date asc;
#If their contracts are expiring soon (February 1, 2001) to convince them to stay.
select distinct e.emp_no, e.first_name, e.last_name, 
e.hire_date, s.salary, 
d.from_date, d.to_date, round((20001231 - d.from_date)/10000) as emp_duration 
from employees e
join dept_emp d on e.emp_no = d.emp_no
join salaries s on s.emp_no = e.emp_no
where round((20001231 - d.from_date)/10000) in (4,5,6,7,8,9,10,11,12,13,14,15) and (d.to_date between 20001231 and 20010201) 
order by d.from_date desc;

