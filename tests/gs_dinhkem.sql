-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2019 at 02:10 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `201906hoso1cua`
--

-- --------------------------------------------------------

--
-- Table structure for table `gs_dinhkem`
--

CREATE TABLE IF NOT EXISTS `gs_dinhkem` (
  `dinhkem_id` int(11) NOT NULL,
  `dinhkem_name` text COLLATE utf8_unicode_ci,
  `dinhkem_url` text COLLATE utf8_unicode_ci,
  `phananh_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gs_dinhkem`
--
ALTER TABLE `gs_dinhkem`
  ADD PRIMARY KEY (`dinhkem_id`),
  ADD KEY `dinhkem_phananh_id` (`phananh_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gs_dinhkem`
--
ALTER TABLE `gs_dinhkem`
  MODIFY `dinhkem_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
