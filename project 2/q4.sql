SELECT dept_emp.emp_no, departments.dept_name, dept_emp.from_date 
FROM employees.dept_emp, employees.departments 
where dept_emp.dept_no = departments.dept_no and 
dept_emp.to_date = '9999-01-01' 
order by emp_no;