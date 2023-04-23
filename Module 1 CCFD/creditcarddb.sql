-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2022 at 09:22 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `creditcarddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin\r\n             '),
('ad', 'ad');

-- --------------------------------------------------------

--
-- Table structure for table `bank_balance`
--

CREATE TABLE IF NOT EXISTS `bank_balance` (
  `credit_card_no` varchar(30) DEFAULT NULL,
  `Balance` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_balance`
--

INSERT INTO `bank_balance` (`credit_card_no`, `Balance`) VALUES
('12345', '1000'),
('1111111111', '1000'),
('2222222222', '2000'),
('3333333333', '1500'),
('8888888888', '9000'),
('9090909090', '9090'),
('8888888888', '2500');

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE IF NOT EXISTS `bank_info` (
  `customer_id` int(11) DEFAULT NULL,
  `creaditCard_no` varchar(30) DEFAULT NULL,
  `acc_no` varchar(30) DEFAULT NULL,
  `cif_no` varchar(30) DEFAULT NULL,
  `branch_code` varchar(30) DEFAULT NULL,
  `ifsc_no` varchar(30) DEFAULT NULL,
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`customer_id`, `creaditCard_no`, `acc_no`, `cif_no`, `branch_code`, `ifsc_no`) VALUES
(1, '8888888888', '9876345674876', '1234', '1234', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `personale_info`
--

CREATE TABLE IF NOT EXISTS `personale_info` (
  `customer_Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `lame` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `c_date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `personale_info`
--

INSERT INTO `personale_info` (`customer_Id`, `fname`, `lame`, `dob`, `gender`, `Address`, `city`, `email_id`, `mobile`, `c_date`) VALUES
(1, 'Raj', 'Patil', '1998-03-09', 'male', 'Katraj', 'Pune', 'raj@gmail.com', '9876543212', '2022.03.16 01:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `sequrity_que`
--

CREATE TABLE IF NOT EXISTS `sequrity_que` (
  `customer_Id` int(11) DEFAULT NULL,
  `que1` varchar(100) DEFAULT NULL,
  `ans1` varchar(100) DEFAULT NULL,
  `que2` varchar(100) DEFAULT NULL,
  `ans2` varchar(100) DEFAULT NULL,
  `que3` varchar(100) DEFAULT NULL,
  `ans3` varchar(100) DEFAULT NULL,
  KEY `customer_Id` (`customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sequrity_que`
--

INSERT INTO `sequrity_que` (`customer_Id`, `que1`, `ans1`, `que2`, `ans2`, `que3`, `ans3`) VALUES
(1, 'What is your PAN Card Number?', 'ABCD12345678', 'What is your First Mobile Number?', '9921760910', 'What is your Date of Birth?', '160290');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`username`, `password`, `status`, `customer_id`) VALUES
('888Raj2022', '1122', 'reg', 53);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD CONSTRAINT `bank_info_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `sequrity_que` (`customer_Id`);

--
-- Constraints for table `sequrity_que`
--
ALTER TABLE `sequrity_que`
  ADD CONSTRAINT `sequrity_que_ibfk_1` FOREIGN KEY (`customer_Id`) REFERENCES `personale_info` (`customer_Id`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `bank_info` (`customer_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
