############################################################### CASE 1 #######################


use employees;
select * from employees;
show tables;


#################     A.Number of male and female employees in the company?
Select Gender, count(gender) As Count_of_Gender
from employees
group by gender ;


 ##############      B.The ratio of males to females hired in the last 5 years?
 #to find the last hiring date 
 select hire_date 
 from employees
 order by hire_date desc;	
 
#Count of Females
select 
d.dept_name,
em.gender,
count(em.gender) As Count_of_Females
from departments d
join dept_emp e  on e.dept_no = d.dept_no
join employees em on em.emp_no=e.emp_no
where em.gender = 'F' 
      and em.hire_date between'1995-01-28' and '2000-01-28'
group by d.dept_name
order by d.dept_name;

#Count of Males
select 
d.dept_name,
em.gender,
count(em.gender) As Count_of_Males
from departments d
join dept_emp e  on e.dept_no = d.dept_no
join employees em on em.emp_no=e.emp_no
where em.gender = 'M' 
      and em.hire_date between'1995-01-28' and '2000-01-28'
group by d.dept_name
order by d.dept_name; 


 ##############          C.The ratio of average salary for males to females?
 
#The average salary for females
select 
d.dept_name,
em.gender,
Avg(s.salary) As Avg_Salary_of_Females
from dept_emp de
join employees em on em.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
join salaries s on em.emp_no = s.emp_no
where em.gender = 'F' 
group by d.dept_name
order by d.dept_name; 

#The average salary for males
select 
d.dept_name,
em.gender,
Avg(s.salary) As Avg_Salary_of_Males
from dept_emp de
join employees em on em.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
join salaries s on em.emp_no = s.emp_no
where em.gender = 'M' 
group by d.dept_name
order by d.dept_name; 


################################################# Done


