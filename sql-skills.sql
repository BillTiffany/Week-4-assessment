-- Add 3 new artists to the artist table using INSERT. (It’s already created.)
INSERT into artist (name)
VALUES ('Rob Zombie'),('Korn'),('David Bowie')
-- Select 5 artists in alphabetical order.
SELECT * from artist
ORDER BY name ASC
limit 5

-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name, city from employee
where city = 'Calgary'

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee
where reports_to = 2

-- Count how many people live in Lethbridge.
SELECT COUNT(*) from employee
WHERE city = 'Lethbridge'

-- Count how many orders were made from the USA.
SELECT COUNT(*) from invoice
where billing_country = 'USA'

-- Find the largest order total amount.
SELECT MAX(total) from invoice

-- Find the smallest order total amount.
SELECT MIN(total) FROM invoice;

-- Find all orders bigger than $5
SELECT * from invoice
WHERE total > 5
ORDER BY total ASC

-- Count how many orders were smaller than $5
