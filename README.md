# Kaggle-dataset

<b> Context:</b> I've used 'Brazilian E-Commerce Public Dataset by Olist' from https://www.kaggle.com/olistbr/brazilian-ecommerce in order to find the evolution of sales by category, average time of delivery, etc. 

<b> Instructions to setup the environment </b>

1. Login to Kaggle and download the https://www.kaggle.com/olistbr/brazilian-ecommerce CSV's
2. Upload the CSV's to your database 
2.1 I've used MSSQL(download link https://www.microsoft.com/en-us/download/details.aspx?id=55994) 
2.2 Open each CSV file with Notepad and remove the " " using CTR+H 
2.3 Upload each dataset in MSSQL in Master DB as:
- right click -> Tasks -> Import Data -> Choose a data source (screenshot attached) -> Flat file source -> upload one CSV file 
- From 'Choose Destination' window choose 'SQL Server Native Client 11.0' -> check the database name to be 'master' -> Next -> Finish 
- repeat the previous step until all the CSV's are uploaded succesfully in your DB 
3. Check the datatype for each column to match the value type, if not modify it 
4. Open each question in mssql in order to see the query and the values

--------------------------------------------------------
<b> Questions from the dataset </b>
1. Who is the customer who bought the most?
2. What are the statuses of complete purchase orders? Calculate the frequency of each status.
3. What are the top 10 selling product categories?
4. Create a ranking of Brazilian states by purchases.
5. On average, how many items does an order from a customer from the SP state have?
6. On average, how long does it take for an approved purchase to be sent to the buyer?
7. On average, how long does it take for a purchase to reach the buyer?
8. Which vendor takes the longest to ship the product?
Optional questions:
9. Which vendor takes the longest to deliver the product?
10. On average, how long does it take for a customer to evaluate the seller?
11. Create a chart to show the evolution of sales by category over time.
12. Plot the frequency of items by sale
----------------------------------------------------------

Each query file contains the title for the numeroted question.  

