SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'fries'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% fries %' or t."full_text" like '% Fries %' or t."hashtags" like 'fries' or t."hashtags" like 'Fries' or
       t."full_text" like '% french fries %' or t."full_text" like '% French fries %' or t."hashtags" like 'frenchfries' or t."hashtags" like 'FrenchFries'
        or t."hashtags" like 'Frenchfries' or
        t."full_text" like '% pommes %' or t."full_text" like '% Pommes %' or t."hashtags" like 'pommes' or t."hashtags" like 'Pommes') and
        (t."full_text" not like '%mdrrrr%')
--95 rows