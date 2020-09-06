SELECT mg.emp_no, departments.dept_name
FROM (select * from employees.dept_manager as m1
where m1.to_date <> '9999-01-01'
and datediff(m1.to_date,m1.from_date) >= ALL(select datediff(m2.to_date,m2.from_date) from employees.dept_manager as m2 where m1.dept_no = m2.dept_no and m2.to_date<>'9999-01-01' )) as mg
, employees.departments
where departments.dept_no = mg.dept_no
order by emp_no asc
;