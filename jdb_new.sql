-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2015 at 02:54 AM
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
  `client_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `sessionId` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aborted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `role` enum(' USER',' ADMIN','Manager','Employee','Unregistered') NOT NULL DEFAULT 'Unregistered',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created`, `email`, `salt`, `role`) VALUES
(5, 'dfg', 'dfgdfg', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSehlgBpG7aDFx / Kpwr7TmreTCmfSMoBvK', '0000-00-00 00:00:00', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSe\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Employee'),
(6, '222', '222', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.Sd99pWb31i5tRVH0AH.sLp8pheUPqwK', '0000-00-00 00:00:00', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.', ' ADMIN'),
(7, 'asd', 'asd', 'asd', '$2a$10$qodIBrrbDy3Of3NmYjK1zeLwiHH7hlHuqXe /.P / U6anVcGxBPHsUq', '0000-00-00 00:00:00', 'mushushushu@gmail.com', '$2a$10$qodIBrrbDy3Of3NmYjK1ze', 'Manager'),
(8, 'er', 'oik', 'oik', '$2a$10$yNTgqYDYle7ABUvSiP6XCeDqJl7D8top6sllZzggnNEjyt.qMAzuC', '0000-00-00 00:00:00', 'mushushushu@gmail.com', '$2a$10$yNTgqYDYle7ABUvSiP6XCe', ' USER'),
(12, '12', '12', '12', '$2a$10$3cmiNSdH5yHC5qCRvOZ.VeNd3NhbTMhAaZShzmAJy6V0q.cjwaNWu', '0000-00-00 00:00:00', 'david - ep@hotmail.com', '$2a$10$3cmiNSdH5yHC5qCRvOZ.Ve', 'Unregistered'),
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
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
