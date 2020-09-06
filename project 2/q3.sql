SELECT employees.last_name, salaries.salary, salaries.from_date, salaries.to_date 
FROM employees.employees, employees.salaries 
WHERE employees.emp_no = salaries.emp_no 
ORDER BY last_name ASC, salary ASC,from_date ASC, to_date ASC ;