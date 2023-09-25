SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% viski %' or t."full_text" like '% Whiskey %' 
        or t."full_text" like '% whiskey%'); 
-- 163

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% vodka %' or t."full_text" like '% Vodka %' 
        or t."full_text" like '% votka%' or t."full_text" like '% Votka%'); 
-- 118

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% tekila %' or t."full_text" like '% Tekila %' 
        or t."full_text" like '% tequila%' or t."full_text" like '% Tequila%'); 
-- 57

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% gin %' or t."full_text" like '% Gin %' 
        r t."full_text" like '% džin %' or t."full_text" like '% Džin %'); 
-- 172

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% liker%' or t."full_text" like '% liquer%'); 
-- 67
