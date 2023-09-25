CREATE
OR REPLACE VIEW "awstronauts_academy_final_test"."wine" as (

    SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'sauvignon'
    else null end as "product_name",
    'red wine' as "product_type"

FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%sauvignon %' or t."hashtags" like '%sauvignon%' or 
         t."full_text" like '%Sauvignon %' or t."hashtags" like '%Sauvignon%' or 
         t."full_text" like '%sovinjon %' or t."full_text" like '%Sovinjon %' or t."hashtags" like '%sovinjon%' or
         t."full_text" like '%savinjon %' or t."full_text" like '%Savinjon %' or t."hashtags" like '%savinjon%' or
         t."full_text" like '%kaberne%' or t."full_text" like '%Kaberne%' or t."hashtags" like '%kaberne%' or
         t."full_text" like '%Cabernet %' or t."hashtags" like '%Cabernet%' or  
         t."full_text" like '%cabernet %' or t."hashtags" like '%cabernet%')
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'zinfandel'
    else null end as "product_name",
    'red wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%zinfandel %' or t."full_text" like '%Zinfandel %' or t."hashtags" like '%zinfandel%')
        and t."full_text" not like '%Herman%'
--7
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'merlot'
    else null end as "product_name",
    'red wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%merlot %' or t."full_text" like '%Merlot %' or t."hashtags" like '%merlot%')
        and t."full_text" not like '%Herman%'
--10
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'pinot crni'
    else null end as "product_name",
    'red wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%pinot %' or t."full_text" like '%Pinot %' or t."hashtags" like '%pinot%')
        and t."full_text" not like '%Thibaut%' and t."full_text" not like '%giro%' and t."full_text" 
        not like '%Giro%' and t."full_text" not like '%Ultras%' and t."full_text" 
        not like '%Ultras%' and t."full_text" not like '%bijeli%'
-- 28
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'malbec'
    else null end as "product_name",
    'red wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%malbec%' or t."full_text" like '%Malbec%' or t."hashtags" like '%malbec%' or
        t."full_text" like '%malbek%' or t."full_text" like '%Malbek%' or t."hashtags" like '%malbek%')

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
    when t."full_text" like '%%' then 'syrah'
    else null end as "product_name",
    'red wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%syrah%' or t."full_text" like '%Syrah%' or t."hashtags" like '%syrah%' or
        t."full_text" like '%shiraz%' or t."full_text" like '%Shiraz%' or t."hashtags" like '%shiraz%')
        and t."full_text" not like '%terror%' and t."full_text" not like '%iran%' and t."full_text" 
        not like '%Iran%' and t."full_text" not like '%IRAN%' and t."full_text" 
        not like '%UN%' and t."full_text" not like '%game%'
-- 14
UNION

------------------------------------------------------------------------white wines----------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'chardonnay'
    else null end as "product_name",
    'white wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%chardonnay%' or t."full_text" like '%chardonay%' or t."hashtags" like '%chardonnay%' or
        t."full_text" like '%šardonej%' or t."full_text" like '%shardoney%' or t."full_text" like '%chardoney%' or 
        t."full_text" like '%Chardonnay %' or t."full_text" like '%Chardonay%' or t."hashtags" like '%chardonnay%' or
        t."full_text" like '%Šardonej%' or t."full_text" like '%Shardoney%' or t."full_text" like '%Shardoney%')
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
    when t."full_text" like '%%' then 'riesling'
    else null end as "product_name",
    'white wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%riesling %' or t."full_text" like '%Riesling%' or t."hashtags" like '%riesling%' or
        t."full_text" like '%risling %' or t."full_text" like '%Risling%' or
        t."full_text" like '%rizling %' or t."full_text" like '%Rizling%' or t."hashtags" like '%rizling%') 
        and t.full_text not like '%Tartar Rizling%'
-- 4
UNION
  SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'pinot bijeli'
    else null end as "product_name",
    'white wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%inot bijeli %')
--2

