
CREATE DATABASE food_app;
USE food_app;

-- Bảng user
CREATE TABLE user (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(100)
);

-- Bảng restaurant
CREATE TABLE restaurant (
  res_id INT AUTO_INCREMENT PRIMARY KEY,
  res_name VARCHAR(100),
  image VARCHAR(255),
  `desc` VARCHAR(255)
);

-- Bảng food_type
CREATE TABLE food_type (
  type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(100)
);

-- Bảng food
CREATE TABLE food (
  food_id INT AUTO_INCREMENT PRIMARY KEY,
  food_name VARCHAR(100),
  image VARCHAR(255),
  price FLOAT,
  `desc` VARCHAR(255),
  type_id INT,
  FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

-- Bảng sub_food
CREATE TABLE sub_food (
  sub_id INT AUTO_INCREMENT PRIMARY KEY,
  sub_name VARCHAR(100),
  sub_price FLOAT,
  food_id INT,
  FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- Bảng order
CREATE TABLE `order` (
  user_id INT,
  food_id INT,
  amount INT,
  code VARCHAR(50),
  arr_sub_id VARCHAR(100),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- Bảng like_res
CREATE TABLE like_res (
  user_id INT,
  res_id INT,
  date_like DATETIME,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Bảng rate_res
CREATE TABLE rate_res (
  user_id INT,
  res_id INT,
  amount INT,
  date_rate DATETIME,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- ========== DỮ LIỆU MẪU ==========

-- 20 người dùng
INSERT INTO user (full_name, email, password) VALUES
('Nguyen Van A','a@gmail.com','123'),
('Tran Thi B','b@gmail.com','123'),
('Le Van C','c@gmail.com','123'),
('Pham D','d@gmail.com','123'),
('Do Thi E','e@gmail.com','123'),
('Nguyen Van F','f@gmail.com','123'),
('Tran Thi G','g@gmail.com','123'),
('Le Van H','h@gmail.com','123'),
('Pham I','i@gmail.com','123'),
('Do Thi K','k@gmail.com','123'),
('Nguyen Van L','l@gmail.com','123'),
('Tran Thi M','m@gmail.com','123'),
('Le Van N','n@gmail.com','123'),
('Pham O','o@gmail.com','123'),
('Do Thi P','p@gmail.com','123'),
('Nguyen Van Q','q@gmail.com','123'),
('Tran Thi R','r@gmail.com','123'),
('Le Van S','s@gmail.com','123'),
('Pham T','t@gmail.com','123'),
('Do Thi U','u@gmail.com','123');

-- 10 nhà hàng
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Sai Gon Food','saigon.jpg','Ẩm thực miền Nam'),
('Ha Noi Taste','hanoi.jpg','Hương vị miền Bắc'),
('Da Nang Beach','danang.jpg','Ẩm thực miền Trung'),
('Hue Royal','hue.jpg','Món cung đình Huế'),
('Ca Mau Corner','camau.jpg','Đặc sản miền Tây'),
('Vung Tau View','vungtau.jpg','Hải sản tươi sống'),
('Nha Trang Chill','nhatrang.jpg','Ẩm thực biển'),
('Binh Duong BBQ','binhduong.jpg','Thịt nướng ngon'),
('Can Tho Garden','cantho.jpg','Ẩm thực sông nước'),
('Phu Quoc Paradise','phuquoc.jpg','Đặc sản đảo ngọc');

-- Loại món ăn
INSERT INTO food_type (type_name) VALUES
('Món chính'),
('Đồ uống'),
('Tráng miệng'),
('Món chay'),
('Đồ nướng');

-- 20 món ăn
INSERT INTO food (food_name,image,price,`desc`,type_id) VALUES
('Phở Bò','pho.jpg',45000,'Phở bò truyền thống',1),
('Cơm Tấm','comtam.jpg',40000,'Cơm tấm sườn bì chả',1),
('Bánh Mì Thịt','banhmi.jpg',25000,'Bánh mì pate thịt nguội',1),
('Cà Phê Sữa','caphe.jpg',20000,'Cà phê sữa đá',2),
('Trà Đào','tradao.jpg',25000,'Trà đào cam sả',2),
('Chè Thái','chethai.jpg',30000,'Chè trái cây',3),
('Kem Dừa','kemdua.jpg',35000,'Kem dừa xiêm',3),
('Đậu Hũ Nóng','dauhu.jpg',15000,'Đậu hũ nước đường',4),
('Cơm Chay Rau Củ','comchay.jpg',35000,'Cơm chay rau củ quả',4),
('Bún Đậu Mắm Tôm','bundau.jpg',40000,'Bún đậu mắm tôm',1),
('Gà Nướng Muối Ớt','ganuong.jpg',90000,'Gà nướng muối ớt nguyên con',5),
('Thịt Xiên Nướng','thitxien.jpg',30000,'Xiên thịt nướng thơm ngon',5),
('Bánh Xèo','banhxeo.jpg',40000,'Bánh xèo miền Tây',1),
('Hủ Tiếu Nam Vang','hutieu.jpg',45000,'Hủ tiếu đặc sản miền Nam',1),
('Nước Cam','nuoccam.jpg',20000,'Nước cam ép tươi',2),
('Soda Bạc Hà','soda.jpg',25000,'Soda bạc hà mát lạnh',2),
('Kem Matcha','kemmatcha.jpg',40000,'Kem trà xanh Nhật Bản',3),
('Bánh Flan','flan.jpg',25000,'Bánh flan trứng sữa',3),
('Mì Cay','micay.jpg',50000,'Mì cay cấp độ 7',1),
('Lẩu Hải Sản','lauhaisan.jpg',150000,'Lẩu hải sản tươi ngon',5);

-- sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Thêm trứng',5000,1),
('Thêm pate',7000,3),
('Thêm topping trái cây',8000,6),
('Thêm nước mắm',2000,10),
('Thêm rau sống',3000,9),
('Thêm kem tươi',10000,17),
('Thêm xiên thịt',15000,12),
('Thêm bún',5000,10),
('Thêm đá lạnh',2000,4),
('Thêm nước sốt',4000,11);

-- like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1,1,NOW()),(2,1,NOW()),(3,2,NOW()),(4,3,NOW()),(5,4,NOW()),
(6,5,NOW()),(7,6,NOW()),(8,7,NOW()),(9,8,NOW()),(10,9,NOW()),
(11,10,NOW()),(12,1,NOW()),(13,2,NOW()),(14,3,NOW()),(15,4,NOW()),
(16,5,NOW()),(17,6,NOW()),(18,7,NOW()),(19,8,NOW()),(20,9,NOW());

-- rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1,1,5,NOW()),(2,2,4,NOW()),(3,3,5,NOW()),(4,4,3,NOW()),
(5,5,5,NOW()),(6,6,4,NOW()),(7,7,5,NOW()),(8,8,3,NOW()),
(9,9,4,NOW()),(10,10,5,NOW());

-- order
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1,1,2,'ORD001','1'),
(2,3,1,'ORD002','2'),
(3,4,3,'ORD003','9'),
(4,10,2,'ORD004','4,8'),
(5,11,1,'ORD005','10'),
(6,17,2,'ORD006','6'),
(7,5,2,'ORD007',NULL),
(8,19,1,'ORD008',NULL),
(9,14,3,'ORD009',NULL),
(10,12,1,'ORD010','7');


-- bài tập
-- BT 1: Tìm 5 người đã like nhà hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(lr.res_id) AS total_like
FROM like_res lr
JOIN user u ON lr.user_id = u.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_like DESC
LIMIT 5;

-- BT 2: Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_id, r.res_name, COUNT(lr.user_id) AS total_like
FROM like_res lr
JOIN restaurant r ON lr.res_id = r.res_id
GROUP BY r.res_id, r.res_name
ORDER BY total_like DESC
LIMIT 2;

-- BT 3: Tìm người đã đặt hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(o.food_id) AS total_orders
FROM `order` o
JOIN user u ON o.user_id = u.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_orders DESC
LIMIT 1;

-- BT4: Tìm người dùng không hoạt động
SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.user_id IS NULL AND lr.user_id IS NULL AND rr.user_id IS NULL;
