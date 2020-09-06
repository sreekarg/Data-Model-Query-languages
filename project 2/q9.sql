select distinct t1.emp_no, count(t1.emp_no) as cnt
from employees.salaries as e1,
	employees.titles as t1,
	employees.titles as t2
where t1.emp_no = t2.emp_no and t1.emp_no = e1.emp_no and t1.title<>t2.title and
	((t1.to_date = t2.from_date and t1.to_date > e1.from_date and t1.to_date<e1.to_date ) or 
    (t2.from_date = t2.to_date and t1.to_date = t2.from_date and t1.to_date >= e1.from_date and t1.to_date<=e1.to_date))
group by emp_no
order by emp_no
