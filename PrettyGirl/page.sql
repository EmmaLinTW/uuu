SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products
WHERE type LIKE '洋裝';

SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products
WHERE type LIKE '洋裝' OR type LIKE '襯衫';

SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products
WHERE type LIKE '洋裝' OR type LIKE '襯衫' OR type LIKE '裙類';

/*前10筆*/
SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products LIMIT 10;

/*前10筆*/
SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products LIMIT 0,10;

/*第11筆開始後10筆->11~20筆*/
SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products LIMIT 10,10;

/*第21筆開始後10筆->21~30筆*/
SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type
FROM products LIMIT 20,10;