-- stg_loan_defaults.sql
SELECT 
    loan_id,
    default_date,
    default_amount,
    default_status  -- e.g., Defaulted, Not Defaulted
FROM {{ source('project', 'STG_LOAN_DEFAULTS') }}
