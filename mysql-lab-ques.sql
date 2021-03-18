-- 1 - Find all the offices and display only their city, phone and country
select city, phone, country from offices;

-- 2 - Find all rows in the orders table that mentions FedEx in the comments.
select * from orders where comments like "%FedEx%"

-- 3 - Display all the orders bought by the customer with the customer number 124, 
-- along with the customer name, the contact's first name and contact's last name.
SELECT orders.*, customers.customerName, customers.contactLastName, customers.contactFirstName FROM customers JOIN orders ON orders.customerNumber = customers.customerNumber
	WHERE customers.customerNumber = 124;


-- 4. Show the contact first name and contact last name of all customers in descending order by the customer's name
SELECT contactFirstName, contactLastName FROM customers order by customerName DESC;


-- 5 - Find all sales rep who are in office code 1, 2 or 3 
-- and their first name or last name contains the substring 'son'
SELECT * FROM employees where JobTitle = "Sales Rep" and (officeCode = 1 or officeCode = 2 or officeCode = 3) 
and (firstName like "%son%" or lastName like "%son%")

-- simplify 
SELECT * from employees where jobTitle = "Sales Rep" and (firstName like "%son%")
-- or 
SELECT * from employees where jobTitle = "Sales Rep"
and (firstName LIKE "%son%" OR lastName LIKE "%son%") and
officeCode in (1,2,3);


-- 6 - Show the name of the product, together with the order details,  for each order line from the orderdetails table
SELECT orderdetails.orderNumber, products.productCode, products.productName FROM orderdetails 
join products on orderdetails.productCode = products.productCode


7 - Show how many employees are there for each state in the USA	
-- ALWAYS FK in TABLE TO PK TO ANOTHER TABLE 
SELECT state,count(*) FROM employees JOIN offices 
	ON employees.officeCode = offices.officeCode
	GROUP BY state


/* 8 - From the payments table, display the average amount spent by each customer. 
Display the name of the customer as well. */

SELECT customers.customerNumber, customerName, AVG(amount) as averageAmount from payments JOIN customers 
	ON payments.customerNumber = customers.customerNumber
	GROUP BY customers.customerNumber, customers.customerName

-- 9 - From the payments table, display the average amount spent by each customer but 
-- only if the customer has spent a minimum of 10,000 dollars.

SELECT customers.customerNumber, customerName, AVG(amount) as averageAmount from payments JOIN customers 
	ON payments.customerNumber = customers.customerNumber
	GROUP BY customers.customerNumber, customers.customerName
	HAVING AVG(amount) > 10000
	ORDER BY AVG(amount) DESC 
	LIMIT 10

/* 10  - For each product, display how many times it was ordered, 
and display the results with the most orders first and only show the top ten. */
SELECT productCode, count(*) FROM orderdetails
GROUP BY productCode 
ORDER BY count(*) DESC
LIMIT 10

/* 11 - Display all orders made between Jan 2003 and Dec 2003 */
-- preferred solution (using DAY, MONTH, YEAR funcs)
SELECT * FROM orders
WHERE YEAR(orderDate) = 2003;

-- OR 
SELECT * FROM orders
WHERE orderDate >= "2003-01" AND orderDate <= "2003-12"

/* 12 - Display all the number of orders made, per month, between Jan 2003 and Dec 2003 */ 
SELECT MONTH(orderDate), count(*) FROM orders
WHERE YEAR(orderDate) = "2003"
GROUP BY MONTH(orderDate)