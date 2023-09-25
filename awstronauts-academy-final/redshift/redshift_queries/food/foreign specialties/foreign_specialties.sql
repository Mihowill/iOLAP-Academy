--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% biftek %' OR
	t.full_text LIKE '% Biftek %'
	)
	
--records = 22
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% ratatouille %' OR
	t.full_text LIKE '% Ratatouille %'
	)
	
--records = 10
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% Sushi %' OR
	t.full_text LIKE '% sushi %'
	)
	
--records = 150
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% moussaka %' OR
	t.full_text LIKE '% Moussaka %' OR 
	t.full_text LIKE '% musaka %'	OR 
	t.full_text LIKE '% Musaka %'
	)
	
--records = 8
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% tofu %' OR
	t.full_text LIKE '% Tofu %'
	)
	
--records = 110
--------------------------------------------------------------

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '%sataraš%' OR
	t.full_text LIKE '%Sataraš%'
	)
	
	AND full_text not LIKE '%Mrak%'
	
--records = 35
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% Ramen %' OR
	t.full_text LIKE '% ramen %'
	)
--records = 72
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% Spring %' OR
	t.full_text LIKE '% spring %'
	)
	AND
	(
	t.full_text LIKE '%roll%' OR
	t.full_text LIKE '%Roll%'
	)
--records = 5
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% burrito%' OR
	t.full_text LIKE '% Burrito%'OR
	t.full_text LIKE '% burito %'	OR
	t.full_text LIKE '% Burito%'
	
	)

--records = 41
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% enchilada%' OR
	t.full_text LIKE '% Enchilada%'OR
	t.full_text LIKE '% enčilada%'	OR
	t.full_text LIKE '% Enčilada%'
	
	)

--records = 8
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '% mesne%' OR
	t.full_text LIKE '% Mesne%' OR
	t.full_text LIKE '%meet balls%'
	
	)
	AND
	(
	t.full_text LIKE '% okruglice%' OR
	t.full_text LIKE '% Okruglice%'OR
	t.full_text LIKE '% meet balls%'
	OR
	t.full_text LIKE '%meet balls%'
	
	)
	
--records = 6
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (

	t.full_text LIKE '%gyros%' or
	t.full_text LIKE '%giros%'
	or
	t.full_text LIKE '%Giros%'
	or
	t.full_text LIKE '%Gyros%'
	)

--records = 50
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (

	t.full_text LIKE '% Gelato%' or
	t.full_text LIKE '% gelato%')

--enchiladas
--records = 21
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

        when t."full_text" like '%%' then 'Foreign specialties'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
    (
	t.full_text LIKE '%taco %' OR
	t.full_text LIKE '%Taco %'
	)
    AND full_text not LIKE '%Staco%'
--records = 143
;
--------------------------------------------------------------
