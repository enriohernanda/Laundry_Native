-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 09:06 AM
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
(1, 'Enrio', '0812345888', 'Jakarta Utara', '2025-11-24 07:05:32', '2025-11-25 03:00:10'),
(2, 'Hernanda', '0812345888', 'Bandung', '2025-11-25 02:59:54', '2025-11-25 03:00:04'),
(3, 'Anugrah', '08121783238', 'Cempaka Putih', '2025-11-27 02:17:46', NULL),
(4, 'Pambudi', '081737637236', 'Sunter', '2025-11-27 02:17:59', NULL),
(5, 'Rio', '087774637463', 'Kelapa Gading', '2025-11-27 02:18:12', NULL);

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
(1, 'Administrator', '2025-11-24 04:52:05', NULL),
(2, 'Operator', '2025-11-24 04:52:33', NULL),
(3, 'Pimpinan', '2025-11-24 04:52:39', NULL);

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
(4, 3, 1, '2025-11-25 02:56:18', NULL),
(50, 1, 8, '2025-11-26 06:51:58', NULL),
(51, 1, 7, '2025-11-26 06:51:59', NULL),
(52, 1, 6, '2025-11-26 06:51:59', NULL),
(53, 1, 5, '2025-11-26 06:51:59', NULL),
(54, 1, 4, '2025-11-26 06:51:59', NULL),
(55, 1, 3, '2025-11-26 06:51:59', NULL),
(56, 1, 2, '2025-11-26 06:51:59', NULL),
(57, 1, 1, '2025-11-26 06:51:59', NULL),
(61, 2, 8, '2025-11-26 06:53:19', NULL),
(62, 2, 7, '2025-11-26 06:53:19', NULL),
(63, 2, 6, '2025-11-26 06:53:19', NULL);

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
(1, 'User', 'bi bi-person', 'user', 6, '2025-11-25 01:42:45', '2025-11-25 07:40:47'),
(2, 'Menu', 'bi bi-menu-button-wide', 'menu', 4, '2025-11-25 01:48:12', '2025-11-25 07:40:42'),
(3, 'Service', 'bi bi-book', 'service', 3, '2025-11-25 02:32:14', '2025-11-25 07:40:39'),
(4, 'Customer', 'bi bi-people', 'customer', 2, '2025-11-25 03:47:37', '2025-11-25 07:40:33'),
(5, 'Level', 'bi bi-book', 'level', 5, '2025-11-25 03:47:55', '2025-11-25 07:40:29'),
(6, 'Dashboard', 'bi bi-speedometer', 'dashboard', 1, '2025-11-25 05:01:53', '2025-11-25 07:38:46'),
(7, 'Tax', 'bi bi-percent', 'tax', 7, '2025-11-26 01:33:46', '2025-11-26 01:35:43'),
(8, 'Order', 'bi bi-table', 'order', 8, '2025-11-26 06:51:50', NULL);

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
(1, 'Wash &  Rub Clothes', 7000, '', '2025-11-24 06:24:30', '2025-11-27 03:08:24'),
(2, 'Wash', 4500, '', '2025-11-24 06:28:15', '2025-11-27 03:08:00'),
(3, 'Rub Clothes', 5000, '', '2025-11-24 06:28:36', '2025-11-27 03:08:15');

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
(3, 12, 1, '2025-11-26 02:43:57', '2025-11-26 02:45:40'),
(4, 10, 0, '2025-11-26 02:45:50', NULL);

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
(1, 0, 'ORD-2711250001', '2025-11-20', 1, 0, 0, 450, 4950, '2025-11-27 07:56:04', NULL),
(2, 0, 'ORD-2711250002', '2025-11-26', 1, 0, 0, 900, 9900, '2025-11-27 08:00:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_details`
--

CREATE TABLE `trans_order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans_order_details`
--

INSERT INTO `trans_order_details` (`id`, `order_id`, `service_id`, `qty`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 4500, 4500, '2025-11-27 07:56:04', NULL),
(2, 2, 2, 2, 4500, 9000, '2025-11-27 08:00:26', NULL);

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
(1, 1, 'Admin', 'admin@gmail.com', '6b63d2a490228d003c055c36430ba00666db7ff7', '2025-11-24 02:56:13', '2025-11-25 04:58:18'),
(2, 2, 'Enrio', 'enrio@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-25 06:26:28', NULL),
(3, 3, 'hernanda', 'hernanda@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-25 06:40:38', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `level_menus`
--
ALTER TABLE `level_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trans_orders`
--
ALTER TABLE `trans_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trans_order_details`
--
ALTER TABLE `trans_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
