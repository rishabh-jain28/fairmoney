-- stg_loan_collections.sql
SELECT 
    loan_id,
    collection_date,
    collected_amount,
    collection_status  -- e.g., Collected, Pending
FROM {{ source('project', 'STG_LOAN_COLLECTIONS') }}
