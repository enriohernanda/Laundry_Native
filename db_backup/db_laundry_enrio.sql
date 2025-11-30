-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2025 pada 17.05
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

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
-- Struktur dari tabel `customers`
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
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Enrio', '0812345888', 'Jakarta', '2025-11-28 07:36:37', NULL),
(2, 'Hernanda', '08123456789', 'Bandung', '2025-11-28 07:36:46', NULL),
(3, 'Anugrah', '08121783238', 'Cempaka Putih', '2025-11-28 07:36:58', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2025-11-28 07:10:13', NULL),
(2, 'Operator', '2025-11-28 07:10:13', NULL),
(4, 'Pimpinan', '2025-11-30 07:12:12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level_menus`
--

CREATE TABLE `level_menus` (
  `id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `level_menus`
--

INSERT INTO `level_menus` (`id`, `level_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(16, 2, 9, '2025-11-30 07:13:53', NULL),
(17, 2, 6, '2025-11-30 07:13:53', NULL),
(28, 1, 10, '2025-11-30 14:24:18', NULL),
(29, 1, 9, '2025-11-30 14:24:18', NULL),
(30, 1, 8, '2025-11-30 14:24:18', NULL),
(31, 1, 7, '2025-11-30 14:24:18', NULL),
(32, 1, 6, '2025-11-30 14:24:18', NULL),
(33, 1, 5, '2025-11-30 14:24:18', NULL),
(34, 1, 4, '2025-11-30 14:24:18', NULL),
(35, 1, 3, '2025-11-30 14:24:18', NULL),
(36, 1, 1, '2025-11-30 14:24:18', NULL),
(37, 4, 10, '2025-11-30 14:24:28', NULL),
(38, 4, 6, '2025-11-30 14:24:28', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
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
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `icon`, `link`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Level', 'bi bi-gear', 'level', 4, '2025-11-28 07:17:53', '2025-11-30 04:33:11'),
(3, 'User', 'bi bi-people', 'user', 5, '2025-11-28 07:28:03', '2025-11-30 04:33:23'),
(4, 'Customer', 'bi bi-person', 'customer', 2, '2025-11-28 07:33:09', '2025-11-30 04:30:44'),
(5, 'Service', 'bi bi-book', 'service', 3, '2025-11-28 07:33:41', '2025-11-30 04:32:34'),
(6, 'Dashboard', 'bi bi-speedometer', 'dashboard', 1, '2025-11-28 07:34:16', '2025-11-30 04:30:52'),
(7, 'Tax', 'bi bi-percent', 'tax', 6, '2025-11-28 07:35:13', '2025-11-30 04:34:50'),
(8, 'Menu', 'bi bi-menu-down', 'menu', 7, '2025-11-28 07:35:13', '2025-11-30 04:34:33'),
(9, 'Order', 'bi bi-bag', 'order', 8, '2025-11-28 07:35:34', '2025-11-30 04:34:58'),
(10, 'Report', 'bi bi-card-list', 'report', 9, '2025-11-30 14:24:06', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
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
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hanya Gosok', 5000, '', '2025-11-28 07:37:08', '2025-11-30 07:24:13'),
(2, 'Cuci & gosok', 5000, '', '2025-11-28 07:37:15', '2025-11-30 07:23:43'),
(3, 'Hanya Cuci', 4500, '', '2025-11-28 07:37:27', '2025-11-30 07:24:03'),
(4, 'Laundry Besar', 7000, '', '2025-11-30 07:24:57', '2025-11-30 07:25:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `taxs`
--

CREATE TABLE `taxs` (
  `id` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `taxs`
--

INSERT INTO `taxs` (`id`, `percent`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2025-11-28 07:37:36', '2025-11-28 07:37:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_orders`
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
-- Dumping data untuk tabel `trans_orders`
--

INSERT INTO `trans_orders` (`id`, `customer_id`, `order_code`, `order_end_date`, `order_status`, `order_pay`, `order_change`, `order_tax`, `order_total`, `created_at`, `updated_at`) VALUES
(20, 1, 'ORD-3011250001', '2025-11-30', 1, 15000, 1250, 1250, 13750, '2025-11-30 07:26:07', NULL),
(21, 2, 'ORD-3011250001', '2025-11-30', 1, 50000, 26900, 2100, 23100, '2025-11-30 07:26:56', NULL),
(22, 3, 'ORD-3011250001', '2025-11-30', 1, 20000, 10100, 900, 9900, '2025-11-30 07:27:28', NULL),
(23, 3, 'ORD-3011250023', '2025-11-30', 1, 15000, 3450, 1050, 11550, '2025-11-30 15:25:10', '2025-11-30 15:25:56'),
(24, 2, 'ORD-3011250024', '2025-11-30', 0, 10000, 1750, 750, 8250, '2025-11-30 15:35:43', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order_details`
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
-- Dumping data untuk tabel `trans_order_details`
--

INSERT INTO `trans_order_details` (`id`, `order_id`, `service_id`, `qty`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(36, 20, 1, '1.0', 5000, 5000, '2025-11-30 07:26:07', NULL),
(37, 20, 2, '1.5', 5000, 7500, '2025-11-30 07:26:07', NULL),
(38, 21, 4, '3.0', 7000, 21000, '2025-11-30 07:26:56', NULL),
(39, 22, 3, '2.0', 4500, 9000, '2025-11-30 07:27:28', NULL),
(40, 23, 4, '1.5', 7000, 10500, '2025-11-30 15:25:10', NULL),
(41, 24, 2, '1.5', 5000, 7500, '2025-11-30 15:35:43', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `level_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-28 07:03:34', '2025-11-28 07:12:31'),
(2, 2, 'Operator', 'operator@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-28 07:05:54', '2025-11-30 07:15:10'),
(3, 4, 'Pimpinan', 'pimpinan@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-11-30 07:13:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level_menus`
--
ALTER TABLE `level_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `taxs`
--
ALTER TABLE `taxs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_orders`
--
ALTER TABLE `trans_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_order_details`
--
ALTER TABLE `trans_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `level_menus`
--
ALTER TABLE `level_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `trans_orders`
--
ALTER TABLE `trans_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `trans_order_details`
--
ALTER TABLE `trans_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
