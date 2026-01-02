-- SELECT 
--     movie_id,
--     tag_id,
--     relevance_score
-- FROM {{ref('fct_gnome_scores')}}
-- WHERE relevance_score <= 0
{{no_nulls_in_columns(ref('fct_gnome_scores'))}}