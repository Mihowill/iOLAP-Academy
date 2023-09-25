create or replace view "awstronauts_academy_final_test"."retail_outlets" as 
(SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'Konzum'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE
    "full_text" LIKE '%konzum%' 
    OR "full_text" LIKE '%Konzum%'
    OR "full_text" LIKE 'Konzum%'
    AND "full_text" NOT LIKE '%konzumir%'
    AND "full_text" NOT LIKE '%konzumac%'
    AND "full_text" NOT LIKE '%konzume%'
union
SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'Lidl'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE "full_text" LIKE '%lidl%'
OR "full_text" LIKE '%Lidl%'
OR "full_text" LIKE 'Lidl%'
OR "full_text" LIKE 'lidl%'
union
SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'Kaufland'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE "full_text" LIKE '%kaufland%'
OR "full_text" LIKE '%Kaufland%'
OR "full_text" LIKE 'Kaufland%'
OR "full_text" LIKE 'kaufland%'
union
SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'Plodine'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE "full_text" LIKE '%plodine%'
OR "full_text" LIKE '%Plodine%'
OR "full_text" LIKE 'Plodine%'
OR "full_text" LIKE 'plodine%'
AND "full_text" NOT LIKE '%krasne plodine%'
AND "full_text" NOT LIKE '%njezine plodine%'
union
SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'SPAR'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE "full_text" LIKE '%interspar%'
OR "full_text" LIKE 'interspar%'
OR "full_text" LIKE '%SPAR%'
OR "full_text" LIKE 'SPAR%'
union
SELECT
    t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'NTL'
        else null
    end as "store_name"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" AS t
WHERE "full_text" LIKE '% NTL %'
OR "full_text" LIKE '% ntl %'
OR "full_text" LIKE 'NTL%'
AND "full_text" NOT LIKE '%NTL Ed%')
with no schema binding