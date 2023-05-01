use pg;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `customer_id` char(10) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_fee` double NOT NULL DEFAULT '0',
  `payment_note` varchar(50) NOT NULL DEFAULT '',
  `shipping_type` varchar(10) NOT NULL,
  `shipping_fee` double NOT NULL DEFAULT '0',
  `shipping_note` varchar(45) NOT NULL DEFAULT '',
  `recipient_name` varchar(40) NOT NULL,
  `recipient_email` varchar(45) NOT NULL,
  `recipient_phone` varchar(25) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKey_orders_TO_customers_idx` (`customer_id`),
  CONSTRAINT `FKey_orders_TO_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





CREATE TABLE `order_items` (
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `color_name` varchar(20) NOT NULL,
  `size` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`color_name`,`size`),
  KEY `Fkey_order_item_TO_product_color_size_stock_idx` (`product_id`,`color_name`,`size`),
  CONSTRAINT `Fkey_order_item_TO_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `Fkey_order_item_TO_product_color_size_stock` FOREIGN KEY (`product_id`, `color_name`, `size`) REFERENCES `product_color_size_stock` (`product_id`, `color_name`, `size`),
  CONSTRAINT `Fkey_order_item_TO_products` FOREIGN KEY (`order_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

INSERT INTO orders
(id, order_date, order_time, customer_id,
 payment_type, payment_fee, shipping_type, shipping_fee,
recipient_name, recipient_email, recipient_phone, shipping_address) VALUES(0,?,?,?,?,?,?,?,?,?,?,?);

INSERT INTO order_items (order_id, product_id, color_name, size, price, quantity) VALUES (?,?,?,?,?,?);
