SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'struklji'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% strukl%' or t."full_text" like '% Strukl%' or t."hashtags" like 'Struklji' or t."hashtags" like 'struklji' or
      t."hashtags" like 'Štruklji' or t."hashtags" like 'štruklji' or
      t."full_text" like '% štrukl%' or t."full_text" like '% Štrukl%')
--122 rows