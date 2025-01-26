-- stg_loan_applications.sql
SELECT 
    loan_id,
    customer_id,
    product_id,
    application_date,
    loan_amount,
    application_status, -- Applied, Approved, Rejected
    offer_status,       -- Accepted, Declined
    offer_accepted_date
FROM {{ source('project', 'STG_LOAN_APPLICATIONS') }}
