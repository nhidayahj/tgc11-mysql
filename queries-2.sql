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
