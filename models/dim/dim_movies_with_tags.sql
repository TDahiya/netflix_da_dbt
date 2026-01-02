{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH movies as (
    SELECT * FROM {{ref("dim_movies")}}
),
tags AS (
    SELECT * FROM {{ref("dim_gnome_tags")}}
),
scores as(
    SELECT * FROM {{ref("fct_gnome_scores")}}
)
SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance_score
FROM movies m 
LEFT JOIN scores s on m.movie_id = s.movie_id
LEFT JOIN tags t on t.tag_id = s.movie_id