WITH src_tags as (
    select * from {{ref('src_gnome_tags')}}
)
select 
    tag_id,
    initcap(TRIM(tag)) as tag_name
from src_tags