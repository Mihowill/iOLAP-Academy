SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'cola'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%cola%' or t."full_text" like '%Cola%' or t."hashtags" like '%cola%' or t."hashtags" like '%Cola%' or t."full_text" like '%kokakola%'
        or t."full_text" like '%Kokakola%') and
        (t."full_text" not like '%icola%' and t."full_text" not like '%hoco%'
        and t."full_text" not like '%ncola%' and t."full_text" not like '%colap%'
        and t."full_text" not like '%ecola%' and t."full_text" not like '%colab%'
        and t."full_text" not like '%Colab%' and t."full_text" not like '%scola%'
        and t."full_text" not like '%ocola%' and t."full_text" not like '%yCola%'
        and t."full_text" not like '%Colad%' and t."full_text" not like '%ColaCh%'
        and t."full_text" not like '%ccola%' and t."full_text" not like '%Colam%'
        and t."full_text" not like '%KCola%' and t."full_text" not like '%Colap%'
        and t."full_text" not like '%colaz%' and t."full_text" not like '%colar%'
        and t."full_text" not like '%Ryan_Colaco%' and t."full_text" not like '%Colak%'
        and t."full_text" not like '%colad%' and t."full_text" not like '%acola%'
        and t."full_text" not like '%tcola%' and t."full_text" not like '%ncola%'
        and t."full_text" not like '%eCola%' and t."full_text" not like '%colax%'
        and t."full_text" not like '%ucola%' and t."full_text" not like '%Colaci%'
        and t."full_text" not like '%colay%' and t."full_text" not like '%colaca%'
        and t."full_text" not like '%Colas%' and t."full_text" not like '%rcola%'
        and t."full_text" not like '%Colan%' and t."full_text" not like '%Colar%'
        and t."full_text" not like '%colat%' and t."full_text" not like '%colak%'
        and t."full_text" not like '%colas%' and t."full_text" not like '%Cola_d%'
        and t."full_text" not like '%colan%' and t."full_text" not like '%colao%'
        and t."full_text" not like '%nCola%' and t."full_text" not like '%Colau%'
        and t."full_text" not like '%Scola%' and t."full_text" not like '%Fcola%'
        and t."full_text" not like '%iCola%' and t."full_text" not like '%ícola%'
        and t."full_text" not like '%John Cola%' and t."full_text" not like '%Colaz%'
        and t."full_text" not like '%lcola%' and t."full_text" not like '%Colacao%'
        and t."full_text" not like '%l_cola%' and t."full_text" not like '%o-Cola%'
        and t."full_text" not like '%ColaCast%' and t."full_text" not like '%Colao%')
--424 rows