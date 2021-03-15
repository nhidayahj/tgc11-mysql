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