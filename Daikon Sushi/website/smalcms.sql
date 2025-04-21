-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 30, 2025 at 09:07 PM
-- Server version: 10.8.4-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smalcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('admin','manager','cook','courier') NOT NULL DEFAULT 'manager',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `login`, `password`, `name`, `phone`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Главный Админ', NULL, 'admin', 1, '2025-03-28 22:47:20', '2025-03-28 22:47:20'),
(2, 'manager1', 'e8b42101857dd881915871a246df2e64', 'Владелец Руслан', '', 'manager', 1, '2025-03-28 22:47:20', '2025-03-29 08:23:12'),
(3, 'cook1', 'e8b42101857dd881915871a246df2e64', 'Повар', '', 'cook', 1, '2025-03-28 22:47:20', '2025-03-28 22:55:56'),
(4, 'courier1', 'e8b42101857dd881915871a246df2e64', 'Служба доставки', '', 'courier', 1, '2025-03-28 22:47:20', '2025-03-29 08:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Суши -1шт'),
(2, 'МАКИ');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`) VALUES
(1, 'Центральный'),
(2, 'Северный'),
(3, 'Южный'),
(4, 'Восточный');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `total_profit` decimal(10,2) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `accepted_time` datetime DEFAULT NULL,
  `delivered_time` datetime DEFAULT NULL,
  `cooking_start_time` datetime DEFAULT NULL,
  `cooking_end_time` datetime DEFAULT NULL,
  `order_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','cooking','done','delivering') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('cash','card') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `total_amount`, `total_profit`, `district_id`, `order_date`, `accepted_time`, `delivered_time`, `cooking_start_time`, `cooking_end_time`, `order_number`, `status`, `start_time`, `end_time`, `delivery_time`, `items`, `address`, `phone`, `payment_method`, `order_code`) VALUES
(1, '1500.00', '1200.00', 1, '2025-03-24', '2024-03-20 12:00:00', '2024-03-20 12:45:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:23:08', NULL, '2025-03-29 14:23:14', '', '', '', 'cash', NULL),
(2, '2300.50', '1800.00', 2, '2025-03-26', '2024-03-22 18:30:00', '2024-03-22 19:15:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:23:16', '2025-03-29 14:23:17', '2025-03-29 15:01:04', '', '', '', 'cash', NULL),
(3, '980.00', '750.00', 3, '2025-03-28', '2024-03-24 09:15:00', '2024-03-24 09:50:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:43:03', '2025-03-29 14:43:08', '2025-03-29 15:01:06', '', '', '', 'cash', NULL),
(4, '4200.00', '3400.00', 1, '2025-03-29', '2024-03-25 14:00:00', '2024-03-25 14:40:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:43:09', '2025-03-29 14:43:11', '2025-03-29 15:01:07', '', '', '', 'cash', NULL),
(5, '1750.00', '1400.00', 4, '2025-03-19', '2024-03-15 20:00:00', '2024-03-15 20:35:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:49:32', '2025-03-29 15:00:46', '2025-03-29 15:02:38', '', '', '', 'cash', NULL),
(6, '3100.00', '2500.00', 2, '2025-03-22', '2024-03-18 16:45:00', '2024-03-18 17:30:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:44:37', NULL, '2025-03-29 14:49:37', '', '', '', 'cash', NULL),
(7, '5000.00', '4000.00', 1, '2025-03-29', '2025-03-29 11:31:28', '2025-03-29 12:31:28', NULL, NULL, NULL, 'delivering', '2025-03-29 14:43:19', NULL, '2025-03-29 14:43:20', '', '', '', 'cash', NULL),
(8, '900.00', '700.00', 3, '2024-02-15', '2024-02-15 12:00:00', '2024-02-15 12:50:00', NULL, NULL, NULL, 'delivering', '2025-03-29 14:43:44', '2025-03-29 14:44:17', '2025-03-29 17:13:43', '', '', '', 'cash', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_sequence`
--

CREATE TABLE `order_sequence` (
  `year_month` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `image`, `updated_at`) VALUES
(1, 'Сяке', 'Свежий лосось, идеальный вкус и полезные свойства.', '600.00', 1, 'product_67e9864d90ff1.jpg', '2025-03-30 17:58:37'),
(2, 'Кани', 'Нежное мясо краба, изысканный вкус, идеально для гурманов.', '600.00', 1, 'product_67e73dfa502008.19322695.jpg', '2025-03-30 17:51:12'),
(4, 'Динамит', 'Пикантный тунец, японский омлет, грибы Шинтаке, майонез, соус Чили, огурец\r\n\r\n', '1900.00', 2, 'product_67e73e4cee8425.87243444.jpg', '2025-03-30 17:51:12'),
(5, 'пример', 'фолпр дыловар дплор', '11250.00', 1, 'product_67e953f6b73e36.43743205.avif', '2025-03-30 17:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `title`, `description`, `image`, `start_date`, `end_date`, `is_active`, `created_at`) VALUES
(1, 'Первым 100', 'Мы сделали скидку первым 100 клиентам 30 %', 'promo_67e79ef509fde.png', '2025-03-29', '2025-03-31', 1, '2025-03-29 01:16:19'),
(2, 'скидка на понедельник ', 'Первым 100 клиентам 15% скидка ', 'promo_67e7ca14e1166.avif', '2025-03-29', '2025-03-31', 1, '2025-03-29 01:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default-logo.png' COMMENT 'Логотип системы',
  `cooking_time` int(11) NOT NULL DEFAULT 1800
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `logo`, `cooking_time`) VALUES
(5, 'logo', 'logo_1743208797.png', 'default-logo.png', 1800),
(15, 'app_name', 'Daikon sushi', 'default-logo.png', 1800),
(16, 'phone', '+7 747 160 8221', 'default-logo.png', 1800),
(17, 'currency', 'RUB', 'default-logo.png', 1800),
(18, 'working_hours', '{\"monday\":{\"start\":\"13:00\",\"end\":\"18:00\"},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\"},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\"},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\"},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\"},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\"},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\"}}', 'default-logo.png', 1800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD UNIQUE KEY `order_code` (`order_code`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_sequence`
--
ALTER TABLE `order_sequence`
  ADD PRIMARY KEY (`year_month`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
