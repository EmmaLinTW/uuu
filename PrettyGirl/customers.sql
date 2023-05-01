USE pg;

DROP TABLE IF EXISTS customers;

CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `class_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



INSERT INTO customers
	(id, name, password, email, gender, birthday, class_name)
	VALUES('A123456789', '張三豐', '123456', 'test01@uuu.com.tw', 'M', '1990-02-24', 'Customer');
    
INSERT INTO customers
	(id, name, password, email, gender, birthday, married, phone, address, class_name, discount)
	VALUES('A223456781', '林梅莉', '123456', 'test02@uuu.com.tw', 'F', '1990-02-24'
			, true, '0987654321', '台北市復興北路99號14F', 'VIP', 15);    
            
            