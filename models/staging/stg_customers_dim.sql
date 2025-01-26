-- stg_customers.sql
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    registration_date,
    date_of_birth,
    gender,
    kyc_status,            -- If the customer has completed KYC
    loan_application_status, -- Tracks the current loan application status
    default_status,         -- Whether the customer is in default
    assigned_collection_executive, -- The collection agent responsible
    region,                 -- Region of the customer
    credit_score,           -- Credit score (could be used for loan eligibility)
    active_loan_id          -- Currently active loan (if applicable)
FROM {{ source('project', 'STG_CUSTOMERS') }}
