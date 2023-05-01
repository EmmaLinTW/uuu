USE pg;

/*product*/
SELECT id, name, unit_price, photo_url, 
stock, description, colors, 
class_name, discount, type
FROM products;

/*product_color*/
SELECT product_id, color_name, color_photo_url 
FROM product_color;

/* INNER JOIN */
SELECT * FROM products
JOIN product_color
ON products.id = product_color.product_id;

/* LEFT OUTER JOIN*/
SELECT id, name, unit_price, photo_url, 
stock, description, colors, 
class_name, discount, type,
product_id, color_name, color_photo_url, color_icon
FROM products
LEFT JOIN product_color
ON products.id = product_color.product_id
GROUP BY products.id;

/*SELECT_PRODUCTS_BY_SEARCH*/
SELECT id, name, unit_price, photo_url, stock, 
	description, colors, class_name, discount, type,
	product_id, color_name, color_photo_url, color_icon
	FROM products LEFT JOIN product_color  
	ON products.id = product_color.product_id
    WHERE name LIKE '%蕾絲%';
    
    
SELECT id, name, unit_price, photo_url, 
	stock, description, colors, 
	class_name, discount, type
	FROM products
	LEFT JOIN product_color
	ON products.id = product_color.product_id
	WHERE id=1;

/*SELECT_ALL_PRODUCTS*/
SELECT id, name, color_name, unit_price, photo_url, stock, description, 
	colors, class_name, discount, type, 
    product_id,  color_photo_url, color_icon 
    FROM products LEFT JOIN product_color
    ON products.id = product_color.product_id;

/*SELECT_PRODUCT_BY_ID*/    
SELECT id, name, unit_price, photo_url, stock, description, 
	colors, class_name, discount, type, 
    product_photos.product_id, photo1, photo2, photo3, photo4, photo5, photo6,
    product_color.product_id, color_name, color_photo_url, color_icon 
    FROM products LEFT JOIN product_photos
    ON products.id = product_photos.product_id
    LEFT JOIN product_color
    ON products.id = product_color.product_id
    Where id='11';
    
    
/*select products color size stock*/    
SELECT id, name, unit_price, photo_url, products.stock, description, colors, class_name, discount, type,
		product_color.product_id, product_color.color_name, color_photo_url, color_icon,
        product_color_size_stock.product_id, product_color_size_stock.color_name, size, product_color_size_stock.stock 
        FROM products LEFT JOIN product_color
        ON products.id = product_color.product_id 
        LEFT JOIN product_color_size_stock
        ON 
        product_color.product_id = product_color_size_stock.product_id
        AND
        product_color.color_name = product_color_size_stock.color_name;
        
/*select color_photos size_stock product_photos*/
	SELECT id, name, unit_price, photo_url, products.stock, description, colors, class_name, discount, type,
		product_color.product_id, product_color.color_name, color_photo_url, color_icon,
        product_color_size_stock.product_id, product_color_size_stock.color_name, size, product_color_size_stock.stock,
        product_photos.product_id, photo1, photo2, photo3, photo4, photo5, photo6
        FROM products LEFT JOIN product_color
        ON products.id = product_color.product_id 
        LEFT JOIN product_color_size_stock
        ON 
        product_color.product_id = product_color_size_stock.product_id
        AND
        product_color.color_name = product_color_size_stock.color_name
        LEFT JOIN product_photos
        ON
        product_color.product_id = product_photos.product_id
        Where id = 1;
        


/*product color_photos product_photos 還沒加尺寸*/
SELECT id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type, 
    product_color.product_id, color_name, color_photo_url, color_icon,
    product_photos.product_id, photo1, photo2, photo3, photo4, photo5, photo6 
    FROM products LEFT JOIN product_color
    ON products.id = product_color.product_id
    LEFT JOIN product_photos
    ON products.id= product_photos.product_id;
    
    /*SELECT_PRODUCT_COLOR_SIZE_STOCK */
SELECT  product_color.product_id, product_color.color_name, color_photo_url, color_icon,
        product_color_size_stock.product_id, product_color_size_stock.color_name, size, product_color_size_stock.stock
        FROM product_color LEFT JOIN product_color_size_stock
        ON product_color.product_id = product_color_size_stock.product_id
        AND product_color.color_name = product_color_size_stock.color_name
        Where product_color_size_stock.product_id = 2 
        AND product_color_size_stock.color_name = '白';

/*SELECT_PRODUCTS_BY_type*/
SELECT id, name, unit_price, photo_url, stock, 
	description, colors, class_name, discount, type	
	FROM products LEFT JOIN product_color  
	ON products.id = product_color.product_id
    WHERE type = '洋裝'
    GROUP BY id;
    
    
    
    /*SELECT_PRODUCT_BY_ID_WITH_SIZE_PRICE*/    
SELECT products.id, products.name, products.unit_price, products.photo_url, products.stock, products.description, 
	products.colors, products.class_name, products.discount, 
    product_photos.product_id, photo1, photo2, photo3, photo4, photo5, photo6,
    product_color.product_id, color_name, color_photo_url, color_icon,
    size_price.product_id,  size_price.size,  size_price.unit_price
    FROM products 
    LEFT JOIN product_photos
    ON products.id = product_photos.product_id
    LEFT JOIN product_color
    ON products.id = product_color.product_id
    LEFT JOIN size_price
    ON products.id = size_price.product_id
    Where id='1';
    
    SELECT  product_color.product_id, product_color.color_name, color_photo_url, color_icon, 
			product_color_size_stock.product_id, product_color_size_stock.color_name, size, product_color_size_stock.stock 
			FROM product_color LEFT JOIN product_color_size_stock  
			ON product_color.product_id = product_color_size_stock.product_id  
			AND product_color.color_name = product_color_size_stock.color_name  
			Where product_color_size_stock.product_id = 1
			AND product_color_size_stock.color_name = '藍';
            
 /*SELECT_REAL_TIME_PRODUCT_STOCK*/
 SELECT product_id, color_name, size, stock
		FROM product_color_size_stock
		WHERE product_id = 1
		AND color_name= '藍'
		AND size = 'XXL' ;           
            
            
/*SELECT_PRODUCT_SIZE_PRICE*/
SELECT product_id, size, unit_price FROM size_price
WHERE product_id = 1 AND size = 'L';

/*SELECT_PRODUCT_SIZE_PRICE*/
SELECT product_id, sizehot_item, unit_price FROM size_price
WHERE product_id = 1;