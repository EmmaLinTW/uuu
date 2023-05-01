SELECT product_id, color_name, size, stock FROM product_color_size_stock 
WHERE product_id = '1' AND color_name='杏' AND size = 'S';

UPDATE product_color_size_stock SET stock=stock-2
WHERE product_id = '1' AND color_name='杏' AND size = 'S'
AND stock>=2;