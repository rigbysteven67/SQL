-- 1) List the following details of each employee: employee number, last name, 
--    first name, sex, and salary.

select employees.emp_no as employee_number,
		last_name,
		first_name,
		sex,
		salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.

select first_name,
		last_name,
		hire_date
from employees
--where hire_date between '1986-01-01' and '1986-12-31';
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- 3) List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.

select employees.emp_no,
		last_name,
		first_name,
		dept_manager.dept_no,
		dept_name
from employees
inner join dept_manager
on employees.emp_no = dept_manager.emp_no
inner join departments
on dept_manager.dept_no = departments.dept_no;

-- 4) List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

select employees.emp_no,
		last_name,
		first_name,
		dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no

-- 5) List first name, last name, and sex for employees whose first name 
--    is "Hercules" and last names begin with "B."

select first_name,
		last_name, 
		sex
from employees
where first_name = 'Hercules' and
		last_name like 'B%'

-- 6) List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.

select employees.emp_no,
		last_name,
		first_name,
		dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

-- 7) List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

select employees.emp_no,
		last_name,
		first_name,
		dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or
		dept_name = 'Development'

-- 9) In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

select last_name,
		count(last_name) as frequency
from employees
group by last_name
order by frequency desc




