CREATE TABLE `product_photos` (
  `product_id` int(10) unsigned NOT NULL,
  `photo1` varchar(250) DEFAULT NULL,
  `photo2` varchar(250) DEFAULT NULL,
  `photo3` varchar(250) DEFAULT NULL,
  `photo4` varchar(250) DEFAULT NULL,
  `photo5` varchar(250) DEFAULT NULL,
  `photo6` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(1,
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-2.jpg",
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-3.jpg",
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-4.jpg",
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-5.jpg",
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-6.jpg",
"https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@PIC-9.jpg");

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(2,
'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-10.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-12.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@PIC-13.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(3
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-14.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@PIC-13.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(4
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-11.jpg'
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-12.jpg'
,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@PIC-13.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(5
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@T9-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@PIC-11.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(6
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-14.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-11.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@PIC-13.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(7
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@T9-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@PIC-10.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@PIC-11.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@PIC-12.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(8
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@PIC-7.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(9
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-9.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(10
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-9.jpg'
,'https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(11
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@T9-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@PIC-12.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@PIC-13.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@PIC-14.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(12
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@PIC-9.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(13
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@T9-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@PIC-9.jpg'
,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(14
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@PIC-7.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(15
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@PIC-9.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(16
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(17
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@T9-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@PIC-3.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@PIC-5.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@PIC-10.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(18
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-9.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-10.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@PIC-11.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(19
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-4.jpg'
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-9.jpg'
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-11.jpg'
,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@PIC-16.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(20
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-1.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-2.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-6.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-7.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-8.jpg'
,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@PIC-9.jpg');

INSERT INTO product_photos
(product_id, photo1, photo2, photo3, photo4, photo5, photo6)
VALUES
(
,''
,''
,''
,''
,''
,'');