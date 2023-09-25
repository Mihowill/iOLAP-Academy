SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% rakija %' or t."full_text" like '%Rakija %'); 
-- 191

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% sljivovica%' or t."full_text" like '%Sljivovica %' 
        or t."full_text" like '% šljivovica%' or t."full_text" like '%Šljivovica %'); 
-- 23

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% lozovaca%' or t."full_text" like '%Lozovaca %' 
        or t."full_text" like '% lozovača%' or t."full_text" like '%Lozovača %'); 
-- 5 

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% travarica%' or t."full_text" like '%Travarica %'); 
-- 18

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% komovica%' or t."full_text" like '%Komovica %'); 
-- 2

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%viljamovka%' or t."full_text" like '%Viljamovka%'
        or t."full_text" like '%vilijamovka%' or t."full_text" like '%Vilijamovka%'
        or t."full_text" like '%kruškovača%' or t."full_text" like '%Kruškovača%'
        or t."full_text" like '%kruskovaca%' or t."full_text" like '%Kruskovaca%'); 
-- 8

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%medica %' or t."full_text" like '%Medica %'
        or t."full_text" like '%Medenica%' or t."full_text" like '%medenica%'
        or t."full_text" like '%medovača%' or t."full_text" like '%Medovača%'
        or t."full_text" like '%medovaca%' or t."full_text" like '%medovaca%'); 
-- 25 