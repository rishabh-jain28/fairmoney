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
),
repayments AS (
    SELECT 
        loan_id,
        repayment_date,
        repayment_amount,
        repayment_status
    FROM {{ ref('stg_loan_repayments') }}
),
defaults AS (
    SELECT 
        loan_id,
        default_date,
        default_amount,
        default_status
    FROM {{ ref('stg_loan_defaults') }}
)
SELECT
    COUNT(la.loan_id) AS total_loans_with_first_due,  
    SUM(CASE 
        WHEN rp.loan_id IS NOT NULL AND rp.repayment_status = 'Overdue' THEN 1
        ELSE 0
    END) AS total_1st_payment_defaults,  
    (SUM(CASE 
        WHEN rp.loan_id IS NOT NULL AND rp.repayment_status = 'Overdue' THEN 1
        ELSE 0
    END) * 100.0 / COUNT(la.loan_id)) AS first_payment_default_rate_percentage  
FROM loan_applications la
LEFT JOIN repayments rp ON la.loan_id = rp.loan_id
LEFT JOIN defaults df ON la.loan_id = df.loan_id
WHERE rp.repayment_date = la.offer_accepted_date
