create database quanlybanhang_tonghop;
use quanlybanhang_tonghop;
create table KhachHang(
MaKH nvarchar(4) primary key,
TenKH nvarchar(30) not null,
Diachi nvarchar(50),
Ngaysinh datetime,
SoDT nvarchar(15) unique
);

create table NhanVien(
MaNV nvarchar(4) primary key,
HoTen nvarchar(30) not null,
GioiTinh bit not null,
DiaChi nvarchar(50) not null,
Ngaysinh datetime not null,
DienThoai nvarchar(15) unique,
Email nvarchar(30) unique,
NoiSinh nvarchar(20) not null,
NgayVaoLam datetime,
MaNQL nvarchar(4)
);

create table NhaCungCap (
MaNCC nvarchar(5) primary key,
TenNCC nvarchar (50) not null,
Diachi nvarchar(50) not null,
DienThoai nvarchar(15) not null unique,
Email nvarchar(30) not null unique,
Website nvarchar(30)
);

create table LoaiSP(
MaLoaiSP nvarchar(5) primary key,
TenloaiSP nvarchar(30) not null,
GhiChu nvarchar(100) not null
);

create table SanPham(
MaSP nvarchar(4) primary key,
MaLoaiSP nvarchar(5) not null,
TenSP nvarchar(50) not null,
Donvitinh nvarchar(10) not null,
Ghichu nvarchar(100),
foreign key (MaLoaiSP) references LoaiSP(MaLoaiSP)
);

create table PhieuNhap (
SoPN nvarchar(5) primary key,
MaNV nvarchar(4) not null,
MaNCC nvarchar(5) not null,
Ngaynhap datetime not null default now(),
Ghichu nvarchar(100),
foreign key(MaNV) references NhanVien(MaNV),
foreign key(MaNCC) references NhaCungCap(MaNCC)
);

create table ChitietPhieuNhap (
MaSP nvarchar(4),
SoPN nvarchar(5),
Soluong smallint check(Soluong > 0),
Gianhap real not null check(Gianhap > 0) ,
primary key(MaSP,SoPN),
foreign key(MaSP) references SanPham(MaSP),
foreign key(SoPN) references PhieuNhap(SoPN)

);

create table PhieuXuat(
SoPX nvarchar(5) primary key,
MaNV nvarchar(4) not null,
MaKH nvarchar(4) not null,
NgayBan datetime not null,
Ghichu text,
foreign key(MaNV) references NhanVien(MaNV),
foreign key(makh) references khachhang(makh)
);

create table ChitietPhieuXuat (
SoPX nvarchar(5),
MaSP nvarchar(4),
Soluong smallint check(Soluong > 0),
Giaban real  check(Giaban > 0),
primary key(masp,sopx),
foreign key(sopx) references phieuxuat(sopx),
foreign key(masp) references sanpham(masp)
);

INSERT INTO KhachHang (MaKH, TenKH, Diachi, Ngaysinh, SoDT)
VALUES
    ('KH01', 'Nguyễn Văn A', '123 Đường ABC', '1990-01-15', '0123456789'),
    ('KH02', 'Trần Thị B', '456 Đường XYZ', '1985-05-20', '0987654321'),
    ('KH03', 'Lê Văn C', '789 Đường PQR', '1992-09-10', '0369847521'),
    ('KH04', 'Nguyễn Thị D', '101 Đường LMN', '1988-12-05', '0741285963'),
    ('KH05', 'Phạm Văn E', '222 Đường KLM', '1995-03-25', '0321654987');

INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, DiaChi, Ngaysinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES
    ('NV01', 'Nguyễn Văn Quang', 1, '456 Đường XYZ', '1980-07-10', '0987654321', 'quang@gmail.com', 'Hà Nội', '2005-04-15', 'NV02'),
    ('NV02', 'Trần Thị Hương', 0, '123 Đường ABC', '1982-05-20', '0123456789', 'huong@gmail.com', 'Hà Nội', '2006-03-18', 'NV01'),
    ('NV03', 'Lê Văn Hải', 1, '789 Đường PQR', '1984-09-25', '0369847521', 'hai@gmail.com', 'Hồ Chí Minh', '2008-02-22', 'NV01'),
    ('NV04', 'Nguyễn Thị Linh', 0, '101 Đường LMN', '1986-12-01', '0741285963', 'linh@gmail.com', 'Hà Nội', '2009-11-10', 'NV02'),
    ('NV05', 'Phạm Văn Tùng', 1, '222 Đường KLM', '1990-03-12', '0321654987', 'tung@gmail.com', 'Hồ Chí Minh', '2010-09-05', 'NV02');
    
