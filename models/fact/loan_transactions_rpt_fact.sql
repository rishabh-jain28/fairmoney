-- loan_transactions_rpt_fact.sql
WITH loan_applications AS (
    SELECT 
        loan_id,
        customer_id,
        product_id,
        application_date,
        loan_amount,
        application_status, 
        offer_status,       
        offer_accepted_date
    FROM {{ ref('stg_loan_applications') }}  
),
loan_disbursements AS (
    SELECT 
        loan_id,
        disbursement_date,
        disbursed_amount,
        disbursement_status 
    FROM {{ ref('stg_loan_disbursements') }}  
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
),
collections AS (
    SELECT 
        loan_id,
        collection_date,
        collected_amount,
        collection_status  
    FROM {{ ref('stg_loan_collections') }}  
)
SELECT 
    la.loan_id,
    la.customer_id,
    la.product_id,
    la.application_date,
    la.loan_amount,
    la.application_status,
    la.offer_status,
    la.offer_accepted_date,
    ld.disbursement_date,
    ld.disbursed_amount,
    ld.disbursement_status,
    rp.repayment_date,
    rp.repayment_amount,
    rp.repayment_status,
    df.default_date,
    df.default_amount,
    df.default_status,
    cl.collection_date,
    cl.collected_amount,
    cl.collection_status
FROM loan_applications la
LEFT JOIN loan_disbursements ld ON la.loan_id = ld.loan_id
LEFT JOIN repayments rp ON la.loan_id = rp.loan_id
LEFT JOIN defaults df ON la.loan_id = df.loan_id
LEFT JOIN collections cl ON la.loan_id = cl.loan_id
