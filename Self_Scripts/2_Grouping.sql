-- customer, employee, inventory, model, sales
select * from sales limit 3;
select * from inventory limit 3;

-- Question 1: How many cars have been sold per employee
SELECT firstName, lastName, COUNT(inventoryId) AS Cars_Sold
FROM sales 
JOIN employee 
ON employee.employeeId == sales.employeeId
GROUP BY sales.employeeId
ORDER BY Cars_Sold DESC;


-- Question 2: Find the least and most expensive car sold by each employee
-- using cte
with leastExp as(
select employee.firstName, employee.lastName ,employee.employeeId, min(salesAmount) as leastExpensive 
from sales 
JOIN employee 
on sales.employeeId == employee.employeeId
group by sales.employeeId ),
mostExp as(
select employeeId, max(salesAmount) as mostExpensive 
from sales
group by employeeId)
select leastExp.firstName, leastExp.lastName ,leastExp.employeeId, leastExpensive, mostExpensive
from leastExp JOIN mostExp
ON leastExp.employeeId == mostExp.employeeId;

-- without cte
select 
employee.firstName, 
employee.lastName,
min(salesAmount) as leastExpensive,
max(salesAmount) as mostExpensive 
from sales 
JOIN employee 
on sales.employeeId == employee.employeeId
group by sales.employeeId;

-- Question 3: Display a report of employees who have sold more than 5 cars
-- without using having
SELECT * FROM
(SELECT firstName, 
lastName, 
employee.employeeId,
COUNT(inventoryId) AS Cars_Sold
FROM sales 
JOIN employee 
ON employee.employeeId == sales.employeeId
GROUP BY sales.employeeId
ORDER BY Cars_Sold DESC)
WHERE Cars_Sold > 5;

-- using having
SELECT firstName, 
lastName, 
employee.employeeId,
COUNT(inventoryId) AS Cars_Sold
FROM sales 
JOIN employee 
ON employee.employeeId == sales.employeeId
GROUP BY sales.employeeId
HAVING Cars_Sold > 5
ORDER BY Cars_Sold DESC;