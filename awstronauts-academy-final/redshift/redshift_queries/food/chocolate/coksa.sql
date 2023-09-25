SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'coksa'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%čoksa %' or t."full_text" like '%Čoksa %' or t."hashtags" like 'čoksa' or t."hashtags" like 'Čoksa' or t."full_text" like '%coksa %' or t."full_text" like '%Coksa %' or t."hashtags" like 'coksa' or t."hashtags" like 'Coksa' or t."full_text" like '%coksu %' or t."full_text" like '%Coksu %'or t."full_text" like '%čoksu %' or t."full_text" like '%Čoksu %' 
            or t."full_text" like '%cokse %' or t."full_text" like '%Cokse %'or t."full_text" like '%čokse %' or t."full_text" like '%Čokse %')
--20 rows