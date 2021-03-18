SELECT customerNumber, creditLimit FROM customers
WHERE creditLimit > (SELECT AVG(creditLimit) from customers)
