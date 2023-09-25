CREATE OR REPLACE VIEW awstronauts_academy_final_test.full_text_once_view AS
SELECT t."user_id",
    u."name",
    CASE
        WHEN LENGTH(t.full_text) % 2 = 0 THEN SUBSTRING(t.full_text, 1, LENGTH(t.full_text) / 2)
        ELSE t.full_text
    END AS full_text,
    t."hashtags",
    t."lang",
    t."created_at"
FROM
    "twitter_redshift_db"."awstronauts_academy_final_data"."tweets" t
INNER JOIN "twitter_redshift_db"."awstronauts_academy_final_data"."users" u
ON t.user_id = u.user_id
WITH NO SCHEMA BINDING;

CREATE VIEW users_view AS
SELECT user_id, name, screen_name as username, location, clean_location, description as profile_description, protected, verified, followers_count, friends_count, listed_count, favourites_count, statuses_count as tweet_cnt, withheld_in_countries, is_croatian 
FROM "users"
WHERE is_croatian=true;

CREATE OR REPLACE VIEW CrosAreTalinkTheMost AS
SELECT t."user_id",
	t."created_at",
	t."full_text",
	t."in_retweet_cnt",
	u."name",
	u."is_croatian"
FROM "tweets" t
	INNER JOIN "users" u ON t.user_id = u.user_id
WHERE is_croatian = TRUE AND (
	full_text LIKE '%sprite%'
	OR full_text LIKE '%Ožujsk%');