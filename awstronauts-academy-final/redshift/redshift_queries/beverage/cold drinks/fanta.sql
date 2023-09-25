SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'fanta'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%fanta %' or t."full_text" like '%Fanta %' or t."hashtags" like '%fant%' or t."hashtags" like '%Fant%' or t."full_text" like '%fantu %'
        or t."full_text" like '%fante %' or t."full_text" like '%Fante %' or t."full_text" like '%Fante %') and
        (t."full_text" not like '%fantas%' and t."full_text" not like '%Fantas%'
        and t."full_text" not like '%fantom%' and t."full_text" not like '%Fantis%'
        and t."full_text" not like '%Fantom%' and t."full_text" not like '%efant%'
        and t."full_text" not like '%Fanta Bility%' and t."full_text" not like '%nfant%'
        and t."full_text" not like '%FantaST%' and t."full_text" not like '%Fanti%'
        and t."full_text" not like '%fantaz%' and t."full_text" not like '%ofant%'
        and t."full_text" not like '%c_fanta%' and t."full_text" not like '%rfant%'
        and t."full_text" not like '%CFant%' and t."full_text" not like '%Fantac%'
        and t."full_text" not like '%ffant%' and t."full_text" not like '%fantin%'
        and t."full_text" not like '%Fanta_R%')
--30 rows