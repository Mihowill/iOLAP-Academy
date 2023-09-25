/* 1. Run MSCK REPAIR TABLE `table_name` for all IMDb tables */






/* 2. Utilizing conditional expressions on the <username>-academy-imdb-datalake.imdb_title_ratings table do the following:
Create ranges per each full rating over the averagerating values
e.g. Values like 2.3, 2.4, 2.7 should fall into the 2-3 range while similarly values like 5.4, 5.6 and 5.7 should fall into the 5-6 range
For each rating range count the number of titles and the sum of total votes
Once your query is done create another table in your schema utilizing CTAS (CVAS)
Name the table: <username>-academy-imdb-datalake.ratings_overview */

-- DISTINCT("tconst") is added cause we ingest double data every day, at least for now :)
CREATE TABLE
    ratings_overview AS
SELECT
    CASE
        WHEN CAST(averagerating AS DOUBLE) >= 10 THEN '9-10'
        WHEN CAST(averagerating AS DOUBLE) >= 1
        AND CAST(averagerating AS DOUBLE) < 10 THEN CAST(
            CAST(FLOOR(CAST(averagerating AS DOUBLE)) AS INT) AS VARCHAR
        ) || '-' || CAST(
            CAST(FLOOR(CAST(averagerating AS DOUBLE)) AS INT) + 1 AS VARCHAR
        )
    END AS rating_range,
    COUNT(DISTINCT("tconst")) AS title_count,
    SUM(CAST("numvotes" AS INT)) AS total_votes
FROM
    "title_ratings"
GROUP BY
    1
ORDER BY
    rating_range;

/* 
3. In your database, utilizing window functions on the <username>-academy-imdb-datalake.title_basics do the following:
Select 5 different title types
For each title type filter out min and max values for start_year run_time_minutes columns where primary title and original title are the same for their respective types.
Once you have min year and max start_year values in a separate column calculate the number of years between them. What does this result column show?
Similarly, for the first and last run_time_minutes values calculate the difference between last and first value.
This should be done in one query, in order to do so, please utilize subqueries
Once your query is done create another view in your schema utilizing CVAS
Name the table: <username>-academy-imdb-datalake.title_insights */

CREATE OR REPLACE VIEW title_insights AS 
WITH min_max_values AS (
    SELECT 
        "titletype",
        MIN(CASE WHEN "startyear" = '\N' THEN NULL ELSE CAST("startyear" AS INT) END) AS min_start_year,
        MAX(CASE WHEN "startyear" = '\N' THEN NULL ELSE CAST("startyear" AS INT) END) AS max_start_year,  
        MIN(CASE WHEN "runtimeminutes" = '\N' THEN NULL ELSE CAST("runtimeminutes" AS INT) END) AS min_runtime,
        MAX(CASE WHEN "runtimeminutes" = '\N' THEN NULL ELSE CAST("runtimeminutes" AS INT) END) AS max_runtime
    FROM "title_basics"
    WHERE "primarytitle" = "originaltitle"
    GROUP BY "titletype"
),
calc_differences AS (
    SELECT 
        "titletype", 
        min_start_year, 
        max_start_year,
        min_runtime,
        max_runtime,
        max_start_year - min_start_year AS year_difference, 
        max_runtime - min_runtime AS runtime_difference
    FROM min_max_values
)
SELECT 
    "titletype", 
    min_start_year, 
    max_start_year, 
    year_difference,
    min_runtime, 
    max_runtime, 
    runtime_difference 
FROM calc_differences
LIMIT 5;