INSERT INTO NhaCungCap (MaNCC, TenNCC, Diachi, DienThoai, Email, Website)
VALUES
    ('NCC01', 'Công ty A', '123 Đường ABC', '0123456789', 'congtyA@gmail.com', 'www.congtyA.com'),
    ('NCC02', 'Công ty B', '456 Đường XYZ', '0987654321', 'congtyB@gmail.com', 'www.congtyB.com'),
    ('NCC03', 'Công ty C', '789 Đường PQR', '0369847521', 'congtyC@gmail.com', 'www.congtyC.com'),
    ('NCC04', 'Công ty D', '101 Đường LMN', '0741285963', 'congtyD@gmail.com', 'www.congtyD.com'),
    ('NCC05', 'Công ty E', '222 Đường KLM', '0321654987', 'congtyE@gmail.com', 'www.congtyE.com');
    
INSERT INTO LoaiSP (MaLoaiSP, TenloaiSP, GhiChu)
VALUES
    ('LSP01', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
    ('LSP02', 'Laptop', 'Các sản phẩm máy tính xách tay'),
    ('LSP03', 'Máy tính bàn', 'Các sản phẩm máy tính để bàn'),
    ('LSP04', 'Máy ảnh', 'Các sản phẩm máy ảnh số'),
    ('LSP05', 'Phụ kiện điện tử', 'Các sản phẩm phụ kiện điện tử');
    
INSERT INTO SanPham (MaSP, MaLoaiSP, TenSP, Donvitinh, Ghichu)
VALUES
    ('SP01', 'LSP01', 'iPhone 12', 'Chiếc', 'Màu đen, 128GB'),
    ('SP02', 'LSP02', 'Dell XPS 13', 'Chiếc', 'Màn hình 13 inch, Core i7'),
    ('SP03', 'LSP03', 'HP Pavilion', 'Chiếc', 'Màn hình 21.5 inch, Core i5'),
    ('SP04', 'LSP04', 'Canon EOS 5D Mark IV', 'Chiếc', '20.2MP, 4K video'),
    ('SP05', 'LSP05', 'Tai nghe Bluetooth', 'Cái', 'Kết nối Bluetooth, chất lượng âm thanh cao cấp');

INSERT INTO PhieuNhap (SoPN, MaNV, MaNCC, Ghichu)
VALUES
    ('PN001', 'NV01', 'NCC01', 'Phiếu nhập số 1'),
    ('PN002', 'NV02', 'NCC02', 'Phiếu nhập số 2'),
    ('PN003', 'NV03', 'NCC03', 'Phiếu nhập số 3'),
    ('PN004', 'NV04', 'NCC04', 'Phiếu nhập số 4'),
    ('PN005', 'NV05', 'NCC05', 'Phiếu nhập số 5');
    
INSERT INTO ChitietPhieuNhap (MaSP, SoPN, Soluong, Gianhap)
VALUES
    ('SP01', 'PN001', 50, 12000000),
    ('SP02', 'PN001', 30, 15000000),
    ('SP03', 'PN002', 20, 10000000),
    ('SP04', 'PN003', 10, 25000000),
    ('SP05', 'PN004', 40, 5000000);

INSERT INTO PhieuXuat (SoPX, MaNV, MaKH, NgayBan, Ghichu)
VALUES
    ('PX001', 'NV01', 'KH01', '2023-10-15', 'Phiếu xuất số 1'),
    ('PX002', 'NV02', 'KH02', '2023-10-16', 'Phiếu xuất số 2'),
    ('PX003', 'NV03', 'KH03', '2023-10-17', 'Phiếu xuất số 3'),
    ('PX004', 'NV04', 'KH04', '2023-10-18', 'Phiếu xuất số 4'),
    ('PX005', 'NV05', 'KH05', '2023-10-19', 'Phiếu xuất số 5');

INSERT INTO ChitietPhieuXuat (SoPX, MaSP, Soluong, Giaban)
VALUES
    ('PX001', 'SP01', 10, 15000000),
    ('PX001', 'SP02', 5, 20000000),
    ('PX002', 'SP03', 8, 12000000),
    ('PX003', 'SP04', 2, 35000000),
    ('PX004', 'SP05', 15, 6000000);

UPDATE KhachHang
SET SoDT = '0123456780' -- Thay đổi số điện thoại mới tại đây
WHERE MaKH = 'KH01'; -- Mã khách hàng cần cập nhật

UPDATE NhanVien
SET DiaChi = '123 Đường XYZ' -- Thay đổi địa chỉ mới tại đây
WHERE MaNV = 'NV05'; -- Mã nhân viên cần cập nhật

DELETE FROM NhanVien
WHERE MaNV = 'NV05'; -- Mã nhân viên cần xóa

DELETE FROM SanPham
WHERE MaSP = 'SP15'; -- Mã sản phẩm cần xóa


    
    