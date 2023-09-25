SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."hashtags",
	t."name",
    t."lang",
    date(t."created_at") as "date",
    case
        when t."full_text" like '%%' then 'sprite'
        else null
    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (t."full_text" like '% sprite %' or t."full_text" like '% Sprite %' or t."hashtags" like '%sprite%' or t."hashtags" like '%Sprite%') and
        (t."full_text" not like '%r sprite%' and t."full_text" not like '%smoke sprite%'
        and t."full_text" not like '%pixel sprite%' and t."full_text" not like '%sprite mode%' and t."full_text" not like '%Smoke Sprite%'
        and t."full_text" not like '%draw a sprite%' and t."full_text" not like '%PSD sprite%' and t."full_text" not like '%SMOKE SPRITE%'
        and t."full_text" not like '%sprite redraw%' and t."full_text" not like '%sprite edit%' and t."full_text" not like '%sprite this goober%'
        and t."full_text" not like '%SmokeSprite%' 
        and t."full_text" not like '%stardewvalley%'
        and t."full_text" not like '%playable sprite%'
        and t."full_text" not like '%sprite exercise%'
        and t."full_text" not like '%genshin%'
        and t."full_text" not like '%sprite layer%'
        and t."full_text" not like '%unfiltered sprite%'
        and t."full_text" not like '%nimated sprite%'
        and t."full_text" not like '%Dirty Sprite 3%'
        and t."full_text" not like '%idle sprite%'
        and t."full_text" not like '%silver wolf sprite%'
        )
--23 rows