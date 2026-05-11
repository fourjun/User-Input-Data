-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2026 at 11:43 AM
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
-- Database: `dashboard_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `name`, `email`, `role`, `created_at`) VALUES
(3, 'James Smith', 'james.smith@example.com', 'User', '2026-01-28 10:31:02'),
(4, 'Sarah Johnson', 'sarah.j@testmail.com', 'User', '2026-01-28 10:31:02'),
(5, 'Michael Brown', 'm.brown88@example.org', 'User', '2026-01-28 10:31:02'),
(6, 'Emily Davis', 'emily.davis@workplace.net', 'User', '2026-01-28 10:31:02'),
(7, 'David Wilson', 'dwilson@techhub.io', 'Guest', '2026-01-28 10:31:02'),
(8, 'Jessica Garcia', 'jessica.g@example.com', 'User', '2026-01-28 10:31:02'),
(9, 'Daniel Martinez', 'dan.martinez@webmail.com', 'User', '2026-01-28 10:31:02'),
(10, 'Laura Rodriguez', 'l.rodriguez@example.org', 'Admin', '2026-01-28 10:31:02'),
(11, 'Robert Anderson', 'robert.a@testmail.com', 'User', '2026-01-28 10:31:02'),
(12, 'Jennifer Taylor', 'jen.taylor@example.net', 'Guest', '2026-01-28 10:31:02'),
(13, 'Thomas Thomas', 't.thomas@example.com', 'User', '2026-01-28 10:31:02'),
(14, 'Linda Moore', 'linda.moore@workplace.io', 'User', '2026-01-28 10:31:02'),
(15, 'Chris Jackson', 'c.jackson@techhub.net', 'Admin', '2026-01-28 10:31:02'),
(16, 'Barbara White', 'barbara.w@example.org', 'User', '2026-01-28 10:31:02'),
(17, 'Paul Harris', 'paul.harris@webmail.com', 'User', '2026-01-28 10:31:02'),
(18, 'Nancy Martin', 'nancy.m@example.com', 'Guest', '2026-01-28 10:31:02'),
(19, 'Kevin Thompson', 'kevin.t@testmail.com', 'User', '2026-01-28 10:31:02'),
(20, 'Sandra Garcia', 'sandra.g@example.net', 'User', '2026-01-28 10:31:02'),
(21, 'Brian Martinez', 'brian.m@workplace.org', 'User', '2026-01-28 10:31:02'),
(22, 'Ashley Robinson', 'ashley.r@techhub.io', 'Admin', '2026-01-28 10:31:02'),
(23, 'Jason Clark', 'jason.clark@example.com', 'User', '2026-01-28 10:31:02'),
(24, 'Kimberly Lewis', 'kim.lewis@webmail.com', 'User', '2026-01-28 10:31:02'),
(25, 'Matthew Lee', 'matthew.lee@testmail.com', 'Guest', '2026-01-28 10:31:02'),
(26, 'Betty Walker', 'betty.walker@example.org', 'User', '2026-01-28 10:31:02'),
(27, 'George Hall', 'george.hall@example.net', 'User', '2026-01-28 10:31:02'),
(28, 'Lisa Allen', 'lisa.allen@workplace.com', 'User', '2026-01-28 10:31:02'),
(29, 'Steven Young', 'steven.young@techhub.net', 'Admin', '2026-01-28 10:31:02'),
(30, 'Karen Hernandez', 'karen.h@example.io', 'User', '2026-01-28 10:31:02'),
(31, 'Edward King', 'edward.king@webmail.com', 'User', '2026-01-28 10:31:02'),
(32, 'Michelle Wright', 'michelle.w@testmail.com', 'Guest', '2026-01-28 10:31:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
