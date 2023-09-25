SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'kala'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% kala %' or t."full_text" like '% Kala %' or t."hashtags" like '%kala%' or t."hashtags" like '%Kala%') and
        (t."full_text" not like '%nkala%' and t."full_text" not like '%Skala%'
        and t."full_text" not like '%akala%'
        and t."full_text" not like '%Livaković%'
        and t."full_text" not like '%TeamNiall%'
        and t."full_text" not like '%kalar%'
        and t."full_text" not like '%Kalam%'
        and t."full_text" not like '%Kalas%'
        and t."full_text" not like '%kala Ravnoga%'
        and t."lang"<>'tr'
        and t."lang"<>'tl'
        and t."full_text" not like '%Kala Kosovac%'
        and t."full_text" not like '%Kalinić%'
        and t."full_text" not like '%kalaj%'
        and t."full_text" not like '%Kažem ti Kala brat%'
        and t."full_text" not like '%kalam%'
        and t."full_text" not like '%stari_as%'
        and t."full_text" not like '%kala nivo%'
        and t."full_text" not like '%kala i bamba%'
        and t."full_text" not like '%Kalaš%'
        and t."full_text" not like '%skala%'
        and t."full_text" not like '%HDZ%'
        and t."full_text" not like '%kalat%'
        and t."full_text" not like '%Ajme kala ne radi%'
        and t."full_text" not like '%Maura kala%'
        and t."full_text" not like '%Kala Vinyasa%'
        and t."full_text" not like '%Kalabrugovic%'
        and t."full_text" not like '%Kalan%'
        and t."full_text" not like '%čaršija%'
        and t."full_text" not like '%Kali%'
        and t."full_text" not like '%Suba%'
        and t."full_text" not like '%Chido%'
        )
--1 row