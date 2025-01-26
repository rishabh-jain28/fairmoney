-- geography_rpt_dim.sql
SELECT 
    region_id,
    region_name,       
    country_name,      
    city_name,         
    urban_rural_flag   
FROM {{ ref('stg_geography') }}
