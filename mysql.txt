DDL - Data Definition language, Schema
DML - CRUD Data Manipulation Language

/********************************
SQL Searches
*********************************/

SELECT * FROM movies WHERE year = 1999 AND title = "The Matrix";
SELECT * FROM movies WHERE year = 1999 OR year = 2000;
SELECT * FROM movies WHERE year BETWEEN 1999 AND 2000;
SELECT * FROM movies WHERE title LIKE "%godfather%";
SELECT * FROM movies ORDER BY year;
SELECT * FROM movies ORDER BY year ASC;
SELECT * FROM movies ORDER BY year DESC;
SELECT * FROM movies ORDER BY year ASC, title DESC;
SELECT * FROM movies LIMIT 10 OFFSET 20;
SELECT * FROM movies WHERE year IS NULL;
SELECT * FROM movies WHERE year IS NOT NULL ORDER BY year;

/********************************
C.R.U.D
*********************************/
{CREATE SCHEMA movie_db_1; | CREATE DATABASE movie_db_1;}
  #create's database
CREATE DATABASE IF NOT EXISTS movie_db_1 DEFAULT CHARACTER SET utf8;
CREATE TABLE movies (title VARCHAR(200) NOT NULL, year INTEGER);
  #if not specified, NULL is the default value
CREATE TABLE products (name VARCHAR(100), description TEXT, stock_ct INTEGER);
CREATE TABLE IF NOT EXISTS movies (title VARCHAR(200) NOT NULL, year INTEGER);
{
  INSERT INTO movies VALUES ("Avatar, 2009"); |
  INSERT INTO movies (year, title) VALUES (2009, "Avatar"), (NULL, "Avatar 2");
}
INSERT INTO movies SET title="Back to the Future", year = 1985;
UPDATE movies SET year=2015 WHERE title="Avatar 2";
UPDATE movies SET year=2016, title="Avatar Reloaded" WHERE title="Avatar 2";
DELETE FROM movies WHERE title="Avatar Reloaded" AND year =2016;

*********************************/
Manipulating Schema
*********************************/
RENAME TABLE movies TO movie_table, actors TO actors_table;
DROP TABLE IF EXISTS reviews; #deletes whole table
TRUNCATE [TABLE] movie_table; #deletes rows but preserves table

add column, change columns name/ change columns type
ALTER TABLE movie_table ADD COLUMN genre VARCHAR(100);
ALTER TABLE actors_table ADD (pob VARCHAR(100), dob DATE);
ALTER TABLE actors_table CHANGE [COLUMN] pob place_of_birth VARCHAR(100);
ALTER TABLE actors_table CHANGE dob date_of_birth DATE;
  #ALTER is unable to change multiple columns in the same line
ALTER TABLE movie_table CHANGE year year_released YEAR;
  #renames column and changes type from integer to year
ALTER TABLE actors DROP COLUMN place_of_birth; #delete column

*********************************/
Normalization
*********************************/
Describes the process of setting up a table that contains redundant data from
one column of a table and putting that info into another table

Customer Transactions

Jones
Tr. ID	Date	      Amount
12890	  14-Oct-2003	−87
12904	  15-Oct-2003	−50
Wilkinson
Tr. ID	Date	      Amount
12898	  14-Oct-2003	−21
Stevens
Tr. ID	Date	      Amount
12907	  15-Oct-2003	−18
14920	  20-Nov-2003	−70
15003	  27-Nov-2003	−60

Customer	Cust. ID
Jones	    1
Wilkins	  2
Stevens	  3

Cust. ID	Tr. ID	Date	        Amount
1	        12890	  14-Oct-2003	  −87
1	        12904	  15-Oct-2003	  −50
2	        12898	  14-Oct-2003	  −21
3	        12907	  15-Oct-2003	  −18
3	        14920	  20-Nov-2003	  −70
3	        15003	  27-Nov-2003	  −60

*********************************/
Keys and Auto-Incrementing Values
*********************************/
Primary Keys, id
  Used to uniquely define each row in a table
  Can't be duplicated or null
Unique Keys, email address, SSN
  Can't be duplicated
  Can be null unless otherwise specified
Foreign Keys, genre_id
  Describe relationship between data in two tables, can be null, can be
  duplicated

