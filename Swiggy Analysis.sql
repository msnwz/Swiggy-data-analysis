use swiggy;

select *
from swiggy;

select count(rating)
from swiggy
where rating >= 4.5;

select city, count(restaurant_name) as number_of_restaurants
from swiggy
group by city
order by number_of_restaurants desc
limit 1;

select  count(*)
from swiggy
where restaurant_name like '%pizza%';

select cuisine, count(*) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1;

select city, avg(rating) as average_rating
from swiggy
group by city;

select restaurant_name, max(price) as highest_price
from swiggy
where menu_category = 'recommended'
group by restaurant_name
order by highest_price desc;

select restaurant_name, avg(cost_per_person) as avg_cost, cuisine
from swiggy
where cuisine not like '%indian%'
group by restaurant_name, cuisine
order by avg_cost desc
limit 5;

select restaurant_name, avg(cost_per_person) as restaurant_avg_cost
from swiggy
group by restaurant_name
having avg(cost_per_person) > (select avg(cost_per_person) as restaurant_avg
from swiggy);

select distinct t1.restaurant_name,t1.city,t2.city
from swiggy t1 , swiggy t2
where t1.restaurant_name=t2.restaurant_name and t1.city<>t2.city;



select restaurant_name, count(*) as num_items
from swiggy
where menu_category = 'main course'
group by restaurant_name
order by num_items desc
limit 1;

select distinct (restaurant_name)
from swiggy
where veg_or_non-veg like '%veg%'
order by restaurant_name asc;

select restaurant_name, avg(price) as avg_price
from swiggy
group by restaurant_name
order by avg_price
limit 1;

select restaurant_name, count(menu_category) as num_categories
from swiggy
group by restaurant_name
order by num_categories desc
limit 5;

SELECT 
    restaurant_name,
    100.0 * SUM(CASE WHEN veg_or_non_veg = 'Non-veg' THEN 1 ELSE 0 END) / COUNT(*) AS Percentage_of_non_veg_food
FROM 
    swiggy
WHERE 
    veg_or_non_veg IS NOT NULLs
GROUP BY 
    restaurant_name
ORDER BY 
    Percentage_of_non_veg_food DESC
LIMIT 1;










