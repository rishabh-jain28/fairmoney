-- average_loan_balance_rpt_fact.sql
WITH loan_applications AS (
    SELECT 
        loan_id,
        customer_id,
        application_date,
        loan_amount,
        application_status, 
        offer_status,       
        offer_accepted_date
    FROM {{ ref('stg_loan_applications') }}  
)
SELECT
    la.loan_id,
    la.customer_id,
    la.application_date,
    la.loan_amount,
    la.application_status,
    la.offer_status,
    la.offer_accepted_date,
    COUNT(la.loan_id) AS total_loans,
    SUM(la.loan_amount) AS total_loan_amount,
    (SUM(la.loan_amount) / COUNT(la.loan_id)) AS average_loan_balance
FROM loan_applications la
GROUP BY 
    la.loan_id, 
    la.customer_id, 
    la.application_date, 
    la.loan_amount, 
    la.application_status, 
    la.offer_status, 
    la.offer_accepted_date
