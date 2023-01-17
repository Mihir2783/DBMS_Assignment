-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2022 at 12:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banking`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_num` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_num`, `amount`) VALUES
(101654, '500.00'),
(101655, '525400.00'),
(10465, '500.00'),
(10465, '46500.00');

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `acc_log` AFTER INSERT ON `account` FOR EACH ROW INSERT INTO account_log
 	SET acc_num = new.acc_num, log_msg = concat("new amount ",new.amount, "deposited")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `total_inserted_amount` BEFORE INSERT ON `account` FOR EACH ROW set @sum = @sum + new.amount
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_log`
--

CREATE TABLE `account_log` (
  `acc_num` int(11) DEFAULT NULL,
  `log_msg` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_log`
--

INSERT INTO `account_log` (`acc_num`, `log_msg`) VALUES
(10465, 'new amount deposited'),
(10465, 'new amount 46500.00deposited');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
