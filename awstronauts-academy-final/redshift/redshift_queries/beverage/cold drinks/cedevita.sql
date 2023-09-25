SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cedevita'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%cedevita %' or t."full_text" like '%Cedevita %' or t."hashtags" like '%cedevit%' or t."hashtags" like '%Cedevit%' or t."full_text" like '%cedevitu %' or t."full_text" like '%Cedevitu %' or t."full_text" like '%Cedevite %' or t."full_text" like '%cedevite %' or t."full_text" like '%cedeviti %' or t."full_text" like '%Cedeviti %' or t."full_text" like '%Cedevitom %' or t."full_text" like '%cedevitom %') and
        (t."full_text" not like '%Olimp%' and t."full_text" not like '%Cibo%'
        and t."full_text" not like '%Junior%' and t."full_text" not like '%cibo%'
        and t."full_text" not like '%sucu%' and t."full_text" not like '%enior%'
        and t."full_text" not like '%🏀%' and t."full_text" not like '%rener%'
        and t."full_text" not like '%cedevitajunior%' and t."full_text" not like '%cedevitaolimpij%' and t."full_text" not like '%liga%'
        and t."full_text" not like '%basket%' and t."full_text" not like '%ekipa%'
        and t."full_text" not like '%koš%' and t."full_text" not like '%Cedevita J.%'
        and t."full_text" not like '%igra%' and t."full_text" not like '%CEDEVITA JUNIOR%' and t."full_text" not like '%sud%' and t."full_text" not like '%utakmica%')
--95 rows