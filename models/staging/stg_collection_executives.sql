
-- stg_collection_executives.sql
SELECT 
    executive_id,
    first_name,
    last_name,
    phone_number,
    email,
    region,
    total_assigned_cases, -- Total number of cases handled by the executive
    total_collections,    -- Total amount collected by the executive
    active_cases,         -- Active cases currently handled by the executive
    performance_rating    -- Rating based on the performance
FROM {{ source('project', 'STG_COLLECTION_EXECUTIVES') }}
