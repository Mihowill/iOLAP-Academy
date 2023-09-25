SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'milka'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '%milka %' or t."full_text" like '%Milka %' or t."hashtags" like 'Milka' or t."hashtags" like 'milka' or t."full_text" like '%Milku %'
        or t."full_text" like '%milku %' or t."full_text" like '%Milke %'
        or t."full_text" like '%milke %') and
        (t."full_text" not like '%Milka Babović%' and
        t."full_text" not like '%Milka Tadić-Mijović%' and
        t."full_text" not like '%Planinc%' and
        t."full_text" not like '%baba Milka%' and
        t."full_text" not like '%MartinMilka%' and
        t."full_text" not like '%Milka Katarina Trnina%' and
        t."full_text" not like '%Milka ljutiti%' and
        t."full_text" not like '%Milka preminul%' and
        t."full_text" not like '%Milka imaju preko 15 milijuna%' and
        t."full_text" not like '%Milana Milka%' and
        t."full_text" not like '%Drniša%' and
        t."full_text" not like '%Milka Rebac%' and
        t."full_text" not like '%teta Milka%' and
        t."full_text" not like '%planinc%' and
        t."full_text" not like '%Milka Šarplaninc%' and
        t."full_text" not like '%Milka Vuletic%' and
        t."full_text" not like '%Milka i Stjepan Mesić%' and
        t."full_text" not like '%milka_ragazza%' and
        t."full_text" not like '%Milka u ropotarnicu povijesti%' and
        t."full_text" not like '%Milke Babović%' and
        t."full_text" not like '%Milka Panini%' and
        t."full_text" not like '%baka Milka%' and
        t."full_text" not like '%Groningen%' and
        t."full_text" not like '%I Milka im je rekla hvala%' and
        t."full_text" not like '%Milka i Živko%' and
        t."full_text" not like '%Milke Drljo%' and
        t."full_text" not like '%Milka Pavlović%' and
        t."full_text" not like '%Milka Frondi%' and
        t."full_text" not like '%zlotvorku Milku%' and
        t."full_text" not like '%milku babović%' and
        t."full_text" not like '%Rade Bulata%' and
        t."full_text" not like '%Milka Škofiča%' and
        t."full_text" not like '%MoleMilka%' and
        t."full_text" not like '%Milka Blanuša%' and
        t."full_text" not like '%Milka i Tonka Matošić%' and
        t."full_text" not like '%Dinko Bogdanić%' and
        t."full_text" not like '%Milke Primorac%' and
        t."full_text" not like '%Milka bude utjeha%' and
        t."full_text" not like '%Milka Kosanović%' and
        t."full_text" not like '%Milke Delibašić%' and
        t."full_text" not like '%Milka Dzikić%' and
        t."full_text" not like '%Komunizam%' and
        t."full_text" not like '%zapovjednik%' and
        t."full_text" not like '%Savke i Milke%' and
        t."full_text" not like '%Voajer%' and
        t."full_text" not like '%zastupnik%' and
        t."full_text" not like '%Milke Malade%' and
        t."full_text" not like '%homoseksualca%' and
        t."full_text" not like '%Dinamo%' and
        t."full_text" not like '%24 milke kuna%' and
        t."full_text" not like '%Milka Babiović%' and
        t."full_text" not like '%Milka Babovic%' and
        t."full_text" not like '%pustolovine Milke%' and
        t."full_text" not like '%Milka Džikić%')
--59 rows