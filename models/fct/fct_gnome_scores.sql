with src_score as (
    select * from {{ref('src_gnome_score')}}
)
SElect 
    movie_id,
    tag_id,
    round(relevance,4) as relevance_score
from src_score
where relevance > 0