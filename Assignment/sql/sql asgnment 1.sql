create database sql_assignment;
use  sql_assignment;

CREATE TABLE factory (
  factory_id INT PRIMARY KEY,
  factory_name VARCHAR(100),
  location VARCHAR(50),
  manager_name VARCHAR(50)
);

INSERT INTO factory VALUES
(1, 'Alpha Manufacturing', 'Pune', 'Rajesh Kumar'),
(2, 'Beta Industries', 'Chennai', 'Suresh Iyer'),
(3, 'Gamma Works', 'Bangalore', 'Anita Sharma'),
(4, 'Delta Corp', 'Hyderabad', 'Ravi Verma'),
(5, 'Omega Manufacturing', 'Ahmedabad', 'Neha Patel');

select * from factory;


CREATE TABLE production (
 production_id INT PRIMARY KEY,
 factory_id INT,
 product_name VARCHAR(50),
 quantity_produced INT,
  production_cost DECIMAL(10,2),
  production_date DATE,
 shift VARCHAR(10),
 FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);

INSERT INTO production VALUES
(1, 1, 'Gear Box', 120, 45000, '2025-01-01', 'Day'),
(2, 1, 'Engine Part', 90, 72000, '2025-01-02', 'Night'),
(3, 2, 'Brake Pad', 200, 30000, '2025-01-03', 'Day'),
(4, 2, 'Clutch Plate', 150, 55000, '2025-01-04', 'Night'),
(5, 3, 'Axle Rod', 80, 40000, '2025-01-05', 'Day'),
(6, 3, 'Gear Box', 110, 46000, '2025-01-06', 'Night'),
(7, 4, 'Piston', 130, 60000, '2025-01-07', 'Day'),
(8, 4, 'Cylinder', 95, 52000, '2025-01-08', 'Night'),
(9, 5, 'Engine Block', 70, 90000, '2025-01-09', 'Day'),
(10, 5, 'Crank Shaft', 60, 85000, '2025-01-10', 'Night'),
(11, 1, 'Brake Pad', 210, 31000, '2025-01-11', 'Day'),
(12, 2, 'Gear Box', 140, 47000, '2025-01-12', 'Night'),
(13, 3, 'Piston', 125, 61000, '2025-01-13', 'Day'),
(14, 4, 'Clutch Plate', 155, 56000, '2025-01-14', 'Night'),
(15, 5, 'Axle Rod', 100, 42000, '2025-01-15', 'Day'),
(16, 1, 'Cylinder', 85, 50000, '2025-01-16', 'Night'),
(17, 2, 'Engine Part', 95, 74000, '2025-01-17', 'Day'),
(18, 3, 'Brake Pad', 220, 33000, '2025-01-18', 'Night'),
(19, 4, 'Gear Box', 115, 48000, '2025-01-19', 'Day'),
(20, 5, 'Piston', 105, 62000, '2025-01-20', 'Night');

select * from production;

# ques1 
select * from production;
# ques 2
select product_name, quantity_produced from production;
#ques 3
select product_name, quantity_produced from production where quantity_produced > 150;
#ques 4
select *from production where production_cost < 50000;
#ques 5
select product_name, quantity_produced from production where quantity_produced between 80 and 120;
#ques 6
select * from production where product_name like "Gear Box";
#ques 7
select * from production where shift like "day";
#ques8
select product_name from production where shift like "night";
#ques 9
select distinct product_name from production;
#ques 10
select distinct shift from production;
#ques 11
select distinct  * from production order by production_cost asc;
#ques 12
select distinct  * from production order by quantity_produced desc;
#quest 13
select distinct  * from production order by product_name limit 5;
#ques 14
select distinct production_date from production order by production_date desc;
#ques 15
Select product_name, max(quantity_produced) as highest_quantity from production group by product_name
order by highest_quantity desc limit 3;
#ques 16
select distinct * from production order by product_name asc limit 6 offset 5;
#ques 17
select product_name , quantity_produced , factory_name from production inner join factory on 
production.factory_id = factory.factory_id;
#ques 18

select f.factory_name , sum(p.quantity_produced) as total_quantity_produced from factory f 
inner join production p on f.factory_id = p.factory_id
group by factory_name 
order by total_quantity_produced ;

#ques 18 another way

select f.factory_name , sum(p.quantity_produced) as total_quantity_produced from factory f ,
production p where f.factory_id = p.factory_id
group by factory_name 
order by total_quantity_produced ;

#ques 19
select location , product_name from factory inner join production on 
factory.factory_id = production.factory_id where location = "pune";

#qus 20
select factory_name , production_cost from factory inner join production on
 factory.factory_id = production.factory_id where production_cost>60000;
#ques 21
select factory_name , shift , product_name , production_cost from factory inner join production on 
factory.factory_id = production.factory_id where shift="day" order by production_cost desc limit 5 ;
#ques 22
select distinct product_name , location from production inner join factory on
 factory.factory_id = production.factory_id
 where location = "pune " or  location ="bangalore";
 
 #ques 23
 select factory_name, product_name , quantity_produced from factory inner join
 production on factory.factory_id = production.factory_id order by  quantity_produced desc limit 5 offset 2;
 #ques 24
 select factory_name, shift, location , product_name , production_cost from factory f inner join
 production p on f.factory_id = p.factory_id
 where (location = "hyderabad" or location = "chennai") and  shift = "night"
 order by  production_cost= 40000<>70000;
 
 #ques 25
 select factory_name , shift, product_name, production_cost from factory inner join
 production on factory.factory_id = production.factory_id;
 #ques 26
 select factory_name ,  product_name, quantity_produced from factory inner join
 production on factory.factory_id = production.factory_id;
 #ques 27
 select product_name , quantity_produced from production where quantity_produced >100;
 #ques 28
 select product_name from production where product_name not like "brake pad";
 
 #ques 29
 select factory_name , quantity_produced from factory inner join
 production on factory.factory_id = production.factory_id
order by factory_name asc , quantity_produced desc;

