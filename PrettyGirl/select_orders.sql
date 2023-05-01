SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status
FROM orders
WHERE customer_id = 'A223456781';


SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
product_id, price, quantity, price * quantity as sub_total/*, SUM(price * quantity) as total_amount*/
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id;

SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
SUM(price * quantity) as total_amount/*, product_id, price, quantity, price * quantity as sub_total, SUM(price * quantity) as total_amount*/
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id;

SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
SUM(price * quantity) as total_amount/*, product_id, price, quantity, price * quantity as sub_total, SUM(price * quantity) as total_amount*/
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id
ORDER BY order_date DESC, order_time DESC;


/*SELECT_ORDERS_BY_CUSTOMER_ID*/
SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
SUM(price * quantity) as total_amount/*, product_id, price, quantity, price * quantity as sub_total, SUM(price * quantity) as total_amount*/
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id
ORDER BY orders.id DESC;


/*SELECT_ORDERS_BY_CUSTOMER_ID_PAGE*/
SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
SUM(price * quantity) as total_amount
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id
ORDER BY orders.id DESC
LIMIT 0,5;


/*SELECT_ORDERS_BY_CUSTOMER_ID_ROWS*/
SELECT COUNT(*) FROM
(SELECT id, order_date, order_time, customer_id, payment_type, shipping_type, status,
SUM(price * quantity) as total_amount
FROM orders JOIN order_items
ON orders.id = order_items.order_id
WHERE customer_id = 'A223456781'
GROUP BY orders.id
ORDER BY orders.id DESC) AS A;

SELECT orders.*,
order_items.product_id, order_items.color_name, size, price, quantity,price * quantity as sub_total
FROM orders 
JOIN order_items
ON orders.id = order_items.order_id
WHERE orders.id=5;



/*SELECT_ORDER_BY_ORDER_ID*/
SELECT orders.id, orders.order_date, orders.order_time, orders.customer_id, orders.payment_type, orders.payment_fee, orders.payment_note, 
orders.shipping_type, orders.shipping_fee, orders.shipping_note, orders.shipping_address,
orders.recipient_name, orders.recipient_email, orders.recipient_phone, orders.status,
order_items.product_id, order_items.color_name, size, price, quantity,
products.name,
product_color.color_photo_url
FROM orders 
LEFT JOIN order_items
ON orders.id = order_items.order_id
LEFT JOIN products
ON order_items.product_id=products.id
LEFT JOIN product_color
ON products.id=product_color.product_id
AND order_items.color_name = product_color.color_name
WHERE orders.id=12;
