use pg;

CREATE TABLE `product_color_size_stock` (
  `product_id` int(10) unsigned NOT NULL,
  `color_name` varchar(20) NOT NULL,
  `size` varchar(10) NOT NULL,
  `stock` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`color_name`,`size`),
  CONSTRAINT `Fkey_To_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `Fkey_color_name` FOREIGN KEY (`product_id`, `color_name`) REFERENCES `product_color` (`product_id`, `color_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(1,'藍','S',5),
(1,'藍','M',5),
(1,'藍','L',5),
(1,'藍','XL',6),
(1,'藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(1,'杏','S',6),
(1,'杏','M',5),
(1,'杏','L',5),
(1,'杏','XL',6),
(1,'杏','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(2,'白','S',3),
(2,'白','M',4),
(2,'白','L',5),
(2,'白','XL',5),
(2,'白','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(2,'黑','S',3),
(2,'黑','M',4),
(2,'黑','L',5),
(2,'黑','XL',5),
(2,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(3,'咖','S',3),
(3,'咖','M',4),
(3,'咖','L',6),
(3,'咖','XL',5),
(3,'咖','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(3,'黑','S',3),
(3,'黑','M',4),
(3,'黑','L',6),
(3,'黑','XL',5),
(3,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(4,'黑','S',3),
(4,'黑','M',4),
(4,'黑','L',6),
(4,'黑','XL',5),
(4,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(4,'灰藍','S',3),
(4,'灰藍','M',4),
(4,'灰藍','L',6),
(4,'灰藍','XL',5),
(4,'灰藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(5,'丈青','S',3),
(5,'丈青','M',4),
(5,'丈青','L',6),
(5,'丈青','XL',5),
(5,'丈青','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(5,'黑','S',3),
(5,'黑','M',4),
(5,'黑','L',6),
(5,'黑','XL',5),
(5,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(6,'灰','S',3),
(6,'灰','M',4),
(6,'灰','L',6),
(6,'灰','XL',5),
(6,'灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(6,'灰藍','S',3),
(6,'灰藍','M',4),
(6,'灰藍','L',6),
(6,'灰藍','XL',5),
(6,'灰藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(6,'杏','S',3),
(6,'杏','M',4),
(6,'杏','L',6),
(6,'杏','XL',5),
(6,'杏','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(7,'黑灰','S',3),
(7,'黑灰','M',4),
(7,'黑灰','L',6),
(7,'黑灰','XL',5),
(7,'黑灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(7,'粉','S',3),
(7,'粉','M',4),
(7,'粉','L',6),
(7,'粉','XL',5),
(7,'粉','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(7,'墨綠','S',3),
(7,'墨綠','M',4),
(7,'墨綠','L',6),
(7,'墨綠','XL',5),
(7,'墨綠','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(8,'黑','S',3),
(8,'黑','M',4),
(8,'黑','L',6),
(8,'黑','XL',5),
(8,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(8,'粉','S',3),
(8,'粉','M',4),
(8,'粉','L',6),
(8,'粉','XL',5),
(8,'粉','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(8,'土黃','S',3),
(8,'土黃','M',4),
(8,'土黃','L',6),
(8,'土黃','XL',5),
(8,'土黃','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(9,'灰','S',3),
(9,'灰','M',4),
(9,'灰','L',6),
(9,'灰','XL',5),
(9,'灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(9,'黑','S',3),
(9,'黑','M',4),
(9,'黑','L',6),
(9,'黑','XL',5),
(9,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(9,'灰藍','S',3),
(9,'灰藍','M',4),
(9,'灰藍','L',6),
(9,'灰藍','XL',5),
(9,'灰藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(10,'黑','S',3),
(10,'黑','M',4),
(10,'黑','L',6),
(10,'黑','XL',5),
(10,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(10,'軍綠','S',3),
(10,'軍綠','M',4),
(10,'軍綠','L',6),
(10,'軍綠','XL',5),
(10,'軍綠','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(11,'粉','S',3),
(11,'粉','M',4),
(11,'粉','L',6),
(11,'粉','XL',5),
(11,'粉','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(11,'牛藍','S',3),
(11,'牛藍','M',4),
(11,'牛藍','L',6),
(11,'牛藍','XL',5),
(11,'牛藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(12,'杏','S',3),
(12,'杏','M',4),
(12,'杏','L',6),
(12,'杏','XL',5),
(12,'杏','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(12,'粉橘','S',3),
(12,'粉橘','M',4),
(12,'粉橘','L',6),
(12,'粉橘','XL',5),
(12,'粉橘','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(13,'白','S',3),
(13,'白','M',4),
(13,'白','L',6),
(13,'白','XL',5),
(13,'白','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(14,'灰','S',3),
(14,'灰','M',4),
(14,'灰','L',6),
(14,'灰','XL',5),
(14,'灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(14,'深藍','S',3),
(14,'深藍','M',4),
(14,'深藍','L',6),
(14,'深藍','XL',5),
(14,'深藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(15,'白','S',3),
(15,'白','M',4),
(15,'白','L',6),
(15,'白','XL',5),
(15,'白','XXL',3),

(15,'藍','S',3),
(15,'藍','M',4),
(15,'藍','L',6),
(15,'藍','XL',5),
(15,'藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(16,'黑','S',3),
(16,'黑','M',4),
(16,'黑','L',6),
(16,'黑','XL',5),
(16,'黑','XXL',3),

(16,'酒紅','S',3),
(16,'酒紅','M',4),
(16,'酒紅','L',6),
(16,'酒紅','XL',5),
(16,'酒紅','XXL',3),

(16,'灰','S',3),
(16,'灰','M',4),
(16,'灰','L',6),
(16,'灰','XL',5),
(16,'灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(17,'牛藍','S',3),
(17,'牛藍','M',4),
(17,'牛藍','L',6),
(17,'牛藍','XL',5),
(17,'牛藍','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(18,'深藍','S',3),
(18,'深藍','M',4),
(18,'深藍','L',6),
(18,'深藍','XL',5),
(18,'深藍', 'XXL',3),

(18,'黑','S',3),
(18,'黑','M',4),
(18,'黑','L',6),
(18,'黑','XL',5),
(18,'黑','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(19,'黑','S',3),
(19,'黑','M',4),
(19,'黑','L',6),
(19,'黑','XL',5),
(19,'黑','XXL',3),

(19,'丈青','S',3),
(19,'丈青','M',4),
(19,'丈青','L',6),
(19,'丈青','XL',5),
(19,'丈青','XXL',3),

(19,'軍綠','S',3),
(19,'軍綠','M',4),
(19,'軍綠','L',6),
(19,'軍綠','XL',5),
(19,'軍綠','XXL',3),

(20,'藍','S',3),
(20,'藍','M',4),
(20,'藍','L',6),
(20,'藍','XL',5),
(20,'藍','XXL',3),

(20,'灰','S',3),
(20,'灰','M',4),
(20,'灰','L',6),
(20,'灰','XL',5),
(20,'灰','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);

INSERT INTO product_color_size_stock
(product_id, color_name, size, stock)
VALUES
(,'','S',3),
(,'','M',4),
(,'','L',6),
(,'','XL',5),
(,'','XXL',3);


