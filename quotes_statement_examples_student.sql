USE quotes_db;


/*********************** SELECT ***********************/

-- TODO TOGETHER: View the author last name and the quote from quotes. Before the output, add a caption explaining the results.
SELECT 'These are author last name' AS 'First Select Query';
SELECT author_last_name, quote FROM quotes;

-- TODO TOGETHER: Select all information from the quotes table. Before the output, add a caption explaining the results.
-- Notice how the id has been auto-incrementing on each insert.
SELECT 'This is all the info from the quotes table' AS '2nd Select query';
SELECT * FROM quotes;

/*********************** WHERE ***********************/

-- TODO TOGETHER: View quotes by Douglas Adams.
SELECT id, author_first_name, author_last_name, quote
FROM quotes
WHERE author_last_name = 'Adams';


-- TODO TOGETHER: View quotes by Douglas Adams. Add a caption.
-- As '' allows us to name the table we have chosen
SELECT quote AS 'Douglas Adams quotes'
FROM quotes
WHERE author_last_name = 'Adams';


-- TODO TOGETHER: View quote with primary key (in this case id) of 5
SELECT quote AS 'id number 5 quote'
FROM quotes
WHERE id = 5;


-- TODO TOGETHER: Select all from quotes where quote contains(is like) "the"
SELECT *
FROM quotes
Where quote LIKE '%the%';






/*********************** UPDATE ***********************/
-- TODO TOGETHER: View all quotes
SELECT *
FROM quotes;


-- TODO TOGETHER: Update quote 4 to first name = Samuel and last name = Clemens
SELECT author_first_name, author_last_name
FROM quotes
WHERE id = 4

UPDATE quotes
SET author_first_name = 'Samuel', author_last_name = 'Clemens'
WhERE id = 4;

/*********************** DELETE ***********************/

-- TODO TOGETHER: Delete quote with id 3. Then view the output.
SELECT quote
FROM quotes
WHERE id = 3;

DELETE
FROM quotes
WHERE id = 3;


/*********************** TRUNCATE ***********************/
-- TODO TOGETHER: Truncate quotes table.... there is no going back! Deletes all records.
TRUNCATE quotes;

