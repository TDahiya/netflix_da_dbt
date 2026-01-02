{{config(materialized = 'table')}}
WITH fct_ratings as (
    select * from {{ref('fct_ratings')}}
),
seed_dates as (
    select * from {{ref('seed_movie_release_dates')}}
)

SELECT 
    f.*,
    CASE 
        WHEN d.release_date is null then 'unknown'
        ELSE 'known'
    END as release_info_available
FROM fct_ratings f 
LEFT JOIN seed_dates d 
ON f.movie_id = d.movie_id