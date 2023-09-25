SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cevapi'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% cevap%' or t."full_text" like '% Cevap%' or t."hashtags" like 'cevap%' or t."hashtags" like 'Cevap%' or t."hashtags" like 'ćevap%' or t."hashtags" like 'Ćevap%' or
       t."full_text" like '% ćevap%' or t."full_text" like '% Ćevap%')
--522 rows