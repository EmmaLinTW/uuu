USE pg;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unit_price` double NOT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `description` varchar(300) NOT NULL DEFAULT '',
  `colors` varchar(100) NOT NULL DEFAULT '',
  `class_name` varchar(45) NOT NULL DEFAULT 'Product',
  `discount` int(11) NOT NULL DEFAULT '0',
  `type` varchar(45) NOT NULL DEFAULT '',
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;


use pg;

INSERT INTO products
(id, name, unit_price, stock, description, photo_url, discount, class_name,colors,type)
VALUES
(1,'領結綁帶雪紡拼接珍珠釦磨毛蕾絲洋裝',599,5,'胸前的領結綁帶增添甜美感造型，
雪紡拼接設計展現親膚感的層次設計~
珍珠排釦點綴氣質優雅加分，
採用磨毛蕾絲的面料使肌膚舒適保暖~','https://image.obdesign.com.tw/catalog/products/DA6243/DA6243@1.jpg',20,'Outlet','藍,杏','洋裝');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors,type)
VALUES
(2,'純色典雅鏤空蕾絲雕花長袖洋裝',529,'https://image.obdesign.com.tw/catalog/products/DA6972/DA6972@1.jpg',5,'選用舒適柔軟的親膚布料，給你好感穿著體驗。
整件洋裝佈滿了典雅的蕾絲雕花，散發浪漫的氣質女人味。
微鏤空設計給你微性感的優雅品味~
此款2色長袖洋裝，不論婚禮女神穿搭、情人節穿搭、韓系優雅穿搭都適合唷!','白,黑','洋裝');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors, type)
VALUES
(3,'滿版印花領綁帶層次感小荷葉邊長袖傘襬洋裝',529 ,'https://image.obdesign.com.tw/catalog/products/DA7160/DA7160@1.jpg', 5,'選用舒適柔軟飄逸布料，營造優雅氣質氛圍。
滿版印花及層次感小荷葉邊造型，增添甜美感。
此款2色長袖傘襬洋裝，輕鬆穿出婚禮賓客穿搭、打卡穿搭、情人節穿搭。','咖,黑','洋裝'),
(4,'波浪造型拼接領假兩件包芯紗細針織毛衣洋裝',679 ,'https://image.obdesign.com.tw/catalog/products/FA1995/FA1995@1.jpg',5 ,'選用舒適柔軟的包芯紗細針織面料，給予親膚好感穿著。
假兩件設計，天氣再冷也能給你美美的不厚重穿搭。
領口波浪造型，瞬間增添甜美可愛氛圍。
此款2色長袖毛衣洋裝，適合婚禮穿搭、情人節穿搭、畢業穿搭。','黑,灰藍','洋裝');

INSERT INTO products
(id, name, unit_price, stock, description, photo_url, discount, class_name,colors,type)
VALUES
(5,'假兩件條紋拼接排釦洋裝',499,5,'直條紋襯衫搭配荷葉袖縮口設計，營造都會時髦女性風格
拼接素面排釦洋裝，穿搭有層次且注目感UP~','https://image.obdesign.com.tw/catalog/products/DA5097/DA5097@1.jpg',20,'Outlet','丈青,黑','洋裝');

INSERT INTO products
(id, name, unit_price, stock, description, photo_url,colors,type)
VALUES
(6,'純色毛呢隱藏釦設計連帽外套',879,5,'選用舒適又保暖的毛呢面料，溫暖你整個冬季。
隱藏釦設計，提升整體質感，更顯優雅氣質。
連帽版型好搭配，簡單穿出你的自我風格。
此款3色純色簡約微寬版外套，適合旅遊穿搭、甜美新鮮人穿搭等多種風格。','https://image.obdesign.com.tw/catalog/products/EA2824/EA2824@1.jpg','灰,灰藍,杏','外套'),
(7,'太空棉純色棒球外套',479,5,'選用質感親膚的太空棉面料保暖又舒適，
微光澤面料讓流行元素棒球外套休閒中帶有質感，
下擺和袖口的條紋配色增加層次感，
此款3色讓妳輕鬆駕馭潮流個性風~','https://image.obdesign.com.tw/catalog/products/EA2817/EA2817@1.jpg','黑灰,粉,墨綠','外套'),
(8,'素色連帽口袋長版開襟外套',419,5,'不退流行的素色面料添加連身帽，修飾身型視覺更為俐落有型~
選用具有彈性質感面料，舒適親膚且不易有悶熱黏膩感!','https://image.obdesign.com.tw/catalog/products/EA1987/EA1987@1.jpg','黑,粉,土黃','外套'),
(9,'內刷毛造型車線長版連帽外套',679,5,'內刷毛的材質提供穿著足夠的保暖性及細緻親膚感受，
長版版型加上造型車線設計穿起來更修身，
連帽造型更增添休閒感，隨意穿都簡約好看 !','https://image.obdesign.com.tw/catalog/products/EA2622/EA2622@1.jpg','灰,黑,灰藍','外套');

INSERT INTO products
(id, name, unit_price, stock, description, photo_url, discount, class_name,colors,type)
VALUES
(10,'連帽厚鋪棉保暖修身長版外套',1279,5,'內裡全厚鋪棉的質感，一件單穿立即感受到溫暖的呵護
修身的版型修飾下半身，展現冬季俐落率性的風格~','https://image.obdesign.com.tw/catalog/products/EA2019/EA2019@1.jpg',20,'Outlet','黑,軍綠','外套'),
(11,'莫蘭迪色調燈籠袖襯衫上衣',440,5,'帶點灰調的莫蘭迪色系，穿上它立即散發溫柔的高貴氣質，
光澤內裡更顯質感，襯衫版型加上燈籠袖設計，
增添知性氛圍中的活潑感，適合小資女或OL穿搭 ~','https://image.obdesign.com.tw/catalog/products/AB11333/AB11333@1.jpg',20,'Outlet','粉,牛藍','襯衫');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors, type)
VALUES
(12,'純色親膚面料寬版長袖襯衫上衣',449,'https://image.obdesign.com.tw/catalog/products/AB10900/AB10900@1.jpg',5,'選用柔軟面料讓肌膚可以擁有舒適的感受，
也適合早晚溫差穿著，
俐落剪裁的寬版版型依然不失流行元素，
打破襯衫拘謹型像輕鬆駕馭率性年輕簡約風格，
此款2色純色上衣正裝長褲打扮或休閒長裙穿搭都適合唷~','杏,粉橘','襯衫'),
(13,'清新純色立體直條花紋高含棉襯衫',429,'https://image.obdesign.com.tw/catalog/products/AA8469/AA8469@1.jpg',5,'素色質感面料，手感輕盈穿出舒適觸感~
立體花紋設計~輕鬆打造溫柔系女孩的清新穿搭!','白','襯衫');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type)
VALUES
(14,'圓點印花長版襯衫',449,'https://image.obdesign.com.tw/catalog/products/DA4003/DA4003@1.jpg',5,'質感色調X俏麗的圓點印花增添青春氣息～襯衫式的洋裝剪裁展現知性LOOK
採用棉含量高的面料，手感柔軟穿著親膚，帶來自在休閒的感受','灰,深藍','Outlet',20,'襯衫');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors, type)
VALUES
(15,'純色面磨毛前短後長高袖口襯衫',449,'https://image.obdesign.com.tw/catalog/products/AB8661/AB8661@1.jpg',5,'版型偏大
請依照個人喜愛的舒適度購買

前短後長設計修飾身型，
讓身形更加修長，
高袖口設計，
擺脫令人乏味的單調印象，
讓個人魅力加倍！','白,藍','襯衫'),
(16,'素色微彈毛呢A字裙',379,'https://image.obdesign.com.tw/catalog/products/CA628/CA628@1.jpg',5,'喜歡合身穿感建議可購買小一個尺碼

色調典雅的微彈毛呢，手感滑順好親膚
簡約的A字裙剪裁，修飾臀部與大腿線條，穿出完美look','黑,酒紅,灰','裙類'),
(17,'造型剪裁魚尾波浪裙襬牛仔長裙',499,'https://image.obdesign.com.tw/catalog/products/CA1764/CA1764@1.jpg',5,'選用有彈性含棉牛仔面料，給予親膚好觸感~
造型剪裁與配色車線點綴展現細緻質感。
魚尾波浪裙襬設計展現出女人得迷人氣息，
為你打造出優雅氣質中又帶率性感迷人魅力~!','牛藍','裙類'),
(18,'高含棉剪接設計後腰鬆緊牛仔魚尾長裙',479,'https://image.obdesign.com.tw/catalog/products/CA1703/CA1703@1.jpg',5,'選用舒適親膚帶點硬挺的高含棉牛仔布料，給予質感好穿著。
剪接裙身讓整體穿著更加立體有形!
順身的魚尾裙襬設計，提升你的優雅女人味。
此款2色牛仔長裙，不論旅遊穿搭、婚禮女神穿搭或是情人節穿搭都適合~','深藍,黑','裙類');

INSERT INTO products
(id, name, unit_price, photo_url, stock, description, colors, class_name, discount, type)
VALUES
(19,'台灣製造．不易皺素面A字中長裙',479,'https://image.obdesign.com.tw/catalog/products/KG0309/KG0309@1.jpg',5,'俐落的A字剪裁搭配不易皺的面料，
修飾下半身線條展現質感穿著~
雙口袋剪裁增添方便的實用性且有型，
沉穩的色調上著任意搭配及可有型出門~','黑,丈青,軍綠','Outlet',20,'裙類'),
(20,'腰後鬆緊格紋毛呢百褶裙',379,'https://image.obdesign.com.tw/catalog/products/CA823/CA823@1.jpg',5,'版型偏大
請依照個人喜愛的舒適度購買

經典的格紋毛呢輕鬆為妳打造初秋的時尚穿搭，
腰後鬆緊讓你在穿著上加方便舒適~
百褶造型注入青春活力，繫上皮帶更加品味時尚~','藍,灰','Outlet',20,'裙類');

INSERT INTO products
(id, name, unit_price, photo_url, description, type, category)
VALUES
(21,'純色毛呢溫暖內鋪棉雙排釦長版翻領大衣/外套',1399,'https://image.obdesign.com.tw/catalog/products/EA2862/EA2862@1.jpg','毛呢的材質讓妳對抗寒風，內鋪棉設計有效升溫能抗寒蓄熱，
俐落的翻領剪裁修飾臉型展現氣勢感穿著，
運用質感純色調在大衣上展現，
除了實搭的灰色以外芥綠色更是今年秋冬流行元素新色，
此款2色雙排釦長版翻領大衣/外套皆可戶外休閒、輕優雅主管或是日常小資女都OK呦~','大衣','外套'),
(22,'溫暖毛呢木紋釦修身剪裁大衣/外套',1479,'https://image.obdesign.com.tw/catalog/products/EA2815/EA2815@1.jpg','選用溫暖柔軟的毛呢材質，給予親膚好感穿著。
木紋釦點綴，簡單點綴提升整體質感。
修身剪裁設計，輕鬆打造理想曲線，穿出氣質女人味。
此款2色純色長版大衣/外套，隨意搭配營造優雅主管穿搭。','大衣','外套'),
(23,'純色質感連帽鈕釦大衣外套',1199,'https://image.obdesign.com.tw/catalog/products/EA2444/EA2444@1.jpg','長版的大衣版型，營造出通勤上班族的氛圍，
在氣勢夾帶著唯美STYLE~
配上連帽設計，讓外出的妳不怕寒風與下雨，
簡單穿出自信與迷人!!','大衣','外套'),
(24,'毛呢大翻領撞色內裡西裝外套',880,'https://image.obdesign.com.tw/catalog/products/EA2080/EA2080@1.jpg','大大的翻領設計，搭配出俐落的優雅造型!

在內裡做上撞色設計，微微的展露低調且氣質STYLE，層次感UP~','大衣','外套'),
(25,'素色翻領寬鬆落肩西裝外套',899,'https://image.obdesign.com.tw/catalog/products/EA1969/EA1969@1.jpg','版型偏大
請依照個人喜愛的舒適度購買
長版與翻領的剪裁讓整體視覺上更顯俐落
寬鬆的設計展現隨興又簡約的大氣風範~','大衣','外套');