SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'schogetten'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%schogetten %' or t."full_text" like '%Schogetten %' or t."hashtags" like 'schogetten' or t."hashtags" like 'Schogetten' or
        t."full_text" like '%schogette %' or t."full_text" like '%Schogette %' or 
        t."full_text" like '%schogete %' or t."full_text" like '%Schogete %' or
        t."full_text" like '%schogeten %' or t."full_text" like '%Schogeten %')
--1 row