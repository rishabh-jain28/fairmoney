-- stg_loan_products.sql
SELECT 
    product_id,
    product_name,
    product_type,      -- Short-term, Long-term
    interest_rate,
    max_loan_amount,
    loan_term_in_days, -- The loan term in days
    eligibility_criteria -- Eligibility criteria for loan products
FROM {{ source('project', 'STG_LOAN_PRODUCTS') }}
