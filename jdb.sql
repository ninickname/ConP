-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2015 at 05:25 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `created_by`, `created_at`) VALUES
  (1, 'Hello world', 'Hello world', 6, '2015-05-27 14:06:43'),
  (2, 'Article 2', 'Article 2', 6, '2015-05-27 14:09:01'),
  (3, 'I wanted to created special article', 'I wanted to created special article', 6, '2015-05-27 14:09:22'),
  (4, '123', '123', 6, '2015-05-27 14:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sessionId` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aborted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `client_id`, `employee_id`, `sessionId`, `created_at`, `aborted_at`) VALUES
  (1, 7, NULL, '2_MX40NTIzODM4Mn5-MTQzMjY3MzA3OTAxM35HSXJNaThsM0grODNYdkhKZG16alkyaVB-UH4', '2015-05-26 20:44:19', '2015-05-12'),
  (2, 6, NULL, '1_MX40NTIzODM4Mn5-MTQzMjY3NDk2OTk4NX4yb2cwQWw3UUNoaU8rbG9sVWlBSVViQVN-UH4', '2015-05-26 21:15:49', '2015-05-19'),
  (3, NULL, NULL, '2_MX40NTIzODM4Mn5-MTQzMjczOTU2NDYwMH4zdnNrcFZjZVM2VlVBK2I0NzlJVGtPM05-UH4', '2015-05-27 15:12:32', NULL),
  (4, NULL, NULL, '1_MX40NTIzODM4Mn5-MTQzMjczOTYxMDI4NH41cTNZS1RCdHdVSHRBZnVIckR1Y0pjRkh-UH4', '2015-05-27 15:13:17', NULL),
  (5, NULL, NULL, '1_MX40NTIzODM4Mn5-MTQzMjczOTcyMjA1N35lVWpJdGdBVmhEclhiZDdIZVdvaDV1akl-UH4', '2015-05-27 15:15:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(9) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `user_name` text NOT NULL,
  `password` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` text NOT NULL,
  `salt` varchar(64) NOT NULL,
  `role` enum('User','Admin','Manager','Employee','Unregistered') NOT NULL DEFAULT 'Unregistered',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created`, `email`, `salt`, `role`) VALUES
  (5, 'dfg', 'dfgdfg', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSehlgBpG7aDFx / Kpwr7TmreTCmfSMoBvK', '0000-00-00 00:00:00', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSe\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Employee'),
  (6, '222', '222', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.Sd99pWb31i5tRVH0AH.sLp8pheUPqwK', '0000-00-00 00:00:00', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.', 'Admin'),
  (7, 'asd', 'asd', 'asd', '$2a$10$qodIBrrbDy3Of3NmYjK1zeLwiHH7hlHuqXe /.P / U6anVcGxBPHsUq', '0000-00-00 00:00:00', 'mushushushu@gmail.com', '$2a$10$qodIBrrbDy3Of3NmYjK1ze', 'Manager'),
  (8, 'er', 'oik', 'oik', '$2a$10$yNTgqYDYle7ABUvSiP6XCeDqJl7D8top6sllZzggnNEjyt.qMAzuC', '0000-00-00 00:00:00', 'mushushushu@gmail.com', '$2a$10$yNTgqYDYle7ABUvSiP6XCe', 'User'),
  (12, '12', '12', '12', '$2a$10$3cmiNSdH5yHC5qCRvOZ.VeNd3NhbTMhAaZShzmAJy6V0q.cjwaNWu', '0000-00-00 00:00:00', 'david - ep@hotmail.com', '$2a$10$3cmiNSdH5yHC5qCRvOZ.Ve', 'Unregistered'),
  (88, 'man', 'man', 'man', '$2a$10$s.XH8P75wtCoadNpQ3MoaeFTXDOJ8bauNCGA6oVifuUAHIlnyBva2', '2015-05-26 17:47:34', 'man@man', '$2a$10$s.XH8P75wtCoadNpQ3Moae', 'Manager'),
  (99, 'admin', 'admin', 'admin', '$2a$10$rnnAoqloI21qUcio4XJGSuYkU3.Rjj3jWPfdPbHtAIX3ZLxODrrEq', '2015-05-26 17:49:37', 'admin@admin', '$2a$10$rnnAoqloI21qUcio4XJGSu', 'Admin'),
  (1233, 'user', 'user', 'user', '$2a$10$Obpm7WI/gd1sn/WLXDABuO5L9KklxAhEWL0iKGueyU7pmuHxwSL6S', '2015-05-26 17:45:39', 'user@user.com', '$2a$10$Obpm7WI/gd1sn/WLXDABuO', 'User'),
  (12311, 'emp', 'emp', 'emp', '$2a$10$lshceUxR./eu4qbFda.bKOphX6Fjlsqpna4yRBz5ffRtOQj4/xnA.', '2015-05-26 17:46:21', 'emp@emp', '$2a$10$lshceUxR./eu4qbFda.bKO', 'Employee'),
  (1234567, 'mombasa', 'mambiso', '1234567', '$2a$10$Gzhi07dcwRLqt3cRkzOzQOCKNLdaWfOLoiRBtc.aZNEO9O / hOefSK', '0000-00-00 00:00:00', 'sagivste@gmail.com', '$2a$10$Gzhi07dcwRLqt3cRkzOzQO', 'Unregistered');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
