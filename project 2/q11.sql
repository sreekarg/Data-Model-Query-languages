with 
e as (select emp.dept_no,sal.salary,emp.emp_no from (select dept_no,emp_no 
	from dept_emp)as emp inner join 
	(select salaries.salary, salaries.emp_no from employees.salaries where salaries.to_date = '9999-01-01')as sal on emp.emp_no = sal.emp_no )

select departments.dept_name, emp_no, salary from e, employees.departments
where e.salary >= all( select e2.salary from e as e2 where e2.dept_no = e.dept_no)
and e.dept_no = departments.dept_no
order by dept_name;



#with 
#d1 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd001' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d2 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd002' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d3 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd003' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d4 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd004' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d5 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries 
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd005' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d6 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd006' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d7 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd007' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d8 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd008' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1),
#d9 as (select dept_no, salary, salaries.emp_no from employees.dept_emp, employees.salaries
#where salaries.to_date = '9999-01-01' and dept_emp.dept_no = 'd009' and dept_emp.emp_no = salaries.emp_no
#order by salary desc limit 1)
#select departments.dept_name, emp.emp_no, emp.salary
#from employees.departments, (select * from d1 union select * from d2 union select * from d3 union select * from d4 union select * from d5 union select * from d6 union select * from d7 union select * from d8 union select * from d9) as emp
#where emp.dept_no = departments.dept_no
#order by dept_name;