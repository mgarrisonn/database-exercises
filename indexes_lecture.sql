# USE employees;
#
# DESCRIBE departments;
#
# SHOW CREATE TABLE departments;
# CREATE TABLE `departments` (
#                                `dept_no` char(4) NOT NULL,
#                                `dept_name` varchar(40) NOT NULL,
#                                PRIMARY KEY (`dept_no`),
#                                UNIQUE KEY `dept_name` (`dept_name`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8

USE codeup_test_db;

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
    id INT UNSIGNED,
    pet_name VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age INT
);

DESCRIBE pets;


-- add a primary key
ALTER TABLE pets
MODIFY COLUMN id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;


-- drop a primary key
ALTER TABLE pets
MODIFY COLUMN id INT;

ALTER TABLE pets
DROP PRIMARY KEY;

SHOW CREATE TABLE pets;


-- Define the primary key on table creation statement
DROP TABLE pets;

CREATE TABLE pets (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    pet_name VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age INT
);

DESCRIBE pets;


-- Define a primary key for multiple columns (demo - not in class)
DROP TABLE pets;

CREATE TABLE pets (
     id INT UNSIGNED AUTO_INCREMENT,
     pet_name VARCHAR(30) NOT NULL,
     owner_name VARCHAR(30),
     age INT,
     PRIMARY KEY (id, age)
);

DESCRIBE pets;


-- Add name index
ALTER TABLE pets
ADD INDEX `pet_name_key` (pet_name);

-- Drop name index
ALTER TABLE pets
DROP INDEX `pet_name_key`;

SHOW INDEX FROM pets;


-- =========Unique Index==========
-- create pets with unique name and owner
-- create using CREATE TABLE
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
    id INT UNSIGNED AUTO_INCREMENT,
    pet_name VARCHAR(30) NOT NULL,
    owner_name VARCHAR(30),
    age INT,
    PRIMARY KEY (id),
    UNIQUE unique_pn_on (pet_name, owner_name)
);

DESCRIBE pets;


-- test unique constraint
INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Fred', 2);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Snickers', 'Jack Smith', 3);

INSERT INTO pets (pet_name, owner_name, age)
VALUES ('Buddy', 'Jack Smith', 6);


-- Foreign keys
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(255) DEFAULT 'Undisclosed'
);

DESCRIBE owners;


DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
    id INT UNSIGNED AUTO_INCREMENT,
    pet_name VARCHAR(30) NOT NULL,
    owner_id INT UNSIGNED,
    age INT,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES owners(id)
);

DESCRIBE pets;


INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 2);

SELECT * FROM owners;

INSERT INTO owners (name, address)
VALUES ('Darth Vader', '1337 Death Star Rd');

INSERT INTO owners (name, address)
VALUES ('Boba Fett', '9 Death Star Rd');

INSERT INTO owners (name)
VALUES ('General Organa');

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Jabba', 2, 2);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Starlord', 3, 1);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Eve', 1, 3);

SELECT * FROM pets;

-- list the name and address of a pet
-- Join a.k.a. "INNER JOIN"
USE codeup_test_db;

SELECT pets.pet_name, owners.address FROM pets
JOIN owners ON pets.owner_id = owners.id;

-- LEFT JOIN
SELECT pets.pet_name, owners.address FROM pets
LEFT JOIN owners ON pets.owner_id = owners.id;

-- RIGHT JOIN
SELECT pets.pet_name, owners.address FROM pets
RIGHT JOIN owners ON pets.owner_id = owners.id;


-- Associative join on 3 tables
USE employees;

-- Find full name and department for employee id of 10001
SELECT CONCAT(employees.first_name, ' ', employees.last_name)AS 'Full Name', departments.dept_name AS 'Department' FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE employees.emp_no = 10001;




