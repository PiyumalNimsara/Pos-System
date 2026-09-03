-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2026 at 10:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(50) DEFAULT 'Cashier',
  `image` longblob DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `nic`, `contact`, `address`, `username`, `password`, `role`, `image`, `created_at`) VALUES
(1, 'Admin', 'User', '123456789V', '0771234567', 'Main Office', 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'Admin', NULL, '2026-08-01 15:29:07'),
(2, 'Kasun', 'Perera', '987654321V', '0777654321', 'Colombo', 'kasun', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'Cashier', NULL, '2026-08-01 15:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `cash` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_no`, `date`, `time`, `employee_id`, `total`, `cash`, `balance`) VALUES
(2, 'INV-1785600916736', '2026-08-01', '21:45:16', 2, 91.00, 100.00, 9.00),
(3, 'INV-1785655488270', '2026-08-02', '12:54:48', 2, 110.00, 150.00, 40.00),
(4, 'INV-1785655832508', '2026-08-02', '13:00:32', 2, 40.00, 50.00, 10.00),
(5, 'INV-1785656144753', '2026-08-02', '13:05:44', 2, 35.00, 50.00, 15.00),
(6, 'INV-1785656673046', '2026-08-02', '13:14:33', 2, 35.00, 50.00, 15.00),
(7, 'INV-1785656706790', '2026-08-02', '13:15:06', 2, 40.00, 50.00, 10.00),
(8, 'INV-1785657031130', '2026-08-02', '13:20:31', 2, 35.00, 40.00, 5.00),
(9, 'INV-1785657257736', '2026-08-02', '13:24:17', 2, 35.00, 50.00, 15.00),
(10, 'INV-1785658778525', '2026-08-02', '13:49:38', 2, 28.00, 30.00, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item`
--

CREATE TABLE `invoice_item` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `unit_price` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_item`
--

INSERT INTO `invoice_item` (`id`, `invoice_id`, `product_id`, `qty`, `unit_price`, `total`) VALUES
(1, 2, 'BC001', 1, 35.00, 35.00),
(2, 2, 'BC003', 2, 28.00, 56.00),
(3, 3, 'BR002', 1, 110.00, 110.00),
(4, 4, 'BC002', 1, 40.00, 40.00),
(5, 5, 'BC001', 1, 35.00, 35.00),
(6, 6, 'BC001', 1, 35.00, 35.00),
(7, 7, 'BC002', 1, 40.00, 40.00),
(8, 8, 'BC001', 1, 35.00, 35.00),
(9, 9, 'BC001', 1, 35.00, 35.00),
(10, 10, 'BC003', 1, 28.00, 28.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `buying_price` decimal(10,2) DEFAULT 0.00,
  `selling_price` decimal(10,2) DEFAULT 0.00,
  `quantity` int(11) DEFAULT 0,
  `reorder_level` int(11) DEFAULT 10,
  `image` longblob DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `category`, `buying_price`, `selling_price`, `quantity`, `reorder_level`, `image`, `created_at`) VALUES
('BC001', 'Butter Biscuit', 'Biscuits', 25.00, 35.00, 96, 20, NULL, '2026-08-01 15:29:07'),
('BC002', 'Chocolate Biscuit', 'Biscuits', 30.00, 40.00, 78, 15, NULL, '2026-08-01 15:29:07'),
('BC003', 'Marie Biscuit', 'Biscuits', 20.00, 28.00, 117, 25, NULL, '2026-08-01 15:29:07'),
('BN001', 'Cream Bun', 'Buns', 40.00, 50.00, 45, 10, NULL, '2026-08-01 15:29:07'),
('BN002', 'Jam Bun', 'Buns', 35.00, 45.00, 35, 8, NULL, '2026-08-01 15:29:07'),
('BR001', 'White Bread', 'Bread', 80.00, 95.00, 50, 10, NULL, '2026-08-01 15:29:07'),
('BR002', 'Brown Bread', 'Bread', 90.00, 110.00, 39, 10, NULL, '2026-08-01 15:29:07'),
('BR003', 'Garlic Bread', 'Bread', 120.00, 145.00, 30, 5, NULL, '2026-08-01 15:29:07'),
('CK001', 'Chocolate Cake', 'Cakes', 450.00, 550.00, 15, 3, NULL, '2026-08-01 15:29:07'),
('CK002', 'Butter Cake', 'Cakes', 350.00, 420.00, 20, 5, NULL, '2026-08-01 15:29:07'),
('CK003', 'Ribbon Cake', 'Cakes', 400.00, 480.00, 12, 3, NULL, '2026-08-01 15:29:07'),
('PS001', 'Fish Bun', 'Pastry', 45.00, 55.00, 60, 15, NULL, '2026-08-01 15:29:07'),
('PS002', 'Egg Bun', 'Pastry', 50.00, 60.00, 50, 10, NULL, '2026-08-01 15:29:07'),
('PS003', 'Sausage Roll', 'Pastry', 65.00, 80.00, 40, 10, NULL, '2026-08-01 15:29:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_item`
--
ALTER TABLE `invoice_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `invoice_item`
--
ALTER TABLE `invoice_item`
  ADD CONSTRAINT `invoice_item_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `invoice_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
