/****** Script for SelectTopNRows command from SSMS  ******/

---11.CREATE A CHART TO SHOW THE EVOLUTION OF SALES BY CATEGORY OVER TIME 


SELECT count(pd.[product_id]) as count_items
      ,iif(pd.[product_category_name] = '','other',pd.[product_category_name]) as product_category_name
	  ,iif(pcnt.[product_category_name_english] IS NULL,'other',pcnt.[product_category_name_english]) as product_category_name_english
	  ,year (od.[order_purchase_timestamp]) as purchase_year
	  


  FROM [master].[dbo].[olist_products_dataset_ok] as pd
  inner join [master].[dbo].[olist_order_items_dataset_ok] as oid
  on pd.[product_id] = oid.[product_id]
  inner join [master].[dbo].[olist_orders_dataset] as od 
  on oid.[order_id] = od.[order_id]
  left join [master].[dbo].[product_category_name_translation_ok] as pcnt
  on pcnt.[product_category_name] = pd.[product_category_name]

  group by pd.[product_category_name],year (od.[order_purchase_timestamp]),pcnt.[product_category_name_english]
  order by pcnt.[product_category_name_english] asc, purchase_year asc




  
 