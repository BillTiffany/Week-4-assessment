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
SELECT count(*) from invoice
WHERE total < 5

-- Get the total sum of the orders
SELECT SUM(total) from invoice
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT * 
from invoice_line
WHERE unit_price > .99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_date , c.first_name, c.last_name, i.total
from invoice i
JOIN customer c ON c.customer_id = i.customer_id
ORDER BY total ASC;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
SELECT c.first_name"customer first name", c.last_name "customer last name" , e.first_name "employee first name" , e.last_name "employee last name"
FROM employee e
Join customer c ON c.support_rep_id = e.employee_id;

-- Get the album title and the artist name from all albums.
SELECT a.name, al.title
FROM artist a
JOIN album al on al.artist_id = a.artist_id;

-- SELECT 10 artists in reverse alphabetical order.
SELECT * from artist
  ORDER BY name DESC
  LIMIT 10

-- Select all artists that start with the word 'Black'
 SELECT * from artist
  WHERE name LIKE 'Black%'

--   Select all artists that contain the word 'Black'
 SELECT * from artist
  WHERE name LIKE '%Black%'

--   Find the birthdate for the youngest employee
SELECT MAX(birth_date) from employee

-- Find the birthdate for the oldest employee
SELECT MIN(birth_date) from employee

-- Count how many orders were in CA,TX, or AZ
SELECT COUNT(billing_state) from invoice
  WHERE billing_state IN ('AZ','CA','TX')

--   Get the average of the total orders
SELECT AVG(total) from invoice

-- Get all playlist_track track_ids where the playlist name is Music.
SELECT p.name, pl.playlist_track_id
from playlist p
JOIN playlist_track pl on pl.playlist_id = p.playlist_id
WHERE  p.name = 'Music'

-- Get all track names for playlist_id 5.
SELECT t.name, p.name, pl.playlist_track_id, p.playlist_id
FROM track t
JOIN playlist_track pl ON pl.track_id = t.track_id
JOIN playlist p ON p.playlist_id = pl.playlist_id
WHERE p.playlist_id = 5

-- Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT t.name, p.name 
FROM track t
JOIN playlist_track pl ON pl.track_id = t.track_id
JOIN playlist p ON p.playlist_id = pl.playlist_id
ORDER BY t.name ASC;

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT t.name, a.title, g.name
FROM track t
JOIN album a ON a.album_id = t.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk'