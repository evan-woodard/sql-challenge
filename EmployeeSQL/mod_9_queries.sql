#Query 1

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

#Query 2

SELECT first_name,
last_name,
hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

#Query 3

SELECT dept_manager.dept_no,
dept_manager.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_manager
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no;

#Query 4

SELECT dept_employee.emp_no,
dept_employee.dept_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_employee
JOIN employees
ON dept_employee.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_employee.dept_no;

#Query 5

SELECT first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

#Query 6

SELECT emp_no,
last_name,
first_name
FROM employees
WHERE emp_no
IN (
	SELECT emp_no
	FROM dept_employee
	WHERE dept_no
	IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	)
;

# Query 8

SELECT LENGTH(last_name) len
FROM employees
GROUP BY last_name
ORDER BY len DESC;