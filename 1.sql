-- create a table 

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY, -- value cannot be null and it must be unique 
    department_name VARCHAR(50) NOT NULL -- "how many characters" can be stored in this column
);

-- insert data into the table

-- DDL - Data Definition Language

INSERT INTO departments (department_name)
VALUES
('sales'),
('suppport'),
('warehouse'),
('IT'),
('HR');


select * from departments;


---------------------------------------------------------------

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    bio TEXT ,
    job_title VARCHAR(50) NOT NULL,
    salary INT NOT NULL CHECK (salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL ,
    last_login TIMESTAMP ,
    employee_status VARCHAR(20) NOT NULL DEFAULT 'active'
                    CHECK(
                        employee_status IN ('active', 'inactive', 'terminated')
                    ),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    -- foreign key constraint , mtlb purane table ka data is table me use kr rhe hai  relation foreign key constraint
    department_id INT REFERENCES departments(department_id),
    manager_id INT REFERENCES employees(employee_id)
)

-- add data 

insert into employees
(first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date)
values
('Priya', 'Nair', 'priya.nair@techbazaar.com', 1, 'Sales Representative', 62000, null, '2020-06-15'),
('Robert', 'Chen', 'robert.chen@techbazaar.com', 1, 'Rep', 50000, null, '2024-01-01'),
('Marcus', 'Webb', 'marcus.webb@techbazaar.com', 1, 'Sales Representative', 58000, null, '2021-09-01'),
('Elena', 'Garcia', 'elena.garcia@techbazaar.com', 1, 'Senior Sales Rep', 68000, null, '2019-11-20'),
('James', 'Okafor', 'james.okafor@techbazaar.com', 2, 'Support Lead', 72000, null, '2018-05-10'),
('Lily', 'Zhang', 'lily.zhang@techbazaar.com', 2, 'Support Agent', 48000, null, '2022-02-14'),
('Diego', 'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent', 46000, null, '2023-01-09'),
('Sara', 'Osei', 'sara.osei@techbazaar.com', 5, 'Warehouse Lead', 55000, null, '2020-08-23');

select * from employees;

-- addition info column add krna hai 

ALTER TABLE employees
ADD COLUMN internal_note varchar(100) NOT NULL DEFAULT 'N/A'

-- rename thhe internal_note column to notes

ALTER TABLE employees
RENAME COLUMN internal_note TO hr_note;

-- drop the hr_note column from the employees table

ALTER TABLE employees
DROP COLUMN hr_note;

---------------------------------------------------------------
-------DML - Data Manipulation Language------------------------


-- 1. categories - prodiucct categories , the "parent" side of one - to many relationship

create table categories(
    category_id varchar(50) primary key,
    category_name varchar(50) not null unique,
    description text
)

