--1. 	List the employee number, last name, first name, sex, 
--		and salary of each employee.
	SELECT  emp.emp_no,
	        emp.last_name,
	        emp.first_name,
	        emp.sex,
	        sal.salary
	FROM employees as emp
	    LEFT JOIN salaries as sal
	    ON (emp.emp_no = sal.emp_no)
	ORDER BY emp.emp_no;

--2. 	List the first name, last name, and hire date for the employees 
--		who were hired in 1986.

SELECT	emp.first_name,
		emp.last_name,
		hire_date
from	employees as emp
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

--3. 	List the manager of each department along with their 
--		department number, department name, employee number, last 
--		name, and first name.

select	dm.dept_no,
		d.dept_name,
		emp.emp_no,
		emp.last_name,
		emp.first_name
from dept_manager as dm
	inner join departments as d
		on (dm.dept_no = d.dept_no)
	inner join employees as emp
		on(dm.emp_no=emp.emp_no);

--4.	List the department number for each employee along with that 
-- 		employee’s employee number, last name, first name, and department name.

select 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name

from employees as emp
	inner join dept_emp as de
		on (emp.emp_no = de.emp_no)
	inner join departments as d
		on (de.dept_no = d.dept_no)
order by emp.emp_no

--5. 	List first name, last name, and sex of each employee whose first name 
--		is Hercules and whose last name begins with the letter B.

select 	first_name,
			last_name,
			sex

from 	employees 
where 	first_name = 'Hercules'
and last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, 
-- last name, and first name.

select 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name
		
from employees as emp
	inner join dept_emp as de
		ON (emp.emp_no = de.emp_no)

	inner join departments as d
		ON (de.dept_no = d.dept_no)

		where d.dept_name = 'Sales'

order by emp.emp_no

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

select 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		d.dept_name

from employees as emp
	inner join dept_emp as de
		on (emp.emp_no = de.emp_no)

	inner join departments as d
		on (de.dept_no = d.dept_no)
		where d.dept_name in ('Sales','Development')

		order by emp.emp_no
		
-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).		

select 	emp.last_name, count(last_name)

from employees as emp
group by last_name
order by count(last_name) desc

		

		


