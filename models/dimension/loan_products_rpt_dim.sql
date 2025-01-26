-- loan_products_rpt_dim.sql
SELECT 
    product_id,
    product_name,      
    product_type,      
    interest_rate,     
    max_loan_amount,   
    loan_term_in_days, 
    eligibility_criteria 
FROM {{ ref('stg_loan_products') }}
