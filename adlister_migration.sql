CREATE DATABASE IF NOT EXISTS adlister_db;

USE adlister_db;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
      id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
      email VARCHAR(100),
      password VARCHAR(100) NOT NULL,
      user_name VARCHAR(100)
);

DROP TABLE IF EXISTS ads;

CREATE TABLE IF NOT EXISTS ads (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       title VARCHAR(100),
       description VARCHAR(100),
       user_id INT REFERENCES users(id)
);

DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories (
       id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       description VARCHAR(100)
);
DROP TABLE IF EXISTS ad_category;
CREATE TABLE IF NOT EXISTS  ad_category (
       ad_id INT REFERENCES ads(id),
       category_id INT REFERENCES categories(id)
);


# For a given ad, what is the email address of the user that created it?
SELECT email
FROM users
WhERE id IN (
    SELECT user_id
    FROM ads
    WHERE id = n
    );

# For a given ad, what category, or categories, does it belong to?
SELECT category_name
FROM ads AS a
JOIN ad_category ac ON a.id = ac.ad_id
JOIN categories c ON ac.ad_id = c.id
WHERE a.id = n;


# For a given category, show all the ads that are in that category.
SELECT a.id, a.title
FROM categories c
JOIN ad_category ac on c.id = ac.category_id
JOIN ads a on ac.ad_id = a.id
WHERE c.name = 'my category name' ORDER BY a.id;


# For a given user, show all the ads they have posted
SELECT a.id, a.title
FROM users u
JOIN ads a ON u.id = a.user_id
WHERE u.name = 'my user name' OR WHERE u.id = n (if known)
ORDER BY a.id;