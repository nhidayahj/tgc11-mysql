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
insert into Parents(surname, given_name, email)
    VALUES ('Sue', 'Mary', 'mary_sue@hello.com'),
            ('John', 'Smith', 'john@smith.com');


-- see all rows in a table
select * from Parents;