CREATE DATABASE IF NOT EXISTS rfm_dbo;

USE rfm_dbo

CREATE TABLE IF NOT EXISTS customers( Customer_id INT PRIMARY KEY,
									  purchase_date DATE,
									  transaction_amount DECIMAL(5,2),
                                      product_information VARCHAR(40),
                                      order_id INT,
                                      location VARCHAR(20)
                                      );

SELECT *
FROM rfm_dbo.customers

-- Establishing recency of each customer:
SELECT Customer_id, MAX(purchase_date) AS last_purchase_date,
       DATEDIFF('2023-07-25', MAX(purchase_date)) AS Recency
FROM  rfm_dbo.customers
GROUP BY customer_id;  

-- Establishing frequency of each customer:
SELECT Customer_id, COUNT(*) AS Frequency
FROM rfm_dbo.customers
GROUP BY Customer_id;      

-- Establishing monetary value of each customer.
SELECT Customer_id, SUM(transaction_amount) AS Monetary_value
FROM rfm_dbo.customers
GROUP BY Customer_id;  

SELECT MIN(purchase_date)
FROM rfm_dbo.customers 

SELECT MAX(purchase_date)
FROM rfm_dbo.customers

-- Creating a view and joining the queries together using a subquery:
CREATE VIEW combinedrfmtable AS
SELECT r.Customer_id, r.Recency, f.Frequency, m.Monetary_value
FROM (SELECT Customer_id, DATEDIFF('2023-07-25', MAX(purchase_date)) AS Recency
      FROM rfm_dbo.customers
      GROUP BY Customer_id) r
JOIN (SELECT Customer_id, COUNT(*) AS Frequency
      FROM rfm_dbo.customers
      GROUP BY customer_id) f ON r.Customer_id = f.Customer_id
JOIN (SELECT Customer_id, SUM(transaction_amount) AS Monetary_value
      FROM rfm_dbo.customers
      GROUP BY Customer_id) m ON r.Customer_id = m.Customer_id;

      

      
-- Customer segmentation using case statements. 
SELECT Customer_id,
       CASE
           WHEN Recency <= 50 THEN 'High'
           WHEN Recency BETWEEN 51 AND 80 THEN 'Medium'
           ELSE 'Low'
       END AS RecencyScore,
       CASE
           WHEN Frequency >= 10 THEN 'High'
           WHEN Frequency BETWEEN 5 AND 9 THEN 'Medium'
           ELSE 'Low'
       END AS FrequencyScore,
       CASE
           WHEN Monetary_value >= 500 THEN 'High'
           WHEN Monetary_value BETWEEN 200 AND 499 THEN 'Medium'
           ELSE 'Low'
       END AS MonetaryScore
FROM combinedrfmtable;










 


                     
