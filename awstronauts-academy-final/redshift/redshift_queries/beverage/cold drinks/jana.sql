SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'jana'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% jana %' or t."full_text" like '% Jana %' or t."hashtags" like '%Jana%' or t."hashtags" like '%jana%') and
        (t."full_text" not like '%Tijana%' and t."full_text" not like '%jubljana%'
        and t."full_text" not like '%dajana%' and t."full_text" not like '%Jana Klímová%'
        and t."full_text" not like '%Jana Koščak%' and t."full_text" not like '%Jana Friedlerová%' and t."full_text" not like '%Jana Vitovca%'
        and t."full_text" not like '%Jana Milić%' and t."full_text" not like '%AndabakIvan%' and t."full_text" not like '%Srbijana%'
        and t."full_text" not like '%Bojana%' and t."full_text" not like '%Tatjana%'
        and t."full_text" not like '%Jana i Martin%' and t."full_text" not like '%Jana Kuciak%' and t."full_text" not like '%Jana Zakarneh%' and t."full_text" not like '%Janaf%' and t."full_text" not like '%janac%' 
        and t."full_text" not like '%Jana Orjunaša%' and t."full_text" not like '%janaj%' and t."full_text" not like '%Jana za Judy%' and t."full_text" not like '%Domacica Jana%' and t."full_text" not like '%Lucija%'
        and t."full_text" not like '%kći%' and t."full_text" not like '%iljana%'
        and t."full_text" not like '%Vozim Jana%' and t."full_text" not like '%ijana%'
        and t."full_text" not like '%Pravni%' and t."full_text" not like '%Sveta Jana%' and t."full_text" not like '%littlesis24%' and t."full_text" not like '%Jana Majdi%' and t."full_text" not like '%Jana Lukáše%'
        and t."full_text" not like '%ana – Žena zmaj%' and t."full_text" not like '%Jana Koscak%' and t."full_text" not like '%ajana%' and t."full_text" not like '%JanaCar%' and t."full_text" not like '%Jana 5%'
        and t."full_text" not like '%janaf%'
        and t."full_text" not like '%Jana Krišković%'
        and t."full_text" not like '%Mariju Tolj%'
        and t."full_text" not like '%Jana Ciaravolo%'
        and t."full_text" not like '%janap%'
        and t."full_text" not like '%Jana Al Kadri%'
        and t."full_text" not like '%Jana Mlakar%'
        and t."full_text" not like '%Jana Černochová%'
        and t."full_text" not like '%ojana%'
        and t."full_text" not like '%Jana Blachowicza%'
        and t."full_text" not like '%Jana Ivanjeka%'
        and t."full_text" not like '%Jana Bubeníčeka%'
        and t."full_text" not like '%Jana Šimon%'
        and t."full_text" not like '%Jana Janěková%'
        and t."full_text" not like '%rjana%'
        and t."full_text" not like '%Madame Jana%'
        and t."full_text" not like '%Jana Sadelera%'
        and t."full_text" not like '%Jana III. Sobieskog%'
        and t."full_text" not like '%Jana z Praha%'
        and t."full_text" not like '%jana i toe to%'
        and t."full_text" not like '%sa46 jana%'
        and t."full_text" not like '%JanaBrike%'
        and t."full_text" not like '%Jana Balacciu%'
        and t."lang"<>'hi'
        and t."lang"<>'in'
        and t."full_text" not like '%ljana%'
        and t."full_text" not like '%Jana Hus%'
        and t."full_text" not like '%Sportske novosti%'
        and t."full_text" not like '%Hrvatska senzacija%'
        and t."full_text" not like '%Bravo Jana%'
        and t."full_text" not like '%Nema Jana da uzvrati glazbom%'
        and t."full_text" not like '%Jana Fett%'
        and t."full_text" not like '%tata malog Jana%'
        and t."full_text" not like '%imamo Jana%'
        and t."full_text" not like '%jana vip%'
        and t."full_text" not like '%Jana Oblaka%'
        and t."full_text" not like '%Gm Jana%'
        and t."full_text" not like '%Jana Sobieskog%'
        and t."full_text" not like '%orjunaški status Jana%'
        and t."full_text" not like '%Jana karate%'
        and t."full_text" not like '%Jana ft Šerif%'
        and t."full_text" not like '%mala Jana%'
        and t."full_text" not like '%trener%'
        and t."full_text" not like '%Jana Cvjetko%'
        and t."full_text" not like '%petrusicsladjana%'
        and t."full_text" not like '%otac 23 Jana%'
        and t."full_text" not like '%njana%'
        and t."full_text" not like '%Gn Jana%'
        and t."full_text" not like '%Jana Korbelov%'
        and t."full_text" not like '%Jana Schimke%'
        and t."full_text" not like '%Jana Kocevska%'
        )
--17 rows