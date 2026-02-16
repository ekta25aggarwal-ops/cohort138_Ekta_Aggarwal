use sql_assignment;
select * from factory;
select * from production;

# part A
# ques1 1. Display product name, quantity produced, production cost, and 
#cost per unit (production_cost / quantity_produced). Alias as cost_per_unit.
select product_name, quantity_produced, production_cost , (production_cost / quantity_produced) as cost_per_unit
from production;

#2. Show product name, production date, and extract the year from production date. Alias as production_year.
select product_name, production_date, substring(production_date,1,4) as production_year
from production;

#3. Display product name and production cost along with 10% increased cost
# (production_cost + 10%). Alias as estimated_future_cost.
select product_name, production_cost , (production_cost * 1.10  ) as estimated_future_cost
from production;

#4. Show product name, quantity produced, production cost, and total production value
# (quantity_produced × production_cost). Alias as production_value.
select product_name, quantity_produced, production_cost , (quantity_produced * production_cost)
 as total_production_value from production;
 
 #5. Display production_id, quantity produced, and remaining capacity assuming 
 #factory daily capacity is 250 units (250 - quantity_produced). Alias as remaining_capacity.
 select production_id, quantity_produced, (250-quantity_produced)
 as remaining_capacity from production;
 
 #part b
 #6. Find the total quantity produced across all factories.
 select sum(quantity_produced) as total_quantitiy_produced from production ;
 
 #7. Find the average production cost of all products.
 select avg(production_cost) as avg_production_cost from production;
 
 #8. Find the maximum and minimum quantity produced.
 select max(quantity_produced) as max_quatity_produced from production;
  select min(quantity_produced) as max_quatity_produced from production;
  
  #9. Count how many production records exist for Night shift.
   select sum(quantity_produced) as production_record from production where shift="night";
   
#10. Find the total number of distinct products manufactured.
select count(distinct product_name ) as distinct_product_count from production ;


-----------------------------
#PART C
-----------------------------
#11. Find total quantity produced per product.
select sum(quantity_produced) as total_quntity_produced from production group by product_name ;

#12. Find total production cost per factory (show factory name).
select factory_name, sum(production_cost) as total_production_cost from production inner join
factory on factory.factory_id = production.factory_id group by factory_name;

#13. Show average quantity produced per shift.
select shift, avg(quantity_produced) as avg_quatity from production group by shift;

#14. Find number of production records per factory (display factory name and count).
select factory_name, sum(quantity_produced) as count_quantity_produced from production inner join
factory on factory.factory_id = production.factory_id group by factory_name;

#15. For each product, calculate total quantity, average cost, and total cost.
select product_name, sum(quantity_produced) as total_qnt_produce ,avg(production_cost)
 as avg_prodc_cost, sum(production_cost)
as total_produc_cost from production group by product_name;

-----------------------------
#PART D –
-----------------------------
#16. List total quantity produced by each factory sorted in descending order.
select factory_name, sum(quantity_produced) as count_quanti_produced from production inner join
factory on factory.factory_id = production.factory_id group by factory_name order by factory_name desc;

#17. Display factories with their total production cost sorted from highest to lowest.
select factory_name, sum(production_cost) as sum_produced_cost from production inner join
factory on factory.factory_id = production.factory_id group by factory_name order by factory_name desc;

#18. Find top 3 products based on total quantity produced.
select product_name, sum(quantity_produced) as sum_quantity_produced from
 production group by product_name order by sum_quantity_produced desc limit 3;

#19. Show bottom 5 production records based on production cost using ORDER BY and LIMIT.
select product_name,  production_cost from production order by production_cost asc limit 5;

#20. Display factory name, product name, and production cost for all records sorted by factory name and production cost.
select product_name, factory_name ,production_cost from production inner join
factory on factory.factory_id = production.factory_id order by factory_name , production_cost asc;



 