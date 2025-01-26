-- time_rpt_dim.sql
SELECT 
    date_id,
    date AS date,
    year,
    quarter,
    month,
    day_of_week,
    day_of_month,
    week_number
FROM {{ ref('stg_time') }}
