-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2015 at 10:42 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

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
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
`id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `content` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `role` enum('User','Admin','Manager','Employee','Unregistered') NOT NULL DEFAULT 'Unregistered'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created`, `email`, `salt`, `role`) VALUES
(5, 'dfg', 'dfgdfg', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSehlgBpG7aDFx/Kpwr7TmreTCmfSMoBvK', '2015-05-04 08:09:58', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSe\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', 'Employee'),
(6, '222', '222', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.Sd99pWb31i5tRVH0AH.sLp8pheUPqwK', '2015-05-04 09:20:58', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.', 'Admin'),
(7, 'asd', 'asd', 'asd', '$2a$10$qodIBrrbDy3Of3NmYjK1zeLwiHH7hlHuqXe/.P/U6anVcGxBPHsUq', '2015-05-04 13:07:03', 'mushushushu@gmail.com', '$2a$10$qodIBrrbDy3Of3NmYjK1ze', 'Manager'),
(8, 'er', 'oik', 'oik', '$2a$10$yNTgqYDYle7ABUvSiP6XCeDqJl7D8top6sllZzggnNEjyt.qMAzuC', '2015-05-04 13:11:51', 'mushushushu@gmail.com', '$2a$10$yNTgqYDYle7ABUvSiP6XCe', 'User'),
(12, '12', '12', '12', '$2a$10$3cmiNSdH5yHC5qCRvOZ.VeNd3NhbTMhAaZShzmAJy6V0q.cjwaNWu', '2015-05-05 19:06:13', 'david-ep@hotmail.com', '$2a$10$3cmiNSdH5yHC5qCRvOZ.Ve', 'Unregistered'),
(321, '321', '321', '321', '$2a$10$TqhxPqaGssU/Ft9lrUssIuBeiheMhKD4Z4izGDHtLqagtYJLxBX8C', '2015-05-19 12:40:20', '321@321.321', '$2a$10$TqhxPqaGssU/Ft9lrUssIu', 'Unregistered'),
(1234567, 'mombasa', 'mambiso', '1234567', '$2a$10$Gzhi07dcwRLqt3cRkzOzQOCKNLdaWfOLoiRBtc.aZNEO9O/hOefSK', '2015-05-05 19:14:02', 'sagivste@gmail.com', '$2a$10$Gzhi07dcwRLqt3cRkzOzQO', 'Unregistered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `sender_id` (`sender_id`), ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
