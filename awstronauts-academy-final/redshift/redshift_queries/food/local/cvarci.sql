SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cvarci'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% cvarci %' or t."full_text" like '% Cvarci %' or t."hashtags" like 'cvarci' or t."hashtags" like 'Cvarci' or
       t."hashtags" like 'čvarci' or t."hashtags" like 'Čvarci' or
       t."full_text" like '% čvarci %' or t."full_text" like '% Čvarci %' or
       t."full_text" like '% čvarke %' or t."full_text" like '% Čvarke %' or 
       t."full_text" like '% cvarke %' or t."full_text" like '% Cvarke %')
--98 rows