-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 08:54 AM
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
-- Database: `db_laundry_enrio`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Enrio', '0812345888', 'Jakarta', '2025-11-28 07:36:37', NULL),
(2, 'Hernanda', '08123456789', 'Bandung', '2025-11-28 07:36:46', NULL),
(3, 'Anugrah', '08121783238', 'Cempaka Putih', '2025-11-28 07:36:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2025-11-28 07:10:13', NULL),
(2, 'Operator', '2025-11-28 07:10:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `level_menus`
--

CREATE TABLE `level_menus` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level_menus`
--

INSERT INTO `level_menus` (`id`, `level_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(4, 1, 9, '2025-11-28 07:35:44', NULL),
(5, 1, 8, '2025-11-28 07:35:44', NULL),
(6, 1, 7, '2025-11-28 07:35:44', NULL),
(7, 1, 6, '2025-11-28 07:35:44', NULL),
(8, 1, 5, '2025-11-28 07:35:44', NULL),
(9, 1, 4, '2025-11-28 07:35:44', NULL),
(10, 1, 3, '2025-11-28 07:35:44', NULL),
(11, 1, 1, '2025-11-28 07:35:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `link` varchar(30) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `icon`, `link`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Level', 'bi bi-book', 'level', 4, '2025-11-28 07:17:53', '2025-11-28 07:34:31'),
(3, 'user', 'bi bi-people', 'user', 5, '2025-11-28 07:28:03', '2025-11-28 07:34:37'),
(4, 'customer', 'bi bi-user', 'customer', 2, '2025-11-28 07:33:09', '2025-11-28 07:34:24'),
(5, 'service', 'bi bi-user', 'service', 3, '2025-11-28 07:33:41', NULL),
(6, 'dashboard', 'bi bi-book', 'dashboard', 1, '2025-11-28 07:34:16', NULL),
(7, 'tax', 'bi bi-user', 'tax', 6, '2025-11-28 07:35:13', NULL),
(8, 'menu', 'bi bi-book', 'menu', 7, '2025-11-28 07:35:13', NULL),
(9, 'order', 'bi bi-user', 'order', 8, '2025-11-28 07:35:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Gosok', 5000, '', '2025-11-28 07:37:08', NULL),
(2, 'Cuci & gosok', 10000, '', '2025-11-28 07:37:15', NULL),
(3, 'Gosok', 4500, '', '2025-11-28 07:37:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taxs`
--

CREATE TABLE `taxs` (
  `id` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taxs`
--

INSERT INTO `taxs` (`id`, `percent`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2025-11-28 07:37:36', '2025-11-28 07:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `trans_orders`
--

CREATE TABLE `trans_orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_code` varchar(20) NOT NULL,
  `order_end_date` date NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT 0,
  `order_pay` int(11) NOT NULL,
  `order_change` int(11) NOT NULL,
  `order_tax` int(11) NOT NULL,
  `order_total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_orders`
--

INSERT INTO `trans_orders` (`id`, `customer_id`, `order_code`, `order_end_date`, `order_status`, `order_pay`, `order_change`, `order_tax`, `order_total`, `created_at`, `updated_at`) VALUES
(11, 1, 'ORD-2811250001', '2025-11-28', 1, 6000, 500, 500, 5500, '2025-11-28 07:50:55', NULL),
(12, 2, 'ORD-2811250001', '2025-11-28', 1, 20000, 3500, 1500, 16500, '2025-11-28 07:51:17', NULL),
(13, 3, 'ORD-2811250001', '2025-11-28', 1, 15000, 5100, 900, 9900, '2025-11-28 07:51:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_details`
--

CREATE TABLE `trans_order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` decimal(10,1) NOT NULL,
  `price` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order_details`
--

INSERT INTO `trans_order_details` (`id`, `order_id`, `service_id`, `qty`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1.0, 5000, 5000, '2025-11-28 07:38:47', NULL),
(2, 1, 2, 1.0, 10000, 10000, '2025-11-28 07:38:47', NULL),
(3, 1, 3, 1.0, 4500, 4500, '2025-11-28 07:38:47', NULL),
(4, 2, 1, 1.0, 5000, 5000, '2025-11-28 07:39:25', NULL),
(5, 2, 2, 1.0, 10000, 10000, '2025-11-28 07:39:25', NULL),
(6, 2, 3, 1.0, 4500, 4500, '2025-11-28 07:39:25', NULL),
(7, 3, 1, 1.0, 5000, 5000, '2025-11-28 07:39:40', NULL),
(8, 3, 2, 1.0, 10000, 10000, '2025-11-28 07:39:40', NULL),
(9, 3, 3, 1.0, 4500, 4500, '2025-11-28 07:39:40', NULL),
(10, 4, 1, 1.0, 5000, 5000, '2025-11-28 07:42:47', NULL),
(11, 4, 2, 1.0, 10000, 10000, '2025-11-28 07:42:47', NULL),
(12, 4, 3, 1.0, 4500, 4500, '2025-11-28 07:42:47', NULL),
(13, 5, 1, 1.0, 5000, 5000, '2025-11-28 07:43:16', NULL),
(14, 5, 2, 1.0, 10000, 10000, '2025-11-28 07:43:16', NULL),
(15, 5, 3, 1.0, 4500, 4500, '2025-11-28 07:43:16', NULL),
(16, 6, 2, 1.0, 10000, 10000, '2025-11-28 07:44:14', NULL),
(17, 6, 3, 1.0, 4500, 4500, '2025-11-28 07:44:14', NULL),
(18, 6, 1, 1.0, 5000, 5000, '2025-11-28 07:44:14', NULL),
(19, 7, 1, 1.0, 5000, 5000, '2025-11-28 07:45:01', NULL),
(20, 7, 2, 1.0, 10000, 10000, '2025-11-28 07:45:01', NULL),
(21, 7, 3, 1.0, 4500, 4500, '2025-11-28 07:45:01', NULL),
(22, 8, 1, 1.0, 5000, 5000, '2025-11-28 07:46:53', NULL),
(23, 8, 2, 1.0, 10000, 10000, '2025-11-28 07:46:53', NULL),
(24, 8, 3, 1.0, 4500, 4500, '2025-11-28 07:46:53', NULL),
(25, 9, 2, 1.0, 10000, 10000, '2025-11-28 07:47:56', NULL),
(26, 10, 1, 1.0, 5000, 5000, '2025-11-28 07:49:53', NULL),
(27, 11, 1, 1.0, 5000, 5000, '2025-11-28 07:50:55', NULL),
(28, 12, 2, 1.5, 10000, 15000, '2025-11-28 07:51:17', NULL),
(29, 13, 3, 2.0, 4500, 9000, '2025-11-28 07:51:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `level_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-28 07:03:34', '2025-11-28 07:12:31'),
(2, 2, 'Operator', 'operator@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2025-11-28 07:05:54', '2025-11-28 07:29:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_menus`
--
ALTER TABLE `level_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxs`
--
ALTER TABLE `taxs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_orders`
--
ALTER TABLE `trans_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_order_details`
--
ALTER TABLE `trans_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level_menus`
--
ALTER TABLE `level_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trans_orders`
--
ALTER TABLE `trans_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trans_order_details`
--
ALTER TABLE `trans_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
