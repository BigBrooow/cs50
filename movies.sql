--1
SELECT title FROM movies WHERE year = 2008;

--2
SELECT birth FROM people WHERE name = "Emma Stone";

--3
SELECT title FROM movies WHERE year >= 2018 ORDER BY title ASC;

--4
SELECT COUNT(movies.title) FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE rating = 10.0;

--5
SELECT title, year FROM movies WHERE title LIKE "Harry Potter%" ORDER BY year ASC;

--6
SELECT AVG(ratings.rating) FROM ratings JOIN movies ON ratings.movie_id = movies.id WHERE year = 2012;

--7
SELECT movies.title, ratings.rating FROM movies JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.year = 2010 ORDER BY ratings.rating DESC, title ASC;

--8
SELECT people.name FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id
WHERE movies.title = "Toy Story";

--9
SELECT DISTINCT people.name FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id
WHERE movies.year = 2004 ORDER BY people.birth ASC;

--10
SELECT DISTINCT people.name FROM people JOIN directors ON people.id = directors.person_id
JOIN ratings ON directors.movie_id = ratings.movie_id WHERE ratings.rating >= 9.0;

--11
SELECT DISTINCT people.name FROM people JOIN directors ON people.id = directors.person_id
JOIN ratings ON directors.movie_id = ratings.movie_id WHERE ratings.rating >= 9.0;

--12
SELECT movies.title FROM movies INNER JOIN stars ON movies.id = stars.movie_id INNER JOIN people ON stars.person_id = people.id
WHERE people.name = "Johnny Depp" AND movies.title IN (SELECT title FROM movies INNER JOIN stars ON movies.id = stars.movie_id
INNER JOIN people ON stars.person_id = people.id WHERE people.name = "Helena Bonham Carter");

--13
SELECT movies.title FROM movies INNER JOIN stars ON movies.id = stars.movie_id INNER JOIN people ON stars.person_id = people.id
WHERE people.name = "Johnny Depp" AND movies.title IN (SELECT title FROM movies INNER JOIN stars ON movies.id = stars.movie_id
INNER JOIN people ON stars.person_id = people.id WHERE people.name = "Helena Bonham Carter");
