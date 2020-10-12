/****** Script for SelectTopNRows command from SSMS  ******/

--6. ON AVERAGE, HOW LONG DOES IT TAKE FOR AN APPROVED PURCHASE TO BE SENT TO THE BUYER?

drop table if exists #temp

SELECT  
	   cd.[customer_unique_id]
	  ,od.[customer_id]
	  ,od.[order_id]
	  ,[order_delivered_customer_date]
	  ,[order_approved_at]

	  into #temp 
     
  from [master].[dbo].[olist_orders_dataset] as od

  inner join [master].[dbo].[olist_customers_dataset_ok] as cd 
  on cd.[customer_id] = od.[customer_id]

 
 select count(distinct [customer_unique_id]) as unique_clients,
 SUM(DATEDIFF(day,[order_delivered_customer_date],[order_approved_at])) / count(distinct [customer_id]) as avg_days_to_approved_deliver

 from #temp 
 where [order_delivered_customer_date] != '1900-01-01 00:00:00.000' --ignoring the blank values 
 and [order_approved_at] != '1900-01-01 00:00:00.000' --ignoring the blank values 


 
 
