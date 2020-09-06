with 
emp as (select * from employees.employees where year(employees.birth_date) = '1965'),
sal as (select * from employees.salaries where salaries.to_date = '9999-01-01'),
emp_sal as (select distinct emp.emp_no, salary, hire_date from emp join sal on emp.emp_no = sal.emp_no)
select e1.emp_no as h_empno, e1.salary as h_salary, e1.hire_date as h_date,
e2.emp_no as l_empno, e2.salary as l_salary , e2.hire_date as l_date
from emp_sal as e1,emp_sal as e2
where e1.hire_date > e2.hire_date and e1.salary>e2.salary
order by e1.emp_no asc, e2.emp_no asc;