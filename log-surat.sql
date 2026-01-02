-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 07:33 AM
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
-- Database: `log-surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`id_departement`, `nama`, `kode`) VALUES
(3, 'Admin', 'ADM'),
(4, 'Logistik', 'LOG'),
(5, 'Finance', 'FIN'),
(6, 'Mine Plan Engineering', 'MPE'),
(7, 'Planning', 'PLN'),
(8, 'Shipping & QC', 'SHP');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jenissurat`
--

CREATE TABLE `jenissurat` (
  `id_jenissurat` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenissurat`
--

INSERT INTO `jenissurat` (`id_jenissurat`, `nama`, `kode`) VALUES
(1, 'Surat Kuasa', 'SK'),
(2, 'Nota Usulan', 'NOSUL'),
(3, 'Berita Acara Serah Terima', 'BAST'),
(4, 'Sertifikat', 'SRT'),
(5, 'Letter In', 'LI'),
(6, 'Letter Out', 'LO'),
(8, 'Purchase Order', 'PO'),
(9, 'Work Order', 'WO');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_11_20_074258_create_surat_masuks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuks`
--

CREATE TABLE `surat_masuks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_surat` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `pengirim` varchar(255) NOT NULL,
  `penerima` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_jenissurat` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surat_masuks`
--

INSERT INTO `surat_masuks` (`id`, `nomor_surat`, `tanggal_surat`, `tujuan`, `pengirim`, `penerima`, `perihal`, `id_departement`, `id_jenissurat`, `keterangan`, `file`, `created_at`, `updated_at`) VALUES
(1, '001/GAM/ADM/SK/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'gvshd', '1764565641_nailong.jpg', '2025-11-30 22:07:21', '2025-11-30 22:07:21'),
(2, '002/GAM/ADM/SK/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vyvghjb', NULL, '2025-11-30 22:07:41', '2025-11-30 22:29:45'),
(3, '001/GAM/LOG/NOSUL/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 4, 2, 'cybh', '1764565722_nailong.jpg', '2025-11-30 22:08:42', '2025-11-30 22:08:42'),
(4, '002/GAM/LOG/NOSUL/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 4, 2, 'dxtcv', NULL, '2025-11-30 22:10:31', '2025-11-30 22:12:44'),
(5, '003/GAM/LOG/NOSUL/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 4, 2, 'gvhb', '1764565945_nailong.jpg', '2025-11-30 22:12:25', '2025-11-30 22:12:25'),
(6, '001/GAM/PLN/LI/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 7, 5, 'cghbji', '1764566716_nailong.jpg', '2025-11-30 22:25:16', '2025-11-30 22:25:16'),
(7, '003/GAM/ADM/SK/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vyvghjbhbh', NULL, '2025-11-30 22:31:54', '2025-11-30 22:35:01'),
(8, '004/GAM/ADM/SK/XII/2025', '2025-12-01', 'yuhbjn', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vyvghjbhbh', NULL, '2025-11-30 22:35:17', '2025-11-30 22:35:17'),
(9, '001/GAM/FIN/SK/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 5, 1, NULL, NULL, '2025-11-30 22:39:40', '2025-11-30 22:39:40'),
(10, '005/GAM-ADM/SK/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-11-30 23:23:59', '2025-11-30 23:23:59'),
(11, '001/GAM-ADM/PO/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, 'uhnjk', NULL, '2025-12-01 00:34:06', '2025-12-01 00:34:06'),
(12, '006.SK/GAM-ADM/XII/2025', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-12-01 00:58:09', '2025-12-01 00:58:09'),
(13, '007.SK/GAM-ADM/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'jb', '1764575908_nailong.jpg', '2025-12-01 00:58:28', '2025-12-01 00:58:28'),
(14, 'GAM-PO/2025/ADM/XII/002', '2025-12-01', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, NULL, NULL, '2025-12-01 00:58:59', '2025-12-01 00:58:59'),
(15, 'GAM-WO/2025/ADM/XII/001', '2025-12-15', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 9, 'b hbbj', '1764575976_nailong.jpg', '2025-12-01 00:59:36', '2025-12-01 00:59:36'),
(16, '008.SK/GAM-ADM/XII/2025', '2025-12-02', 'hsbdbhj', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vgbhnj', '1764635043_nailong.jpg', '2025-12-01 17:24:03', '2025-12-01 17:24:03'),
(18, '009.SK/GAM-ADM/XII/2025', '2026-01-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vhb', NULL, '2025-12-01 17:34:10', '2025-12-01 17:34:10'),
(20, 'GAM-PO/2025/ADM/XII/001', '2025-12-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, NULL, NULL, '2025-12-01 17:59:54', '2025-12-01 17:59:54'),
(23, '010.SK/GAM-ADM/XII/2025', '2025-12-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-12-01 18:08:17', '2025-12-01 18:08:17'),
(24, '011.SK/GAM-ADM/XII/2025', '2025-12-08', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'bhnji', '1764652288_nailong.jpg', '2025-12-01 18:08:28', '2025-12-01 22:11:28'),
(28, 'GAM-PO/2025/ADM/XII/003', '2025-12-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, NULL, NULL, '2025-12-01 22:21:43', '2025-12-01 22:21:43'),
(29, 'GAM-PO/2025/ADM/XII/004', '2025-12-02', 'kmnkl', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, NULL, NULL, '2025-12-01 22:22:05', '2025-12-02 00:29:28'),
(33, '004/GAM-LOG/NOSUL/XII/2025', '2025-12-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 4, 2, NULL, NULL, '2025-12-01 22:34:04', '2025-12-01 22:34:04'),
(34, '012.SK/GAM-ADM/XII/2025', '2024-01-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-12-01 22:42:14', '2025-12-01 22:42:14'),
(35, '013.SK/GAM-ADM/XII/2025', '2025-12-02', 'dsada', 'svdbh', 'DFTGYHUJ', 'gvshd', 3, 1, 'fcygvhbj', '1764655049_nailong.jpg', '2025-12-01 22:57:29', '2025-12-01 22:57:38'),
(36, 'GAM-PO/2025/ADM/XII/005', '2025-12-02', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, 'CVGHB', '1764655101_nailong.jpg', '2025-12-01 22:58:21', '2025-12-01 22:58:21'),
(37, '001/GAM-ADM/BAST/XII/2025', '2025-12-03', 'dsada', 'svdbh', 'gsvdhsd', 'gvshd', 3, 3, 'DXCGV', NULL, '2025-12-01 23:16:00', '2025-12-01 23:16:00'),
(38, '002/GAM-ADM/BAST/XII/2025', '2025-12-01', 'penting', 'penting', 'aubdb', 'penting', 3, 3, 'penting', NULL, '2025-12-01 23:17:05', '2025-12-01 23:17:05'),
(42, '014.SK/GAM-ADM/XII/2025', '2025-12-03', 'kmnkl', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-12-02 17:47:43', '2025-12-02 17:47:43'),
(43, '015.SK/GAM-ADM/XII/2025', '2025-12-04', 'kmnkl', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, NULL, NULL, '2025-12-02 18:29:01', '2025-12-02 18:29:01'),
(44, '016.SK/GAM-ADM/XII/2025', '2025-12-04', 'kmnkl', 'svdbh', 'gsvdhsd', 'gvshd', 3, 1, 'vghbj', '1764725355_nailong.jpg', '2025-12-02 18:29:15', '2025-12-02 18:29:15'),
(45, 'GAM-PO/2025/ADM/XII/006', '2025-12-03', 'kmnkl', 'svdbh', 'gsvdhsd', 'gvshd', 3, 8, NULL, '1764730160_nailong.jpg', '2025-12-02 19:49:20', '2025-12-02 19:49:20'),
(46, '001/GAM-ADM/NOSUL/XII/2025', '2025-12-03', 'wgshba', 'sg saha', 'ghaxbns', 'ghvabn', 3, 2, NULL, NULL, '2025-12-02 21:53:05', '2025-12-02 21:53:05'),
(48, '017.SK/GAM-ADM/XII/2025', '2025-12-03', 'kmnkl', 'svdbh', 'gsvdhsdB NJBJ', 'gvshd', 3, 1, 'yvbh', '1764737753_nailong.jpg', '2025-12-02 21:55:53', '2025-12-02 21:58:10'),
(50, '001.SK/GAM-ADM/I/2027', '2027-01-06', 'kmnkl', 'svdbh', 'gsvdhsdXTCFGVHBJ', 'gvshd', 3, 1, 'XHAJSBN', '1764737801_nailong.jpg', '2025-12-02 21:56:22', '2025-12-02 21:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_departement`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jenissurat`
--
ALTER TABLE `jenissurat`
  ADD PRIMARY KEY (`id_jenissurat`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `surat_masuks`
--
ALTER TABLE `surat_masuks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `surat_masuks_nomor_surat_unique` (`nomor_surat`),
  ADD KEY `id_departement` (`id_departement`,`id_jenissurat`);

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
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenissurat`
--
ALTER TABLE `jenissurat`
  MODIFY `id_jenissurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_masuks`
--
ALTER TABLE `surat_masuks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
