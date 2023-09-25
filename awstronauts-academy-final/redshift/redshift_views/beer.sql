--------------------------------------------------------------foreign beers---------------------------------------------------------------
CREATE
OR REPLACE VIEW "awstronauts_academy_final_test"."beer" as (
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'kozel'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%kozel %' or t."full_text" like '%Kozel %' or 
        t."hashtags" like '%kozel %') and t."full_text" not like '%magarci %'
-- 3 
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'staropramen'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%staropramen %' or t."full_text" like '%Staropramen %' or t."hashtags" like '%staropramen %' or 
        t."full_text" like '%staro pramen %' or t."full_text" like '%Staro pramen %' or 
        ((t."full_text" like '%pramen %' or t."full_text" like '%Pramen %')  
        and (t."full_text" like '%pivo %' or t."full_text" like '%beer %' )))
-- 14
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'heineken'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%heineken %' or t."full_text" like '%Heineken %' 
        or t."hashtags" like '%heineken %' or 
        t."full_text" like '%heiniken %' or t."full_text" like '%Heiniken %' or 
        t."full_text" like '%hajneken %' or t."full_text" like '%Hajneken %' or 
        t."full_text" like '%hajniken %' or t."full_text" like '%Hajniken %')
-- 62
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'guinnesss'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% Guinness %' or t."full_text" like '% guinness %' or t."hashtags" like '% guinness %' or 
        t."full_text" like '%#Guinness %' or t."full_text" like '%#guinness %' or 
        t."full_text" like '% guinnes %' or t."full_text" like '%Guinnes %')
        and t."full_text" not like '%ecord%' and t."full_text" not like '%Alec%' and t."full_text" not like '%aphne%'
        and t."full_text" not like '%ljama%' and t."full_text" not like '%enter%'
-- 12 
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'budweiser'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Budweiser %' or t."full_text" like '%budweiser %' or t."hashtags" like '%budweiser %' or 
        t."full_text" like '%Badvajzer %' or t."full_text" like '%badvajzer %' or 
        t."full_text" like '%adweiser %' or t."full_text" like '%adwieser %')
-- 117
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'pilsner'
    else null end as "product_name",
    'foreign beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%pilsner %' or t."full_text" like '%Pilsner %' or t."hashtags" like '%pilsner %')
-- 13
UNION

-------------------------------------------------------------croatian beers---------------------------------------------------------------
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'ožujsko'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Žuja %' or t."full_text" like '%Zuja %' or t."full_text" like '% žuja %'
        or t."full_text" like '% zuja %' or t."full_text" like '%Ožujsko %' or t."full_text" like '%ožujsko %'
        or t."full_text" like '%Ozujsko %' or t."full_text" like '%ozujsko %')
-- 62
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'karlovačko'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Karlovacko %' or t."full_text" like '%karlovacko %' 
        or t."full_text" like '%karlovačko %' or t."full_text" like '%Karlovačko %')
-- 53
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'osječko'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Osjecko %' or t."full_text" like '%osjecko %' 
        or t."full_text" like '%Osječko %' or t."full_text" like '%osječko %')
        and t."full_text" not like '%pravo%' and t."full_text" not like '%baranj%' 
        and t."full_text" not like '%kult%' and t."full_text" not like '%kupali%'
        and t."full_text" like '%pi%'
-- 6
UNION

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'velebitsko'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Velebitsko %' or t."full_text" like '% velebitsko %')
        and t."full_text" not like 'kult'
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
    when t."full_text" like '%%' then 'pale ale'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%pale ale %' or t."full_text" like '%Pale Ale%' or t."full_text" like '%Pale ale%')
-- 19
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'tomislav'
    else null end as "product_name",
    'croatian beer' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '% Tomislav %' or t."full_text" like '% tomislav %')
        and 
        (t."full_text" like '%beer%' or t."full_text" like '% pij%' 
        or t."full_text" like '% pivo%') and t."full_text" not like '%kralj%'
-- 3
) with no schema binding