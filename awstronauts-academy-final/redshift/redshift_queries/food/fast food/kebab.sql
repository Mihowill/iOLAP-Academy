SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'kebab'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% kebab %' or t."full_text" like '% Kebab %' or t."hashtags" like 'kebab' or t."hashtags" like 'Kebab') and
       (t."full_text" not like '%ebab league%')
--149 rows