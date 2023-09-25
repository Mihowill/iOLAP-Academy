--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% Čaj %' OR
	t.full_text LIKE '% čaj %' OR
	t.full_text LIKE '% tea %' 

	)
	
	AND full_text NOT LIKE '%Gorjanc%'

	

--records = 776
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE  (
	t.full_text LIKE '% Franck %' OR
	t.full_text LIKE '% franck %'
	)
	
	AND t.full_text LIKE '%čaj%'

	

--records = 1
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE  (
	t.full_text LIKE '% naturavita %' OR
	t.full_text LIKE '% Naturavita %' OR
	t.full_text LIKE '%natura vita%' OR
	t.full_text LIKE '%Natura vita%'
	)
	

--records = 1
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE (
	t.full_text LIKE '% Podravka %' OR
	t.full_text LIKE '% podravka %'
	)
	
	AND t.full_text LIKE '%čaj%'
	
--records = 0
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% lord  %' OR
	t.full_text LIKE '% Lord  %'
	)
	AND
	(
	t.full_text LIKE '% nelson %' OR
	t.full_text LIKE '% Nelson %'
	)
	
--records = 0
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% ahmad %' OR
	t.full_text LIKE '% Ahmad %'
	)
	AND
	(
	t.full_text LIKE '% tea %' OR
	t.full_text LIKE '% Tea %'
	)
	
--records = 0
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% teekanne %' OR
	t.full_text LIKE '% Teekanne %'
	)
	
--records = 0
;
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Tea'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% agristar %' OR
	t.full_text LIKE '% Agristar %'
	)
	
	
--records = 1
;

