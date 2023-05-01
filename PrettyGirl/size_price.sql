CREATE TABLE `size_price` (
  `product_id` int(10) unsigned NOT NULL,
  `size` varchar(10) NOT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`product_id`,`size`),
  CONSTRAINT `FKey_size_price_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(1,'S',599),
(1,'M',599),
(1,'L',599),
(1,'XL',679),
(1,'XXL',759);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(2,'S',529),
(2,'M',529),
(2,'L',529),
(2,'XL',609),
(2,'XXL',689);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(3,'S',529),
(3,'M',529),
(3,'L',569),
(3,'XL',609),
(3,'XXL',659);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(4,'S',679),
(4,'M',679),
(4,'L',729),
(4,'XL',759),
(4,'XXL',759);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(5,'S',499),
(5,'M',499),
(5,'L',499),
(5,'XL',579),
(5,'XXL',579),

(6,'S',879),
(6,'M',879),
(6,'L',879),
(6,'XL',959),
(6,'XXL',959),

(7,'S',479),
(7,'M',479),
(7,'L',479),
(7,'XL',559),
(7,'XXL',559),

(8,'S',419),
(8,'M',419),
(8,'L',499),
(8,'XL',499),
(8,'XXL',499),

(9,'S',679),
(9,'M',679),
(9,'L',679),
(9,'XL',759),
(9,'XXL',759),

(10,'S',1279),
(10,'M',1279),
(10,'L',1279),
(10,'XL',1359),
(10,'XXL',1359);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(11,'S',449),
(11,'M',449),
(11,'L',489),
(11,'XL',529),
(11,'XXL',529),

(12,'S',449),
(12,'M',449),
(12,'L',489),
(12,'XL',529),
(12,'XXL',529),

(13,'S',429),
(13,'M',429),
(13,'L',459),
(13,'XL',509),
(13,'XXL',509),

(14,'S',449),
(14,'M',449),
(14,'L',489),
(14,'XL',529),
(14,'XXL',529),

(15,'S',449),
(15,'M',449),
(15,'L',489),
(15,'XL',529),
(15,'XXL',549);

INSERT INTO size_price
(product_id, size, unit_price)
VALUES
(16,'S',349),
(16,'M',379),
(16,'L',379),
(16,'XL',399),
(16,'XXL',429),

(17,'S',499),
(17,'M',499),
(17,'L',529),
(17,'XL',529),
(17,'XXL',559),

(18,'S',479),
(18,'M',479),
(18,'L',499),
(18,'XL',529),
(18,'XXL',529),

(19,'S',479),
(19,'M',479),
(19,'L',499),
(19,'XL',529),
(19,'XXL',529),

(20,'S',379),
(20,'M',379),
(20,'L',399),
(20,'XL',429),
(20,'XXL',459);



