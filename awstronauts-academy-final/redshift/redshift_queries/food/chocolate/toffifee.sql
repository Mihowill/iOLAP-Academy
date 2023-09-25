SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'toffifee'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%toffifee %' or t."full_text" like '%Toffifee %' or t."hashtags" like 'toffifee' or t."hashtags" like 'Toffifee' or
        t."full_text" like '%tofifee %' or t."full_text" like '%Tofifee %' or 
        t."full_text" like '%toffife %' or t."full_text" like '%Toffife %' or
        t."full_text" like '%tofife %' or t."full_text" like '%Tofife %')
--3 rows