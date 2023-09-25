SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'prsut'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% prsut%' or t."full_text" like '% Prsut%' or t."hashtags" like 'Prsut' or t."hashtags" like 'prsut' or
      t."hashtags" like 'Pršut' or t."hashtags" like 'pršut' or
      t."full_text" like '% pršut%' or t."full_text" like '% Pršut%')
--371 rows