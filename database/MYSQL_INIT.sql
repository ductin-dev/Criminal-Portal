-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2022 at 12:45 PM
-- Server version: 5.7.39-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+07:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `satdeve1_CovidTracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `Area`
--

CREATE TABLE `Area` (
                        `aId` int(11) NOT NULL,
                        `aX` varchar(255) NOT NULL,
                        `aY` varchar(255) NOT NULL,
                        `aAddress` varchar(500) CHARACTER SET utf8 NOT NULL,
                        `aDetail` varchar(500) CHARACTER SET utf8 NOT NULL,
                        `aCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                        `aModifieddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Area`
--

INSERT INTO `Area` (`aId`, `aX`, `aY`, `aAddress`, `aDetail`, `aCreateddate`, `aModifieddate`) VALUES
                                                                                                   (1, '15.967313', '108.183486', 'Thôn Lệ Sơn Nam, xã Hòa Tiến, huyện Hoà Vang, Đà Nẵng', '- Nhà BN509, BN557, BN581, BN629, BN630, BN638, BN640, BN851 ở khu vực này\n- BN456 đã đến đây vào ngày 20/07/2020\n- BN637 đã đến đây\n- BN693 đã đến đây vào ngày 23/7/2020 và 25/7/2020', '2022-09-06 15:03:16', NULL),
                                                                                                   (2, '15.972618', '108.172090', 'Thôn Yến Nê 2 (ranh giới 1/2 tổ 6, tổ 7 và tổ 8), Hoà Vang, Đà Nẵng', '', '2022-09-06 15:04:42', NULL),
                                                                                                   (3, '16.010536', '108.195136', 'Trung tâm Y tế quận Cẩm Lệ - Đà Nẵng', '- BN556 đi khám vào ngày 27/7/2020\n- BN509 đã đến Khoa Truyền nhiễm, phòng số 6 vào ngày 27/7/2020\n- BN826 đã khám sức khỏe tại đây vào 22/7/2020', '2022-09-06 15:04:42', NULL),
                                                                                                   (4, '16.059738', '108.209942', 'Bệnh viện Hoàn Mỹ Đà Nẵng', '- BN456 đã đến đây vào ngày 29/07/2020\n- BN696 đã đến đây nửa đầu tháng 7/2020', '2022-09-06 15:04:42', NULL),
                                                                                                   (5, '16.057214', '108.235863', 'Đường Lê Hữu Trác, phường An Hải Đông, Sơn Trà, Đà Nẵng', 'Khu vực Kiệt K34, K38, K54 đường Lê Hữu Trác và hai đoạn đường Nguyễn Duy Hiệu, Lê Hữu Trác (đoạn từ K34 đến K54 Lê Hữu Trác), phường An Hải Đông, quận Sơn Trà', '2022-09-06 15:04:42', NULL),
                                                                                                   (6, '16.072677', '108.215707', 'Bệnh viện Đà Nẵng', '', '2022-09-06 15:04:42', NULL),
                                                                                                   (7, '16.072522', '108.213390', 'Trung tâm Y tế quận Hải Châu - Đà Nẵng', '- BN555 đã đến đây vào ngày 28/07/2020\n- BN503 đã đến đây làm việc vào ngày 24/07/2020 tại khoa Nhi\n- BN456 đã đến đây vào ngày 24/07/2020\n- BN656 đã đến đây khám và khai báo y tế vào ngày 27/07/2020 và29/07/2020\n- BN663 đã đến đây từ 27/07/2020 - 30/07/2020\n- BN724, BN801 đã đến đây vào khoảng 16:00 ngày 27/07/2020 và 29/07/2020\n- BN457 đã đến đây ngày 28/07/2020\n- BN582 đã đến đây ngày 29/07/2020\n- BN874 đến đây từ ngày 26/7 đến 30/7/2020', '2022-09-06 15:04:42', NULL),
                                                                                                   (8, '16.088499', '108.230703', 'Chung cư B1 - 119 Vân Đồn, Đà Nẵng', '', '2022-09-06 15:04:42', NULL),
                                                                                                   (9, '16.092086', '108.232238', 'Chung cư A3 - Ngô Trí Hòa, Nại Hiên Đông, Sơn Trà, Đà Nẵng', '', '2022-09-06 15:04:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charity`
--

CREATE TABLE `charity` (
                           `cId` bigint(20) NOT NULL,
                           `cName` varchar(150) NOT NULL,
                           `cAddress` varchar(150) NOT NULL,
                           `cUser` bigint(20) NOT NULL,
                           `cProduct` bigint(20) NOT NULL,
                           `cCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                           `cModifieddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charity`
--

INSERT INTO `charity` (`cId`, `cName`, `cAddress`, `cUser`, `cProduct`, `cCreateddate`, `cModifieddate`) VALUES
                                                                                                             (2, 'Nhà H? Tr? Nhân Tâm', 'H?i Châu-?à N?ng', 1, 1, '2022-09-06 15:02:43', NULL),
                                                                                                             (3, '?oàn FPT', 'S?n Trà-?à N?ng', 2, 2, '2022-09-06 15:02:43', NULL),
                                                                                                             (4, 'Xã Hòa Th?nh', 'Thanh Khê-?à N?ng', 1, 3, '2022-09-06 15:02:43', NULL),
                                                                                                             (5, 'UBND ??ng Nai', 'C?m L?-?à N?ng', 1, 4, '2022-09-06 15:02:43', NULL),
                                                                                                             (6, 'Nhà H? Tr? 5', 'FPT-?à N?ng', 2, 5, '2022-09-06 15:02:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
                           `bnId` bigint(20) NOT NULL,
                           `bnCode` varchar(10) NOT NULL,
                           `bnName` varchar(100) CHARACTER SET utf8 NOT NULL,
                           `bnX` varchar(255) NOT NULL,
                           `bnY` varchar(255) NOT NULL,
                           `bnAddress` varchar(500) CHARACTER SET utf8 NOT NULL,
                           `bnStatus` varchar(50) CHARACTER SET utf8 NOT NULL,
                           `bnCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                           `bnModifieddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
                            `pId` bigint(20) NOT NULL,
                            `pName` varchar(255) NOT NULL,
                            `pNumber` int(11) NOT NULL,
                            `pCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                            `pModifieddate` datetime DEFAULT NULL,
                            `uImage` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pId`, `pName`, `pNumber`, `pCreateddate`, `pModifieddate`, `uImage`) VALUES
                                                                                                  (1, 'M? Tôm', 321, '2022-09-06 15:01:42', NULL, ''),
                                                                                                  (2, 'N??c', 232, '2022-09-06 15:01:42', NULL, ''),
                                                                                                  (3, 'Bánh K?o', 543, '2022-09-06 15:01:42', NULL, ''),
                                                                                                  (4, 'Kh?u Trang', 312, '2022-09-06 15:01:43', NULL, ''),
                                                                                                  (5, 'Another', 312, '2022-09-06 15:01:43', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
                        `rId` bigint(20) NOT NULL,
                        `rName` varchar(255) NOT NULL,
                        `rCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                        `rModifieddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rId`, `rName`, `rCreateddate`, `rModifieddate`) VALUES
                                                                         (1, 'ADMIN', '2022-09-06 14:59:54', NULL),
                                                                         (2, 'MODERATOR', '2022-09-06 14:59:54', NULL),
                                                                         (3, 'PRIMARY USER', '2022-09-06 14:59:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
                        `uId` bigint(20) NOT NULL,
                        `uUsername` varchar(150) NOT NULL,
                        `uPassword` varchar(150) NOT NULL,
                        `uFullname` varchar(150) NOT NULL,
                        `uPhone` varchar(150) NOT NULL,
                        `uAddress` varchar(150) NOT NULL,
                        `uEmail` varchar(150) DEFAULT NULL,
                        `uStatus` int(11) NOT NULL,
                        `uRole` bigint(20) NOT NULL,
                        `uCreateddate` datetime DEFAULT CURRENT_TIMESTAMP,
                        `uModifieddate` datetime DEFAULT NULL,
                        `uAvatar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uId`, `uUsername`, `uPassword`, `uFullname`, `uPhone`, `uAddress`, `uEmail`, `uStatus`, `uRole`, `uCreateddate`, `uModifieddate`, `uAvatar`) VALUES
                                                                                                                                                                      (1, 'admin', '123456', 'admin', '19008198', 'Nguyen Van Thoai-Da Nang', 'admin@gmail.com', 1, 1, '2022-09-06 15:00:21', NULL, ''),
                                                                                                                                                                      (2, 'nguyenvana', '123456', 'Nguyen Van A', '19008198', 'Thanh Khe-Da Nang', 'nguyenvana@gmail.com', 1, 2, '2022-09-06 15:00:21', NULL, ''),
                                                                                                                                                                      (3, 'nguyenvanb', '123456', 'Nguyen Van B', '19008198', 'Cam Le-Da Nang', 'nguyenvanb@gmail.com', 1, 2, '2022-09-06 15:00:21', NULL, ''),
                                                                                                                                                                      (4, 'nguyenvanc', '123456', 'Nguyen Van C', '19008198', 'Son Tra-Da Nang', 'nguyenvanc@gmail.com', 1, 2, '2022-09-06 15:00:21', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Area`
--
ALTER TABLE `Area`
    ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `charity`
--
ALTER TABLE `charity`
    ADD PRIMARY KEY (`cId`),
  ADD KEY `fk_charity_product` (`cProduct`),
  ADD KEY `fk_charity_user` (`cUser`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
    ADD PRIMARY KEY (`bnId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`rId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`uId`),
  ADD KEY `fk_user_role` (`uRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Area`
--
ALTER TABLE `Area`
    MODIFY `aId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `charity`
--
ALTER TABLE `charity`
    MODIFY `cId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
    MODIFY `bnId` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `pId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
    MODIFY `rId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `uId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charity`
--
ALTER TABLE `charity`
    ADD CONSTRAINT `fk_charity_product` FOREIGN KEY (`cProduct`) REFERENCES `products` (`pId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_charity_user` FOREIGN KEY (`cUser`) REFERENCES `user` (`uId`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
    ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`uRole`) REFERENCES `role` (`rId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
