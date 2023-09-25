--1. Write a DQL statement to retrieve the average of average rating from the `title_ratings__v` view for all records that have *tconst* starting with `tt0000`.

SELECT AVG("average_rating") as average_of_average FROM "title_ratings__v"
WHERE "tconst" LIKE 'tt0000%';

--2. Write a DQL statement to retrieve ids of the titles and their average ratings from the `title_ratings__v` view, selecting only titles with more than 1000 votes.

SELECT "tconst", "average_rating" FROM "title_ratings__v"
WHERE "num_votes" > 1000;

--3. Write a DQL statement to retrieve the titles from the `title_basics__v` view that are in the genre *Comedy* and have a *runtime* greater than 90 minutes.

SELECT "primary_title" FROM "title_basics__v"
WHERE "genres" = 'Comedy' AND "run_time_minutes" > 90;

--4. Write a DQL statement to retrieve the titles from the `title_basics__v` view that have a *title type* of *Movie* and have a *start year* between 1900 and 1920.

SELECT "primary_title" FROM "title_basics__v"
WHERE "title_type" = 'Movie' AND "start_year" BETWEEN 1900 AND 1920;

--5. Write 3 separate queries:
    -- List 25 longest living actors in movie industry and their age, oldest persons first.
    -- List all producers whose names start with a letter M.
    -- List all producers whose surnames start with a letter N.
--1
SELECT "primary_name", ("death_year" - "birth_year") AS age FROM "name_basics__v"
WHERE "primary_profession" LIKE '%actor%'
ORDER BY age DESC
LIMIT 25;
--2
SELECT "primary_name" FROM "name_basics__v"
WHERE "primary_profession" LIKE '%producer%' AND "primary_name" LIKE 'M%';
--3
SELECT "primary_name" FROM "name_basics__v"
WHERE "primary_profession" LIKE '%producer%' AND "primary_name" LIKE '% N%';

--6. Write 2 separate queries:
    -- Select title ids and title ratings for movies with rating between 7 and 10 using the BETWEEN statement
    -- Do the same thing as above WITHOUT using the BETWEEN statement.
    -- Order the results by average rating descending

--1
SELECT "tconst", "average_rating" FROM "title_ratings__v"
WHERE "average_rating" BETWEEN 7 AND 10
ORDER BY "average_rating" DESC;

--2
SELECT "tconst", "average_rating" FROM "title_ratings__v"
WHERE "average_rating" >= 7 AND "average_rating" <= 10
ORDER BY "average_rating" DESC;

--7. Select actors who have also directed movies, along with average ratings between 2.5 and 5.5. 
--Display the data in a way that the highest rating movies are on the top. 
SELECT DISTINCT 
nb.primary_name
,tr.average_rating
FROM
name_basics__v AS nb
JOIN title_principals__v AS tp ON nb.nconst = tp.nconst
JOIN title_ratings__v AS tr ON tr.tconst = tp.tconst
WHERE tp.category = 'Director'
AND (tr.average_rating <= 5.5 AND tr.average_rating >= 2.5)
ORDER BY tr.average_rating DESC;

-- 8. List movie details for movies with two genres which are not adult movies.
SELECT a.*, b.*, c.*, d.*, e.* FROM "title_basics__v" AS a
JOIN "title_crew__v" AS b ON a."tconst" = b."tconst"
JOIN "title_episode__v" AS c ON b."tconst" = c."tconst"
JOIN "title_principals__v" AS d ON c."tconst" = d."tconst"
JOIN "title_ratings__v" AS e ON d."tconst" = e."tconst"
WHERE a."is_adult" = false AND a."genres" LIKE '%,%' AND NOT LIKE '%,%,%';

--9. List title ids, titles, and genres that contain "Romance" for movies released in 20th century chronologically ordered.
SELECT "tconst", "primary_title", "genres" FROM "title_basics__v"
WHERE "start_year" >= 1900 AND "start_year" < 2000 AND "genres" LIKE '%Romance%'
ORDER BY "start_year";

