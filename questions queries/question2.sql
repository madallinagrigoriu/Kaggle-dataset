/****** Script for SelectTopNRows command from SSMS  ******/

--2.CALCULATE THE FREQUENCY OF EACH STATUS


SELECT count( [order_id]) as status_frequency,
[order_status]
  
     
     
  FROM [master].[dbo].[olist_orders_dataset]

  group by [order_status]
  order by status_frequency 
 