SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'studena'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% studena %' or t."full_text" like '% Studena %' or t."hashtags" like '%studenta%' or t."hashtags" like '%Studena%') and
        (t."full_text" not like '%tudent%')
--2 rows