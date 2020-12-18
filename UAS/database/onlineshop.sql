-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 02:29 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Yamagata'),
(2, 'Akita'),
(3, 'Hokkaido'),
(4, 'Yamaguchi'),
(5, 'Ishikawa'),
(6, 'Tokushima');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(153, 70, '::1', 27, 1),
(154, 71, '::1', 27, 1),
(167, 59, '::1', 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Stickers'),
(2, 'Pins'),
(3, 'Prints'),
(4, 'Plushies'),
(5, 'Tees'),
(6, 'Postcards'),
(7, 'Tote Bag');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'angganaro3@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(3, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Indonesia', 123456, 'Angga', '999', '12/22', 5, 45, 9),
(4, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'JP', 123456, 'Angga', '18888', '12/22', 2, 18, 1),
(5, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 's', 123456, 'Angga', '1', '12/22', 1, 9, 1),
(6, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 1, 9, 1),
(7, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 1, 9, 1),
(8, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 1, 699, 1),
(9, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 1, 9, 1),
(10, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 1, 9, 1),
(11, 26, 'I Gede Angga Narotama', 'angganaro3@gmail.com', 'Perumahan Raya Kampial blok K.14', 'Bali', 'Bali', 123456, 'Angga', '1', '12/22', 2, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(92, 3, 74, 1, 9),
(93, 3, 61, 1, 9),
(94, 3, 60, 1, 9),
(95, 3, 59, 1, 9),
(96, 3, 62, 1, 9),
(97, 4, 64, 1, 9),
(98, 4, 61, 1, 9),
(99, 5, 71, 1, 9),
(100, 6, 61, 1, 9),
(101, 7, 71, 1, 9),
(102, 8, 85, 1, 699),
(103, 9, 60, 1, 9),
(104, 10, 72, 1, 9),
(105, 11, 61, 1, 9),
(106, 11, 64, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(59, 1, 1, 'Justice Tricycle', 9, 'JT', '1607260652_Justice Tricycle Stiker.jpg', 'JT'),
(60, 1, 1, 'Kyuka & Daisy', 9, 'KD', '1607260672_Kyuka Daisy Sticker.jpg', 'KD'),
(61, 5, 1, 'Ours Tee', 9, 'OT', '1607260839_Ours Tee.jpg', 'OT'),
(62, 5, 1, 'Kappa Tee', 9, 'KT', '1607260867_Kappa Tee.jpg', 'KT'),
(63, 5, 1, 'Peace Tee', 9, 'PT', '1607260884_Peace Tee.jpg', 'PT'),
(64, 5, 1, 'Ramen Tee', 9, 'RT', '1607260895_Ramen Tee.jpg', '2'),
(69, 1, 1, 'Kappa', 9, 'Kappa', '1607259767_Kappa Sticker.jpg', 'Kappa'),
(70, 1, 1, 'Shiba', 9, 'Shiba', '1607259798_Shiba-sticker.jpg', 'Shiba'),
(71, 1, 1, 'Ina Overalls', 9, 'Ina Overalls', '1607259337_Ina Overalls Sticker.jpg', 'Ina'),
(72, 1, 1, 'Ina Shamisen', 9, 'Ina Shamisen', '1607259509_Ina Shamisen Sticker.jpg', 'Ina'),
(73, 1, 1, 'Kaiju', 9, 'Kaiju', '1607259576_Kaiju Sticker.jpg', 'Kaiju'),
(74, 1, 1, 'Nakayubi Katana', 9, 'Naka', '1607259604_Nakayubi Katana Sticker.jpg', 'Naka'),
(83, 1, 1, 'Sticker', 0, 'Sticker Collections', '1607091399_Red Stickers.jpg', 'Stickers'),
(84, 2, 1, 'Pins', 699, 'This is Pins', '1607094316_Masked Shiba Pin.jpg', 'Pins'),
(85, 5, 1, 'Tees', 699, 'Tees', '1607094382_BFF Tee.jpg', 'Tees'),
(98, 5, 1, 'Masked Shiba Tee', 9, 'MST', '1607261302_Masked Shiba Tee.jpg', 'MST'),
(99, 5, 1, 'Senjafuda Tee', 9, 'ST', '1607261335_Senjafuda Tee.jpg', 'ST'),
(100, 5, 1, 'Tako Tee', 9, 'TT', '1607261498_Tako Tee.jpg', 'TT'),
(101, 4, 1, 'Cat Plushie', 9, 'CP', '1607261663_Cat Plushie.jpg', 'CP'),
(102, 4, 1, 'Catto Plushie', 9, 'CPP', '1607261679_Catto Plushie.jpg', 'CPP'),
(103, 4, 1, 'Dog Plushie', 9, 'DOG', '1607261704_Dog Plushie.jpg', '1'),
(108, 7, 1, 'Bad Luck Tote', 0, 'BLT', '1607262005_Bad Luck Tote.jpg', '2'),
(109, 7, 1, 'Ninja Tote', 9, 'NT', '1607262019_Ninja Tote.jpg', '1'),
(110, 3, 1, 'Kabuki Ramen Print', 9, '1', '1607262045_Kabuki Ramen Print.jpg', '1'),
(111, 3, 1, 'Shiba Print', 9, '-', '1607262060_Shiba Print.jpg', '1'),
(112, 3, 1, 'Yokai School Print', 9, '-', '1607262082_Yokai School Print.jpg', '1'),
(113, 6, 1, 'Season Postcard', 9, '-', '1607262123_Days Postcards.jpg', '1'),
(114, 6, 1, 'Fall Season', 9, '-', '1607262140_Japan Fall Season Postcards.jpg', '1'),
(115, 6, 1, 'Spirit Cat Postcard', 9, '-', '1607262280_Spirit Cat.jpg', '1'),
(116, 6, 1, 'Spirit Cat', 9, '-', '1607262429_Spirit Cat.jpg', '1'),
(117, 6, 1, 'Fox Postcard', 9, '-', '1607262463_Fox.jpg', '1'),
(118, 6, 1, 'Tanuki', 9, '-', '1607262514_Tanuki.jpg', '1'),
(119, 6, 1, 'Kappa', 9, '-', '1607262542_Kappa.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'I Gede Angga', 'Narotama', 'angganaro3@gmail.com', '1234567890S', '0000000000', 'Perumahan Raya Kampial blok K.14', 'Bali'),
(27, 'Lucky', 'Aldi', 'luckyaldi@gmail.com', 'Lucky12345', '0812345678', 'Bali', 'Bali');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

---------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
