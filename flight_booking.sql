-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 13, 2025 lúc 06:37 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `flight_booking`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auditlogs`
--

CREATE TABLE `auditlogs` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Action` varchar(255) NOT NULL,
  `ActionTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `NumberOfSeats` int(11) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `BookingStatus` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  `BookingDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bookings`
--

INSERT INTO `bookings` (`BookingID`, `UserID`, `FlightID`, `NumberOfSeats`, `TotalPrice`, `BookingStatus`, `BookingDate`) VALUES
(1111, 19, 141, 1, 11111.00, 'Confirmed', '2025-01-13 21:59:26'),
(1114, 26, 102, 7, 4200.00, 'Confirmed', '2025-01-13 22:13:43'),
(1115, 26, 107, 6, 3600.00, 'Confirmed', '2025-01-13 22:41:52'),
(1116, 26, 107, 7, 4200.00, 'Confirmed', '2025-01-13 23:38:52'),
(1117, 26, 102, 1, 600.00, 'Confirmed', '2025-01-14 00:12:13'),
(1118, 34, 102, 5, 3000.00, 'Confirmed', '2025-01-14 00:25:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights`
--

CREATE TABLE `flights` (
  `FlightID` int(11) NOT NULL,
  `Airline` varchar(100) NOT NULL,
  `FlightNumber` varchar(50) NOT NULL,
  `DepartureCity` varchar(100) NOT NULL,
  `ArrivalCity` varchar(100) NOT NULL,
  `DepartureTime` datetime NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `SeatsAvailable` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `flights`
--

INSERT INTO `flights` (`FlightID`, `Airline`, `FlightNumber`, `DepartureCity`, `ArrivalCity`, `DepartureTime`, `ArrivalTime`, `Price`, `SeatsAvailable`, `CreatedAt`) VALUES
(102, 'VietJet Air', 'FL102', 'Hồ Chí Minh', 'Hà Nội', '2025-01-14 07:00:00', '2025-01-14 09:00:00', 600.00, 150, '2025-01-13 17:28:04'),
(103, 'Bamboo Airways', 'FL103', 'Hồ Chí Minh', 'Phú Quốc', '2025-01-14 08:00:00', '2025-01-14 10:00:00', 350.00, 150, '2025-01-13 17:28:04'),
(104, 'Pacific Airlines', 'FL104', 'Hồ Chí Minh', 'Đà Nẵng', '2025-01-14 09:00:00', '2025-01-14 11:00:00', 500.00, 150, '2025-01-13 17:28:04'),
(105, 'Vietnam Airlines', 'FL105', 'Hồ Chí Minh', 'Nha Trang', '2025-01-14 10:00:00', '2025-01-14 12:00:00', 450.00, 150, '2025-01-13 17:28:04'),
(106, 'VietJet Air', 'FL106', 'Hồ Chí Minh', 'Phú Quốc', '2025-01-14 11:00:00', '2025-01-14 13:00:00', 350.00, 150, '2025-01-13 17:28:04'),
(107, 'Bamboo Airways', 'FL107', 'Hồ Chí Minh', 'Hà Nội', '2025-01-14 12:00:00', '2025-01-14 14:00:00', 600.00, 150, '2025-01-13 17:28:04'),
(108, 'Pacific Airlines', 'FL201', 'Nha Trang', 'Hà Nội', '2025-01-15 06:00:00', '2025-01-15 08:00:00', 600.00, 150, '2025-01-13 17:28:05'),
(109, 'Vietnam Airlines', 'FL202', 'Nha Trang', 'Đà Nẵng', '2025-01-15 07:00:00', '2025-01-15 09:00:00', 500.00, 150, '2025-01-13 17:28:05'),
(110, 'VietJet Air', 'FL203', 'Nha Trang', 'Phú Quốc', '2025-01-15 08:00:00', '2025-01-15 10:00:00', 350.00, 150, '2025-01-13 17:28:05'),
(111, 'Bamboo Airways', 'FL204', 'Nha Trang', 'Hồ Chí Minh', '2025-01-15 09:00:00', '2025-01-15 11:00:00', 450.00, 150, '2025-01-13 17:28:05'),
(112, 'Pacific Airlines', 'FL205', 'Nha Trang', 'Phú Quốc', '2025-01-15 10:00:00', '2025-01-15 12:00:00', 350.00, 150, '2025-01-13 17:28:05'),
(113, 'Vietnam Airlines', 'FL206', 'Nha Trang', 'Hà Nội', '2025-01-15 11:00:00', '2025-01-15 13:00:00', 600.00, 150, '2025-01-13 17:28:05'),
(114, 'VietJet Air', 'FL207', 'Nha Trang', 'Đà Nẵng', '2025-01-15 12:00:00', '2025-01-15 14:00:00', 500.00, 150, '2025-01-13 17:28:05'),
(115, 'Bamboo Airways', 'FL301', 'Hà Nội', 'Phú Quốc', '2025-01-16 06:00:00', '2025-01-16 08:00:00', 350.00, 150, '2025-01-13 17:28:05'),
(116, 'Pacific Airlines', 'FL302', 'Hà Nội', 'Nha Trang', '2025-01-16 07:00:00', '2025-01-16 09:00:00', 500.00, 150, '2025-01-13 17:28:05'),
(117, 'Vietnam Airlines', 'FL303', 'Hà Nội', 'Đà Nẵng', '2025-01-16 08:00:00', '2025-01-16 10:00:00', 450.00, 150, '2025-01-13 17:28:05'),
(118, 'VietJet Air', 'FL304', 'Hà Nội', 'Hồ Chí Minh', '2025-01-16 09:00:00', '2025-01-16 11:00:00', 600.00, 150, '2025-01-13 17:28:05'),
(119, 'Bamboo Airways', 'FL305', 'Hà Nội', 'Phú Quốc', '2025-01-16 10:00:00', '2025-01-16 12:00:00', 350.00, 150, '2025-01-13 17:28:05'),
(120, 'Pacific Airlines', 'FL306', 'Hà Nội', 'Nha Trang', '2025-01-16 11:00:00', '2025-01-16 13:00:00', 500.00, 150, '2025-01-13 17:28:05'),
(121, 'Vietnam Airlines', 'FL307', 'Hà Nội', 'Đà Nẵng', '2025-01-16 12:00:00', '2025-01-16 14:00:00', 450.00, 150, '2025-01-13 17:28:05'),
(122, 'VietJet Air', 'FL401', 'Phú Quốc', 'Hồ Chí Minh', '2025-01-17 06:00:00', '2025-01-17 08:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(123, 'Bamboo Airways', 'FL402', 'Phú Quốc', 'Nha Trang', '2025-01-17 07:00:00', '2025-01-17 09:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(124, 'Pacific Airlines', 'FL403', 'Phú Quốc', 'Hà Nội', '2025-01-17 08:00:00', '2025-01-17 10:00:00', 600.00, 150, '2025-01-13 17:28:45'),
(125, 'Vietnam Airlines', 'FL404', 'Phú Quốc', 'Đà Nẵng', '2025-01-17 09:00:00', '2025-01-17 11:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(126, 'VietJet Air', 'FL405', 'Phú Quốc', 'Hồ Chí Minh', '2025-01-17 10:00:00', '2025-01-17 12:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(127, 'Bamboo Airways', 'FL406', 'Phú Quốc', 'Đà Nẵng', '2025-01-17 11:00:00', '2025-01-17 13:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(128, 'Pacific Airlines', 'FL407', 'Phú Quốc', 'Nha Trang', '2025-01-17 12:00:00', '2025-01-17 14:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(129, 'Bamboo Airways', 'FL501', 'Đà Nẵng', 'Hồ Chí Minh', '2025-01-18 06:00:00', '2025-01-18 08:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(130, 'Vietnam Airlines', 'FL502', 'Đà Nẵng', 'Nha Trang', '2025-01-18 07:00:00', '2025-01-18 09:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(131, 'Pacific Airlines', 'FL503', 'Đà Nẵng', 'Phú Quốc', '2025-01-18 08:00:00', '2025-01-18 10:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(132, 'VietJet Air', 'FL504', 'Đà Nẵng', 'Hà Nội', '2025-01-18 09:00:00', '2025-01-18 11:00:00', 600.00, 150, '2025-01-13 17:28:45'),
(133, 'Bamboo Airways', 'FL505', 'Đà Nẵng', 'Hồ Chí Minh', '2025-01-18 10:00:00', '2025-01-18 12:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(134, 'Pacific Airlines', 'FL506', 'Đà Nẵng', 'Nha Trang', '2025-01-18 11:00:00', '2025-01-18 13:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(135, 'Vietnam Airlines', 'FL507', 'Đà Nẵng', 'Phú Quốc', '2025-01-18 12:00:00', '2025-01-18 14:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(136, 'VietJet Air', 'FL601', 'Hồ Chí Minh', 'Đà Nẵng', '2025-01-19 06:00:00', '2025-01-19 08:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(137, 'Bamboo Airways', 'FL602', 'Hồ Chí Minh', 'Phú Quốc', '2025-01-19 07:00:00', '2025-01-19 09:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(138, 'Pacific Airlines', 'FL603', 'Hồ Chí Minh', 'Nha Trang', '2025-01-19 08:00:00', '2025-01-19 10:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(139, 'Vietnam Airlines', 'FL604', 'Hồ Chí Minh', 'Hà Nội', '2025-01-19 09:00:00', '2025-01-19 11:00:00', 600.00, 150, '2025-01-13 17:28:45'),
(140, 'VietJet Air', 'FL605', 'Hồ Chí Minh', 'Phú Quốc', '2025-01-19 10:00:00', '2025-01-19 12:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(141, 'Bamboo Airways', 'FL606', 'Hồ Chí Minh', 'Đà Nẵng', '2025-01-19 11:00:00', '2025-01-19 13:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(142, 'Pacific Airlines', 'FL607', 'Hồ Chí Minh', 'Nha Trang', '2025-01-19 12:00:00', '2025-01-19 14:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(143, 'Bamboo Airways', 'FL701', 'Hà Nội', 'Phú Quốc', '2025-01-20 06:00:00', '2025-01-20 08:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(144, 'Vietnam Airlines', 'FL702', 'Hà Nội', 'Đà Nẵng', '2025-01-20 07:00:00', '2025-01-20 09:00:00', 500.00, 150, '2025-01-13 17:28:45'),
(145, 'VietJet Air', 'FL703', 'Hà Nội', 'Nha Trang', '2025-01-20 08:00:00', '2025-01-20 10:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(146, 'Pacific Airlines', 'FL704', 'Hà Nội', 'Phú Quốc', '2025-01-20 09:00:00', '2025-01-20 11:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(147, 'Bamboo Airways', 'FL705', 'Hà Nội', 'Hồ Chí Minh', '2025-01-20 10:00:00', '2025-01-20 12:00:00', 450.00, 150, '2025-01-13 17:28:45'),
(148, 'Vietnam Airlines', 'FL706', 'Hà Nội', 'Phú Quốc', '2025-01-20 11:00:00', '2025-01-20 13:00:00', 350.00, 150, '2025-01-13 17:28:45'),
(149, 'VietJet Air', 'FL707', 'Hà Nội', 'Đà Nẵng', '2025-01-20 12:00:00', '2025-01-20 14:00:00', 500.00, 150, '2025-01-13 17:28:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `PaymentMethod` enum('CreditCard','BankTransfer','Cash','Other') NOT NULL,
  `PaymentStatus` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  `PaidAmount` decimal(10,2) NOT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`, `Description`) VALUES
(1, 'Admin', 'Quản trị hệ thống'),
(2, 'Customer', 'Khách hàng đặt vé');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `RoleID` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `Username`, `PasswordHash`, `FullName`, `Email`, `Phone`, `RoleID`, `CreatedAt`) VALUES
(19, 'admin', '$2a$10$fA3pv3.VBLeesSM0vkhL7OPdY9gsn2f7p8IZv.Jph96v4hOqLPIWq', 'Hào', 'hiepvip45@gmail.com', '0776267228', 1, '2025-01-08 17:17:16'),
(26, 'hoang', '$2a$10$jhYWHIRkcwyYZrpcLzl4xeArBWLPfi7NLjKilMHYR0Pm9qdSBm8ui', 'Hoàng', 'hiepvip101213@gmail.com', '0776267228', 2, '2025-01-13 14:17:57'),
(34, 'hao', '$2a$10$ovkxobEdd9JVauNn6ZZ3p.ptLFf51UimKHHMW7i/ZYuf3piZD3njq', 'Taone', '22130076@st.hcmuaf.edu.vn', '0984972747', 2, '2025-01-14 00:20:17'),
(35, 'haone', '$2a$10$m/HmMNHkeKvUl/cb2Z2iIeT9khoGQ6l9yyo4z/ebbc6jTvwBRk8k6', 'haone', '22130092@st.hcmuaf.edu.vn', '0984972746', 2, '2025-01-14 00:23:10');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `FlightID` (`FlightID`);

--
-- Chỉ mục cho bảng `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`FlightID`),
  ADD UNIQUE KEY `FlightNumber` (`FlightNumber`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `BookingID` (`BookingID`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`),
  ADD UNIQUE KEY `RoleName` (`RoleName`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RoleID` (`RoleID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auditlogs`
--
ALTER TABLE `auditlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1119;

--
-- AUTO_INCREMENT cho bảng `flights`
--
ALTER TABLE `flights`
  MODIFY `FlightID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD CONSTRAINT `auditlogs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`);

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`);

DELIMITER $$
--
-- Sự kiện
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_expired_flights` ON SCHEDULE EVERY 1 HOUR STARTS '2025-01-13 18:21:49' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM flights
    WHERE DepartureTime < NOW()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
