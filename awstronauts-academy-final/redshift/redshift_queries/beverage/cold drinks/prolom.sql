SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'prolom'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% prolom %' or t."full_text" like '% Prolom %' or t."hashtags" like '%prolom%' or t."hashtags" like '%Prolom%') and
        (t."full_text" not like '%rolom oblak%' and
        t."full_text" not like '%Prolom 10 minuta%' and
        t."full_text" not like '%Prolom Obl%' and
        t."full_text" not like '%2 minute kasnije, prolom%')
-- 2 rows