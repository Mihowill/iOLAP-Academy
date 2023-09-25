SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'dorina'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%dorina %' or t."full_text" like '%Dorina %' or t."hashtags" like 'dorina' or t."hashtags" like 'Dorina' or t."full_text" like '%dorinu %' or t."full_text" like '%Dorinu %' or t."full_text" like '%dorine %' or t."full_text" like '%Dorine %') and
        (t."full_text" not like '%BlueDorina%' and
        t."full_text" not like '%andorin%' and
        t."full_text" not like '%liliana_dorina%' and
        t."full_text" not like '%e_fedorina%' and
        t."full_text" not like '%Dorina macht alles richtig%')
--23 rows