{{
    config(
        materialized='view',
        database='airbnb',
        schema='dev'
    )
}}
with cte_raw_host as 
(
    select * from raw_host
)
select 
        ID , 
        nvl(NAME,'Anonymous') host_name, 
        IS_SUPERHOST, 
        CREATED_AT, 
        UPDATED_AT
from cte_raw_host
--where NAME is null