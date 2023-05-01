CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER VIEW `hot_item` AS 
select 
`order_items`.`order_id` AS `order_id`,
`order_items`.`product_id` AS `product_id`,
`order_items`.`color_name` AS `color_name`,
`order_items`.`size` AS `size`,
`order_items`.`price` AS `price`,
sum(`order_items`.`quantity`) AS `quantity` 
from `order_items` 
group by `order_items`.`product_id` 
order by `quantity` 
desc 
limit 6;
