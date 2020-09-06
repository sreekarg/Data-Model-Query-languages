SELECT departments.dept_name, mgr.cnt
FROM employees.departments,
(SELECT dept_manager.dept_no, count(dept_manager.dept_no) as cnt
from employees.dept_manager 
where dept_manager.to_date<>'9999-01-01' group by dept_no )as mgr
where departments.dept_no = mgr.dept_no and cnt>1
order by dept_name;