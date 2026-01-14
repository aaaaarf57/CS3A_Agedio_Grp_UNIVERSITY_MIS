-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 14, 2026 at 09:11 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u611601159_studentportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_summary`
--

CREATE TABLE `academic_summary` (
  `summary_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `current_gpa` decimal(4,2) DEFAULT NULL,
  `units_enrolled` int(11) DEFAULT NULL,
  `outstanding_balance` decimal(10,2) DEFAULT 0.00,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `academic_summary`
--

INSERT INTO `academic_summary` (`summary_id`, `student_id`, `current_gpa`, `units_enrolled`, `outstanding_balance`, `updated_at`) VALUES
(3, '202215230', 0.00, 0, 0.00, '2026-01-07 12:09:53'),
(4, '202313518', 0.00, 0, 0.00, '2026-01-07 12:09:53'),
(5, '202313537', 0.00, 0, 0.00, '2026-01-07 12:09:53'),
(6, '202313557', 0.00, 0, 0.00, '2026-01-07 12:09:53'),
(7, '202313768', 0.00, 0, 0.00, '2026-01-07 12:09:53'),
(11, '202313162', 0.00, 0, 0.00, '2026-01-08 01:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `academic_terms`
--

CREATE TABLE `academic_terms` (
  `id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_terms`
--

INSERT INTO `academic_terms` (`id`, `semester`, `school_year`, `is_active`) VALUES
(1, '1st Semester', '2025-2026', 1);

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `is_current` tinyint(1) DEFAULT 0,
  `current_semester` enum('1st Semester','2nd Semester') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `school_year`, `is_current`, `current_semester`) VALUES
(1, '2025-2026', 1, '1st Semester');

-- --------------------------------------------------------

--
-- Table structure for table `admin_accounts`
--

CREATE TABLE `admin_accounts` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_accounts`
--

INSERT INTO `admin_accounts` (`admin_id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Agedio27', '$2y$10$jW.jfOENgS0BJC3UEU60Wub3iq3nEAd5Z29WpaBTXI1jWIHV9i/02', 'admin', '2025-10-12 09:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `content` text NOT NULL,
  `status` enum('active','pending','archived') DEFAULT 'active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL,
  `announcement_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `type`, `color`, `content`, `status`, `created_by`, `created_at`, `image_path`, `announcement_date`, `start_date`, `end_date`) VALUES
(34, 'Semestral Break', '', NULL, 'Sem Break for A.Y. 2025-2026', 'active', NULL, '2026-01-06 21:18:32', 'https://cvsustudentportal.site/assets/Announcements/1767734312_White_Gray_and_Black_Cartoon_Illustrated_Study_Break_Time_Poster__2_.jpg', NULL, '2026-01-19', '2026-01-31'),
(36, 'Reporting Group 3 and 4', 'Suspension', NULL, 'Data Communication', 'active', NULL, '2026-01-08 04:32:01', 'https://cvsustudentportal.site/assets/Announcements/1767846721_1.png', NULL, '2026-01-09', '2026-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `billing_statements`
--

CREATE TABLE `billing_statements` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `description` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL CHECK (`amount` >= 0),
  `semester` varchar(50) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_statements`
--

INSERT INTO `billing_statements` (`id`, `student_id`, `description`, `amount`, `semester`, `school_year`, `created_at`) VALUES
(1, '202313235', 'Computer Lab Fee', 1200.00, '1st Semester', '2024-2025', '2026-01-06 08:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `program` varchar(100) NOT NULL,
  `year_level` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculum_id`, `subject_id`, `program`, `year_level`, `semester`) VALUES
(7, 14, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(8, 15, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(9, 11, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(10, 13, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(11, 16, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(12, 17, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(13, 12, 'Bachelor of Science in Computer Science', '3rd Year', '1st Semester'),
(14, 31, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(15, 39, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(16, 32, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(17, 34, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(19, 18, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(21, 47, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(22, 46, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(23, 68, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(24, 69, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(25, 48, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(26, 49, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(27, 50, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(28, 71, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(29, 51, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(30, 61, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(31, 52, 'Bachelor of Science in Computer Science', '1st Year', '2nd Semester'),
(32, 62, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(33, 63, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(34, 19, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(35, 38, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(36, 67, 'Bachelor of Science in Computer Science', '1st Year', '1st Semester'),
(37, 64, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(38, 65, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(39, 66, 'Bachelor of Science in Computer Science', '2nd Year', '2nd Semester'),
(40, 53, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(41, 70, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(42, 55, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(43, 56, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(44, 57, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(45, 58, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(46, 59, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(47, 60, 'Bachelor of Science in Computer Science', '2nd Year', '1st Semester'),
(49, 35, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(50, 33, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(51, 37, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(52, 40, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(53, 41, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(54, 42, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(55, 43, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(56, 44, 'Bachelor of Science in Computer Science', '3rd Year', '2nd Semester'),
(57, 20, 'Bachelor of Science in Computer Science', '4th Year', '1st Semester'),
(58, 21, 'Bachelor of Science in Computer Science', '4th Year', '1st Semester'),
(59, 22, 'Bachelor of Science in Computer Science', '4th Year', '1st Semester'),
(60, 23, 'Bachelor of Science in Computer Science', '4th Year', '1st Semester'),
(61, 24, 'Bachelor of Science in Computer Science', '4th Year', '1st Semester'),
(62, 25, 'Bachelor of Science in Computer Science', '4th Year', '2nd Semester'),
(63, 26, 'Bachelor of Science in Computer Science', '4th Year', '2nd Semester'),
(64, 27, 'Bachelor of Science in Computer Science', '4th Year', '2nd Semester');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `color` varchar(20) DEFAULT '#107C41',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `course_code` varchar(100) NOT NULL,
  `units` int(11) DEFAULT 0,
  `grade` decimal(3,2) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject_id`, `course_code`, `units`, `grade`, `semester`, `remarks`, `created_at`) VALUES
(1, '202313235', 1, 'MATH101', 3, 1.75, '1st Semester', 'Passed', '2025-10-17 07:18:40'),
(2, '202313235', 2, '', 0, 1.25, NULL, 'Passed', '2026-01-06 05:19:59'),
(3, '202313557', 2, '', 0, 1.25, NULL, 'Passed', '2026-01-06 21:47:33'),
(4, '202313768', 2, '', 0, 1.25, NULL, 'Passed', '2026-01-06 21:49:40'),
(5, '202313518', 2, '', 0, 1.25, NULL, 'Passed', '2026-01-06 21:50:55'),
(7, '202313537', 2, '', 0, 1.25, NULL, 'Passed', '2026-01-06 21:51:32'),
(8, '202215230', 8, '', 0, 1.00, NULL, 'Passed', '2026-01-06 23:11:56'),
(9, '202313537', 14, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:03:30'),
(10, '202313537', 15, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:03:43'),
(11, '202313537', 11, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:03:54'),
(12, '202313537', 13, '', 0, 2.25, NULL, 'Passed', '2026-01-07 05:04:04'),
(13, '202313537', 16, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:04:12'),
(14, '202313537', 17, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:04:26'),
(15, '202313537', 12, '', 0, 2.50, NULL, 'Passed', '2026-01-07 05:04:38'),
(16, '202313768', 14, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:06:43'),
(17, '202313768', 15, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:06:57'),
(18, '202313768', 11, '', 0, 3.00, NULL, 'Passed', '2026-01-07 05:07:10'),
(19, '202313768', 13, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:07:23'),
(20, '202313768', 16, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:07:34'),
(21, '202313768', 17, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:07:41'),
(22, '202313768', 12, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:07:50'),
(23, '202313518', 12, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:08:12'),
(24, '202313518', 17, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:08:20'),
(25, '202313518', 16, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:08:29'),
(26, '202313518', 13, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:08:38'),
(27, '202313518', 11, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:08:47'),
(28, '202313518', 15, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:08:59'),
(29, '202313518', 14, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:09:09'),
(30, '202313235', 12, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:12:56'),
(31, '202313235', 17, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:13:09'),
(32, '202313235', 16, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:13:19'),
(33, '202313235', 13, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:13:27'),
(34, '202313235', 11, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:13:36'),
(35, '202313235', 15, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:13:45'),
(36, '202313235', 14, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:13:53'),
(37, '202313557', 12, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:14:08'),
(38, '202313557', 17, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:14:16'),
(39, '202313557', 16, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:14:28'),
(40, '202313557', 13, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:14:36'),
(41, '202313557', 11, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:14:44'),
(42, '202313557', 15, '', 0, 2.25, NULL, 'Passed', '2026-01-07 05:14:53'),
(43, '202313557', 14, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:15:10'),
(44, '202313768', 31, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:27:11'),
(45, '202313768', 32, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:27:29'),
(46, '202313768', 34, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:27:42'),
(47, '202313768', 18, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:27:55'),
(48, '202313768', 39, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:28:21'),
(49, '202313768', 19, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:28:34'),
(50, '202313768', 38, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:28:52'),
(51, '202313768', 67, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:29:07'),
(52, '202313768', 47, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:29:22'),
(53, '202313768', 46, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:29:34'),
(54, '202313768', 68, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:30:29'),
(55, '202313768', 48, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:30:42'),
(56, '202313768', 49, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:31:02'),
(57, '202313768', 50, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:31:18'),
(58, '202313768', 52, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:31:38'),
(59, '202313537', 31, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:32:28'),
(60, '202313537', 39, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:33:04'),
(61, '202313537', 32, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:33:11'),
(62, '202313537', 34, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:33:28'),
(63, '202313537', 18, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:33:45'),
(64, '202313537', 19, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:35:29'),
(65, '202313537', 38, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:35:45'),
(66, '202313537', 67, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:36:10'),
(67, '202313537', 47, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:36:38'),
(68, '202313537', 46, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:36:47'),
(69, '202313537', 68, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:37:00'),
(70, '202313537', 48, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:37:52'),
(71, '202313537', 49, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:38:02'),
(72, '202313537', 50, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:38:10'),
(73, '202313537', 51, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:38:20'),
(74, '202313537', 52, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:38:29'),
(75, '202313557', 31, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:41:00'),
(76, '202313557', 39, '', 0, 1.27, NULL, 'Passed', '2026-01-07 05:41:06'),
(77, '202313557', 32, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:41:14'),
(78, '202313557', 34, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:41:36'),
(79, '202313557', 18, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:42:29'),
(80, '202313557', 19, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:42:36'),
(81, '202313557', 38, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:42:44'),
(82, '202313557', 67, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:42:51'),
(83, '202313557', 47, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:42:58'),
(84, '202313557', 46, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:43:08'),
(85, '202313557', 68, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:43:15'),
(87, '202313557', 48, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:43:24'),
(89, '202313557', 49, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:43:39'),
(91, '202313557', 50, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:44:02'),
(92, '202313557', 51, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:44:11'),
(93, '202313557', 52, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:44:25'),
(95, '202313518', 31, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:44:52'),
(96, '202313518', 39, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:44:59'),
(97, '202313518', 32, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:45:06'),
(99, '202313518', 34, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:45:49'),
(100, '202313518', 18, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:45:58'),
(101, '202313518', 19, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:46:06'),
(102, '202313518', 38, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:46:16'),
(103, '202313518', 67, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:46:23'),
(104, '202313518', 47, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:46:30'),
(105, '202313518', 53, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:46:39'),
(106, '202313518', 46, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:46:41'),
(107, '202313518', 68, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:46:49'),
(108, '202313518', 70, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:47:03'),
(109, '202313518', 55, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:47:18'),
(110, '202313518', 48, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:47:23'),
(111, '202313518', 49, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:47:33'),
(112, '202313518', 56, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:47:35'),
(113, '202313518', 50, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:47:44'),
(114, '202313518', 51, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:47:53'),
(115, '202313518', 57, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:48:22'),
(116, '202313518', 58, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:48:38'),
(117, '202313518', 59, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:48:59'),
(118, '202313518', 52, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:49:10'),
(119, '202313518', 60, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:49:13'),
(120, '202313235', 31, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:49:25'),
(121, '202313235', 39, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:49:34'),
(122, '202313518', 69, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:49:36'),
(123, '202313235', 32, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:49:40'),
(124, '202313235', 34, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:49:46'),
(125, '202313518', 71, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:49:51'),
(126, '202313235', 18, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:49:55'),
(127, '202313235', 19, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:50:01'),
(128, '202313235', 38, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:50:18'),
(129, '202313235', 67, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:50:24'),
(131, '202313235', 46, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:50:38'),
(132, '202313518', 61, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:50:39'),
(133, '202313235', 68, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:50:49'),
(134, '202313518', 62, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:50:59'),
(136, '202313235', 48, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:51:14'),
(137, '202313518', 63, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:51:15'),
(138, '202313235', 49, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:51:22'),
(139, '202313518', 64, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:51:42'),
(140, '202313235', 50, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:51:44'),
(141, '202313235', 51, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:51:53'),
(142, '202313235', 52, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:52:05'),
(143, '202313518', 65, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:52:12'),
(144, '202313518', 66, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:52:42'),
(145, '202313557', 53, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:54:26'),
(146, '202313557', 70, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:54:39'),
(147, '202313557', 55, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:54:54'),
(148, '202313557', 56, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:55:16'),
(149, '202313557', 57, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:55:44'),
(151, '202313557', 58, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:56:34'),
(152, '202313557', 59, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:56:55'),
(153, '202313557', 60, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:57:15'),
(154, '202313557', 69, '', 0, 1.75, NULL, 'Passed', '2026-01-07 05:57:43'),
(156, '202313557', 61, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:58:18'),
(157, '202313557', 62, '', 0, 2.00, NULL, 'Passed', '2026-01-07 05:58:33'),
(158, '202313557', 63, '', 0, 1.00, NULL, 'Passed', '2026-01-07 05:58:47'),
(159, '202313557', 64, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:59:01'),
(160, '202313557', 65, '', 0, 1.25, NULL, 'Passed', '2026-01-07 05:59:16'),
(161, '202313557', 66, '', 0, 1.50, NULL, 'Passed', '2026-01-07 05:59:45'),
(162, '202313537', 53, '', 0, 3.00, NULL, 'Passed', '2026-01-07 06:02:45'),
(163, '202313537', 70, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:02:59'),
(164, '202313537', 55, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:03:10'),
(165, '202313537', 56, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:03:25'),
(166, '202313537', 57, '', 0, 1.75, NULL, 'Passed', '2026-01-07 06:03:37'),
(167, '202313537', 58, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:03:56'),
(168, '202313537', 59, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:04:04'),
(169, '202313537', 60, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:04:18'),
(170, '202313537', 69, '', 0, 2.25, NULL, 'Passed', '2026-01-07 06:04:42'),
(171, '202313537', 71, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:04:55'),
(172, '202313537', 61, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:05:38'),
(173, '202313537', 63, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:06:32'),
(174, '202313537', 64, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:06:46'),
(175, '202313537', 65, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:07:30'),
(176, '202313537', 66, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:07:45'),
(177, '202313235', 53, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:10:56'),
(178, '202313235', 70, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:11:08'),
(179, '202313235', 55, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:11:26'),
(180, '202313235', 56, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:11:41'),
(181, '202313235', 57, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:11:51'),
(182, '202313235', 58, '', 0, 1.75, NULL, 'Passed', '2026-01-07 06:12:03'),
(183, '202313235', 59, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:12:24'),
(184, '202313235', 60, '', 0, 2.00, NULL, 'Passed', '2026-01-07 06:12:34'),
(185, '202313235', 69, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:13:04'),
(186, '202313235', 71, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:13:14'),
(187, '202313235', 61, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:13:26'),
(188, '202313235', 62, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:13:36'),
(189, '202313235', 63, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:13:48'),
(191, '202313235', 64, '', 0, 1.50, NULL, 'Passed', '2026-01-07 06:14:20'),
(192, '202313235', 65, '', 0, 1.00, NULL, 'Passed', '2026-01-07 06:14:40'),
(193, '202313235', 66, '', 0, 1.25, NULL, 'Passed', '2026-01-07 06:14:54'),
(194, '202313537', 62, '', 0, 1.25, NULL, 'Passed', '2026-01-07 11:55:27'),
(195, '202313235', 47, '', 0, 1.00, NULL, 'Passed', '2026-01-07 12:40:12'),
(196, '202313557', 71, '', 0, 1.50, NULL, 'PASSED', '2026-01-07 16:09:00'),
(197, '202313557', 24, '', 0, 1.00, NULL, 'PASSED', '2026-01-07 16:17:47'),
(198, '202313557', 40, '', 0, 1.00, NULL, 'PASSED', '2026-01-07 21:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `full_name`, `first_name`, `middle_name`, `last_name`) VALUES
(11, 'J. N. Rosales', NULL, NULL, NULL),
(12, 'G. N. Ramos', NULL, NULL, NULL),
(13, 'G. N. Penaflorida', NULL, NULL, NULL),
(14, 'A. N. Argoncillo', NULL, NULL, NULL),
(15, 'S. N. Rosales', NULL, NULL, NULL),
(16, 'J. N. Macadangdang', NULL, NULL, NULL),
(17, 'I. R. Amoroso', NULL, NULL, NULL),
(18, 'C. R. Luna', NULL, NULL, NULL),
(19, 'J. N. Perez', NULL, NULL, NULL),
(20, 'I. M. Diokno', NULL, NULL, NULL),
(21, 'S. N. Bagalawis', NULL, NULL, NULL),
(22, 'L. B. Bandillon Jr.', NULL, NULL, NULL),
(23, 'M. E. Delacruz', NULL, NULL, NULL),
(24, 'D. S. Papa', NULL, NULL, NULL),
(25, 'K. M. Baptista', NULL, NULL, NULL),
(26, 'H. P. Camutin', NULL, NULL, NULL),
(27, 'M. S. Rellosa', NULL, NULL, NULL),
(28, 'S. D. Torre', NULL, NULL, NULL),
(29, 'P. A. Avila', NULL, NULL, NULL),
(31, 'R. P. Toledo', NULL, NULL, NULL),
(32, 'K. Agreda', NULL, NULL, NULL),
(34, 'Patrick Anson Jaminal', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `instructor` varchar(100) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `subject_id`, `section_id`, `semester`, `school_year`, `instructor`, `day`, `time_start`, `time_end`, `room`, `is_locked`) VALUES
(5, 17, 162, '1st Semester', '2025-2026', 'K. Agreda', 'Mon', '11:00:00', '13:00:00', '107', 0),
(6, 16, 162, '1st Semester', '2025-2026', 'P. Manahan', 'Mon', '15:00:00', '19:00:00', '220/104', 0),
(7, 13, 162, '1st Semester', '2025-2026', 'D. S. Papa', 'Thurs', '09:00:00', '13:00:00', '218/109', 0),
(8, 14, 162, '1st Semester', '2025-2026', 'D. S. Papa', 'Thurs', '15:00:00', '19:00:00', '218/109', 0),
(9, 15, 162, '1st Semester', '2025-2026', 'D. S. Papa', 'Tues', '13:00:00', '17:00:00', '217/109', 0),
(10, 12, 162, '1st Semester', '2025-2026', 'M. S. Rellosa', 'Wed', '11:00:00', '13:00:00', '220', 0),
(11, 11, 162, '1st Semester', '2025-2026', 'A. N. Argoncillo', 'Tues', '07:00:00', '11:00:00', '109/107', 0),
(12, 12, 172, '1st Semester', '2025-2026', '', 'Tuesday', '12:50:00', '23:50:00', '119', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `course` varchar(150) NOT NULL,
  `year_level` varchar(20) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `course`, `year_level`, `section_name`, `created_at`) VALUES
(162, 'Bachelor of Science in Computer Science', '3rd', 'A', '2025-10-17 18:25:14'),
(165, 'Bachelor of Science in Computer Science', '1st', 'A', '2025-10-20 16:15:49'),
(166, 'Bachelor of Science in Computer Science', '2nd', 'A', '2026-01-06 20:46:01'),
(167, 'Bachelor of Science in Computer Science', '2nd', 'B', '2026-01-06 20:46:10'),
(168, 'Bachelor of Science in Computer Science', '1st', 'B', '2026-01-06 20:46:19'),
(169, 'Bachelor of Science in Computer Science', '3rd', 'B', '2026-01-06 20:46:28'),
(170, 'Bachelor of Science in Computer Science', '4th', 'A', '2026-01-06 20:46:35'),
(171, 'Bachelor of Science in Computer Science', '4th', 'B', '2026-01-06 20:46:43'),
(172, 'Bachelor of Science in Information Technology', '1st', 'A', '2026-01-08 04:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `semester_fees`
--

CREATE TABLE `semester_fees` (
  `id` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `tuition` decimal(10,2) NOT NULL DEFAULT 0.00,
  `lab_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `library_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `medical_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `publication_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `registration_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `guidance_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sdf_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `srf_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `athletic_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `scuaa_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semester_fees`
--

INSERT INTO `semester_fees` (`id`, `semester`, `tuition`, `lab_fee`, `library_fee`, `medical_fee`, `publication_fee`, `registration_fee`, `guidance_fee`, `sdf_fee`, `srf_fee`, `athletic_fee`, `scuaa_fee`, `total_amount`) VALUES
(1, '1st Semester', 0.00, 800.00, 230.00, 200.00, 150.00, 100.00, 120.00, 1000.00, 1000.00, 200.00, 150.00, 3950.00),
(2, '2nd Semester', 0.00, 800.00, 230.00, 200.00, 150.00, 100.00, 120.00, 1000.00, 1000.00, 200.00, 150.00, 3950.00);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(128) NOT NULL,
  `data` text NOT NULL,
  `last_access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `major` varchar(150) DEFAULT NULL,
  `year_level` varchar(50) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `barangay` varchar(150) DEFAULT NULL,
  `municipality` varchar(150) DEFAULT NULL,
  `province` varchar(150) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `civil_status` varchar(50) DEFAULT NULL,
  `citizenship` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_contact` varchar(20) DEFAULT NULL,
  `profile_picture_url` varchar(255) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `password_hash`, `first_name`, `middle_name`, `last_name`, `major`, `year_level`, `section`, `email`, `contact_number`, `street`, `barangay`, `municipality`, `province`, `date_of_birth`, `sex`, `civil_status`, `citizenship`, `religion`, `guardian_name`, `guardian_contact`, `profile_picture_url`, `section_id`) VALUES
('202215230', '$2y$10$8eHqJKGmiz28EEi7lflKA.dyXt.4y4K4Ze7b/qUP8O0a4sKtc8/qO', 'Owen Ricci', '', 'Molina', 'Bachelor of Science in Information Technology', '4th', 'C', 'aremagedio@gmail.com', '09063302623', '901 Soriano Street Caridad Cavite City', 'Barangay 24', 'City of Cavite', 'Cavite', '2003-04-17', 'Male', 'Single', 'Filipino', 'Jehovah\'s Witnesses', 'Railey Mae', '09942849558', NULL, NULL),
('202313162', '$2y$10$EXgkwFHGlSlKHYBMEMrDLu4oPwIt5Dil8Fj1u9zCTT8HzjVbpX/Y.', 'Amiel Ron', 'Perez', 'Gapasin', 'Bachelor of Science in Computer Science', '3rd', 'A', 'amielron.gapasin@cvsu.edu.ph', '09874563245', 'L.Diwa St. San Antonio', 'Barangay 12', 'City of Cavite', 'Cavite', '2003-02-25', 'Male', 'Single', 'Filipino', 'Roman Catholic', 'Mae Gapasin', '09876543221', 'uploads/profile_pics/profile_202313162_1767834378.jpg', 162),
('202313518', '$2y$10$zB2c7yP9XqI7OgVQ0P/1vOnuD3Gl8ks9PlTnwcd3IC15WW2t0uv22', 'Aicee Emari', 'Hernandez', 'Estores', 'Bachelor of Science in Computer Science', '3rd', 'A', 'aiceeemari.estores@cvsu.edu.ph', '09261527405', '1033 Tramo Road', 'Santa Rosa I', 'Noveleta', 'Cavite', '2005-08-13', 'Female', 'Single', 'Filipino', 'Roman Catholic', 'Nancy Estores', '09555277525', 'uploads/profile_pics/profile_202313518_1767826116.jpg', 162),
('202313537', '$2y$10$Qhn66hJJ5fcxJYCa0.qO5.6bLdWq1N/Qp6mVUuI7O66JzvTGdVz/.', 'Alexis', 'Feliciano', 'Ornales', 'Bachelor of Science in Computer Science', '3rd', 'A', 'alexis.ornales@cvsu.edu.ph', '09353175189', '419', 'San Rafael III', 'Noveleta', 'Cavite', '2004-11-24', 'Female', 'Single', 'Filipino', 'Others', 'Aileen Feliciano', '09753409594', 'uploads/profile_pics/profile_202313537_1767831454.jpg', 162),
('202313557', '$2y$10$spyC7zMCrfbHv9mGlagw5.99YPqkq8JnzunCnYibMrjtoJzOntZnK', 'Florence Sophia', 'Vasquez', 'Diaz', 'Bachelor of Science in Computer Science', '3rd', 'A', 'florencesophia.diaz@cvsu.edu.ph', '09277354240', 'Manggahan-Lawin', 'Manggahan-Lawin', 'Kawit', 'Cavite', '2005-02-25', 'Female', 'Single', 'Filipino', 'Others', 'Alyssa Toribio', '09174350038', 'uploads/profile_pics/profile_202313557_1767831423.jpg', 162),
('202313768', '$2y$10$8wVSwW1hfHIUSlvkpzepcO9CiBkp3HYkOrpfvO6SugUMUH1/JAXti', 'Althea', '', 'Balicat', 'Bachelor of Science in Computer Science', '3rd', 'A', 'althea.balicat@cvsu.edu.ph', '09853674869', 'L.Diwa St. San Antonio', 'Barangay 53', 'City of Cavite', 'Cavite', '2005-04-19', 'Female', 'Single', 'Filipino', 'Iglesia ni Cristo', 'Neslie Reyes', '09852137839', 'uploads/profile_pics/profile_202313768_1767799478.jpg', 162);

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollments`
--

CREATE TABLE `student_enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `status` enum('enrolled','completed') DEFAULT 'enrolled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_scholarships`
--

CREATE TABLE `student_scholarships` (
  `student_id` varchar(20) NOT NULL,
  `scholarship_name` enum('RA_10931','NONE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_scholarships`
--

INSERT INTO `student_scholarships` (`student_id`, `scholarship_name`) VALUES
('202215230', 'RA_10931'),
('202313235', 'RA_10931'),
('202313518', 'RA_10931'),
('202313537', 'RA_10931'),
('202313557', 'RA_10931'),
('202313768', 'RA_10931');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `units` int(11) NOT NULL,
  `section` varchar(50) NOT NULL
) ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_name`, `units`, `section`) VALUES
(11, 'COSC75', 'Software Engineering II', 3, ''),
(12, 'MATH3', 'Linear Algebra', 3, ''),
(13, 'COSC80', 'Operating Systems', 3, ''),
(14, 'COSC85', 'Networks and Communucation', 3, ''),
(15, 'COSC101', 'CS Elective 1', 3, ''),
(16, 'DCIT26', 'Applications Development and Emerging Technologies', 3, ''),
(17, 'DCIT65', 'Social and Professional Issues', 3, ''),
(18, 'GNED02', 'Ethics', 3, ''),
(19, 'GNED05', 'Purposive Communication', 3, ''),
(20, 'ITEC80', 'Introduction to Human Computer Interaction', 3, ''),
(21, 'COSC100', 'Automata Theory and Formal Language', 3, ''),
(22, 'COSC105', 'Intelligent Systems', 3, ''),
(23, 'COSC111', 'CS Elective 3 (Internet of Things)', 3, ''),
(24, 'COSC200A', 'Undergraduate Thesis I', 3, ''),
(25, 'GNED07', 'The Contemporary World', 3, ''),
(26, 'COSC110', 'Numerical and Symbolic Computation', 3, ''),
(27, 'COSC200B', 'Undergraduate Thesis II', 3, ''),
(30, 'GNED11', 'Kontekswalisadong Komunikasyon sa Filipino', 3, ''),
(31, 'COSC50', 'Discrete Structure', 3, ''),
(32, 'DCIT21', 'Introduction to Computing', 2, ''),
(33, 'ITEC85', 'Information Assurance and Security 1', 3, ''),
(34, 'DCIT22', 'Computer Programming 1', 1, ''),
(35, 'DCIT60', 'Method of Research', 3, ''),
(37, 'GNED10', 'Gender and Society', 3, ''),
(38, 'NSTP1', 'National Service Training Program 1', 3, ''),
(39, 'CVSU101', 'Institutional Orientation', 1, ''),
(40, 'COSC106', 'CS Elective 2(Introduction to Game Development)', 3, ''),
(41, 'COSC90', 'Design and Analysis of Algorithm', 3, ''),
(42, 'COSC95', 'Programming Languages', 3, ''),
(43, 'GNED09', 'Rizal\'s Life and Works', 3, ''),
(44, 'MATH4', 'Experimental Statics', 3, ''),
(46, 'NSTP2', 'National Service Training Program 2', 3, ''),
(47, 'FITT2', 'Fitness Exercises', 2, ''),
(48, 'GNED01', 'Arts Appreciation', 3, ''),
(49, 'GNED06', 'Science, Technology and Society', 3, ''),
(50, 'ITEC50', 'Web System and Technologies 1', 3, ''),
(51, 'DCIT23', 'Computer Programming 2', 3, ''),
(52, 'GNED12', 'Dalumat ng/sa Filipino', 3, ''),
(53, 'GNED04', 'Mga Babasahin Hinggil sa Kasaysayan ng Pilipinas', 3, ''),
(55, 'COSC55', 'Discrete Structures 2', 3, ''),
(56, 'INSY50', 'Fundamentals of Information System', 3, ''),
(57, 'FITT3', 'Physical Activities Towards Health and Fitness 1', 2, ''),
(58, 'COSC60', 'Digital Logic Design', 3, ''),
(59, 'DCIT50', 'Object Oriented Programming', 3, ''),
(60, 'DCIT24', 'Information Management', 3, ''),
(61, 'DCIT55', 'Adavance Database System', 3, ''),
(62, 'COSC70', 'Software Engineering 1', 3, ''),
(63, 'FITT4', 'Physical Fitness Towards Health and Fitness 2', 2, ''),
(64, 'GNED14', 'Panitikang Panlipunan', 3, ''),
(65, 'GNED08', 'Understanding the Self', 3, ''),
(66, 'DCIT25', 'Data Structures and Algorithms', 3, ''),
(67, 'FITT1', 'Movement Enhancement', 2, ''),
(68, 'GNED03', 'Mathematics in the Modern World', 3, ''),
(69, 'MATH2', 'Calculus', 3, ''),
(70, 'MATH1', 'Analytic Geometry', 3, ''),
(71, 'COSC65', 'Architecture and Organization', 3, ''),
(72, 'THRYAK', 'Try lang p', 3, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_summary`
--
ALTER TABLE `academic_summary`
  ADD PRIMARY KEY (`summary_id`),
  ADD UNIQUE KEY `student_id_2` (`student_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `academic_terms`
--
ALTER TABLE `academic_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_announcement_admin` (`created_by`);

--
-- Indexes for table `billing_statements`
--
ALTER TABLE `billing_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_event_admin` (`created_by`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_student_subject` (`student_id`,`subject_id`),
  ADD KEY `fk_grades_student` (`student_id`),
  ADD KEY `fk_grades_subject` (`subject_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `fk_schedule_subject` (`subject_id`),
  ADD KEY `fk_schedule_section` (`section_id`),
  ADD KEY `idx_schedule_period` (`semester`,`school_year`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semester_fees`
--
ALTER TABLE `semester_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_students_section` (`section_id`);

--
-- Indexes for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `uniq_student_subject_sem` (`student_id`,`subject_id`,`school_year`,`semester`),
  ADD KEY `fk_enroll_subject` (`subject_id`);

--
-- Indexes for table `student_scholarships`
--
ALTER TABLE `student_scholarships`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`),
  ADD UNIQUE KEY `subject_code_2` (`subject_code`),
  ADD UNIQUE KEY `subject_code_3` (`subject_code`),
  ADD UNIQUE KEY `subject_code_4` (`subject_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_summary`
--
ALTER TABLE `academic_summary`
  MODIFY `summary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `academic_terms`
--
ALTER TABLE `academic_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_accounts`
--
ALTER TABLE `admin_accounts`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `billing_statements`
--
ALTER TABLE `billing_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `semester_fees`
--
ALTER TABLE `semester_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_admin` FOREIGN KEY (`created_by`) REFERENCES `admin_accounts` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fk_schedule_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_schedule_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_section` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_enrollments`
--
ALTER TABLE `student_enrollments`
  ADD CONSTRAINT `fk_enroll_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_enroll_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
