
 -- Data Analysis


--1 List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2 List the employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3 List the manager of each department with the following information: department number, department name, manager's employee number, lastname, first name, and start and end dates.

SELECT departments.dpet.no, departments.dept_name, departments_emp_no, employees.last_name, employees_first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dpet_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4 List the department of each employee with the following information; employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

--5 List all employees whose name is "Herculees" and last name begins "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6 List all employees in the Sales department, including their employee number, last name, first name, and department
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dep_name = 'Sales' 


--7 List all employees in the Sales and Devolopment departments, including thier employee number, last name, first name and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dep_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dep_name = 'Sales' 
OR departments.dep_name = 'Development';

--8 In descending order, list the frequency count of employee last names, i.e how many employees share each last name.
SELECT last_name, 
COUNT (last_name) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;