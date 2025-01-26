-- stg_loan_disbursements.sql
SELECT 
    loan_id,
    disbursement_date,
    disbursed_amount,
    disbursement_status -- e.g., Disbursed, Pending
FROM {{ source('project', 'STG_LOAN_DISBURSEMENTS') }}
