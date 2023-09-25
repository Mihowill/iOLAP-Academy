--First query
SELECT "tconst", "nconst_count"
FROM (
  SELECT "tconst", COUNT("nconst") AS "nconst_count"
  FROM "title_principals"
  GROUP BY "tconst"
) AS subquery
WHERE "nconst_count" > 8
ORDER BY "nconst_count" DESC;

--Second query
SELECT "tconst", COUNT("nconst") AS "nconst_count" FROM "title_principals"
GROUP BY "tconst"
HAVING COUNT("nconst") > 8
ORDER BY "nconst_count" DESC;
