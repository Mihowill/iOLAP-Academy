SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'tortilla'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% tortil%' or t."full_text" like '% Tortil%' or t."hashtags" like 'tortilla' or t."hashtags" like 'Tortilla' or t."hashtags" like 'tortilja' or t."hashtags" like 'Tortilja')
--94 rows