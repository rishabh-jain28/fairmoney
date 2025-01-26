-- collection_executives_rpt_dim.sql
SELECT 
    executive_id,         
    first_name,           
    last_name,            
    phone_number,         
    email,                
    region,               
    total_assigned_cases, 
    total_collections,    
    active_cases,         
    performance_rating    
FROM {{ ref('stg_collection_executives') }}
