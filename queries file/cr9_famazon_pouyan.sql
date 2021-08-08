-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 08, 2021 at 05:38 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr9_famazon_pouyan`
--
CREATE DATABASE IF NOT EXISTS `cr9_famazon_pouyan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr9_famazon_pouyan`;

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `address_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_city_id` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `house` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`address_id`, `fk_customer_id`, `fk_city_id`, `zip`, `street`, `house`) VALUES
(1, 1, 1, 1220, 'mora', 12),
(2, 2, 2, 60280, 'berlingasse', 34),
(3, 9, 3, 1010, 'Lapit', 223);

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`category_id`, `title`) VALUES
(1, 'Mobile'),
(2, 'Laptop'),
(3, 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `Cities`
--

CREATE TABLE `Cities` (
  `city_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `fk_state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Cities`
--

INSERT INTO `Cities` (`city_id`, `title`, `fk_state_id`) VALUES
(1, 'Veinna', 1),
(2, 'Berlin', 2),
(3, 'Paris', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Companies`
--

CREATE TABLE `Companies` (
  `company_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Companies`
--

INSERT INTO `Companies` (`company_id`, `title`) VALUES
(1, 'Apple'),
(2, 'Samsong'),
(3, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

CREATE TABLE `Countries` (
  `country_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Countries`
--

INSERT INTO `Countries` (`country_id`, `title`, `country_code`) VALUES
(1, 'Austria', 1),
(2, 'Germany', 2),
(4, 'France', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `family` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `name`, `family`, `email`, `phone`) VALUES
(1, 'Mary', 'Ardi', 'mary@yahoo.com', 660382020),
(2, 'Arvid', 'Merlo', 'Arvid@hotmail.com', 668285493),
(9, 'Paul', 'Dora', 'paul@google.com', 663458712);

-- --------------------------------------------------------

--
-- Table structure for table `Famazon`
--

CREATE TABLE `Famazon` (
  `famazon_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `url` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Famazon`
--

INSERT INTO `Famazon` (`famazon_id`, `title`, `url`) VALUES
(1, 'Famazon', 'www.famazon.com');

-- --------------------------------------------------------

--
-- Table structure for table `Ordered_Products`
--

CREATE TABLE `Ordered_Products` (
  `orderd_product_id` int(11) NOT NULL,
  `fk_order_id` int(11) NOT NULL,
  `fk_product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Ordered_Products`
--

INSERT INTO `Ordered_Products` (`orderd_product_id`, `fk_order_id`, `fk_product_id`, `price`, `quantity`, `order_date`) VALUES
(10, 1, 1, 1000, 2, '2021-07-07'),
(11, 2, 1, 1000, 1, '2021-08-08'),
(12, 2, 2, 900, 1, '2021-08-08'),
(13, 2, 3, 800, 1, '2021-08-08'),
(14, 3, 1, 4000, 4, '2021-06-06'),
(15, 3, 3, 800, 1, '2021-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_shipping_id` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `status_order` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `shipping_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `fk_customer_id`, `fk_shipping_id`, `fk_address_id`, `quantity`, `total_cost`, `status_order`, `date`, `shipping_date`) VALUES
(1, 1, 1, 1, 2, 2000, 'done', '2021-08-07', '2021-08-07'),
(2, 2, 2, 2, 3, 2700, 'done', '2021-08-08', '2021-08-08'),
(3, 9, 3, 3, 5, 4800, 'done', '2021-08-08', '2021-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `Peyments`
--

CREATE TABLE `Peyments` (
  `peyment_id` int(11) NOT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `peyment_method` varchar(30) DEFAULT NULL,
  `tracking_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Peyments`
--

INSERT INTO `Peyments` (`peyment_id`, `fk_order_id`, `peyment_method`, `tracking_code`) VALUES
(1, 1, 'Online Banking', 23),
(2, 2, 'Master Card', 21),
(3, 3, 'PayPal', 564);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `fk_category_id` int(11) DEFAULT NULL,
  `fk_company_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `fk_category_id`, `fk_company_id`, `name`, `price`, `image`) VALUES
(1, 1, 1, 'iphoneX', 1000, NULL),
(2, 2, 3, 'Hua', 900, NULL),
(3, 3, 2, 'e-Watch', 800, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Shipping_Companies`
--

CREATE TABLE `Shipping_Companies` (
  `shipping_company_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Shipping_Companies`
--

INSERT INTO `Shipping_Companies` (`shipping_company_id`, `title`) VALUES
(1, 'Fedex'),
(2, 'DHL'),
(3, 'DB');

-- --------------------------------------------------------

--
-- Table structure for table `States`
--

CREATE TABLE `States` (
  `state_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `fk_country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `States`
--

INSERT INTO `States` (`state_id`, `title`, `fk_country_id`) VALUES
(1, 'Vienna', 1),
(2, 'Berlin', 2),
(3, 'Paris Region', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `Cities`
--
ALTER TABLE `Cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `fk_state_id` (`fk_state_id`);

--
-- Indexes for table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `Countries`
--
ALTER TABLE `Countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Famazon`
--
ALTER TABLE `Famazon`
  ADD PRIMARY KEY (`famazon_id`);

--
-- Indexes for table `Ordered_Products`
--
ALTER TABLE `Ordered_Products`
  ADD PRIMARY KEY (`orderd_product_id`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_order_id` (`fk_order_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_shipping_id` (`fk_shipping_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `Peyments`
--
ALTER TABLE `Peyments`
  ADD PRIMARY KEY (`peyment_id`),
  ADD KEY `fk_order_id` (`fk_order_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_category_id` (`fk_category_id`);

--
-- Indexes for table `Shipping_Companies`
--
ALTER TABLE `Shipping_Companies`
  ADD PRIMARY KEY (`shipping_company_id`);

--
-- Indexes for table `States`
--
ALTER TABLE `States`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `fk_country_id` (`fk_country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Cities`
--
ALTER TABLE `Cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Countries`
--
ALTER TABLE `Countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Famazon`
--
ALTER TABLE `Famazon`
  MODIFY `famazon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Ordered_Products`
--
ALTER TABLE `Ordered_Products`
  MODIFY `orderd_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Peyments`
--
ALTER TABLE `Peyments`
  MODIFY `peyment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Shipping_Companies`
--
ALTER TABLE `Shipping_Companies`
  MODIFY `shipping_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `States`
--
ALTER TABLE `States`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`fk_city_id`) REFERENCES `Cities` (`city_id`);

--
-- Constraints for table `Cities`
--
ALTER TABLE `Cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`fk_state_id`) REFERENCES `States` (`state_id`);

--
-- Constraints for table `Ordered_Products`
--
ALTER TABLE `Ordered_Products`
  ADD CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `Products` (`product_id`),
  ADD CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`fk_order_id`) REFERENCES `Orders` (`order_id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `Customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`fk_shipping_id`) REFERENCES `Shipping_Companies` (`shipping_company_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`fk_address_id`) REFERENCES `Address` (`address_id`);

--
-- Constraints for table `Peyments`
--
ALTER TABLE `Peyments`
  ADD CONSTRAINT `peyments_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `Orders` (`order_id`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_company_id`) REFERENCES `Companies` (`company_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`fk_category_id`) REFERENCES `Categories` (`category_id`);

--
-- Constraints for table `States`
--
ALTER TABLE `States`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`fk_country_id`) REFERENCES `Countries` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
