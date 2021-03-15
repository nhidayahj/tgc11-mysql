/* logging in */
mysql -u root

/* see all databases */
show databases;

/* create a database */
create database swimming;

/* switch database */
use swimming;

/* show all tables */
show tables;

/* describe a table name*/ 
describe <table_name>;

/* TIP FOR using mySQL and text editor to type in sql Queries */
-- 1. the .sql file extension enables the editor to recognise sql queries
--  then copy paste into mysql terminal
-- 2. if auto-increment for PK is defined, then NO NEED to insert 
-- PK when inserting into Table
-- 2.i, else must include PK value when inserting 





-- create table
-- column in separarted by comma
-- must set maximum size 1. reserved/to save space(optimization) 
-- 2. security reason 
-- not null: means compulsory
-- engine=innodb is for the FK (foreign keys) to work in SQL
create table Parents (
    parent_id int unsigned auto_increment primary key,
    surname varchar(50) not null,
    given_name varchar(50) not null,
    email varchar(350) not null
) engine=innodb;


-- insert one row into table 
insert into Parents(surname, given_name, email) 
    VALUES ('Phua', 'Chu Kang', 'pck@phua.com.sg');

-- add many rows
-- separate by commas, and end with ;
insert into Parents(surname, given_name, email)
    VALUES ('Sue', 'Mary', 'mary_sue@hello.com'),
            ('John', 'Smith', 'john@smith.com');


-- see all rows in a table
select * from Parents;

-- Hands-On Practice for Swimming Lesson 
-- 1. Creating Certificates table --
create table Certificates (
    certificates_id int unsigned auto_increment primary key,
    title varchar(200) not null
)engine=innodb;


-- 1.i Create Venues table 
-- 'address' and 'name'is a reserved keyword in mySql
-- to really use such a keyword, surround with quotes 

create table Venues (
    venue_id int unsigned auto_increment primary key,
    address varchar(500) not null
)engine=innodb;

-- Insert rows into Certificate table 
insert into Certificates(title)
    VALUES ("Basic Swimming Techniques"),
            ("Basic Life-Saving Skills"),
            ("Advanced Life-Saving Skills");

-- Insert into Venues table
insert into Venues(address) 
    VALUES ("Yishun Swimming Complex"),
            ("Sengkang Swimming Complex");

describe Venues;