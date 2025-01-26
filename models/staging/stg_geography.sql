-- stg_geographies.sql
SELECT 
    region_id,
    region_name,       -- Region like West Africa, East Africa
    country_name,      -- Country like Nigeria, Kenya
    city_name,         -- City like Lagos, Nairobi
    urban_rural_flag   -- Urban or rural classification
FROM {{ source('project', 'STG_GEOGRAPHY') }}
