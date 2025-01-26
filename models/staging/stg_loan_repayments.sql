-- stg_loan_repayments.sql
SELECT 
    loan_id,
    repayment_date,
    repayment_amount,
    repayment_status  -- e.g., Paid, Pending, Overdue
FROM {{ source('project', 'STG_LOAN_REPAYMENTS') }}
