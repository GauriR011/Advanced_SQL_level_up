-- customer, employee, inventory, model, sales
select * from sales limit 3;

-- Question 1: Summarize sales per year using CTE
with cte as (
select 
strftime('%Y', soldDate) AS soldYear, 
Round(SUM(salesAmount),2) AS TotalSales
from sales 
GROUP BY soldYear)
select 
soldYear, 
FORMAT("$%.2f", TotalSales) AS AnnualSales
FROM cte; 


-- Question 2: Display the number of sales for each employee by month for 2021
select sales.employeeId, firstName, lastName,
strftime('%m', soldDate) AS saleMonth,
strftime('%Y', soldDate) AS soldYear,
-- FORMAT("$%.2f", sum(salesAmount)) as MonthlySales
sum(salesAmount) as MonthlySales
FROM sales
JOIN employee
ON employee.employeeId = sales.employeeId 
GROUP BY saleMonth, sales.employeeId
HAVING soldYear = '2021'
ORDER BY saleMonth ASC, MonthlySales DESC;

select 
--sales.employeeId, firstName, lastName,
strftime('%m', soldDate) AS saleMonth,
strftime('%Y', soldDate) AS soldYear,
FORMAT("$%.2f", sum(salesAmount)) as MonthlySales
FROM sales
--JOIN employee
--ON employee.employeeId = sales.employeeId 
GROUP BY saleMonth
--, sales.employeeId
HAVING soldYear = '2021'
--ORDER BY saleMonth ASC, MonthlySales DESC;