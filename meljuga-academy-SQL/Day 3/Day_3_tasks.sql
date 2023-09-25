/* 1. Create a view `average_rating_rpt__v` using these guidelines:
- Create ranges per each full rating over the *averagerating* values. Values like 2.3, 2.4, 2.7 should fall into the 2-3 range while similarly values like 5.4, 5.6, and 5.7 should fall into the 5-6 range.
- For each *rating* range, count the number of *titles* and the sum of total *votes*.
- A view should contain three columns: *rating_range* (1-2, 2-3, ...), *total_titles*, and *total_votes*. */
CREATE OR REPLACE VIEW
    average_rating_rpt__v AS
SELECT
    CASE
        WHEN average_rating = 10 THEN '9.0-10.0'
        ELSE CONCAT(
            CAST(FLOOR("average_rating") AS VARCHAR (3)),
            '-',
            CAST(FLOOR("average_rating") + 1 AS VARCHAR (3))
        )
    END AS rating,
    COUNT(*) AS titles,
    SUM("num_votes") AS votes
FROM
    "title_ratings__v"
GROUP BY
    1
ORDER BY
    rating;

/* 2. Create a view `title_actors_rpt__v` using these guidelines:
- Choose all distinct *titles* with tconst ending in '27' from the `title_principals__v` view.
- For each of those *titles*, filter out all actors and actress whose *primary profession* is *acting*, and sort it in the descending order by *birth year*.
 */
CREATE OR REPLACE VIEW
    title_actors_rpt__v AS
SELECT
    a."primary_title" AS title,
    ARRAY_JOIN(
        ARRAY_AGG(
            CONCAT(
                b."primary_name",
                ' (',
                CAST(b."birth_year" AS VARCHAR),
                ')'
            )
            ORDER BY
                b."birth_year" DESC
        ),
        ','
    ) AS actors_actresses
FROM
    "title_basics__v" AS a
    JOIN "title_principals__v" AS c ON a."tconst" = c."tconst"
    JOIN "name_basics__v" AS b ON c."nconst" = b."nconst"
WHERE
    CAST(a."tconst" AS VARCHAR) LIKE '%27'
    AND (
        b."primary_profession" LIKE '%actor%'
        OR b."primary_profession" LIKE '%actress%'
    )
GROUP BY
    a."primary_title";

/* 3. Create a view `top_rated_movies_rpt__v` using these guidelines:
- Find all *movies* that have at least 1000 *votes* or more, along with their *primary titles*, *average ratings*, and *number of votes*.
- Display the *movies* with the most *votes* at the top. */
CREATE OR REPLACE VIEW
    top_rated_movies_rpt__v AS
SELECT
    a."primary_title",
    b."average_rating",
    b."num_votes"
FROM
    "title_basics__v" AS a
    JOIN "title_ratings__v" AS b ON a."tconst" = b."tconst"
WHERE
    b."num_votes" >= 1000
ORDER BY
    b."num_votes" DESC;

/* 4. Create a view `top_rated_shows_rpt__v` using these guidelines:
- Find all *TV shows* (series, mini series) that have two or more words in their *primary title*.
- For each *genre*, list the *genre name*, and the *average rating*. */
CREATE OR REPLACE VIEW
    top_rated_shows_rpt__v AS
SELECT
    a."primary_title" AS tv_show,
    ARRAY_JOIN(ARRAY_AGG(c.genre), ',') AS unique_genre,
    AVG(b."average_rating") AS average_rating_for_show_and_genre
FROM
    "title_basics__v" AS a
    JOIN "title_ratings__v" AS b ON a."tconst" = b."tconst"
    CROSS JOIN UNNEST (SPLIT(a."genres", ',')) AS c (genre)
WHERE
    (
        a."title_type" LIKE 'TV Series'
        OR a."title_type" LIKE 'TV Mini Series'
    )
    AND a."genres" NOT LIKE '\N'
GROUP BY
    1
ORDER BY
    tv_show;

/* 5. Create a view `top_actor_rpt__v` using these guidelines:
- Find all *actors* who are also *writers*. 
- For each *actor*, list their *name*, *primary profession*, *genres* and the count of unique *genres* they have acted in. */
CREATE OR REPLACE VIEW
    top_actor_rpt__v AS
SELECT
    a."primary_name" AS name,
    ARRAY_JOIN(ARRAY_AGG(DISTINCT a."primary_profession"), ',') AS professions_array,
    ARRAY_JOIN(ARRAY_AGG(DISTINCT d.genre), ',') AS genres_array,
    COUNT(DISTINCT d.genre) AS count_of_genres
FROM
    "name_basics__v" AS a
    JOIN "title_principals__v" AS c ON a."nconst" = c."nconst"
    JOIN "title_basics__v" AS b ON c."tconst" = b."tconst"
    CROSS JOIN UNNEST (SPLIT(b."genres", ',')) AS d (genre)
WHERE
    a."primary_profession" LIKE '%actor%'
    AND a."primary_profession" LIKE '%writer%'
    AND b."genres" NOT LIKE '\N'
GROUP BY
    1
ORDER BY
    name;