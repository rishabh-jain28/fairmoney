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
defaults AS (
    SELECT 
        loan_id,
        default_date,
        default_amount,
        default_status  
    FROM {{ ref('stg_loan_defaults') }} where default_status='Defaulted'
)
SELECT
    COUNT(la.loan_id) AS total_loans,  
    SUM(CASE 
        WHEN df.loan_id IS NOT NULL THEN 1
        ELSE 0
    END) AS total_defaults,  
    (SUM(CASE 
        WHEN df.loan_id IS NOT NULL THEN 1
        ELSE 0
    END) * 100.0 / COUNT(la.loan_id)) AS default_percentage  
FROM loan_applications la
LEFT JOIN defaults df ON la.loan_id = df.loan_id
