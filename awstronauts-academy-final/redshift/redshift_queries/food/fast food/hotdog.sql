SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'hotdog'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% hotdog%' or t."full_text" like '% Hotdog%' or t."hashtags" like 'hotdog' or t."hashtags" like 'Hotdog' or
       t."full_text" like '% hot dog %' or t."full_text" like '% Hot dog %'
       or t."full_text" like '% hot-dog %' or t."full_text" like '% Hot-dog %')
--73 rows