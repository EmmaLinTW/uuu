USE pg;

DROP TABLE IF EXISTS `product_color`;

CREATE TABLE `product_color` (
  `product_id` int(10) unsigned NOT NULL,
  `color_name` varchar(20) NOT NULL,
  `color_photo_url` varchar(250) DEFAULT NULL,
  `color_icon` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`color_name`),
  CONSTRAINT `PKey_product_color_TO_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(1,'藍','https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@CB-1.jpg'),
(1,'杏','https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@CB-2.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(2,'白','https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-1.jpg'),
(2,'黑','https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@CB-2.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(3,'咖','https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@CB-1.jpg'),
(3,'黑','https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@CB-2.jpg'),
(4,'黑','https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@CB-1.jpg'),
(4,'灰藍','https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@CB-2.jpg'),
(5,'丈青','https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@CB-1.jpg'),
(5,'黑','https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@CB-2.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(6,'灰','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-1.jpg'),
(6,'灰藍','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-2.jpg'),
(6,'杏','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-3-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@CB-3.jpg'),
(7,'黑灰','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-1.jpg'),
(7,'粉','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-2.jpg'),
(7,'墨綠','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-3-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@CB-3.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(8,'黑','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-1.jpg'),
(8,'粉','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-2.jpg'),
(8,'土黃','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-4-1.jpg','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@CB-4.jpg'),
(9,'灰','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-1.jpg'),
(9,'黑','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-2.jpg'),
(9,'灰藍','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-3-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@CB-3.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(10,'黑','https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@CB-1.jpg'),
(10,'軍綠','https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@CB-2.jpg'),
(11,'粉','https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@CB-1.jpg'),
(11,'牛藍','https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@CB-2.jpg'),
(12,'杏','https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@CB-1.jpg'),
(12,'粉橘','https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@CB-2.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(13,'清新純色立體直條花紋高含棉襯衫','https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@1.jpg','https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@CB-1.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(14,'灰','https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@CB-1.jpg'),
(14,'深藍','https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@CB-2.jpg'),
(15,'白','https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@CB-1.jpg'),
(15,'藍','https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@CB-2.jpg'),
(16,'黑','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-1.jpg'),
(16,'酒紅','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-2.jpg'),
(16,'灰','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-3-1.jpg','https://image.obdesign.com.tw/catalog/products/CA628/CA628@CB-3.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(17,'造型剪裁魚尾波浪裙襬牛仔長裙','https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@1.jpg','https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@CB-1.jpg');

INSERT INTO product_color
(product_id, color_name, color_photo_url,color_icon)
VALUES
(18,'深藍','https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@CB-1.jpg'),
(18,'黑','https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@CB-2.jpg'),
(19,'黑','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-1.jpg'),
(19,'丈青','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-2-1.jpg','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-2.jpg'),
(19,'軍綠','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-3-1.jpg','https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@CB-3.jpg'),
(20,'藍','https://image.obdesign.com.tw/catalog/products/CA823/CA823@CB-1-1.jpg','https://image.obdesign.com.tw/catalog/products/CA823/CA823@CB-1.jpg'),
(20,'灰','https://image.obdesign.com.tw/catalog/products/CA823/CA823@CB-2-2.jpg','https://image.obdesign.com.tw/catalog/products/CA823/CA823@CB-2.jpgproduct_color');
