-- Active: 1694600651436@@127.0.0.1@5432@Northwind@public
-- 1
SELECT * FROM employees

-- 2
SELECT COUNT(product_id) AS amountOfProducts FROM products

-- 3
SELECT first_name ,last_name ,city, country  
FROM employees
WHERE country = 'USA' AND city <> 'Seattle'
-- WHERE country = 'USA' AND city != 'Seattle'

-- 4
SELECT product_id, supplier_id, unit_price 
FROM products
WHERE supplier_id = 2
ORDER BY unit_price DESC
LIMIT 3

-- 5
SELECT COUNT(product_id) AS amountOfProducts, category_id 
FROM products
GROUP BY category_id
HAVING COUNT(product_id) > 10

--  6
SELECT COUNT(product_id) AS amountOfProducts, category_name 
FROM products INNER JOIN categories
ON products.category_id = categories.category_id
GROUP BY category_name
HAVING COUNT(product_id) > 10

-- 7
SELECT AVG(unit_price) AS avgOfProducts, category_name 
FROM products INNER JOIN categories
ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY avgOfProducts DESC
LIMIT 5

--  8
SELECT first_name, last_name, territory_description
FROM employees INNER JOIN employee_territories
ON employees.employee_id = employee_territories.employee_id
INNER JOIN territories
ON employee_territories.territory_id = territories.territory_id

-- 9
SELECT first_name ||' '|| last_name AS employee_name , COUNT(order_id)
FROM employees INNER JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY employee_name
HAVING COUNT(order_id) > 100

SELECT first_name, last_name, COUNT(order_id)
FROM employees INNER JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY employees.employee_id
HAVING COUNT(order_id) > 100