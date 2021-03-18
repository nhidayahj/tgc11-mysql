/* 1 - Display all Sales Support Agents with their first name and last name */
SELECT FirstName, LastName, Title from Employee
WHERE Title = "Sales Support Agent";


/* 2 - Display all employees hired between 2002 and 2003,
 and display their first name and last name */
 SELECT FirstName, lastName, HireDate from Employee
WHERE HireDate >= "2002-01-01" and HireDate <= "2003-12-31";

/* 3 - Display all artists that have the word 'Metal' in their name
 */
 SELECT * from Artist
WHERE Name like "%metal%"
LIMIT 30;

/* 4 - Display all employees which are in sales (sales manager, sales rep etc.) */
SELECT FirstName,LastName,Title from Employee
where Title like "%sales%"
LIMIT 20;


/* 5 - Display the titles of all tracks which has the genre "easy listening" */
/* AFTER Join, then use ON (more efficient, than Join -> WHERE) */
SELECT Track.Name, Genre.Name from Track JOIN Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.GenreId = 12
LIMIT 10;

-- OR 
SELECT Track.Name as 'TrackName', Genre.Name as 'GenreName' from Track JOIN Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Easy Listening"
LIMIT 10;



/* 6 - Display all the tracks from all albums 
along with the genre of each track */
SELECT Album.Title, Track.Name, Track.GenreId FROM Album
JOIN Track 
ON Album.AlbumId = Track.AlbumId

/* 7 - Using the Invoice table, 
show the average payment made for each country  */
SELECT BillingCountry, AVG(Total) from Invoice
GROUP BY BillingCountry

/* 8 - Using the Invoice table, show the average payment made for each country, 
but only for countries that paid more than 1,000 in total */
SELECT BillingCountry, AVG(Total) from Invoice
GROUP BY BillingCountry
HAVING SUM(Total) > 100
LIMIT 10;

/* Q9 */
SELECT Invoice.CustomerId, AVG(Invoice.Total), SUM(Invoice.Total), Customer.Country
FROM Invoice
JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.Country = "Germany"
GROUP BY Invoice.CustomerId, Customer.Country
HAVING SUM(Invoice.Total) > 10;


/* Q10 */
SELECT Album.AlbumId, Album.Title, AVG(Track.Milliseconds)
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
JOIN Album ON Track.AlbumId = Album.AlbumId
WHERE Genre.Name = 'Jazz'
GROUP BY Album.AlbumId, Album.Title;