CREATE TABLE genres (id INTEGER AUTO_INCREMENT PRIMARY KEY, name VARCHAR(30)
  NOT NULL UNIQUE [KEY]);
INSERT INTO genres (name) VALUES("Sci Fi");
ALTER TABLE movies ADD [COLUMN] id INTEGER AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE movies
  ADD COLUMN genre_id INTEGER NULL,
  ADD CONSTRAINT FOREIGN KEY (genre_id) REFERENCES genres(id);

UPDATE movies SET genre_id = 1 where id = 8 or id = 9
  #creates

SELECT * FROM movies JOIN genres ON movies.genre_id = genres.id;
  #common information from inside the circle

SELECT movies.title AS movie_title , genres.name AS genre_name
FROM movies LEFT OUTER JOIN genres
ON movies.genre_id = genres.id
WHERE genres.name IS NOT NULL;
    #AS queries return column titles without modifying the table itself

SELECT movies.title, genres.name FROM movies
  INNER JOIN genres ON movies.genre_id = genres.id;
    #INNER JOIN to join the 'movies' and 'genres' tables together only
    selecting the movie 'title' first and the genre 'name' second.

*********************************/
Numeric and Aggregate Functions
*********************************/
SELECT COUNT(id) AS review_count FROM reviews WHERE movie_id =1;
SELECT MIN(score) AS minimun_score, MAX(score) AS maximun_score,
  AVG(score) AS average FROM reviews WHERE movie_id=1;
SELECT MIN(score) AS min_score FROM reviews WHERE movie_id=2;
  #"reviews" table, with columns "score" and "movie_id", return the minimum
  score for the movie with the id of 2. Alias the minimum score as "min_score".
SELECT AVG(score) AS average_all_scores FROM reviews;

SELECT movie_id MIN(score) AS minimun_score, MAX(score) AS maximun_score,
  AVG(score) AS average FROM reviews GROUP BY movie_id;
    #all movie_id by avg score
SELECT title MIN(score) AS minimun_score,
  MAX(score) AS maximun_score,
  IFNULL (AVG(score), 0) AS average
  FROM movies LEFT OUTER JOIN reviews
  ON movies.id = reviews.movie_id
  GROUP BY movie_id HAVING average > 3;
    #all movie titles by avg score
    #HAVING "WHERE" of aggregates
SELECT AVG(score) AS average FROM reviews GROUP BY movie_id;
  #group all reviews by "movie_id" and get avg "score" and alias it by "average"

SELECT title, IFNULL(AVG(score), 0) AS average
  FROM movies LEFT OUTER JOIN reviews
  ON reviews.movie_id = movies.id
  GROUP BY movie_id HAVING average < 2;
    #Select the average "score" as "average", setting to 0 if null, by
     grouping the "movie_id" from the "reviews" table. Also, do an outer join on
     the "movies" table with its "id" column and display the movie "title" before
     the "average". Finally, include averages under 2.
*********************************/
String Functions
*********************************/
SELECT CONCAT(first_name," ", last_name) AS full_name,
 CONCAT(SUBSTRING(LOWER(email), 1, 10), "...") AS partial_email,
 LENGTH(username) AS username_length
 FROM users HAVING username_length < 19;

SELECT LOWER(email) AS lower_email FROM users;
SELECT CONCAT(first_name, " (", username, ")") AS display_name FROM users;
  #Andrew (chalkers)
SELECT CONCAT(SUBSTRING(UPPER(first_name), 1, 1) , ". ",
  UPPER(last_name)) AS "name" FROM users;
    #A. CHALKERS
*********************************/
Indexing Columns
*********************************/
CREATE INDEX last_name_idx ON users(last_name);
*********************************/
Users
*********************************/
GRANT SELECT
ON treehouse_movie_db.*
TO user1@localhost
IDENTIFIED BY 'password';
  #only read

FLUSH PRIVILEGES;
   #after creating user

GRANT SELECT, INSERT, UPDATE, DELETE
ON `treehouse_movie_db`.*
TO user2@localhost
IDENTIFIED BY 'password';
  #read/write/delete

GRANT ALTER, CREATE, DROP
ON `treehouse_movie_db`.*
TO user3@localhost
IDENTIFIED BY 'password';
  #schema changes
