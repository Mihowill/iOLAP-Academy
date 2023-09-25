SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'fuzi'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% fuži%' or t."full_text" like '% Fuži%' or t."hashtags" like 'fuži' or t."hashtags" like 'Fuži' or 
       t."full_text" like '% fuzi%' or t."full_text" like '% Fuzi%') and
       (t."full_text" not like '%fužin%' and
       t."full_text" not like '%Fužin%' and
       t."full_text" not like '%fuzij%' and
       t."full_text" not like '%fuzio%' and
       t."full_text" not like '%Fuzij%' and
       t."full_text" not like '%fuzik%' and
       t."full_text" not like '%fuzin%' and
       t."full_text" not like '%fuzic%' and
       t."full_text" not like '%fuzil%' and
       t."full_text" not like '%Fuzin%' and
       t."full_text" not like '%Fuzio%' and
       t."full_text" not like '%Whitestone%' and
       t."full_text" not like '%Fuzishawa%')
--9 rows