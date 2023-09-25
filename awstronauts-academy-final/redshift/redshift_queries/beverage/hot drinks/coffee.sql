--------------------------------------------------------------1.

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"

FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% Arabesca %'
	OR t.full_text LIKE '% arabesca %'
	)
	
--records = 0

--------------------------------------------------------------2.


SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",t.full_text LIKE
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% Jacobs %'
	OR t.full_text LIKE '% jacobs %'
	)
	AND (t.full_text LIKE '%ronat%'
	OR t.full_text LIKE '%onarch%')
	
--records = 4
;
--------------------------------------------------------------3.

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE  
	(
	t.full_text LIKE '% Lavazza %'
	OR t.full_text LIKE '%lavazza %'
	)

--records = 10
;

--------------------------------------------------------------4.

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% barcaffe %'
	OR t.full_text LIKE '% Barcaffe %'
	)

--records = 5
;

--------------------------------------------------------------5.

SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% Nescafe %'
	OR t.full_text LIKE '% nescafe %'
	)

--records = 8
;

--------------------------------------------------------------6.


SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% kava %'
	OR t.full_text LIKE '% kavu %'
	OR t.full_text LIKE '% Kavu %'
	OR t.full_text LIKE '% Kava %'
	OR t.full_text LIKE '% coffee %'
	OR t.full_text LIKE '% Coffee %'
	)
	
	AND full_text NOT LIKE '%rabesca %'
	AND full_text NOT LIKE '%avazza %'
	AND full_text NOT LIKE '%escafe %'
	AND full_text NOT LIKE '%arcaffe %'
	

--records = 4557
;
-------------------------------------------------------------



SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% franck %'
	OR t.full_text LIKE '% Franck %')

	AND full_text NOT LIKE '%ibery%'
	AND full_text NOT LIKE '%Ribéry%'
	AND full_text NOT LIKE '%ohann %'
	AND full_text NOT LIKE '%čips%'
	AND full_text NOT LIKE '%photo%'
	AND full_text NOT LIKE '%igrač%'
	AND full_text NOT LIKE '%čaj%'
	AND full_text NOT LIKE '%inatra%'
	AND full_text NOT LIKE '%MMA%'
	AND full_text NOT LIKE '%enzema%'
	AND full_text NOT LIKE '%⚽%'
    AND full_text NOT LIKE '%Leboeuf%'
    AND full_text NOT LIKE '%Maignan%'
    AND full_text NOT LIKE '%Casemiro%'
    AND full_text NOT LIKE '%F1%'
    AND full_text NOT LIKE '%ministre%'
    AND full_text NOT LIKE '%fameux%'
    AND full_text NOT LIKE '%Grupe%'
    
    

	--records = 22
;

-------------------------------------------------------------



SELECT t."user_id",
    t."created_at",
    t."full_text",
    t."hashtags",
    t."name",
    t."lang",
	date(t."created_at") as "date",

    case

        when t."full_text" like '%%' then 'Coffee'

        else null

    end as "product_name"
FROM "twitter_redshift_db"."awstronauts_academy_final_test"."full_text_once_view" as t
WHERE 
	(
	t.full_text LIKE '% julius %'
	OR t.full_text LIKE '% Julius %'
	)
	AND 
	
	(
	t.full_text LIKE '% meinl %'
	OR t.full_text LIKE '% Meinl %'
	)


	--records = 5
;


-------------------------------------------------------------
