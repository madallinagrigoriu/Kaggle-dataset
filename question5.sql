/****** Script for SelectTopNRows command from SSMS  ******/


---5.ON AVERAGE, HOW MANY ITEMS DOES AN ORDER FROM A CUSTOMER FROM SAN PAULO HAS?
drop table if exists #temp

SELECT  
       oid.[order_item_id]
	  , cd.[customer_unique_id]
	  ,od.[customer_id]
	  ,od.[order_id]
	                                                                                
	  into #temp 
     
  FROM [master].[dbo].[olist_order_items_dataset_ok] as oid 
  inner join [master].[dbo].[olist_orders_dataset] as od
  on od.[order_id] = oid.[order_id]
  inner join[master].[dbo].[olist_customers_dataset_ok] as cd 
  on cd.[customer_id] = od.[customer_id]

  where cd.[customer_state] = 'SP'
  
  ----COUNTING THE ORDER ID'S TO SEE HOW MANY ORDERS A UNIQUE CUSTOMER HAS -----

  select  count(distinct [customer_unique_id] ) as unique_clients,
		  count(distinct [order_id]) as total_orders,
		  count([order_item_id]) as total_items,
		  round(cast(count([order_item_id]) as float)/cast(count(distinct [order_id]) as float),3) as avg_order_items
		  
  from #temp 
 
 
  
 

 
 