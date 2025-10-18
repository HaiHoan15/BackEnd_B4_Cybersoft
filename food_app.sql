
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

-- Dữ liệu mẫu
INSERT INTO user (full_name, email, password)
VALUES 
('Nguyen Van Anh','a@gmail.com','123'),
('Tran Thi Bich','b@gmail.com','123'),
('Le Van Cuong','c@gmail.com','123'),
('Pham Duong','d@gmail.com','123'),
('Nguyen An Nhon','e@gmail.com','123');

INSERT INTO restaurant (res_name,image,`desc`)
VALUES
('Nha Hang Sai Gon','saigon.jpg','Ngon'),
('Nha Hang Ha Noi','hanoi.jpg','Rong rai'),
('Nha Hang Da Nang','danang.jpg','Bien'),
('Nha Hang Hue','hue.jpg','Thanh co'),
('Nha Hang Ca Mau','camau.jpg','Rung ngap man');

INSERT INTO like_res (user_id, res_id, date_like)
VALUES 
(1,1,NOW()),(1,2,NOW()),(2,1,NOW()),(3,3,NOW()),(3,1,NOW()),(3,2,NOW()),(4,2,NOW());

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
