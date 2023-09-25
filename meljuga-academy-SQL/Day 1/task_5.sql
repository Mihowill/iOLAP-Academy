SELECT "title_basics"."primarytitle", "title_crew"."directors" FROM "title_basics"
INNER JOIN "title_crew" ON "title_basics"."tconst" = "title_crew"."tconst"
WHERE "directors" != '\N';