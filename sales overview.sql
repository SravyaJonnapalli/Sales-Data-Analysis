-- 1. Where is revenue coming from
select category, sum(price * quantity) as revenue
from customer_shopping_data
group by category
order by revenue desc;

-- 2. Which location drives sales
select shopping_mall, SUM(price * quantity) as revenue
from customer_shopping_data
group by shopping_mall
order by revenue desc;

-- 3. When do sales peak
select date_format(invoice_date,'%Y-%m') as month, sum(price * quantity) as revenue
from customer_shopping_data
group by month
order by month;

-- 4. Customer payment preference
select payment_method, sum(price * quantity) as revenue
from customer_shopping_data
group by payment_method
order by revenue desc;

-- 5. Target customers
select 
case 
 when age < 25 then 'Under 25'
 when age between 25 and 40 then '25-40'
 when age between 41 and 60 then '41-60'
 else '60+'
end as age_group,
sum(price * quantity) as revenue
from customer_shopping_data
group by age_group
order by revenue desc;

-- 6. Who spends more
select gender, sum(price * quantity) as revenue
from customer_shopping_data
group by gender;

-- 7. Who are high-value customers
select customer_id, sum(price * quantity) as total_spent
from customer_shopping_data
group by customer_id
order by total_spent desc
limit 10;

-- 8. customer segmentation
select customer_id,
       sum(price * quantity) as total_spent,
       case
           when sum(price * quantity) > 5000 then 'High Value'
           when sum(price * quantity) between 2000 and 5000 then 'Medium Value'
           else 'Low Value'
       end as customer_segment
from customer_shopping_data
group by customer_id;

-- 9. AOV
select 
    sum(price * quantity) / count(distinct invoice_no) as avg_order_value
from customer_shopping_data;

