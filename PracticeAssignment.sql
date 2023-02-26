CREATE database Practice_Assignment;
USE Practice_Assignment;

-- PASSENGER Table creation 
create table PASSENGER (
Id int auto_increment primary key,
 Passenger_name varchar(50),
 Category varchar(10),
 Gender varchar (10),
 Boarding_City varchar(50),
 Destination_City varchar(50),
 Distance int,
 Bus_Type varchar(10)
 );
 
 -- PRICE Table creation
 create table PRICE (
 Bus_Type varchar(10),
 Distance int,
 Price int
 );
 
 -- Inserting values into table PASSENGER
 insert into PASSENGER (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
 values 
 ('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
 ('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
 ('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
 ('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
 ('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper'),
 ('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
 ('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
 ('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
 ('Piyush','AC','M','Pune','Nagpur',700,'Sitting');
 
 
 -- Inserting values into table PRICE
 insert into PRICE (Bus_Type, Distance, Price)
 values
 ('Sleeper',350,770),
 ('Sleeper',500,1100),
 ('Sleeper',600,1320),
 ('Sleeper',700,1540),
 ('Sleeper',1000,2200),
 ('Sleeper',1200,2640),
 ('Sleeper',1500,2700),
 ('Sitting',500,620),
 ('Sitting',600,744),
 ('Sitting',700,868),
 ('Sitting',1000,1240),
 ('Sitting',1200,1488),
 ('Sitting',1500,1860);
 
 -- How many females and how many male passengers traveled for a minimum distance of 600 KMs
 select Gender, count(*) as Total_Passengers from PASSENGER where Distance >= 600 group by Gender;
 
 -- Find the minimum ticket price for Sleeper Bus
 select min(PRICE) as Minimum_Price from PRICE where Bus_Type='Sleeper';
 
 -- Select passenger names whose names start with character 'S'
 select Passenger_name from PASSENGER where Passenger_name like 'S%';
 
 -- Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
 select p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, pr.Price from PASSENGER p JOIN PRICE pr ON p.Bus_Type=pr.Bus_Type and p.Distance=pr.Distance;
 
-- What are the passenger name/s and his/her ticket price who traveled in the Sitting bus for a distance of 1000 KMs
select Passenger_name, PRICE.Price
 from PASSENGER join PRICE on PASSENGER.Bus_Type = PRICE.Bus_Type and PASSENGER.Distance = PRICE.Distance
 where PASSENGER.Bus_Type = 'Sitting' and PASSENGER.Distance = 1000;
 
 -- What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bengaluru to Panaji
 select PASSENGER.Bus_Type, PRICE.Price
 from PASSENGER  
 join PRICE  on PASSENGER.Bus_Type = PRICE.Bus_Type and PASSENGER.Distance = PRICE.Distance
 where PASSENGER.Passenger_name = 'Pallavi' and PASSENGER.Boarding_City = 'Bengaluru' and PASSENGER.Destination_City = 'Panaji';
 
 -- List the distances from "Passenger" table which are unique (non-repeated distances) in descending order
 select distinct Distance from PASSENGER order by Distance desc;
 
 -- Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passenegers without using user variables
 select p.Passenger_name,(p.Distance)*100 as Percentage_Distance from PASSENGER p;
 
 -- Display the distance, price in three categories in table PRICE
 -- a) Expensive if the cost is more than 1000
 -- b) Average Cost if the cost is less than 1000 and greater than 500
 -- c) Cheap otherwise
 select Distance, Price,
 case
 when Price > 1000 then 'Expensive'
 when Price > 500 then 'Average Cost'
 else 'Cheap'
 end as Price_Category from PRICE;