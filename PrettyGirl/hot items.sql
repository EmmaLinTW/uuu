SELECT * FROM pg.order_items;

SELECT * FROM pg.order_items
GROUP BY product_id;

/*top6->建立一個view*/
SELECT order_id, product_id, 
color_name, size, price , 
SUM(quantity) AS quantity
FROM order_items 
GROUP BY product_id
ORDER BY quantity DESC
LIMIT 6;

/*SELECT_HOT_ITEMS_TOP_6*/
SELECT id, name, unit_price, color_name,photo_url, stock, description, 
	colors, class_name, discount, type, 
    product_id,  color_photo_url, color_icon 
    FROM products LEFT JOIN product_color
    ON products.id = product_color.product_id
    WHERE id in 
    (SELECT product_id FROM hot_item);


    SELECT order_items.order_id, order_items.product_id, order_items.color_name, order_items.size, order_items.price , order_items.quantity,
	products.id, products.name, products.unit_price, products.photo_url, products.stock, products.description, 
	products.colors, products.class_name, products.discount, products.type 
	FROM order_items LEFT JOIN products
    ON order_items.product_id= products.id;
    
	SELECT order_items.order_id, order_items.product_id, order_items.color_name, SUM(order_items.quantity) as quantity, order_items.size, order_items.price ,
	products.id, products.name, products.unit_price, products.photo_url, products.stock, products.description, 
	products.colors, products.class_name, products.discount, products.type,
    product_color.product_id, product_color.color_name, product_color.color_photo_url, product_color.color_icon
	FROM order_items LEFT JOIN products
    ON order_items.product_id = products.id
    LEFT JOIN product_color
    ON products.id = product_color.product_id
    AND order_items.color_name = product_color.color_name
    group by order_items.product_id,order_items.color_name 
    ORDER BY quantity DESC;
    
