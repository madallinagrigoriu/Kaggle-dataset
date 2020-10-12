---9. WHICH VENDOR TAKES THE LONGEST TO DELIVER THE PRODUCT?

 drop table if exists #temp


 SELECT
       oid.[order_id]
      ,oid.[seller_id]
      ,od.[order_purchase_timestamp]
	  ,od.[order_delivered_customer_date]

  into #temp

  FROM [master].[dbo].[olist_order_items_dataset_ok] as oid
  inner join [master].[dbo].[olist_orders_dataset] as od
  on oid.[order_id] = od.[order_id]
                                                                                

  select top (1) 
	   [seller_id]
	  ,[order_id]
	  ,DATEDIFF(day,[order_delivered_customer_date],[order_purchase_timestamp]) as diff_delivery_days
 
  from #temp
  where [order_delivered_customer_date] != '1900-01-01 00:00:00.000'
  
  order by diff_delivery_days asc
  
  