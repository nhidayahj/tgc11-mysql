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


insert into Parents(surname, given_name, email) 
    VALUES ('Gadot', 'Gull', 'gull@gadot.com.sg'),
            ('Smeg', 'Amira', 'aamira@test.com');

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

/* Foreign Keys */ 
-- line 96 creates the column 
-- line 97 defines the foreign key 
-- forign key data type MUST Follow the data type of the referenced table
create table Students (
    student_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key(parent_id) references Parents(parent_id)
)engine=innodb;

insert into Students(surname,given_name,date_of_birth, parent_id)
    VALUES ('Phua', 'Jonathan', '2001-04-05', 1);

insert into Students(surname,given_name,date_of_birth, parent_id)
    VALUES ('Sue', 'Lexi', '2001-01-20', 2);


create table Sessions (
    sess_id int unsigned auto_increment primary key,
    venue_id int unsigned,
    foreign key(venue_id) references Venues(venue_id)
)engine=innodb;

insert into Sessions (venue_id) 
    VALUES ()


/* 3 delete rules for Foreign key */
-- on delete restrict (default / normal)
-- on delete cascade (most convenient but MOST dangerous)
-- on delete set null (only when the data type is set to null)
-- using soft / fake delete (However, illegal)
-- 

create table CertificateStudent (
    certificate_student_id int unsigned auto_increment primary key,
    student_id int unsigned,
    certificates_id int unsigned,
    award_date date not null,
    foreign key(student_id) references Students(student_id),
    foreign key(certificates_id) references Certificates(certificates_id)
)engine=innodb;

insert into CertificateStudent(student_id, certificates_id, award_date)
    VALUES (2, 3, '2015-06-01');



/* ALTERING TABLE */ 

-- Add a new column to an existing table
alter table Students add gender varchar(1) not null;

-- rename a column 
alter table Students rename column surname to last_name;
alter table Students rename column given_name to first_name;

-- Modify the definition of a column 
alter table Students modify gender varchar(1); -- chnages the Gender from Not Null to YES 


-- assumes we have a table named 'Fake'
drop table Fake; -- delete a table 