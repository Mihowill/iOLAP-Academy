SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'burger'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%burger %' or t."full_text" like '% Burger %' or t."hashtags" like '%burger' or t."hashtags" like 'Burger') and
        (t."full_text" not like '%RealSwimburger%' and
        t."full_text" not like '%csiaburger%' and
        t."full_text" not like '%Salzburger%' and
        t."full_text" not like '%Brandenburger%' and
        t."full_text" not like '%Boeren%' and
        t."full_text" not like '%DrNWillburger%' and
        t."full_text" not like '%Pressburger%' and
        t."full_text" not like '%ThSpartanburger%' and
        t."full_text" not like '%wewelsburger%' and
        t."full_text" not like '%Haselburger%' and
        t."full_text" not like '%cheeserburger%')
--455 rows