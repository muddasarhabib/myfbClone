-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2021 at 06:20 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook_vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `covers`
--

CREATE TABLE `covers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cover_photo` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `covers`
--

INSERT INTO `covers` (`id`, `user_id`, `cover_photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'male_cover.jpg', 1, '2021-03-21 08:43:00', '2021-03-21 08:43:00'),
(2, 3, 'male_cover.jpg', 1, '2021-03-21 09:04:46', '2021-03-21 09:04:46'),
(3, 4, 'female_cover.jpg', 1, '2021-03-21 09:06:16', '2021-03-21 09:06:16'),
(4, 5, 'female_cover.jpg', 1, '2021-03-21 09:08:34', '2021-03-21 09:08:34'),
(5, 6, 'male_cover.jpg', 1, '2021-03-21 09:12:36', '2021-03-21 09:12:36'),
(6, 7, 'female_cover.jpg', 1, '2021-03-21 09:15:44', '2021-03-21 09:15:44'),
(7, 8, 'female_cover.jpg', 1, '2021-03-21 09:17:03', '2021-03-21 09:17:03'),
(8, 9, 'female_cover.jpg', 1, '2021-03-21 09:18:32', '2021-03-21 09:18:32'),
(9, 10, 'male_cover.jpg', 1, '2021-03-25 17:52:12', '2021-03-25 17:52:12'),
(10, 11, 'male_cover.jpg', 1, '2021-03-26 09:32:11', '2021-03-26 09:32:11'),
(11, 12, 'male_cover.jpg', 1, '2021-03-26 09:35:46', '2021-03-26 09:35:46'),
(12, 13, 'male_cover.jpg', 1, '2021-03-26 09:38:55', '2021-03-26 09:38:55'),
(13, 14, 'male_cover.jpg', 1, '2021-03-26 09:41:25', '2021-03-26 09:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `like_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'like',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`, `like_type`, `status`, `created_at`, `updated_at`) VALUES
(192, 145, 36, 'Haha', 'like', '2021-04-12 19:45:06', '2021-04-18 15:58:27'),
(193, 143, 36, 'Wow', 'like', '2021-04-13 18:16:15', '2021-04-18 15:58:36'),
(194, 146, 36, 'Like', 'like', '2021-04-13 18:28:35', '2021-04-26 15:15:35'),
(195, 146, 37, 'Love', 'like', '2021-04-13 18:29:18', '2021-04-13 18:29:18'),
(197, 140, 38, 'Like', 'like', '2021-04-13 18:44:41', '2021-04-13 18:45:45'),
(198, 147, 38, 'Like', 'like', '2021-04-13 18:45:35', '2021-04-13 18:45:36'),
(199, 140, 36, 'Love', 'like', '2021-04-13 18:46:20', '2021-05-19 20:20:57'),
(200, 146, 38, 'Wow', 'like', '2021-04-13 18:46:40', '2021-04-13 18:46:41'),
(201, 147, 36, 'Haha', 'like', '2021-04-14 09:32:30', '2021-04-22 14:17:47'),
(202, 144, 36, 'Love', 'like', '2021-04-14 16:38:23', '2021-04-14 16:38:23'),
(203, 148, 37, 'Like', 'unlike', '2021-04-14 21:53:17', '2021-04-18 10:59:46'),
(204, 139, 36, 'Like', 'like', '2021-04-16 12:41:56', '2021-04-18 20:20:10'),
(205, 148, 36, 'Love', 'like', '2021-04-16 19:24:20', '2021-04-18 14:41:54'),
(206, 145, 37, 'Wow', 'like', '2021-04-18 10:59:54', '2021-04-18 10:59:55'),
(207, 144, 37, 'Like', 'like', '2021-04-18 10:59:57', '2021-04-18 10:59:57'),
(208, 143, 37, 'Love', 'like', '2021-04-18 11:00:03', '2021-04-18 11:00:03'),
(209, 138, 36, 'Like', 'like', '2021-04-18 15:58:37', '2021-04-18 15:58:38'),
(210, 137, 36, 'Angry', 'like', '2021-04-18 15:58:39', '2021-04-24 18:58:32'),
(211, 153, 36, 'Like', 'like', '2021-04-18 20:34:11', '2021-04-25 19:55:21'),
(212, 154, 36, 'Wow', 'like', '2021-04-18 20:34:44', '2021-05-14 18:18:06'),
(213, 155, 36, 'Like', 'unlike', '2021-04-21 16:07:01', '2021-05-16 14:43:10'),
(214, 141, 38, 'Love', 'like', '2021-04-21 20:24:26', '2021-04-21 20:24:38'),
(215, 156, 40, 'Like', 'like', '2021-04-21 21:30:59', '2021-04-21 21:30:59'),
(216, 157, 40, 'Like', 'like', '2021-04-21 21:31:04', '2021-04-21 21:31:04'),
(217, 142, 36, 'Like', 'like', '2021-04-22 14:17:36', '2021-04-22 14:17:55'),
(218, 155, 41, 'Like', 'like', '2021-04-23 15:05:16', '2021-04-23 15:05:17'),
(219, 146, 40, 'Love', 'like', '2021-04-26 18:40:11', '2021-04-26 18:40:13'),
(220, 146, 41, 'Wow', 'like', '2021-04-26 18:48:50', '2021-04-26 18:48:52'),
(221, 139, 41, 'Like', 'like', '2021-04-26 18:50:02', '2021-04-26 18:50:02'),
(222, 140, 41, 'Like', 'like', '2021-04-26 18:50:03', '2021-04-26 18:50:03'),
(223, 158, 37, 'Haha', 'like', '2021-05-03 15:48:39', '2021-05-03 15:48:40'),
(224, 160, 36, 'Haha', 'like', '2021-05-03 15:49:37', '2021-05-19 20:15:57'),
(225, 159, 36, 'Thankful', 'like', '2021-05-03 15:55:41', '2021-05-16 14:43:05'),
(226, 158, 36, 'Like', 'like', '2021-05-19 20:16:21', '2021-05-19 20:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` longtext DEFAULT NULL,
  `post_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `post_type`, `created_at`, `updated_at`) VALUES
(137, 36, '', 'profile', '2021-04-12 19:36:43', '2021-04-12 19:36:43'),
(138, 36, '', 'cover', '2021-04-12 19:36:43', '2021-04-12 19:36:43'),
(139, 37, '', 'profile', '2021-04-12 19:37:14', '2021-04-12 19:37:14'),
(140, 37, '', 'cover', '2021-04-12 19:37:14', '2021-04-12 19:37:14'),
(141, 38, '', 'profile', '2021-04-12 19:37:49', '2021-04-12 19:37:49'),
(142, 38, '', 'cover', '2021-04-12 19:37:49', '2021-04-12 19:37:49'),
(143, 36, '', 'profile', '2021-04-12 19:44:01', '2021-04-12 19:44:01'),
(144, 36, '', 'cover', '2021-04-12 19:44:21', '2021-04-12 19:44:21'),
(145, 36, 'brothers', 'post', '2021-04-12 19:44:59', '2021-04-12 19:44:59'),
(146, 37, '', 'profile', '2021-04-12 19:56:30', '2021-04-12 19:56:30'),
(147, 38, '', 'profile', '2021-04-12 19:57:34', '2021-04-12 19:57:34'),
(148, 36, NULL, 'post', '2021-04-14 19:05:09', '2021-04-14 19:05:09'),
(149, 39, '', 'profile', '2021-04-18 10:35:05', '2021-04-18 10:35:05'),
(150, 39, '', 'cover', '2021-04-18 10:35:06', '2021-04-18 10:35:06'),
(151, 40, '', 'profile', '2021-04-18 10:35:58', '2021-04-18 10:35:58'),
(152, 40, '', 'cover', '2021-04-18 10:35:58', '2021-04-18 10:35:58'),
(153, 36, '', 'cover', '2021-04-18 20:34:01', '2021-04-18 20:34:01'),
(154, 36, NULL, 'post', '2021-04-18 20:34:27', '2021-04-18 20:34:27'),
(155, 36, '', 'cover', '2021-04-21 15:29:08', '2021-04-21 15:29:08'),
(156, 41, '', 'profile', '2021-04-21 20:34:57', '2021-04-21 20:34:57'),
(157, 41, '', 'cover', '2021-04-21 20:34:57', '2021-04-21 20:34:57'),
(158, 37, 'ccc', 'post', '2021-05-03 15:48:24', '2021-05-03 15:48:24'),
(159, 36, 'cc', 'post', '2021-05-03 15:49:09', '2021-05-03 15:49:09'),
(160, 36, 'cccccc', 'post', '2021-05-03 15:49:28', '2021-05-03 15:49:28'),
(161, 42, '', 'profile', '2021-05-03 16:27:11', '2021-05-03 16:27:11'),
(162, 42, '', 'cover', '2021-05-03 16:27:12', '2021-05-03 16:27:12'),
(163, 36, 'Hello', 'post', '2021-05-19 20:22:03', '2021-05-19 20:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `posts_files`
--

CREATE TABLE `posts_files` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file` longtext DEFAULT NULL,
  `file_type` varchar(255) NOT NULL,
  `post_type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts_files`
--

INSERT INTO `posts_files` (`id`, `post_id`, `user_id`, `file`, `file_type`, `post_type`, `status`, `created_at`, `updated_at`) VALUES
(101, 137, 36, 'male_profile.png', 'image', 'profile', 0, '2021-04-12 19:36:43', '2021-04-12 19:36:43'),
(102, 138, 36, 'male_cover.jpg', 'image', 'cover', 0, '2021-04-12 19:36:43', '2021-04-12 19:36:43'),
(103, 139, 37, 'female_profile.jpg', 'image', 'profile', 0, '2021-04-12 19:37:14', '2021-04-12 19:37:14'),
(104, 140, 37, 'female_cover.jpg', 'image', 'cover', 0, '2021-04-12 19:37:14', '2021-04-12 19:37:14'),
(105, 141, 38, 'female_profile.jpg', 'image', 'profile', 0, '2021-04-12 19:37:49', '2021-04-12 19:37:49'),
(106, 142, 38, 'female_cover.jpg', 'image', 'cover', 0, '2021-04-12 19:37:49', '2021-04-12 19:37:49'),
(107, 143, 36, '221080.jpg', 'image', 'profile', 1, '2021-04-12 19:44:04', '2021-04-12 19:44:04'),
(108, 144, 36, '845430.jpg', 'image', 'cover', 1, '2021-04-12 19:44:21', '2021-04-12 19:44:21'),
(109, 145, 36, '561753.jpg', 'image', 'post', 1, '2021-04-12 19:45:00', '2021-04-12 19:45:00'),
(110, 146, 37, '960102.jpg', 'image', 'profile', 1, '2021-04-12 19:56:31', '2021-04-12 19:56:31'),
(111, 147, 38, '238310.jpg', 'image', 'profile', 1, '2021-04-12 19:57:34', '2021-04-12 19:57:34'),
(112, 148, 36, '44628.webm', 'video', 'post', 1, '2021-04-14 19:05:25', '2021-04-14 19:05:25'),
(113, 149, 39, 'male_profile.png', 'image', 'profile', 0, '2021-04-18 10:35:06', '2021-04-18 10:35:06'),
(114, 150, 39, 'male_cover.jpg', 'image', 'cover', 0, '2021-04-18 10:35:06', '2021-04-18 10:35:06'),
(115, 151, 40, 'male_profile.png', 'image', 'profile', 0, '2021-04-18 10:35:58', '2021-04-18 10:35:58'),
(116, 152, 40, 'male_cover.jpg', 'image', 'cover', 0, '2021-04-18 10:35:58', '2021-04-18 10:35:58'),
(117, 153, 36, '160840.jpg', 'image', 'cover', 1, '2021-04-18 20:34:03', '2021-04-18 20:34:03'),
(118, 154, 36, '467725.jpg', 'image', 'post', 1, '2021-04-18 20:34:31', '2021-04-18 20:34:31'),
(119, 155, 36, '468244.jpg', 'image', 'cover', 1, '2021-04-21 15:29:12', '2021-04-21 15:29:12'),
(120, 156, 41, 'male_profile.png', 'image', 'profile', 0, '2021-04-21 20:34:57', '2021-04-21 20:34:57'),
(121, 157, 41, 'male_cover.jpg', 'image', 'cover', 0, '2021-04-21 20:34:57', '2021-04-21 20:34:57'),
(122, 161, 42, 'male_profile.png', 'image', 'profile', 0, '2021-05-03 16:27:11', '2021-05-03 16:27:11'),
(123, 162, 42, 'male_cover.jpg', 'image', 'cover', 0, '2021-05-03 16:27:12', '2021-05-03 16:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `profile_pic`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'male_profile.png', 2, 1, '2021-03-21 08:43:00', '2021-03-21 08:43:00'),
(2, 'male_profile.png', 3, 1, '2021-03-21 09:04:45', '2021-03-21 09:04:45'),
(3, 'female_profile.jpg', 4, 1, '2021-03-21 09:06:16', '2021-03-21 09:06:16'),
(4, 'female_profile.jpg', 5, 1, '2021-03-21 09:08:34', '2021-03-21 09:08:34'),
(5, 'male_profile.png', 6, 1, '2021-03-21 09:12:36', '2021-03-21 09:12:36'),
(6, 'female_profile.jpg', 7, 1, '2021-03-21 09:15:43', '2021-03-21 09:15:43'),
(7, 'female_profile.jpg', 8, 1, '2021-03-21 09:17:03', '2021-03-21 09:17:03'),
(8, 'female_profile.jpg', 9, 1, '2021-03-21 09:18:32', '2021-03-21 09:18:32'),
(9, 'male_profile.png', 10, 1, '2021-03-25 17:52:10', '2021-03-25 17:52:10'),
(10, 'male_profile.png', 11, 1, '2021-03-26 09:32:10', '2021-03-26 09:32:10'),
(11, 'male_profile.png', 12, 1, '2021-03-26 09:35:46', '2021-03-26 09:35:46'),
(12, 'male_profile.png', 13, 1, '2021-03-26 09:38:55', '2021-03-26 09:38:55'),
(13, 'male_profile.png', 14, 1, '2021-03-26 09:41:25', '2021-03-26 09:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_birth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `sname`, `date_birth`, `email`, `gender`, `email_verified_at`, `password`, `api_token`, `remember_token`, `status`, `device_token`, `created_at`, `updated_at`) VALUES
(36, 'Muddasar', 'habib', '2021-04-11', 'muddasar.habib15@gmail.com', 'male', NULL, '$2y$10$oxs4knEqheLq4XZi5du/CO6vFV/ulwdYtA40.I8hTdYH5/gPyoCrC', 'kEb51MdhrIlk', NULL, 1, NULL, '2021-04-12 14:36:42', '2021-04-17 14:48:04'),
(37, 'Huma', 'Khan', '2021-04-04', 'huma@gmail.com', 'female', NULL, '$2y$10$PGsweM8JRrV2cmk.6Nf7juV11Im1.3tdoyWG0S3dhz2S6qLnLDHQK', 'wertyuiijmvcxaxcfg', NULL, 1, NULL, '2021-04-12 14:37:13', '2021-04-14 16:23:29'),
(38, 'Saba', 'Khan', '2021-04-11', 'saba@gmail.com', 'female', NULL, '$2y$10$fyuNUmsJ6q1.TSaYC0iicu.X0lB0aWGn3uLCgDd4Lk0/ea0LBVQUW', 'ertgvvbunnna', NULL, 1, NULL, '2021-04-12 14:37:49', '2021-04-13 13:46:30'),
(39, 'ali', 'khan', '2021-04-05', 'ali@gmail.com', 'male', NULL, '$2y$10$zclCkfiUlyBYvkrLSWyRXuRUkM5rJmxwYpb0I469gsWFWq2w3h8Jq', 'kEb51MdhrI', NULL, 1, NULL, '2021-04-18 05:35:05', '2021-04-18 05:35:05'),
(40, 'wahab', 'jutt', '2021-04-12', 'wahab@gmail.com', 'male', NULL, '$2y$10$9BvD09OS/TFjquSfzB3zw./VDs/k7BJL6rb4DLSEZQtl07Jz0b2.C', 'Yz0Aeli4d0', NULL, 1, NULL, '2021-04-18 05:35:58', '2021-04-18 05:35:58'),
(41, 'usama', 'sahi', '2021-04-12', 'rana@gmail.com', 'male', NULL, '$2y$10$OY9spj0Pz7kJhLUT0qjbjuurc3A07fbT8e/r1XtgBx5D0dU55GEyu', 'wa0C0vEhjH', NULL, 1, NULL, '2021-04-21 15:34:57', '2021-04-21 15:34:57'),
(42, 'usama', 'jaa', '2021-05-04', 'mudasar.habib15@gmail.com', 'male', NULL, '$2y$10$iaCfKNgQd02Uc9Pv9vMZ.uvEJ9BkK3djhOC1qIxcYm0mk3AT/tULe', 'PgakOCEM3V', NULL, 1, NULL, '2021-05-03 11:27:11', '2021-05-03 11:27:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `covers`
--
ALTER TABLE `covers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_files`
--
ALTER TABLE `posts_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `covers`
--
ALTER TABLE `covers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `posts_files`
--
ALTER TABLE `posts_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
