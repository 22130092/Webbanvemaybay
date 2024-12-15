-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2024 lúc 09:26 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `abay`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietchuyenbay`
--

CREATE TABLE `chitietchuyenbay` (
  `MaChiTietChuyenBay` varchar(10) NOT NULL,
  `SanBayTrungGian` varchar(100) DEFAULT NULL,
  `ThoiGianDung` int(11) DEFAULT NULL,
  `Ghichu` text DEFAULT NULL,
  `MaChuyenBay` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietchuyenbay`
--

INSERT INTO `chitietchuyenbay` (`MaChiTietChuyenBay`, `SanBayTrungGian`, `ThoiGianDung`, `Ghichu`, `MaChuyenBay`) VALUES
('CTCB01', 'SB03', 30, 'Dừng kỹ thuật', 'CB01'),
('CTCB02', 'SB04', 20, 'Nạp nhiên liệu', 'CB02'),
('CTCB03', 'SB05', 25, 'Kiểm tra máy móc', 'CB03'),
('CTCB04', 'SB06', 15, 'Chờ hành khách', 'CB04'),
('CTCB05', 'SB07', 10, 'Dừng ngắn', 'CB05'),
('CTCB06', 'SB08', 35, 'Kiểm tra hàng hóa', 'CB06'),
('CTCB07', NULL, NULL, NULL, 'CB07'),
('CTCB08', 'SB09', 40, 'Dừng lâu', 'CB08'),
('CTCB09', 'SB10', 50, 'Chờ bảo trì', 'CB09'),
('CTCB10', 'SB01', 60, 'Dừng khẩn cấp', 'CB10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyenbay`
--

CREATE TABLE `chuyenbay` (
  `MaChuyenBay` varchar(10) NOT NULL,
  `NgayGio` datetime NOT NULL,
  `ThoiGianBay` int(11) NOT NULL,
  `SoLuongGheHang1` int(11) NOT NULL,
  `SoLuongGheHang2` int(11) NOT NULL,
  `MaChiTietChuyenBay` varchar(10) DEFAULT NULL,
  `MaTuyenBay` varchar(10) NOT NULL,
  `MaMayBay` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chuyenbay`
--

INSERT INTO `chuyenbay` (`MaChuyenBay`, `NgayGio`, `ThoiGianBay`, `SoLuongGheHang1`, `SoLuongGheHang2`, `MaChiTietChuyenBay`, `MaTuyenBay`, `MaMayBay`) VALUES
('CB01', '2024-12-20 08:00:00', 120, 20, 100, NULL, 'TB01', 'MB01'),
('CB02', '2024-12-21 09:00:00', 90, 15, 80, NULL, 'TB02', 'MB02'),
('CB03', '2024-12-22 10:00:00', 150, 30, 120, NULL, 'TB03', 'MB03'),
('CB04', '2024-12-23 11:00:00', 180, 25, 90, NULL, 'TB04', 'MB04'),
('CB05', '2024-12-24 12:00:00', 200, 20, 70, NULL, 'TB05', 'MB05'),
('CB06', '2024-12-25 13:00:00', 60, 10, 50, NULL, 'TB06', 'MB06'),
('CB07', '2024-12-26 14:00:00', 130, 35, 110, NULL, 'TB07', 'MB07'),
('CB08', '2024-12-27 15:00:00', 95, 15, 75, NULL, 'TB08', 'MB08'),
('CB09', '2024-12-28 16:00:00', 125, 40, 95, NULL, 'TB09', 'MB09'),
('CB10', '2024-12-29 17:00:00', 170, 50, 130, NULL, 'TB10', 'MB10'),
('CB15', '2024-12-15 06:36:47', 200, 60, 150, 'CTCB01', 'TB10', 'MB10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doanhthunam`
--

CREATE TABLE `doanhthunam` (
  `MaDoanhThuNam` varchar(10) NOT NULL,
  `SoLuongVe` int(11) NOT NULL,
  `DoanhThu` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doanhthunam`
--

INSERT INTO `doanhthunam` (`MaDoanhThuNam`, `SoLuongVe`, `DoanhThu`) VALUES
('DN01', 120, 99999999.99),
('DN02', 150, 99999999.99),
('DN03', 180, 99999999.99),
('DN04', 210, 99999999.99),
('DN05', 240, 99999999.99),
('DN06', 270, 99999999.99),
('DN07', 300, 99999999.99),
('DN08', 330, 99999999.99),
('DN09', 360, 99999999.99),
('DN10', 390, 99999999.99);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doanhthuthang`
--

CREATE TABLE `doanhthuthang` (
  `MaDoanhThuThang` varchar(10) NOT NULL,
  `SoLuongVe` int(11) NOT NULL,
  `DoanhThu` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doanhthuthang`
--

INSERT INTO `doanhthuthang` (`MaDoanhThuThang`, `SoLuongVe`, `DoanhThu`) VALUES
('DT01', 10, 23000000),
('DT02', 20, 46000000),
('DT03', 30, 69000000),
('DT04', 40, 92000000),
('DT05', 50, 100000000),
('DT06', 60, 100000000),
('DT07', 70, 100000000),
('DT08', 80, 100000000),
('DT09', 90, 100000000),
('DT10', 100, 100000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongia`
--

CREATE TABLE `dongia` (
  `MaDonGia` varchar(10) NOT NULL,
  `USD` decimal(10,2) DEFAULT NULL,
  `VND` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dongia`
--

INSERT INTO `dongia` (`MaDonGia`, `USD`, `VND`) VALUES
('DG01', 100.00, 2300000.00),
('DG02', 150.00, 3450000.00),
('DG03', 200.00, 4600000.00),
('DG04', 250.00, 5750000.00),
('DG05', 300.00, 6900000.00),
('DG06', 350.00, 8050000.00),
('DG07', 400.00, 9200000.00),
('DG08', 450.00, 10350000.00),
('DG09', 500.00, 11500000.00),
('DG10', 550.00, 12650000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangve`
--

CREATE TABLE `hangve` (
  `MaHangVe` varchar(10) NOT NULL,
  `TenHangVe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangve`
--

INSERT INTO `hangve` (`MaHangVe`, `TenHangVe`) VALUES
('HV01', 'Hạng nhất'),
('HV02', 'Hạng thường'),
('HV03', 'Hạng tiết kiệm'),
('HV04', 'Hạng doanh nhân'),
('HV05', 'Hạng phổ thông đặc biệt'),
('HV06', 'Hạng phổ thông'),
('HV07', 'Hạng siêu tiết kiệm'),
('HV08', 'Hạng linh hoạt'),
('HV09', 'Hạng cơ bản'),
('HV10', 'Hạng tiêu chuẩn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHoaDon` varchar(10) NOT NULL,
  `NgayHoaDon` datetime NOT NULL,
  `ThanhTien` decimal(10,2) NOT NULL,
  `CMND` varchar(12) DEFAULT NULL,
  `MaNhanVien` varchar(10) DEFAULT NULL,
  `MaDoanhThuThang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHoaDon`, `NgayHoaDon`, `ThanhTien`, `CMND`, `MaNhanVien`, `MaDoanhThuThang`) VALUES
('HD01', '2024-12-12 16:00:00', 2300000.00, '123456789', 'NV01', 'DT01'),
('HD02', '2024-12-13 17:00:00', 3450000.00, '987654321', 'NV02', 'DT02'),
('HD03', '2024-12-14 18:00:00', 4600000.00, '456789123', 'NV03', 'DT03'),
('HD04', '2024-12-15 19:00:00', 5750000.00, '321654987', 'NV04', 'DT04'),
('HD05', '2024-12-16 20:00:00', 6900000.00, '789123456', 'NV05', 'DT05'),
('HD06', '2024-12-17 21:00:00', 8050000.00, '654321789', 'NV06', 'DT06'),
('HD07', '2024-12-18 22:00:00', 9200000.00, '159753486', 'NV07', 'DT07'),
('HD08', '2024-12-19 23:00:00', 10350000.00, '357951864', 'NV08', 'DT08'),
('HD09', '2024-12-20 23:30:00', 11500000.00, '258741369', 'NV09', 'DT09'),
('HD10', '2024-12-21 00:00:00', 12650000.00, '147852369', 'NV10', 'DT10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `CMND` varchar(12) NOT NULL,
  `TenKhachHang` varchar(100) NOT NULL,
  `DienThoai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`CMND`, `TenKhachHang`, `DienThoai`) VALUES
('123456789', 'Nguyễn Văn A', '0901234567'),
('12345679', 'Nguyen Van A', '0987654321'),
('147852369', 'Hồ Thị J', '0990123456'),
('159753486', 'Bùi Văn G', '0967890123'),
('258741369', 'Lý Văn I', '0989012345'),
('321654987', 'Hoàng Thị D', '0934567890'),
('357951864', 'Ngô Thị H', '0978901234'),
('456789123', 'Lê Văn C', '0923456789'),
('654321789', 'Đặng Thị F', '0956789012'),
('789123456', 'Phạm Văn E', '0945678901'),
('987654321', 'Trần Thị B', '0912345678');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maybay`
--

CREATE TABLE `maybay` (
  `MaMayBay` varchar(10) NOT NULL,
  `LoaiMayBay` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `maybay`
--

INSERT INTO `maybay` (`MaMayBay`, `LoaiMayBay`) VALUES
('MB01', 'Airbus A320'),
('MB02', 'Boeing 737'),
('MB03', 'Airbus A321'),
('MB04', 'Boeing 787'),
('MB05', 'Embraer E190'),
('MB06', 'Bombardier CRJ900'),
('MB07', 'Cessna Citation X'),
('MB08', 'Airbus A350'),
('MB09', 'ATR 72'),
('MB10', 'Boeing 777');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` varchar(10) NOT NULL,
  `TenNhanVien` varchar(100) NOT NULL,
  `DienThoai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `TenNhanVien`, `DienThoai`) VALUES
('NV01', 'Nguyễn Thị D', '0931234567'),
('NV02', 'Trần Văn E', '0941234567'),
('NV03', 'Lê Thị F', '0951234567'),
('NV04', 'Phạm Văn G', '0961234567'),
('NV05', 'Đặng Thị H', '0971234567'),
('NV06', 'Bùi Văn I', '0981234567'),
('NV07', 'Ngô Thị J', '0991234567'),
('NV08', 'Hoàng Văn K', '0902234567'),
('NV09', 'Lý Thị L', '0912234567'),
('NV10', 'Hồ Văn M', '0922234567');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudatcho`
--

CREATE TABLE `phieudatcho` (
  `MaPhieuDatCho` varchar(10) NOT NULL,
  `NgayDat` datetime NOT NULL,
  `SoGheDat` int(11) NOT NULL,
  `CMND` varchar(12) DEFAULT NULL,
  `MaChuyenBay` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieudatcho`
--

INSERT INTO `phieudatcho` (`MaPhieuDatCho`, `NgayDat`, `SoGheDat`, `CMND`, `MaChuyenBay`) VALUES
('PDC01', '2024-12-10 14:00:00', 2, '123456789', 'CB01'),
('PDC02', '2024-12-11 15:30:00', 1, '456789123', 'CB02'),
('PDC03', '2024-12-12 16:45:00', 3, '987654321', 'CB03'),
('PDC04', '2024-12-13 17:00:00', 4, '321654987', 'CB04'),
('PDC05', '2024-12-14 18:15:00', 2, '789123456', 'CB05'),
('PDC06', '2024-12-15 19:30:00', 1, '654321789', 'CB06'),
('PDC07', '2024-12-16 20:45:00', 5, '159753486', 'CB07'),
('PDC08', '2024-12-17 21:00:00', 3, '357951864', 'CB08'),
('PDC09', '2024-12-18 22:15:00', 4, '258741369', 'CB09'),
('PDC10', '2024-12-19 23:30:00', 2, '147852369', 'CB10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanbay`
--

CREATE TABLE `sanbay` (
  `MaSanBay` varchar(10) NOT NULL,
  `TenSanBay` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanbay`
--

INSERT INTO `sanbay` (`MaSanBay`, `TenSanBay`) VALUES
('SB01', 'Nội Bài'),
('SB02', 'Tân Sơn Nhất'),
('SB03', 'Đà Nẵng'),
('SB04', 'Phú Bài'),
('SB05', 'Cát Bi'),
('SB06', 'Liên Khương'),
('SB07', 'Cam Ranh'),
('SB08', 'Vinh'),
('SB09', 'Cần Thơ'),
('SB10', 'Pleiku');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuyenbay`
--

CREATE TABLE `tuyenbay` (
  `MaTuyenBay` varchar(10) NOT NULL,
  `MaSanBayDi` varchar(10) NOT NULL,
  `MaSanBayDen` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tuyenbay`
--

INSERT INTO `tuyenbay` (`MaTuyenBay`, `MaSanBayDi`, `MaSanBayDen`) VALUES
('TB01', 'SB01', 'SB02'),
('TB02', 'SB01', 'SB03'),
('TB03', 'SB02', 'SB03'),
('TB04', 'SB04', 'SB05'),
('TB05', 'SB06', 'SB07'),
('TB06', 'SB08', 'SB09'),
('TB07', 'SB09', 'SB10'),
('TB08', 'SB01', 'SB04'),
('TB09', 'SB02', 'SB06'),
('TB10', 'SB05', 'SB03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vechuyenbay`
--

CREATE TABLE `vechuyenbay` (
  `MaVeChuyenBay` varchar(10) NOT NULL,
  `TinhTrangVe` varchar(50) NOT NULL,
  `MaDonGia` varchar(10) DEFAULT NULL,
  `MaHangVe` varchar(10) DEFAULT NULL,
  `MaChuyenBay` varchar(10) DEFAULT NULL,
  `CMND` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vechuyenbay`
--

INSERT INTO `vechuyenbay` (`MaVeChuyenBay`, `TinhTrangVe`, `MaDonGia`, `MaHangVe`, `MaChuyenBay`, `CMND`) VALUES
('VE01', 'Đã đặt', 'DG01', 'HV01', 'CB01', '123456789'),
('VE02', 'Chưa đặt', 'DG02', 'HV02', 'CB02', '987654321'),
('VE03', 'Đã đặt', 'DG03', 'HV01', 'CB03', '456789123'),
('VE04', 'Đã đặt', 'DG04', 'HV02', 'CB04', '321654987'),
('VE05', 'Chưa đặt', 'DG05', 'HV01', 'CB05', '789123456'),
('VE06', 'Đã đặt', 'DG06', 'HV02', 'CB06', '654321789'),
('VE07', 'Đã đặt', 'DG07', 'HV01', 'CB07', '159753486'),
('VE08', 'Chưa đặt', 'DG08', 'HV02', 'CB08', '357951864'),
('VE09', 'Đã đặt', 'DG09', 'HV01', 'CB09', '258741369'),
('VE10', 'Đã đặt', 'DG10', 'HV02', 'CB10', '147852369');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietchuyenbay`
--
ALTER TABLE `chitietchuyenbay`
  ADD PRIMARY KEY (`MaChiTietChuyenBay`),
  ADD KEY `MaChuyenBay` (`MaChuyenBay`);

--
-- Chỉ mục cho bảng `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD PRIMARY KEY (`MaChuyenBay`),
  ADD KEY `MaTuyenBay` (`MaTuyenBay`),
  ADD KEY `MaMayBay` (`MaMayBay`);

--
-- Chỉ mục cho bảng `doanhthunam`
--
ALTER TABLE `doanhthunam`
  ADD PRIMARY KEY (`MaDoanhThuNam`);

--
-- Chỉ mục cho bảng `doanhthuthang`
--
ALTER TABLE `doanhthuthang`
  ADD PRIMARY KEY (`MaDoanhThuThang`);

--
-- Chỉ mục cho bảng `dongia`
--
ALTER TABLE `dongia`
  ADD PRIMARY KEY (`MaDonGia`);

--
-- Chỉ mục cho bảng `hangve`
--
ALTER TABLE `hangve`
  ADD PRIMARY KEY (`MaHangVe`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHoaDon`),
  ADD KEY `CMND` (`CMND`),
  ADD KEY `MaNhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`CMND`);

--
-- Chỉ mục cho bảng `maybay`
--
ALTER TABLE `maybay`
  ADD PRIMARY KEY (`MaMayBay`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`);

--
-- Chỉ mục cho bảng `phieudatcho`
--
ALTER TABLE `phieudatcho`
  ADD PRIMARY KEY (`MaPhieuDatCho`),
  ADD KEY `CMND` (`CMND`),
  ADD KEY `MaChuyenBay` (`MaChuyenBay`);

--
-- Chỉ mục cho bảng `sanbay`
--
ALTER TABLE `sanbay`
  ADD PRIMARY KEY (`MaSanBay`);

--
-- Chỉ mục cho bảng `tuyenbay`
--
ALTER TABLE `tuyenbay`
  ADD PRIMARY KEY (`MaTuyenBay`),
  ADD KEY `MaSanBayDi` (`MaSanBayDi`),
  ADD KEY `MaSanBayDen` (`MaSanBayDen`);

--
-- Chỉ mục cho bảng `vechuyenbay`
--
ALTER TABLE `vechuyenbay`
  ADD PRIMARY KEY (`MaVeChuyenBay`),
  ADD KEY `MaChuyenBay` (`MaChuyenBay`),
  ADD KEY `CMND` (`CMND`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietchuyenbay`
--
ALTER TABLE `chitietchuyenbay`
  ADD CONSTRAINT `chitietchuyenbay_ibfk_1` FOREIGN KEY (`MaChuyenBay`) REFERENCES `chuyenbay` (`MaChuyenBay`);

--
-- Các ràng buộc cho bảng `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`MaTuyenBay`) REFERENCES `tuyenbay` (`MaTuyenBay`),
  ADD CONSTRAINT `chuyenbay_ibfk_2` FOREIGN KEY (`MaMayBay`) REFERENCES `maybay` (`MaMayBay`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `phieudatcho`
--
ALTER TABLE `phieudatcho`
  ADD CONSTRAINT `phieudatcho_ibfk_1` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`),
  ADD CONSTRAINT `phieudatcho_ibfk_2` FOREIGN KEY (`MaChuyenBay`) REFERENCES `chuyenbay` (`MaChuyenBay`);

--
-- Các ràng buộc cho bảng `tuyenbay`
--
ALTER TABLE `tuyenbay`
  ADD CONSTRAINT `tuyenbay_ibfk_1` FOREIGN KEY (`MaSanBayDi`) REFERENCES `sanbay` (`MaSanBay`),
  ADD CONSTRAINT `tuyenbay_ibfk_2` FOREIGN KEY (`MaSanBayDen`) REFERENCES `sanbay` (`MaSanBay`);

--
-- Các ràng buộc cho bảng `vechuyenbay`
--
ALTER TABLE `vechuyenbay`
  ADD CONSTRAINT `vechuyenbay_ibfk_1` FOREIGN KEY (`MaChuyenBay`) REFERENCES `chuyenbay` (`MaChuyenBay`),
  ADD CONSTRAINT `vechuyenbay_ibfk_2` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
