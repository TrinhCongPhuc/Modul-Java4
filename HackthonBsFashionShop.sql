create database fashionshop;

use fashionshop;

create table category(
    idcate INT PRIMARY KEY AUTO_INCREMENT,
    namecate VARCHAR(100) NOT NULL UNIQUE,
    statuscate TINYINT DEFAULT 0
);

create table product(
    idpro INT PRIMARY KEY AUTO_INCREMENT,
    namepro VARCHAR(200) NOT NULL,
    price FLOAT NOT NULL,
    image VARCHAR(200),
    cateid INT,
    FOREIGN KEY (cateid) REFERENCES category(idcate)
);

create table customer(
    idcus INT PRIMARY KEY AUTO_INCREMENT,
    namecus VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    image VARCHAR(200),
    birthday DATE,
    gender TINYINT
);

create table orders(
    idorder INT PRIMARY KEY AUTO_INCREMENT,
    cusid INT,
    created Timestamp DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (cusid) REFERENCES customer(idcus),
    orderstatus TINYINT DEFAULT 0
);

create table orderdetail(
    orderid INT,
    productid INT,
    quantity INT,
    price FLOAT,
    FOREIGN KEY (orderid) REFERENCES orders(idorder),
    FOREIGN KEY (productid) REFERENCES product(idpro),
    PRIMARY KEY (orderid, productid) 
);

INSERT INTO category (namecate, statuscate) VALUES
('Áo', 1),
('Quần', 1),
('Mũ', 1),
('Giày', 1);

-- Thêm dữ liệu cho bảng product
INSERT INTO product (namepro, price, cateid) VALUES
('Áo sơ mi', 150000, 1),
('Áo khoác dạ', 500000,  1),
('Quần Kaki', 200000, 2),
('Giầy tây', 1000000, 4),
('Mũ bảo hiểm A1', 100000, 3);

-- Thêm dữ liệu cho bảng customer
INSERT INTO customer (namecus, email, birthday, gender) VALUES
('Nguyễn Minh Khôi', 'khoi@gmail.com', '2021-12-21', 1),
('Nguyễn Khánh Linh', 'linh2@gmail.com', '2001-12-12', 0),
('Đỗ Khánh Linh', 'linh@gmail.com', '1999-01-01', 0);

-- Thêm dữ liệu cho bảng orders
INSERT INTO orders (cusid, created, orderstatus) VALUES
(1, CURRENT_TIMESTAMP, 0),
(2, CURRENT_TIMESTAMP, 0),
(1, CURRENT_TIMESTAMP, 0),
(3, CURRENT_TIMESTAMP, 0);

-- Thêm dữ liệu cho bảng orderdetail
INSERT INTO orderdetail (orderid, productid, quantity, price) VALUES
(1, 1, 1, 150000),
(1, 2, 1, 500000),
(2, 2, 2, 500000),
(3, 2, 1, 500000),
(4, 1, 1, 150000);

-- 1.  Hiển thị danh sách danh mục gồm id, name, status:
SELECT idcate, namecate, statuscate FROM category;

-- 2. Hiển thị danh sách sản phẩm gồm id, name, price, sale_price, category_name (tên danh mục):
SELECT p.idpro, p.namepro, p.price, p.price * (1 - 0.1 * c.statuscate) AS sale_price, c.namecate AS category_name
FROM product p INNER JOIN category c ON p.cateid = c.idcate;

-- 3. Hiển thị danh sách sản phẩm có giá lớn hơn 200,000:
SELECT * FROM product WHERE price > 200000;

-- 4. Hiển thị 3 sản phẩm có giá cao nhất:
SELECT p.idpro, p.namepro, p.price, c.namecate AS category_name
FROM product p INNER JOIN category c ON p.cateid = c.idcate
ORDER BY p.price DESC LIMIT 3;

-- 5. Hiển thị danh sách đơn hàng gồm id, customer_id  customer_name, created, status:
SELECT o.idorder,o.cusid, c.namecus AS customer_name, o.created, o.orderstatus AS status
FROM orders o INNER JOIN customer c ON o.cusid = c.idcus;

-- 6. Cập nhật trạng thái đơn hàng có id là 1:
UPDATE orders SET orderstatus = 1 WHERE idorder = 1;

-- 7. Hiển thị chi tiết đơn hàng của đơn hàng có id là 1:
SELECT od.orderid AS order_id, p.namepro AS product_name, od.quantity, od.price, od.quantity * od.price AS total_money
FROM orderdetail od INNER JOIN product p ON od.productid = p.idpro
WHERE od.orderid = 1;

-- 8. Danh sách danh mục gồm id, name, quantity_product (đếm trong bảng product):
SELECT c.idcate, c.namecate, COUNT(p.idpro) AS quantity_product
FROM category c LEFT JOIN product p ON c.idcate = p.cateid
GROUP BY c.idcate;
