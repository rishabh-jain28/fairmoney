-- stg_time.sql
SELECT 
    date_id,
    date AS date,
    EXTRACT(year FROM date) AS year,
    EXTRACT(quarter FROM date) AS quarter,
    EXTRACT(month FROM date) AS month,
    EXTRACT(dow FROM date) AS day_of_week,
    EXTRACT(day FROM date) AS day_of_month,
    EXTRACT(week FROM date) AS week_number
FROM {{ source('project', 'STG_TIME') }}
