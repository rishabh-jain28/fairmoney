-- customers_rpt_dim.sql
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    registration_date,
    date_of_birth,
    gender,
    kyc_status,      
    loan_application_status,  
    default_status,  
    assigned_collection_executive, 
    region,          
    credit_score,    
    active_loan_id   
FROM {{ ref('stg_customers_dim') }}
