-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2015 at 08:34 PM
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
  `img_url` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `img_url`, `created_by`, `created_at`) VALUES
  (2, 'Article 2', '"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', NULL, 6, '2015-05-27 14:09:01'),
  (3, 'I wanted to created special article', '"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', NULL, 6, '2015-05-27 14:09:22'),
  (4, '123', '"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', NULL, 6, '2015-05-27 14:32:23'),
  (6, 'Andrey the king', 'Andery is awsome Andery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsomeAndery is awsome', '/img/andrey.jpg', 99, '2015-05-27 22:39:33'),
  (9, 'Hello world', '"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', '/img/andrey.jpg', 99, '2015-06-06 15:26:24'),
  (10, 'Hello world 1', '"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', '/img/andrey.jpg', 99, '2015-06-06 15:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `article_rates`
--

CREATE TABLE IF NOT EXISTS `article_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `article_rates`
--

INSERT INTO `article_rates` (`id`, `article_id`, `user_id`, `rate`) VALUES
  (1, 1, 99, 4),
  (2, 2, 99, 4),
  (3, 1, 99, 2),
  (4, 3, 99, 4),
  (5, 3, 99, 4),
  (6, 4, 99, 5),
  (7, 5, 99, 2),
  (8, 6, 99, 3),
  (9, 6, 99, 5);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `written_on` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aborted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `client_id`, `employee_id`, `sessionId`, `created_at`, `aborted_at`) VALUES
  (30, 1233, NULL, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:25:22', NULL),
  (31, 1233, 0, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:25:22', NULL),
  (32, 1233, 0, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:25:31', NULL),
  (33, 1233, 0, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:25:38', NULL),
  (34, 1233, 0, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:32:05', NULL),
  (35, 1233, 0, '2_MX40NTIzODM4Mn5-MTQzMzYxNTEzNTk3N35uM1F1ZSthT1FPbE9nSjdjSm9JZWNleEF-UH4', '2015-06-06 21:32:13', NULL);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
