SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cetina'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% cetina %' or t."full_text" like '% Cetina %' or t."hashtags" like '%cetina%' or t."hashtags" like '%Cetina%') and
        (t."full_text" not like '%Omiš%' and
        t."full_text" not like '%teče%' and
        t."full_text" not like '%more%' and
        t."full_text" not like '%granica%' and
        t."full_text" not like '%Blato N/C%' and
        t."full_text" not like '%DavisCup%' and
        t."full_text" not like '%Bridge%' and
        t."full_text" not like '%canyon%' and
        t."full_text" not like '%river%' and
        t."full_text" not like '%HTS%' and
        t."full_text" not like '%Ivan Cetina%' and
        t."full_text" not like '%rekata%' and
        t."full_text" not like '%River%' and
        t."full_text" not like '%Ivana Nelipića%' and
        t."full_text" not like '%KK%'  and
        t."full_text" not like '%Most%'  and
        t."full_text" not like '%kogatifoliras%'  and
        t."full_text" not like '%most%'  and
        t."full_text" not like '%bridge%'  and
        t."full_text" not like '%TigiBorg%'  and
        t."full_text" not like '%Duje Ajduković%' and
        t."full_text" not like '%cara%' and
        t."full_text" not like '%Cetina well%' and
        t."full_text" not like '%outsidewalk%' and
        t."full_text" not like '%race%' and
        t."full_text" not like '%kanjon%' and
        t."full_text" not like '%župa Cetina%' and
        t."full_text" not like '%Karin Knorr Cetina%' and
        t."full_text" not like '%struja%' and
        t."full_text" not like '%TomislavHorva20%' and
        t."full_text" not like '%Serbia4youth%')
--1 row