-- customer, employee, inventory, model, sales

SELECT * FROM sales LIMIT 3;


-- Question 1: Retrieve a list of employers, including the first and last
-- names, and the names of their immediate managers. 
SELECT 
a.firstName as EMP_first, 
a.lastName EMP_last, 
b.firstName MANAGER_first,
B.lastName MANAGER_last
FROM employee a JOIN employee b 
ON a.managerId = b.employeeId;


-- Question 2: Get a list of salespeople with zero sales
SELECT employee.firstName ,employee.lastName
FROM employee 
LEFT JOIN sales
ON employee.employeeId = sales.employeeId
WHERE (sales.salesAmount ISNULL) AND (employee.title IS "Sales Person");

-- Question 3: Join Sales and Customer tables
SELECT * FROM customer FULL OUTER JOIN sales 
ON customer.customerId = sales.customerId;