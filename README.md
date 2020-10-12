# Kaggle-dataset

Context: I've used 'Brazilian E-Commerce Public Dataset by Olist' from https://www.kaggle.com/olistbr/brazilian-ecommerce in order to find the evolution of sales by category, average time of delivery, etc. 

Instructions to setup the environment

1.Login to Kaggle and download the https://www.kaggle.com/olistbr/brazilian-ecommerce CSV's
2.Upload the CSV's to your database 
2.1 I've used MSSQL(download link https://www.microsoft.com/en-us/download/details.aspx?id=55994) 
2.2 Open each CSV file with Notepad and remove the "" using CTR+H
2.3 Upload each dataset in MSSQL in Master DB as :
- right click -> Tasks -> Import Data 
