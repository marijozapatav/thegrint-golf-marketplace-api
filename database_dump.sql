-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2026 a las 04:43:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `golf_marketplace`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-309652eebaf70dc850d5c481cb7e058a', 'i:21;', 1768505699),
('laravel-cache-309652eebaf70dc850d5c481cb7e058a:timer', 'i:1768505699;', 1768505699);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Drivers', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(2, 'Woods', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(3, 'Hybrids', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(4, 'Driving Irons', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(5, 'Irons', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(6, 'Wedges', '2026-01-14 05:03:18', '2026-01-14 05:03:18'),
(7, 'Putters', '2026-01-14 05:03:18', '2026-01-14 05:03:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ai_market_value` decimal(10,2) DEFAULT NULL,
  `condition` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `ai_evaluation` text DEFAULT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `listings`
--

INSERT INTO `listings` (`id`, `user_id`, `category_id`, `title`, `price`, `ai_market_value`, `condition`, `description`, `ai_evaluation`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Callaway Rogue ST Driver', 450.00, 470.00, 'New', 'Latest model Callaway driver, high forgiveness and speed.', 'Excellent value for a current season driver.', '2026-12-31 23:59:59', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(2, 2, 1, 'TaylorMade Stealth Irons', 850.00, 820.00, 'Like New', 'Set of irons 4-PW. Carbonwood technology. Only used twice at the range.', 'Great condition. Practically brand new.', '2026-11-15 12:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(3, 2, 2, 'Titleist Pro V1 Balls', 55.00, 55.00, 'New', 'One dozen brand new Pro V1 balls. White color.', 'Standard retail price.', '2026-10-10 00:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(4, 2, 1, 'Odyssey White Hot Putter', 180.00, 190.00, 'Refurbished', 'Professionally restored classic Odyssey putter. New original grip.', 'Excellent refurbished condition. Better than used.', '2026-09-20 18:30:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(5, 2, 3, 'Garmin Approach S62', 320.00, 350.00, 'Like New', 'Golf GPS Watch. Screen is perfect, Includes original box.', 'Premium accessory in mint condition.', '2026-08-05 09:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(6, 2, 4, 'FootJoy HyperFlex Shoes', 120.00, 130.00, 'New', 'Size 10 US. Blue/White. Waterproof golf shoes.', 'Competitive price for new footwear.', '2025-01-01 00:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(7, 2, 1, 'Ping G425 Hybrid', 210.00, 200.00, 'Used', '22 degree hybrid, Alta Slate stiff shaft. Includes headcover.', 'Fair price for a used hybrid.', '2026-07-12 15:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(8, 2, 3, 'Wilson Staff Golf Bag', 150.00, 170.00, 'Refurbished', 'Restored stand bag. Zippers and dividers replaced.', 'Unique refurbished item. Great for budget golfers.', '2025-12-20 23:59:59', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(9, 2, 1, 'Mizuno JPX921 Irons', 600.00, 650.00, 'Used', 'Forged irons 5-GW. Professional feel and control.', 'Underpriced professional set.', '2026-06-30 20:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59'),
(10, 2, 1, 'Cleveland RTX ZipCore', 130.00, 140.00, 'Like New', '56 degree wedge, used for 5 rounds only. Maximum spin.', 'High-end wedge in near perfect condition.', '2026-05-15 10:00:00', '2026-01-15 03:37:59', '2026-01-15 03:37:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_14_002308_create_categories_table', 1),
(5, '2026_01_14_002319_create_listings_table', 1),
(6, '2026_01_14_011112_create_personal_access_tokens_table', 2),
(7, '2026_01_14_031415_add_ai_fields_to_listings_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '3f485c5f7bdcdf9bbd53819a4bdcbdb4644cea1ed7d758bb3d32c3174a6a9180', '[\"*\"]', NULL, NULL, '2026-01-14 16:37:39', '2026-01-14 16:37:39'),
(2, 'App\\Models\\User', 2, 'auth_token', 'e381b4c885c468054b9d0cc9d0feb581af85bf11224959e624f4950423c46360', '[\"*\"]', '2026-01-15 05:50:33', NULL, '2026-01-14 17:04:03', '2026-01-15 05:50:33'),
(3, 'App\\Models\\User', 2, 'auth_token', 'cb3f1247060c4ba35483aadd397202abc9bfb6e48f9b7bedbe3eca587a09a108', '[\"*\"]', NULL, NULL, '2026-01-15 06:59:56', '2026-01-15 06:59:56'),
(4, 'App\\Models\\User', 2, 'auth_token', '13a2e51a87482b74f273fa8590bcc6afa93ec56ba38eae8484f50a6bf7f99b33', '[\"*\"]', NULL, NULL, '2026-01-15 07:03:44', '2026-01-15 07:03:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8sPitpZ4XxtZBr5t7CRhrodGz4NKOeyWG7dcOLex', NULL, '127.0.0.1', 'PostmanRuntime/7.51.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXdudXN0SDI1bkZZZjlnZ2djSGh2cEpqTEFVb0xrczhJbFUwMmcyNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768394173),
('kztBK3pcj78ZTCD3vnyUHaj8NH3EamEtmUIR1BHv', NULL, '127.0.0.1', 'PostmanRuntime/7.51.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWtEdk95QThnZ2hySGR3V3NnQko5M0o2VmlyU0hBTEZ4V3BwaVh1ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1768440325);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'User', 'test@example.com', '2026-01-14 04:59:18', '$2y$12$nCl8DTFOiJ0NLefCbEstpuWwwnnwR/agYTuJDF.KkX/bKeUxPlLeW', 'Vdufcu1g6d', '2026-01-14 04:59:18', '2026-01-14 04:59:18'),
(2, 'Majo', 'Golf', 'majo@example.com', NULL, '$2y$12$msro2dX8MGF1wgvlHfF1ge0xwCERnO/nCiKHJaa6zenMWl8MNn7N.', NULL, '2026-01-14 07:39:33', '2026-01-14 07:39:33'),
(4, 'Majo', 'Golf', 'marijo@example.com', NULL, '$2y$12$Q6UpgtWI3xTcg5sxpPOLfuv88XjoHSCxnc7TUaJfj7OXyjAfe1CR6', NULL, '2026-01-14 08:37:28', '2026-01-14 08:37:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listings_user_id_foreign` (`user_id`),
  ADD KEY `listings_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `listings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `listings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
