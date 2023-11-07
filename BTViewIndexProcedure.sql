CREATE DATABASE demo;
USE demo;
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(255) NOT NULL,
    productName VARCHAR(255) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(255)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Product 1', 10.99, 100, 'Description 1', 'Active'),
    ('P002', 'Product 2', 19.99, 50, 'Description 2', 'Inactive'),
    ('P003', 'Product 3', 5.99, 200, 'Description 3', 'Active');
-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productNamePrice ON Products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để xem cách câu truy vấn được thực thi
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';

-- Tạo view
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
-- Sửa đổi view
CREATE OR REPLACE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;
-- Xoá view
DROP VIEW ProductInfo;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng Products
DELIMITER //

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END;
// DELIMITER ;
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddNewProduct(IN pCode VARCHAR(255), IN pName VARCHAR(255), IN pPrice DECIMAL(10, 2), IN pAmount INT, IN pDesc TEXT, IN pStatus VARCHAR(255))
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDesc, pStatus);
END;
// DELIMITER ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(IN pId INT, IN pCode VARCHAR(255), IN pName VARCHAR(255), IN pPrice DECIMAL(10, 2), IN pAmount INT, IN pDesc TEXT, IN pStatus VARCHAR(255))
BEGIN
    UPDATE Products
    SET productCode = pCode, productName = pName, productPrice = pPrice, productAmount = pAmount, productDescription = pDesc, productStatus = pStatus
    WHERE Id = pId;
END;
//DELIMITER ;
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProduct(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END;
//DELIMITER ;
