-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2024 at 11:26 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 02:14:32', 1),
(2, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 02:23:17', 1),
(3, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 03:14:21', 1),
(4, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 03:59:06', 1),
(5, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 04:00:37', 1),
(6, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 04:02:42', 1),
(7, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 10:20:12', 1),
(8, '::1', 'superadmin', NULL, '2024-05-21 12:22:24', 0),
(9, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 12:22:33', 1),
(10, '::1', 'adminsuper@gmail.com', 1, '2024-05-21 15:21:36', 1),
(11, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 00:30:31', 1),
(12, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 06:50:52', 1),
(13, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 07:58:08', 1),
(14, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 12:07:53', 1),
(15, '::1', 'adminsuper@gmail.com', NULL, '2024-05-22 18:53:42', 0),
(16, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 18:54:53', 1),
(17, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 19:00:48', 1),
(18, '::1', 'adminsuper@gmail.com', NULL, '2024-05-22 19:41:25', 0),
(19, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 19:41:34', 1),
(20, '::1', 'adminsuper@gmail.com', 1, '2024-05-22 19:47:45', 1),
(21, '::1', 'adminsuper@gmail.com', 1, '2024-05-23 17:23:55', 1),
(22, '::1', 'adminsuper@gmail.com', 1, '2024-05-26 11:08:03', 1),
(23, '::1', 'adminsuper@gmail.com', NULL, '2024-09-18 05:30:35', 0),
(24, '::1', 'adminsuper@gmail.com', 1, '2024-09-18 05:30:45', 1),
(25, '::1', 'adminsuper@gmail.com', 1, '2024-09-18 20:43:02', 1),
(26, '::1', 'adminsuper@gmail.com', 1, '2024-09-20 16:35:45', 1),
(27, '::1', 'adminsuper@gmail.com', 1, '2024-09-20 16:39:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1716148778, 1),
(2, '2023-08-18-000001', 'App\\Database\\Migrations\\CreateJurusanTable', 'default', 'App', 1716148778, 1),
(3, '2023-08-18-000002', 'App\\Database\\Migrations\\CreateKelasTable', 'default', 'App', 1716148778, 1),
(4, '2023-08-18-000003', 'App\\Database\\Migrations\\CreateDB', 'default', 'App', 1716148779, 1),
(5, '2023-08-18-000004', 'App\\Database\\Migrations\\AddSuperadmin', 'default', 'App', 1716148779, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nuptk` varchar(24) NOT NULL,
  `nama_guru` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id` int(11) UNSIGNED NOT NULL,
  `jurusan` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id`, `jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'D4 Teknik Informatika', '2024-09-17 22:36:54', '2024-09-17 22:36:54', NULL),
(7, 'D3 Teknik Informatika', '2024-09-17 22:54:27', '2024-09-17 22:54:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_kehadiran`
--

CREATE TABLE `tb_kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `kehadiran` enum('Hadir','Sakit','Izin','Tanpa keterangan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kehadiran`
--

INSERT INTO `tb_kehadiran` (`id_kehadiran`, `kehadiran`) VALUES
(1, 'Hadir'),
(2, 'Sakit'),
(3, 'Izin'),
(4, 'Tanpa keterangan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `kelas` varchar(32) NOT NULL,
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `kelas`, `id_jurusan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, '4', 6, '2024-09-17 22:38:10', '2024-09-17 22:38:10', NULL),
(14, '3', 7, '2024-09-17 22:38:26', '2024-09-17 22:38:26', NULL),
(15, 'D4TI4C', 6, '2024-09-17 22:38:37', '2024-09-17 22:38:37', '2024-09-18 14:36:27'),
(16, 'D3TI3C', 7, '2024-09-17 22:54:41', '2024-09-17 22:54:41', '2024-09-18 14:36:31');

-- --------------------------------------------------------

--
-- Table structure for table `tb_presensi_guru`
--

CREATE TABLE `tb_presensi_guru` (
  `id_presensi` int(11) NOT NULL,
  `id_guru` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_presensi_siswa`
--

CREATE TABLE `tb_presensi_siswa` (
  `id_presensi` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_kelas` int(11) UNSIGNED DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `id_kehadiran` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(16) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(32) NOT NULL,
  `unique_code` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `id_kelas`, `jenis_kelamin`, `no_hp`, `unique_code`) VALUES
(6, '714222072', 'Bernadus Billy Riantono', 13, 'Laki-laki', '44444', '9c413c42c8fee0420ad991e0c5e2c1bf02a13eab0b218f645a846a7bee99e5bb'),
(7, '714222073', 'Ardini Yuanita Lubis', 13, 'Perempuan', '44444', 'ef0095250d54c78e8435d731addaed7547dd1fc735382212797e3b755dd84a96'),
(8, '1174004', 'Choirul Anam', 13, 'Laki-laki', '44444', '268caeb201460add0f01a99489e91c13df9788ecbc171e91185bb2ad691b36ef'),
(9, '1204061', 'Nur Tri Ramadhanti Adiningrum', 13, 'Perempuan', '44444', '0f7aa6b1fc0dfbfde761ff73cc8b6c0db08a4cb397460fa546b164c431842cb2'),
(10, '1204004', 'Jose Chasey Pratama', 13, 'Laki-laki', '44444', '00a40c8965cbfb6a4e63e9aebc1ae1b1e3a290b34ea00bf9a4301c36c177c60c'),
(11, '1204045', 'Muhammad Rifqi Daffa Ulhaq', 13, 'Laki-laki', '44444', '24072a05334820681f63340b14cbf648560db8044f8d4bc2449e2ba0284c802c'),
(12, '1204077', 'Bachtiar Ramadhan', 13, 'Laki-laki', '44444', '98d05cbfc3fa86580f805dfa6cebd188dc178d3a03be055a0b25adee0272bb6f'),
(13, '1204049', 'Zian Asti Dwiyanti', 13, 'Perempuan', '44444', '916bc5b08590806f8bb5ec73fb29c4031c61472f399daf84c1bd403dc27c876b'),
(14, '1204039', 'Muammar Alfien Zaidan', 13, 'Laki-laki', '44444', '26f050adc80867028f4309f29508a7249a0247ff55ae699b593b6bdb480b7481'),
(15, '1204063', 'Algies Rifkha Fadillah', 13, 'Perempuan', '44444', 'd2dd642c0aa23584bc2d15f5a0e9b0de5b32cbe292f5dd0f223c9b027ab5cb87'),
(16, '1204053', 'Resa Rianti', 13, 'Laki-laki', '44444', 'df101c1ac06424924a05a282f09a67d81924d859b64d5fbbafcf604e55b0e9d1'),
(17, '1204036', 'Nawaf Naofal', 13, 'Laki-laki', '44444', '046f39d96ad42f51d880ef7597653a5a625cff738d39b10e6fb248b256f047da'),
(18, '1204025', 'Christian Yuda Pratama', 13, 'Laki-laki', '44444', '70d4e6b61fd2f5406d71dbd80dad3ad7316a9bb16e0f4efa195713a6c688cf56'),
(19, '1204011', 'Wildan Azril Arvany', 13, 'Laki-laki', '44444', '91058a3224b2329c0255cb0d6b8bd58f8ffea795615e2634a7fd11629978f34c'),
(20, '1204022', 'Hanan Destiarin Kishendrian', 13, 'Perempuan', '44444', 'e5d9d75f13326a2459c1b080d8c4d7d1c0a5c1d108bb0583bd766a0ffae42135'),
(21, '1204068', 'Hasna Zahidah', 13, 'Perempuan', '44444', '5f8347fb539a30a829af394b8e702a79aa549b488db20e910857f29065ab8628'),
(22, '1204021', 'Mayke Andani Rohmaniar', 13, 'Perempuan', '44444', 'a859b22fba2fb9b1e2b528998b337278a8c1f6031f99999c3ace00dcd126bc52'),
(23, '1204029', 'Fadil Febriansyah', 13, 'Laki-laki', '44444', '5435302ecd27aae7670e8799df6ebb891b1b98d5ec634bb1a28f8f3cc9b5d99c'),
(24, '1204060', 'Valen Rionald', 13, 'Laki-laki', '44444', 'e2ed38fc7b0d06dc987cbabb85fe9d9e0fa5493b9699b9a7d213635a024b4414'),
(25, '1204071', 'Guna Dharma', 13, 'Laki-laki', '44444', 'a0c547520ae7661799d3ed69f2358b5f7aaf7a8b25aaf601c2473306de62b75d'),
(26, '1204007', 'Wulan Nur Annisah', 13, 'Perempuan', '44444', '9c5aaa4543ffb6eaef6f6cd83ae242b20ff4c15236cb422d1c39ccbc807b6bba'),
(27, '1204044', 'Fahira', 13, 'Perempuan', '44444', '00bd909f8afbd45ecd19f217da2b91998b9553b406e76638b2903b6c0e1d4b74'),
(28, '1204003', 'Kholida Magfirah', 13, 'Perempuan', '44444', '15ae23c0f78e6119fcd878f21d3887aa7484c9b1ef0c844c48ada64badf53c36'),
(29, '1204076', 'Rifqi Fathurrohman', 13, 'Laki-laki', '44444', '15aaee71d8d84b74903252320ed9e52c034fa63672f4fac1129d8a225820d705'),
(30, '1204057', 'Zidan Alamsyah Amir', 13, 'Laki-laki', '44444', '88992c99a69bfb5b23c57f9ba1f714a0f15c5e4e7e684b767f4ce3d5c1b71695'),
(32, '1204026', 'Haryadi Yusuf', 13, 'Perempuan', '44444', '74e769268b62d1f7881b258fb51d03df76e9a9352c047c089e7b8cb97758df9c'),
(33, '1204062', 'Argya Rijal Rafi', 13, 'Laki-laki', '44444', 'b8fbd573b42f9eaa86644ab88c35f9184da3f20c5b163e319747571436037fb5'),
(34, '1204056', 'Rakasona', 13, 'Laki-laki', '44444', '25c946533e23a251694cd8d4cbdf64ae79a7646d9b454d0a7ee5a4d5aa2ad90c'),
(35, '1204037', 'Muhammad Sapwan Suhadi', 13, 'Laki-laki', '44444', '0e5abb85e1f57d759cbb0de9db13ab3d44e9ce499d3764ff2a644eefbaf7e84f'),
(36, '1204013', 'Fauziah Henni Hasibuan', 13, 'Perempuan', '44444', 'fcf2964a7c3bf1fa6bc377155cbee558591f29aa98296397dceac27f1f58a11a'),
(37, '1194002', 'Ahmad Fathoni Rizaldi', 13, 'Laki-laki', '44444', '740b551f188e74bea249f2aa6317d8e55ac60d4b7290c0efdb1d108fb66b1a4b'),
(38, '1194063', 'Rachmatika Intan Sari', 13, 'Perempuan', '44444', 'be32c096423f994761690aef908d2cdac345eb562139ba49ad42d8bf0cf4c953'),
(39, '1204027', 'Mustika Tiara Triani Br.Sirait', 13, 'Perempuan', '44444', '56b8cc2acb51a99d9e5874a4e67097ddd584ea50c7d08b276ce1237a41a324ac'),
(40, '1184036', 'Muchamad Innal Kariem', 13, 'Laki-laki', '44444', '482fc67852c04a37244301b4a2baa82b0e3d8759b90467b1a1456c96c975ee10'),
(41, '1194042', 'Danang Ari Subarkah', 13, 'Laki-laki', '44444', 'e424bea49685748a5e80041e874614efb995cb99816bf956c9089c8535d5cd62'),
(42, '1204017', 'Surahmat', 13, 'Laki-laki', '44444', '9ef5f6a814bb5c1001c0c0198aa5844bcb769013391d60985aea36d9147e1bc8'),
(43, '1194045', 'Fahriza Rizky Amalia', 13, 'Perempuan', '44444', 'bc6a01f4c9df3397c41162b40b6b07c7b2b8475820f45419387f12dc904de7cb'),
(44, '1204014', 'Anita Alfi Syahra', 13, 'Perempuan', '44444', 'd168b6865c792971325bd7cc74129a030e09b5f87e9df6bf3e19f87983051887'),
(45, '1174047', 'Salwaa Tania', 13, 'Perempuan', '44444', '5c5188d77ce5de8fc9ca8b6fa33f37427e29f5e459bfa59cebe333ba1cf35943'),
(46, '1204075', 'Fathur Abdul Halim', 13, 'Laki-laki', '44444', '770f902e37b43504d80aec8724af713d9336e0c341fbcbea742d213584afb503'),
(47, '1194046', 'Ilham Ambar Rochmat', 13, 'Laki-laki', '44444', 'a4f6b0aea76c451e6e112f4994aadb66fc2d92c1e85f07e2dce9f71ed6b81c51'),
(48, '1174025', 'Dezha Aidil Martha', 13, 'Laki-laki', '44444', '8949300f726f4748fac1b72446c6f9cda57a39d44117eaee0c657e7ffc906e42'),
(49, '1213016', 'Raden Raihan Ramadhan', 14, 'Laki-laki', '33333', 'bff7e054eaa2ab8cb81fbe384a1f4c857c403046f9971a6ac8b8155289308d95'),
(50, '1213001', 'Reza Febriansyah Adnan', 14, 'Laki-laki', '33333', '840de4de2e4cf83c346bb6aecb47bc6be7238de26e521e2d3b807477fd7aa528');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `is_superadmin` tinyint(1) NOT NULL DEFAULT 0,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `is_superadmin`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'adminsuper@gmail.com', 'superadmin', 1, '$2y$10$rRuDTgGtiAWRJRioVQFVTeqzJxbfgwAf/IKkLH.gRi4o3rgL1yWbC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD UNIQUE KEY `unique_code` (`unique_code`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jurusan` (`jurusan`);

--
-- Indexes for table `tb_kehadiran`
--
ALTER TABLE `tb_kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `tb_kelas_id_jurusan_foreign` (`id_jurusan`);

--
-- Indexes for table `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_kehadiran` (`id_kehadiran`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indexes for table `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_kehadiran` (`id_kehadiran`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `unique_code` (`unique_code`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_kehadiran`
--
ALTER TABLE `tb_kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD CONSTRAINT `tb_kelas_id_jurusan_foreign` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tb_presensi_guru`
--
ALTER TABLE `tb_presensi_guru`
  ADD CONSTRAINT `tb_presensi_guru_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  ADD CONSTRAINT `tb_presensi_guru_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE SET NULL;

--
-- Constraints for table `tb_presensi_siswa`
--
ALTER TABLE `tb_presensi_siswa`
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_2` FOREIGN KEY (`id_kehadiran`) REFERENCES `tb_kehadiran` (`id_kehadiran`),
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_presensi_siswa_ibfk_4` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
