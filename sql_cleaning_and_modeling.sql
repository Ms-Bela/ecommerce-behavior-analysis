-- Data Cleaning
SELECT
  SAFE_CAST(Customer_ID AS STRING) AS Customer_ID,
  SAFE_CAST(Age AS INT64) AS Age,
  Gender,
  Income_Level,
  Marital_Status,
  Education_Level,
  Occupation,
  Location,
  Purchase_Category,
  SAFE_CAST(Purchase_Amount AS FLOAT64) AS Purchase_Amount,
  SAFE_CAST(Frequency_of_Purchase AS INT64) AS Frequency_of_Purchase,
  Purchase_Channel,
  SAFE_CAST(Brand_Loyalty AS INT64) AS Brand_Loyalty,
  SAFE_CAST(Product_Rating AS INT64) AS Product_Rating,
  SAFE_CAST(Time_Spent_on_Product_Research AS INT64) AS Time_Spent_on_Product_Research,
  Social_Media_Influence,
  Discount_Sensitivity,
  SAFE_CAST(Return_Rate AS FLOAT64) AS Return_Rate,
  SAFE_CAST(Customer_Satisfaction AS INT64) AS Customer_Satisfaction,
  Engagement_with_Ads,
  Device_Used_for_Shopping,
  Payment_Method,
  SAFE_CAST(Time_of_Purchase AS DATETIME) AS Time_of_Purchase,
  Discount_Used,
  Customer_Loyalty_Program_Member,
  Purchase_Intent,
  Shipping_Preference,
  Payment_Frequency,
  SAFE_CAST(Time_to_Decision AS INT64) AS Time_to_Decision
FROM
  `project.dataset.raw_orders`
WHERE
  Customer_ID IS NOT NULL;

-- EDA Queries (Examples)
SELECT Gender, AVG(Purchase_Amount) AS AvgSpend FROM `project.dataset.cleaned_orders` GROUP BY Gender;
SELECT Social_Media_Influence, COUNT(*) AS Count FROM `project.dataset.cleaned_orders` GROUP BY Social_Media_Influence;

-- Feature Engineering
SELECT
  *,
  CASE
    WHEN Brand_Loyalty >= 7 THEN 'Loyal'
    ELSE 'Non-Loyal'
  END AS Loyalty_Segment,
  CASE
    WHEN Customer_Satisfaction >= 8 THEN 'High Satisfaction'
    WHEN Customer_Satisfaction BETWEEN 5 AND 7 THEN 'Moderate Satisfaction'
    ELSE 'Low Satisfaction'
  END AS Satisfaction_Level
FROM
  `project.dataset.cleaned_orders`;