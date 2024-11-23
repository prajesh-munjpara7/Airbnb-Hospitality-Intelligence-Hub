create database air_bnb;
use air_bnb;
show databases;

select * from listings;
select * from booking_details;

alter table listings rename column name to listings_name;

#1.Write a query to show names from Listings table

select listings_name from listings;

#2.Write a query to fetch total listings from the listings table

select count(listings_name) listings_count from listings;

#3.Write a query to fetch total listing_id from the booking_details table

select count(listing_id) listing_id from booking_details;

#4.Write a query to fetch host ids from listings table

select distinct host_id from listings;

#5.Write a query to fetch all unique host name from listings table

select distinct host_name from listings;

#6.Write a query to show all unique neighbourhood_group from listings table

select distinct neighbourhood_group from listings;

#7.Write a query to show all unique neighbourhood from listings table

select distinct neighbourhood from listings;

#8.Write a query to fetch unique room_type from listings tables

select distinct room_type from listings;

#9.Write a query to show all values of Brooklyn & Manhattan from listings tables

select * from listings where neighbourhood_group in ('Manhattan','Brooklyn')

#10.Write a query to show maximum price from booking_details table

select max(price) from booking_details;

#11.Write a query to show minimum price fron booking_details table

select min(price) from booking_details;

#12.Write a query to show average price from booking_details table

select avg(price) from booking_details;

#13.Write a query to show minimum value of minimum_nights from booking_details table

select min(minimum_nights) from booking_details

#14.Write a query to show maximum value of minimum_nights from booking_details table

select max(minimum_nights) from booking_details

#15.Write a query to show average availability_365

select avg(availability_365) from booking_details;

#16.Write a query to show id , availability_365 and all availability_365 values greater than 300

select listing_id, availability_365 from booking_details where availability_365 > 300;

#17.Write a query to show count of id where price is in between 300 to 400

select count(listing_id) from booking_details where price between 300 and 400;

#18.Write a query to show count of id where minimum_nights spend is less than 5

select count(listing_id) from booking_details where minimum_nights < 5;

#19.Write a query to show count where minimum_nights spend is greater than 100

select count(minimum_nights) from booking_details where minimum_nights > 100;

#20.Write a query to show all data of listings & booking_details

select * from listings, booking_details;

#21.Write a query to show host name and price

select host_name, price from listings l inner join booking_details b on l.listing_id = b.listing_id ;

#22.Write a query to show room_type and price

select room_type, price from listings l inner join booking_details b on l.listing_id = b.listing_id ;

#23.Write a query to show neighbourhood_group & minimum_nights spend

select neighbourhood_group, minimum_nights from listings l inner join booking_details b on l.listing_id = b.listing_id ;

#24.Write a query to show neighbourhood & availability_365

select neighbourhood, availability_365 from listings l inner join booking_details b on l.listing_id = b.listing_id ;

#25.Write a query to show total price by neighbourhood_group

select neighbourhood_group, sum(price) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by neighbourhood_group;

#26.Write a query to show maximum price by neighbourhood_group

select neighbourhood_group, max(price) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by neighbourhood_group;

#27.Write a query to show maximum night spend by neighbourhood_group

select neighbourhood_group, max(minimum_nights) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by neighbourhood_group;

#28.Write a query to show maximum reviews_per_month spend by neighbourhood

select neighbourhood, max(reviews_per_month) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by neighbourhood;

#29.Write a query to show maximum price by room type

select room_type, max(price) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by room_type;

#30.Write a query to show average number_of_reviews by room_type

select room_type, round(avg(number_of_reviews),2) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by room_type;

#31.Write a query to show average price by room type

select room_type, round(avg(price),2) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by room_type;

#32.Write a query to show average night spend by room type

select room_type, round(avg(minimum_nights),2) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by room_type;

#33.Write a query to show average price by room type but average price is less than 100

select room_type, round(avg(price),2) from listings l inner join booking_details b on l.listing_id = b.listing_id 
group by room_type having round(avg(price),2) < 100

#34.Write a query to show average night by neighbourhood and average_nights is greater than 5

select neighbourhood, round(avg(minimum_nights),2) from listings l inner join booking_details b 
on l.listing_id = b.listing_id group by neighbourhood having round(avg(minimum_nights),2) > 5



#Rename column name id from table listings to listing_id

alter table listings rename column id to listing_id



#35.Write a query to show all data from listings where price is greater than 200 using sub-query

select * from listings where listing_id in (select listing_id from booking_details where price > 200)

#36.Write a query to show all values from booking_details table where host id is 314941 using sub-query.

select * from booking_details where listing_id in (select listing_id from listings where host_id = 314941);

#37.Find all pairs of id having the same host id, each pair coming once only

---------------------------------------------------------------------------
---------------------------------------------------------------------------

#38.Write an sql query to show fetch all records that have the term cozy in name

select * from listings where listings_name like '%cozy%';

#39.Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group

select neighbourhood_group, L.host_id, B.price from listings L inner join booking_details B on L.listing_id = B.listing_id 
where neighbourhood_group = 'manhattan';

#40.Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100

select l.listing_id, host_name, neighbourhood, price from listings l inner join booking_details b 
on l.listing_id = b.listing_id where price in (select price from booking_details where price > 100) and 
neighbourhood in ('Upper West Side', 'Williamsburg');

#41.Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

select l.listing_id, host_name, neighbourhood, price from listings l inner join booking_details b 
on l.listing_id = b.listing_id where host_name = 'Elise' and 
neighbourhood = 'Bedford-Stuyvesant';

#42.Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

select host_name, availability_365, minimum_nights from listings l inner join booking_details b 
on l.listing_id = b.listing_id where minimum_nights > 100 and availability_365 > 100;

#43.Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+

select l.listing_id, host_name, number_of_reviews, reviews_per_month from listings l inner join 
booking_details b on l.listing_id = b.listing_id where number_of_reviews > 500 and reviews_per_month > 5

#44.Write a query to show neighbourhood_group which have most total number of review

select neighbourhood_group, sum(number_of_reviews) from listings l inner join booking_details b 
on l.listing_id = b.listing_id 
group by neighbourhood_group;   -----------------------------------------------------

#45.Write a query to show host name which have most cheaper total price

------------------------------------------------------------------------

#46.Write a query to show host name which have most costly total price

------------------------------------------------------------------------

#47.Write a query to show host name which have max price using sub-query

------------------------------------------------------------------------

#48.Write a query to show neighbourhood_group where price is less than 100

select neighbourhood_group from listings where listing_id in 
(select listing_id from booking_details where price < 100)

#49.Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.

select max(price), round(avg(availability_365),2), room_type from booking_details b inner join listings l on 
l.listing_id = b.listing_id group by room_type
order by max(price) asc; 


