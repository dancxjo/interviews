-- Top earners by department
SELECT em1.name, dept.name, em1.salary 
FROM employees em1
JOIN (SELECT dept_id, MAX(salary) AS maxSalary FROM employees) em2
  ON em1.dept_id = em2.dept_id AND em1.salary = em2.maxSalary
JOIN departments dept 
  ON em1.dept_id = dept.id;

-- Employees earning more than the department average
SELECT em1.name, dept.name, em1.salary, em2.avgSalary
FROM employees em1
JOIN (SELECT dept_id, AVG(salary) AS avgSalary FROM employees) em2
  ON em1.dept_id = em2.dept_id AND em1.salary > em2.avgSalary
JOIN departments dept
  ON em1.dept_id = dept.id;
