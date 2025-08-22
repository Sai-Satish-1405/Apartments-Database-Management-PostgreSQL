
SELECT
    pm.payment_method,
    SUM(l.rent_amount) AS  total_turnover,
    COUNT(pm.payment_id) AS number_of_transactions
FROM
    payment pm 
JOIN  
	lease_file l  ON l.property_id = pm.property_number
WHERE
    pm.payment_date >= date_trunc('month',CURRENT_DATE) AND pm.payment_date <=  date_trunc('month',CURRENT_DATE)+INTERVAL '1 month'
GROUP BY
    pm.payment_method
ORDER BY
    total_turnover DESC;