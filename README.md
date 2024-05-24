# Recency,Frequency & Monetary value.

In this RFM model I used a simple dataset to conduct RFM analysis using SQL. I created a database for the data and created tables with different constraints to ensure data integrity.  I calculated the most recent purchase by using the DATEDIFF but set my date to 2023-07-25 as the dataset was quite old.For the frequency i used the COUNT function to establish the number of times the unique customer ids made purchases. I calculated the SUM of transactions made by the unique customer ids to establish the total spending. I created a SQL view where I joined the three queries using a subquery and named my view as combinedrfmtable.
I utilized the CASE statement (if,else) statements to do customer segmentation where customers with a recency score <=50 classified as High, between 51 and 80 to be medium and higher than that as low. I did this for frequency and monetary value.

I utilized tableau to perform data visualizaton.
[Tableu Visualization](https://public.tableau.com/app/profile/jeff.kamuthu/viz/RFManalysis_/RFM_analysis_?publish=yes)

