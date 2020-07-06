USE codeup_test_db;

DROP TABLE IF EXISTS contacts;

CREATE TABLE IF NOT EXISTS contacts(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number INT,
    created_at DATETIME,
    updated_at DATETIME,
    PRIMARY KEY (id)
);

