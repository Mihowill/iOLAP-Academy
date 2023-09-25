CREATE
OR REPLACE VIEW "awstronauts_academy_final_test"."strong_drinks" as (
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'whiskey'
    else null end as "product_name",
    'foreign strong drink' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% viski %' or t."full_text" like '% Whiskey %' 
        or t."full_text" like '% whiskey%')
-- 163
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'vodka'
    else null end as "product_name",
    'foreign strong drink' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% vodka %' or t."full_text" like '% Vodka %' 
        or t."full_text" like '% votka%' or t."full_text" like '% Votka%')
-- 118
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'tequila'
    else null end as "product_name",
    'foreign strong drink' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% tekila %' or t."full_text" like '% Tekila %' 
        or t."full_text" like '% tequila%' or t."full_text" like '% Tequila%')
-- 57
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'gin'
    else null end as "product_name",
    'foreign strong drink' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% gin %' or t."full_text" like '% Gin %' 
        or t."full_text" like '% džin %' or t."full_text" like '% Džin %')
-- 172
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'liquer'
    else null end as "product_name",
    'foreign strong drink' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% liker%' or t."full_text" like '% liquer%')
-- 67
UNION

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'rakija'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% rakija %' or t."full_text" like '%Rakija %')
-- 191
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'šljivovica'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% sljivovica%' or t."full_text" like '%Sljivovica %' 
        or t."full_text" like '% šljivovica%' or t."full_text" like '%Šljivovica %')
-- 23
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'lozovača'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% lozovaca%' or t."full_text" like '%Lozovaca %' 
        or t."full_text" like '% lozovača%' or t."full_text" like '%Lozovača %')
-- 5 
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'travarica'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% travarica%' or t."full_text" like '%Travarica %')
-- 18
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'komovača'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% komovica%' or t."full_text" like '%Komovica %')
-- 2
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'viljamovka'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%viljamovka%' or t."full_text" like '%Viljamovka%'
        or t."full_text" like '%vilijamovka%' or t."full_text" like '%Vilijamovka%'
        or t."full_text" like '%kruškovača%' or t."full_text" like '%Kruškovača%'
        or t."full_text" like '%kruskovaca%' or t."full_text" like '%Kruskovaca%')
-- 8
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'komovmedicaača'
    else null end as "product_name",
    'croatian rakija' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%medica %' or t."full_text" like '%Medica %'
        or t."full_text" like '%Medenica%' or t."full_text" like '%medenica%'
        or t."full_text" like '%medovača%' or t."full_text" like '%Medovača%'
        or t."full_text" like '%medovaca%' or t."full_text" like '%medovaca%')
-- 25 
) with no schema binding