/****** Script for SelectTopNRows command from SSMS  ******/


--1. WHO IS THE CUSTOMER WHO BOUGHT THE MOST? ---
SELECT top (1) cd.[customer_id],
		cd.[customer_unique_id],
        max(oid.[order_item_id]) as max_quantity,
        od.[order_id]
     
   
  FROM [master].[dbo].[olist_customers_dataset_ok] as cd
  inner join [master].[dbo].[olist_orders_dataset] as od
  on cd.[customer_id] = od.[customer_id]
  inner join [master].[dbo].[olist_order_items_dataset_ok] as oid
  on od.[order_id] = oid.[order_id]
  group by cd.[customer_id],
        cd.[customer_unique_id],
        od.[order_id]
order by max_quantity desc
		

