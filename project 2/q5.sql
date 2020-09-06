SELECT departments.dept_name, COUNT(*) as noe
FROM employees.dept_emp, employees.departments 
where departments.dept_no=dept_emp.dept_no 
group by dept_name 
order by dept_name ASC;