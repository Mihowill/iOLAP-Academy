SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cobanac'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% cobanac%' or t."full_text" like '% Cobanac%' or t."hashtags" like 'Cobanac' or t."hashtags" like 'cobanac' or
      t."hashtags" like 'Čobanac' or t."hashtags" like 'čobanac' or
      t."full_text" like '% čobanac%' or t."full_text" like '% Čobanac%')
--46 rows