UNION
  SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'muscat'
    else null end as "product_name",
    'white wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%moscato %' or t."full_text" like '%muscat %' or t."full_text" like '%muškat %' or 
        t."full_text" like '%Moscato %' or t."full_text" like '%Muscat %' or t."full_text" like '%Muškat %' or 
        t."hashtags" like '%moscato%' or t."hashtags" like '%muscat %' or t."hashtags" like '%muškat %') 
        and t.full_text not like '%man%' and t.full_text not like '%Natasha%'
--16
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'traminac'
    else null end as "product_name",
    'white wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%ewurztraminer%' or t."full_text" like '%traminac%' or t."full_text" like '%Traminac%'  
        or t."hashtags" like '%traminer%' or t."hashtags" like '%traminac%')
-- 43
UNION
------------------------------------------------------------------------croatian wines----------------------------------------------------------------
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'žlahtina'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%lahtina %' or t."hashtags" like '%zlahtina %' or t."full_text" like '%žlahtina %' or 
        t."full_text" like '%lajtina %' or t."hashtags" like '%zlajtina %' or t."full_text" like '%žlajtina %')
-- 7
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'pošip'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Pošip %' or t."hashtags" like '%pošip %' or t."full_text" like '%pošip %' or 
        t."full_text" like '%Posip %' or t."hashtags" like '%posip %' or t."full_text" like '%posip %')
        and t."full_text" not like '%Pornic%'
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
    when t."full_text" like '%%' then 'malvazija'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Malvazija %' or t."hashtags" like '%malvazija%' or t."full_text" like '%malvazija %')
-- 27      
UNION

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'graševina'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%Graševina %' or t."hashtags" like '%Graševina%' or 
         t."full_text" like '%graševina %' or t."hashtags" like '%graševina%' or 
         t."full_text" like '%Grasevina %' or t."hashtags" like '%graševina%' or  
         t."full_text" like '%grasevina %' or t."hashtags" like '%graševina%')
-- 34
UNION

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'plavac'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%plavac %' or t."hashtags" like '%plavac %' or t."full_text" like '%Plavac %')
-- 40
UNION
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then 'babić'
    else null end as "product_name",
    'croatian wine' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%abic %' or t."hashtags" like '%babic %' or t."full_text" 
        like '%abić %') and (t."full_text" like '%Wine%' or t."full_text" like '%wine%' 
        or t."full_text" like '%Vino%' or t."full_text" like '%vino%' ) 
        and t."full_text" not like '%nevino%'
-- 3
UNION
------------------------------------------------------------------------rose and champagne----------------------------------------------------------------
SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then ''
    else null end as "product_name",
    'rose' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%rose %' or t."hashtags" like '%rose %' or t."full_text" like '%Rose %') and 
        (t."full_text" like '%Wine%' or t."full_text" like '%wine%' or t."full_text" like '%Vino%' 
        or t."full_text" like '%vino%' or t."full_text" like '%pijemo%' or t."full_text" like '%drink%' or 
        t."full_text" like '%okus%' or t."full_text" like '%taste%' ) and t."full_text" not like '%Kesha%' and 
        t."full_text" not like '%tea%' and t."full_text" not like '%itanic%'
-- 9
UNION

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
    date(t."created_at") as "date",
    case
    when t."full_text" like '%%' then ''
    else null end as "product_name",
    'pjenušac' as "product_type"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE
        (t."full_text" like '%pjenusac %' or t."hashtags" like '%pjenusac %' or t."full_text" 
        like '%pjenušac %' or t."full_text" like '%Pjenusac %' or t."full_text" like '%Pjenušac %'
        or t."full_text" like '%Sampanjac %' or t."full_text" like '%Šampanjac %' or t."hashtags" 
        like '%sampanjac %' or t."full_text" like '%champaign %' 
        or t."full_text" like '%Champagne %' or t."hashtags" like '%champagne %' 
        or t."full_text" like '%champagne %') and t."full_text" not like '%roblems%'

-- 110
) with no schema binding