--10. Find the total number of TV show episodes for every TV show’s season 2.
SELECT SUM("episode_number") AS total_num_of_TV_episodes FROM "title_episode__v"
WHERE "season_number" = 2;

--11. Since the `primary_profession` column in `name_basics__v` view has comma delimited values, show distinct primary profession per `nconst`, and `primary_name`. 
--Split the array and capitalize first letter in profession values. 
--For example: 
--    this:
--nconst          primary_name        profession 
--nm0000011       Gary Cooper         actor,soundtrack,stunts
--
--   should look like this:
--nconst          primary_name        profession 
--nm0000011       Gary Cooper         Actor
--nm0000011       Gary Cooper         Soundtrack
--nm0000011       Gary Cooper         Stunts
SELECT a."nconst", a."primary_name", b.profession
FROM (
    SELECT "nconst", "primary_name", SPLIT("primary_profession", ',') AS professions
    FROM "name_basics__v"
) a
CROSS JOIN UNNEST(a.professions) AS b(CONCAT(UPPER(LEFT(profession,1))))
ORDER BY a."primary_name"

--12. Identify actors who have no death year listed in the name_basics__v view and that have appeared in more than five titles. Display the count of titles next to their names.
SELECT a."primary_name", COUNT(b."tconst") AS number_of_titles FROM "name_basics__v" AS a
INNER JOIN "title_principals__v" AS b ON a."nconst" = b."nconst"
WHERE a."death_year" IS NULL 
GROUP BY a."primary_name"
HAVING COUNT(b."tconst") > 5
ORDER BY number_of_titles DESC;

--13. Create a custom column "age_rating" for movies based on their average ratings and genres. 
--    Categorize movies as "Family Friendly" if average_rating is equal or greter than 7.5 and genre is 'Animation'
--    Categorize movies as "General Audience" if average_rating is equal or greter than 6 and if the title is not an adult title 
--    Categorize movies as "Mature" if average_rating is equal or greter than 5 and if the title is an adult title
--    Categorize all other movies as "Watch at your own risk"
SELECT a."primary_title" AS movie_title,
    CASE
        WHEN b."average_rating" >= 7.5 AND a."genres" LIKE '%Animation%' AND a."title_type" LIKE 'Movie' THEN 'Family Friendly'
        WHEN b."average_rating" >= 6 AND a."is_adult" = false AND a."title_type" LIKE 'Movie' THEN 'General Audience'
        WHEN b."average_rating" >= 5 AND a."is_adult" = true AND a."title_type" LIKE 'Movie' THEN 'Mature'
        ELSE 'Watch at your own risk'
    END AS age_rating
FROM "title_basics__v" AS a
JOIN "title_ratings__v" AS b ON a."tconst" = b."tconst"
ORDER BY age_rating;

--14. Calculate the average run time of movies released in each decade. Display all the decades and the average run time per each of them.
--    Note which decade has the longest average run time, and which has the shortest
SELECT 
start_year,
case when cast(start_year as varchar) like '%0' then (start_year / 10) else FLOOR(start_year / 10)+1 end
AS decade ,
    AVG(run_time_minutes) AS avg_runtime
FROM title_basics__v
WHERE title_type = 'Movie' AND run_time_minutes IS NOT NULL AND start_year IS NOT NULL
GROUP BY 2,1
ORDER BY 2 DESC;

--Note: 
--min
SELECT CONCAT(SUBSTR(CAST("start_year" AS VARCHAR(4)), 1, 3), '0s') AS decade, AVG("run_time_minutes") AS avg_run_time FROM "title_basics__v"
GROUP BY CONCAT(SUBSTR(CAST("start_year" AS VARCHAR(4)), 1, 3), '0s')
ORDER BY decade
LIMIT 1;
--max
SELECT CONCAT(SUBSTR(CAST("start_year" AS VARCHAR(4)), 1, 3), '0s') AS decade, AVG("run_time_minutes") AS avg_run_time FROM "title_basics__v"
GROUP BY CONCAT(SUBSTR(CAST("start_year" AS VARCHAR(4)), 1, 3), '0s')
ORDER BY decade DESC
LIMIT 1;
