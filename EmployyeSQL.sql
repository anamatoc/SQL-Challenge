SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles



-- employee and salaries

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
--INTO emp_salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no 
ORDER BY e.emp_no

-- List first name
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
order by e.hire_date;

-- List the manager of each department 

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
		JOIN dept_manager AS dm
		ON d.dept_no=dm.dept_no
			JOIN employees AS e
			ON dm.emp_no = e.emp_no;
			
-- List the department number for each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
	WHERE e.first_name = 'Hercules'
	AND e.last_name LIKE 'B%'
	
	
-- List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE d.dept_name = 'Sales';
		
		
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT e.last_name, COUNT(*) AS frecuency
FROM employees AS e
GROUP BY e.last_name
ORDER BY frecuency DESC;








