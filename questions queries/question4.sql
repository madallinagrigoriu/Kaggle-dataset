/****** Script for SelectTopNRows command from SSMS  ******/

---4. CREATE A RANKING OF BRAZILIAN STATES BY PURCHASE 

drop table if  exists #temp

SELECT  count(od.[order_id]) as count_orders
      ,cd.[customer_state]
	  into #temp
  FROM [master].[dbo].[olist_orders_dataset] as od
  inner join [master].[dbo].[olist_customers_dataset_ok] as cd
  on od.[customer_id] = cd.[customer_id]
  group by cd.[customer_state]
  order by count_orders desc

  select [customer_state],
  count_orders, 
  rank() over ( order by count_orders desc) as state_rank 
  from #temp