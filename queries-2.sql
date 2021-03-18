create database Employees;

create table Departments (
    department_id tinyint unsigned auto_increment primary key, 
    `name` varchar(100) not null
)engine=innodb;

create table Taskforce (
    taskforce_id tinyint unsigned auto_increment primary key,
    `name` varchar(100)
)engine=innodb;

insert into Departments(`name`) 
    VALUES ("Finance"),
            ("Human Resource"),
            ("Data Scientist"),
            ("Developer");

insert into Taskforce(`name`)
    VALUES ("Green Campaign"),
            ("Smart Community");

create table Employees (
    employee_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_service datetime not null,
    department_id tinyint unsigned,
    foreign key(department_id) references Departments(department_id)
)engine=innodb;

insert into Employees(surname,given_name,date_of_service,department_id)
    VALUES  ("Kang", "Esther", "2017-08-10", 4),
            ("Inix", "Meddea", "2017-04-22", 3);

create table Em_Address (
    address_id int unsigned auto_increment primary key,
    blk_number varchar(100) not null,
    street varchar(100) not null, 
    unit_code varchar(100) not null,
    postal_code varchar(100) not null,
    employee_id int unsigned,
    foreign key(employee_id) references Employees(employee_id)
)engine=innodb;

insert into Em_Address(blk_number, street, unit_code, postal_code, employee_id)
    VALUES ("643", "Yishun St 62", "09090", "760643",2 );

create table Employee_Taskforce (
        em_taskforce_id tinyint unsigned auto_increment primary key,
        emp_role varchar(100) not null,
        employee_id int unsigned,
        taskforce_id tinyint unsigned,
        foreign key(employee_id) references Employees(employee_id),
        foreign key(taskforce_id) references Taskforce(taskforce_id)
     )engine=innodb;


-- select only certain columns 
select firstName,lastName from employees;

-- show columns based on conditions 
select firstName,lastName,email from employees where officeCode = 1;

-- show rows with substring a wildcard % 
select * from employees where jobTitle like "%Sales%";

-- search with condition AND 
SELECT * FROM employees where officeCode = 1 AND jobTitle = "Sales";

-- using NOT operator 
SELECT * FROM employees where officeCode != 1 and officeCode != 4;
-- SAME AS 
select * from employees where officeCode not in (1,4)


-- Order and priority with using condition 
-- the AND has higher priority
SELECT * FROM employees where officeCode = 4 or officeCode = 1 and jobTitle = "Sales Rep"

-- the brackets makes a Difference too 
SELECT * FROM employees where (officeCode = 4 or officeCode = 1) and jobTitle = "Sales Rep"

-- using a JOIN command 
SELECT firstName, lastName, city, state, addressLine1, addressLine2 FROM employees 
join offices on employees.officeCode = offices.officeCode

-- JOIN takes FIRST priority 
-- follwed by 'WHERE'
-- then lastly SELECT
SELECT firstName, lastName, jobTitle, city, state, addressLine1, addressLine2 FROM employees 
join offices on employees.officeCode = offices.officeCode
where jobTitle = "Sales Rep"


-- 3-way join 
 SELECT customers.customerName, employees.firstName, employees.lastName, offices.city FROM customers join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
join offices 
on employees.officeCode = offices.officeCode;


SELECT customers.customerName, employees.firstName, employees.lastName, offices.city 
FROM customers join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
join offices 
on employees.officeCode = offices.officeCode
where customers.country = "France" or customers.country="USA"
order by customers.customerNumber
limit 3 -- limit first 3 

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