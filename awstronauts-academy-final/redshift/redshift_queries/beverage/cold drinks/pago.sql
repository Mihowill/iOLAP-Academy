SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'pago'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% pago %' or t."full_text" like '% Pago %' or t."hashtags" like '%Pago%' or t."hashtags" like '%pago%') and (
        t."lang"<>'es' and t."lang"<>'pt' and t."full_text"  not like '%Galapagos%' and
        t."full_text"  not like '%Pacific Air Charters%'
        )
--4 rows