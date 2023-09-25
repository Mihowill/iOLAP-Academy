SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'schweppes'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% schweppes %' or t."full_text" like '% Schweppes %' or t."hashtags" like '%Schweppes%' or t."hashtags" like '%schweppes%')
--2 rows