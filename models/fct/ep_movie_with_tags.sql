with fct_movie_w_tags as (
    select * from {{ref('dim_movies_with_tags')}}
)
SELECT * FROM fct_movie_w_tags