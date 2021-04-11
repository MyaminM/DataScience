
# this query will return every employee with age and salaries;
# this query will extract the information we need for Case 2 Covid-19 scenario.
select distinct e.emp_no,e.first_name,e.last_name , d.dept_name,t.title,(Year('2000-12-31')-year(t.from_date)) as experience,/*t.from_date,t.to_date ,*/(Year('2001-02-01')-year(e.birth_date))as age,new_salaries.salary as salary from
 (select s.emp_no ,max( s.salary) as salary from salaries s

group by s.emp_no) as new_salaries

join dept_emp de on new_salaries.emp_no=de.emp_no
join departments d on de.dept_no=d.dept_no
join employees e on new_salaries.emp_no=e.emp_no
join titles t on t.emp_no=e.emp_no and
 t.from_date<='2000-12-31' and t.to_date>'2000-12-31'

;