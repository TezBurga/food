-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 09:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcart`
--

CREATE TABLE `addcart` (
  `id` int(12) NOT NULL,
  `p_id` int(12) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(12) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `addcart`
--

INSERT INTO `addcart` (`id`, `p_id`, `u_id`, `price`, `qty`, `total`) VALUES
(6, 11, 'admin', '30.00', 2, '60.00'),
(17, 38, 'ben', '3.00', 1, '3.00'),
(26, 53, 'tom', '4.65', 1, '4.65'),
(27, 52, 'bean', '6.50', 2, '13.00'),
(29, 51, 'tez', '10.95', 2, '21.90'),
(30, 46, 'tez', '7.00', 2, '14.00');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `id` int(12) NOT NULL,
  `p_id` int(12) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `mobile` int(30) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `status_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`id`, `p_id`, `u_id`, `mobile`, `email`, `address`, `status_id`) VALUES
(44, 53, 'tom', 1231231234, 'tom@gmail.com', '123144124', 'Delivered'),
(45, 40, 'bean', 1231231234, 'bean@gmail.com', '123123123', 'Cancelled'),
(46, 44, 'bean', 1231231234, 'bean@gmail.com', '123123123', 'Cancelled'),
(47, 52, 'bean', 1234124455, 'bean@gmail.com', '123123241232', 'Cancelled'),
(48, 43, 'tez', 1231231234, 'tez@gmail.com', '12312312323', 'Pending'),
(49, 51, 'tez', 1231231234, 'tez@gmail.com', '12312312313', 'Delivered'),
(50, 46, 'tez', 1231231234, 'tez@gmail.com', '12312312313', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `food_cat`
--

CREATE TABLE `food_cat` (
  `id` int(12) NOT NULL,
  `catnm` varchar(100) NOT NULL,
  `sub_cat` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_cat`
--

INSERT INTO `food_cat` (`id`, `catnm`, `sub_cat`) VALUES
(61, 'breakfast', ''),
(62, 'lunch', ''),
(63, 'drinks', ''),
(64, 'dessert', ''),
(65, 'breakfast', 'Croissants'),
(66, 'drinks', 'milkshakes'),
(67, 'drinks', 'smoothies'),
(68, 'lunch', 'burgers');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(12) NOT NULL,
  `category` varchar(100) NOT NULL,
  `sub_cat` varchar(120) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `category`, `sub_cat`, `title`, `description`, `price`, `image`) VALUES
(39, 'breakfast', '', 'Mediterranean Breakfast', 'dwadawdd', '11.00', 'mimg/mediterranean_breakfast.jpg'),
(40, 'lunch', '', 'Pasta', 'Tomato pasta with cheese', '5.00', 'mimg/pasta.jpg'),
(41, 'breakfast', '', 'Eggs Benedict', 'wdadddd', '12.00', 'mimg/eggs_benedict.jpg'),
(42, 'lunch', '', 'Famous Black Burger', 'Comes with chips and cheese sauce', '15.00', 'mimg/black_burger.jpg'),
(43, 'drinks', '', 'Fruit Smoothie', 'Our secret blend of fruits', '3.00', 'mimg/fruit_smoothie.jpg'),
(44, 'drinks', '', 'Oreo Milkshake ', 'wdadddd', '4.00', 'mimg/oreo_milkshake.jpg'),
(45, 'dessert', '', 'Pistachio velvet ', 'Red velvet with pistachios ', '5.00', 'mimg/red_velvet_pistachio.jpg'),
(46, 'dessert', '', 'Red Velvet', 'comes with macaroons and ice cream', '7.00', 'mimg/red_velvet_macaroon.jpg'),
(50, 'breakfast', 'Croissants', 'Croissants', 'Freshly baked croissants.', '3.00', 'mimg/croissant.jpg'),
(51, 'breakfast', '', 'Full English ', 'wdqdqdd', '10.95', 'mimg/item1.jpg'),
(52, 'lunch', '', 'Suckuck wrap', 'wqdwqdd', '6.50', 'mimg/item2.jpg'),
(53, 'breakfast', '', 'Pancake', 'wfdefasf', '4.65', 'mimg/item3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(12) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `userid`, `password`, `email`) VALUES
(6, 'tez', '123', '123@gmail.com'),
(7, 'bean', '123', 'bean@gmail.com'),
(8, 'tom', '123', 'tom@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(12) NOT NULL,
  `name` varchar(100) NOT NULL,
  `review` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `name`, `review`, `description`) VALUES
(8, 'tes', 'Very Poor', 'burnt'),
(9, 'dul', 'Exellent', 'digilicious');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addcart`
--
ALTER TABLE `addcart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_cat`
--
ALTER TABLE `food_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addcart`
--
ALTER TABLE `addcart`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `food_cat`
--
ALTER TABLE `food_cat`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
