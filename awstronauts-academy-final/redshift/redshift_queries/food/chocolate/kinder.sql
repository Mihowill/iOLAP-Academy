SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'kinder'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%kinder %' or t."full_text" like '%Kinder %' or t."hashtags" like 'Kinder' or t."hashtags" like 'kinder') and
        (t."lang"<>'de' and 
        t."full_text" not like '%kinder words%' and
        t."full_text" not like '%kinder world%' and
        t."full_text" not like '%kinder to idols.%' and
        t."full_text" not like '%as kinder and more decent%' and
        t."full_text" not like '%narcissist%' and
        t."full_text" not like '%eminder to be kinder%' and
        t."full_text" not like '%Plenković%' and
        t."full_text" not like '%been a lot kinder%' and
        t."full_text" not like '%has been far kinder%' and
        t."full_text" not like '%Kindness%' and
        t."full_text" not like '%kinder choices%' and
        t."full_text" not like '%Wendekinder%' and
        t."full_text" not like '%kinder to us all%' and
        t."full_text" not like '%Kinder će biti razriješen%' and
        t."full_text" not like '%kinder and more understanding%' and
        t."full_text" not like '%be kinder%' and
        t."full_text" not like '%bit kinder%' and
        t."full_text" not like '%kinder than you appear%' and
        t."full_text" not like '%kinder to%' and
        t."full_text" not like '%Ivica Kinder%' and
        t."full_text" not like '%Kinder Zentrum%' and
        t."full_text" not like '%Kinder des Bosnienkriegs%' and
        t."full_text" not like '%kinder way%' and
        t."full_text" not like '%kinder when you talk%' and
        t."full_text" not like '%kinder and softer.%' and
        t."full_text" not like '%Kinder Butragueño%' and
        t."full_text" not like '%being kinder%' and
        t."full_text" not like '%Mackinder%' and
        t."full_text" not like '%kinder society%' and
        t."full_text" not like '%meilleurs%' and
        t."full_text" not like '%PetieKinder%' and
        t."full_text" not like '%kinder he%' and
        t."full_text" not like '%Kinder je u ostavci%' and
        t."full_text" not like '%far kinder%' and
        t."full_text" not like '%kinder goal%' and
        t."full_text" not like '%kinder place%' and
        t."full_text" not like '%kindness%' and
        t."full_text" not like '%been kinder%' and
        t."full_text" not like '%kinder face%' and
        t."full_text" not like '%Kinder vodi vojnu%' and
        t."full_text" not like '% kinder bet%' and
        t."full_text" not like '%kinder and more productive%' and
        t."full_text" not like '%kinder face%' and
        t."full_text" not like '%kinder face%' and
        t."full_text" not like '%kinder face%')
--125 rows