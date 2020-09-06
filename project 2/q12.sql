with 
tcnt as (select dept_no, COUNT(*) as cnt
from employees.dept_emp where dept_emp.to_date = '9999-01-01'
group by dept_no),

sal as (select dept_no,emp.emp_no,salary
from (select * from employees.dept_emp where dept_emp.to_date = '9999-01-01') as emp inner join 
	(select * from employees.salaries 
		where salaries.to_date = '9999-01-01' ) as s 
	on emp.emp_no = s.emp_no),
    
davg as (select dept_no,avg(salary) as avgsal from sal
group by dept_no)

select dept_name, 100*(count(*))/tcnt.cnt as above_avg_pect
from davg, sal, tcnt, employees.departments where sal.salary > davg.avgsal and sal.dept_no = davg.dept_no and tcnt.dept_no = davg.dept_no and departments.dept_no = davg.dept_no
group by dept_name
order by dept_name;


