--1
CREATE OR REPLACE VIEW "name_basics__v" AS
SELECT "nconst",
        "primaryname" AS "primary_name",
        CASE 
            WHEN "birthyear" != '\N' THEN CAST("birthyear" AS INTEGER)
            ELSE NULL
        END AS "birth_year",
        CASE 
            WHEN "deathyear" != '\N' THEN CAST("deathyear" AS INTEGER)
            ELSE NULL
        END AS "death_year",
        "primaryprofession" AS "primary_profession",
        "knownfortitles" AS "known_for_titles"
FROM "name_basics";

--2
CREATE OR REPLACE VIEW "title_basics__v" AS
SELECT "tconst",
       CASE "titletype"
           WHEN 'tvSeries' THEN 'TV Series'
           WHEN 'videoGame' THEN 'Video Game'
           WHEN 'tvEpisode' THEN 'TV Episode'
           WHEN 'tvMiniSeries' THEN 'TV Mini Series'
           WHEN 'movie' THEN 'Movie'
           WHEN 'tvMovie' THEN 'TV Movie'
           WHEN 'video' THEN 'Video'
           WHEN 'short' THEN 'Short'
           WHEN 'tvSpecial' THEN 'TV Special'
           WHEN 'tvShort' THEN 'TV Short'
           ELSE "titletype"
        END AS "title_type",
        "primarytitle" AS "primary_title",
        "originaltitle" AS "original_title",
        CAST("isadult" AS BOOLEAN) AS "is_adult",
        CAST("startyear" AS INTEGER) AS "start_year",
        CASE
            WHEN "endyear" != '\N' THEN CAST("endyear" AS INTEGER)
            ELSE NULL
        END AS "end_year",
        CASE
            WHEN "runtimeminutes" != '\N' THEN CAST("runtimeminutes" AS INTEGER)
            ELSE NULL
        END AS "run_time_minutes",
        "genres"
FROM "title_basics";

--3
CREATE VIEW "title_crew__v" AS
SELECT "tconst",
       "directors",
       "writers"
FROM "title_crew";

--4
CREATE VIEW "title_principals__v" AS
SELECT "tconst",
       CAST("ordering" AS INTEGER) AS "ordering",
       "nconst",
       CASE 
           WHEN "category" = 'archive_sound' THEN 'Archive Sound'
           WHEN "category" = 'archive_footage' THEN 'Archive Footage'
           WHEN "category" = 'production_designer' THEN 'Production Designer'
           ELSE CONCAT(UPPER(SUBSTRING("category", 1, 1)), LOWER(SUBSTRING("category", 2)))
       END AS "category",
       CONCAT(UPPER(SUBSTRING("job", 1, 1)), LOWER(SUBSTRING("job", 2))) AS "job",
       CASE
           WHEN "characters" = '\N' THEN ''
           ELSE REPLACE(REPLACE("characters", '[', ''), ']', '')
       END AS "characters"
FROM "title_principals";

--5
CREATE VIEW "title_ratings__v" AS
SELECT "tconst",
       CAST("averagerating" AS DOUBLE) AS "average_rating",
       CAST("numvotes" AS INTEGER) AS "num_votes"
FROM "title_ratings";

--6
CREATE OR REPLACE VIEW "title_episode__V" AS 
SELECT  "tconst",
        "parenttconst" AS "parent_tconst",
        CASE
            WHEN "seasonnumber" != '\N' THEN CAST("seasonnumber" AS INTEGER)
            ELSE NULL
        END AS "season_number",
        CASE
            WHEN "episodenumber" != '\N' THEN CAST("episodenumber" AS INTEGER) 
            ELSE NULL
        END AS "episode_number"
FROM "title_episode";