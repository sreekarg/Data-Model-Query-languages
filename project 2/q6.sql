SELECT emp1.emp_no as e1, emp2.emp_no as e2
FROM (SELECT employees.emp_no 
	FROM employees.employees 
    WHERE YEAR(employees.birth_date) = 1955 
    and employees.emp_no in 
		(SELECT dept_emp.emp_no 
			FROM dept_emp 
			where dept_emp.to_date = '9999-01-01' and dept_emp.dept_no = 'd001')) as emp1, 
	(SELECT employees.emp_no 
		FROM employees.employees 
		WHERE YEAR(employees.birth_date)= 1955 and 
			employees.emp_no in (SELECT dept_emp.emp_no 
				FROM dept_emp 
			where dept_emp.to_date = '9999-01-01' 
			and dept_emp.dept_no = 'd001')
		order by employees.emp_no asc )as emp2
WHERE emp1.emp_no<emp2.emp_no
order by e1 asc, e2 asc
;