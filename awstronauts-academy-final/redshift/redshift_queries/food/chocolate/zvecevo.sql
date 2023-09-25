SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
	date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'zvecevo'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%zvecevo %' or t."full_text" like '%Zvecevo %' or t."hashtags" like 'zvecevo' or t."hashtags" like 'Zvecevo' or
        t."full_text" like '%žvecevo %' or t."full_text" like '%Žvecevo %' or t."hashtags" like 'žvecevo' or t."hashtags" like 'Žvecevo')
--3 rows