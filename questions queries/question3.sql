---3.WHAT ARE THE TOP 10 SELLING PRODUCT CATEGORIES?
drop table if exists #temp 


SELECT top (10) count(pd.[product_id]) as count_items
      ,iif(pd.[product_category_name] = '','other',pd.[product_category_name]) as product_category_name
	  ,iif(pcnt.[product_category_name_english] IS NULL,'other',pcnt.[product_category_name_english]) as product_category_name_english

  into #temp

  FROM [master].[dbo].[olist_products_dataset_ok] as pd
  inner join [master].[dbo].[olist_order_items_dataset_ok] as oid
  on pd.[product_id] = oid.[product_id]
  inner join [master].[dbo].[olist_orders_dataset] as od 
  on oid.[order_id] = od.[order_id]
  left join [master].[dbo].[product_category_name_translation_ok] as pcnt
  on pcnt.[product_category_name] = pd.[product_category_name]

  group by pd.[product_category_name],pcnt.[product_category_name_english]
  order by count_items desc, pcnt.[product_category_name_english] asc

  ---TOP 10 SELLING PRODUCT CATEGORIES IN PORTUGUESE AND ENGLISH 

  SELECT product_category_name,product_category_name_english
  FROM  #temp