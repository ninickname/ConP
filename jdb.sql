-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2015 at 10:51 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

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
(88, 'man', 'man', 'man', '$2a$10$s.XH8P75wtCoadNpQ3MoaeFTXDOJ8bauNCGA6oVifuUAHIlnyBva2', '2015-05-26 20:47:34', 'man@man', '$2a$10$s.XH8P75wtCoadNpQ3Moae', 'Manager'),
(99, 'admin', 'admin', 'admin', '$2a$10$rnnAoqloI21qUcio4XJGSuYkU3.Rjj3jWPfdPbHtAIX3ZLxODrrEq', '2015-05-26 20:49:37', 'admin@admin', '$2a$10$rnnAoqloI21qUcio4XJGSu', 'Admin'),
(1233, 'user', 'user', 'user', '$2a$10$Obpm7WI/gd1sn/WLXDABuO5L9KklxAhEWL0iKGueyU7pmuHxwSL6S', '2015-05-26 20:45:39', 'user@user.com', '$2a$10$Obpm7WI/gd1sn/WLXDABuO', 'User'),
(12311, 'emp', 'emp', 'emp', '$2a$10$lshceUxR./eu4qbFda.bKOphX6Fjlsqpna4yRBz5ffRtOQj4/xnA.', '2015-05-26 20:46:21', 'emp@emp', '$2a$10$lshceUxR./eu4qbFda.bKO', 'Employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);


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
  (1, 'Article 1', 'Alternatively, you can leave the video call window without ending the video call. Tap the back button on your tablet to go one step back in Skype, or tap the home button to go to the desktop. This doesn’t end your video call, and it will appear in a small floating window in the right corner of your screen. Now you can tap the floating window to go back to your video call.', 6, '2015-05-27 14:06:43'),
  (2, 'Article 2', 'Alternatively, you can leave the video call window without ending the video call. Tap the back button on your tablet to go one step back in Skype, or tap the home button to go to the desktop. This doesn’t end your video call, and it will appear in a small floating window in the right corner of your screen. Now you can tap the floating window to go back to your video call.', 6, '2015-05-27 14:09:01'),
  (3, 'Article 3', 'Alternatively, you can leave the video call window without ending the video call. Tap the back button on your tablet to go one step back in Skype, or tap the home button to go to the desktop. This doesn’t end your video call, and it will appear in a small floating window in the right corner of your screen. Now you can tap the floating window to go back to your video call.', 6, '2015-05-27 14:09:22'),
  (4, 'Article 4', 'Alternatively, you can leave the video call window without ending the video call. Tap the back button on your tablet to go one step back in Skype, or tap the home button to go to the desktop. This doesn’t end your video call, and it will appear in a small floating window in the right corner of your screen. Now you can tap the floating window to go back to your video call.', 6, '2015-05-27 14:32:23');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
