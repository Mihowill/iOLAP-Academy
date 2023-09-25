SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'pizza'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% pizza %' or t."full_text" like '% Pizza %' or t."hashtags" like 'pizza' or t."hashtags" like 'Pizza' or
        t."full_text" like '% pizzu %' or t."full_text" like '% Pizzu %' or
        t."full_text" like '% pizze %' or t."full_text" like '% Pizze %')
--1247 rows