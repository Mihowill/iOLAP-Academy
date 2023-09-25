SELECT "primarytitle" AS "title",
       CASE
           WHEN "endyear" = '\N' THEN NULL
           ELSE CAST("endyear" AS INTEGER)
       END AS "end_year"
FROM "title_basics"
WHERE "isadult" = 0
ORDER BY "end_year" NULLS LAST;