-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2014 at 05:21 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `infusionsoft-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of admin users' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `user_name`, `password`, `created_at`, `modified_at`) VALUES
(1, 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', '2013-10-23 00:00:00', '2013-10-24 14:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `help_text` varchar(250) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `key`, `label`, `help_text`, `value`, `created_at`, `modified_at`) VALUES
(1, 'infusionsoft_app_name', 'App Name', 'Name of the app for integration. Ex. infu-fastway', 'infusionFastWay', '0000-00-00 00:00:00', '2014-01-19 15:01:15'),
(2, 'infusionsoft_domain_name', 'Domain Name', 'Sudomain of your infusion app instance. example: For: os140.infusionsoft.com  please enter: os140', 'os140', '0000-00-00 00:00:00', '2014-01-19 15:01:15'),
(3, 'infusionsoft_key', 'API Key', 'Your Infusionsoft  API Key', '7b6e7bf7278e41be52eda569b9f563bf', '0000-00-00 00:00:00', '2014-01-19 15:01:15'),
(4, 'fastway_key', 'FastWay API Key', 'API Key For FastWay Courier', 'DKE2308ASD1', '0000-00-00 00:00:00', '2014-01-19 15:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `infusionsoft_orders`
--

DROP TABLE IF EXISTS `infusionsoft_orders`;
CREATE TABLE IF NOT EXISTS `infusionsoft_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderStatus` varchar(10) NOT NULL,
  `JobRecurringId` varchar(10) NOT NULL,
  `DueDate` datetime NOT NULL,
  `ShipCity` varchar(100) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `JobStatus` varchar(10) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `ShipStreet2` varchar(100) NOT NULL,
  `ShipStreet1` varchar(100) NOT NULL,
  `StartDate` datetime NOT NULL,
  `ShipFirstName` varchar(100) NOT NULL,
  `OrderType` varchar(10) NOT NULL,
  `ShipPhone` varchar(100) NOT NULL,
  `ContactId` varchar(250) NOT NULL,
  `JobTitle` varchar(250) NOT NULL,
  `ShipZip` varchar(100) NOT NULL,
  `ShipLastName` varchar(100) NOT NULL,
  `ShipCompany` varchar(100) NOT NULL,
  `ShipCountry` varchar(100) NOT NULL,
  `ShipState` varchar(100) NOT NULL,
  `infu_Id` varchar(100) NOT NULL,
  `itemsFetched` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `infu_Id` (`infu_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `infusionsoft_orders`
--

INSERT INTO `infusionsoft_orders` (`id`, `OrderStatus`, `JobRecurringId`, `DueDate`, `ShipCity`, `DateCreated`, `JobStatus`, `ProductId`, `ShipStreet2`, `ShipStreet1`, `StartDate`, `ShipFirstName`, `OrderType`, `ShipPhone`, `ContactId`, `JobTitle`, `ShipZip`, `ShipLastName`, `ShipCompany`, `ShipCountry`, `ShipState`, `infu_Id`, `itemsFetched`, `created_at`, `modified_at`) VALUES
(1, '1', '0', '2013-07-22 01:02:03', '', '2013-07-22 01:03:17', 'Quote', '0', '', '', '2013-07-22 01:02:03', 'Russell', 'Online', '+6478568552', '5', 'Shopping Cart', '', 'Brown', 'Digital Stream Ltd', '', '', '1', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(2, '1', '0', '2013-09-17 03:59:04', 'Havelock North', '2013-09-17 04:13:58', 'Quote', '0', 'Rd 12', '563 Maraetotara Rd', '2013-09-17 03:59:04', 'Ben Test', 'Online', '06 8747663', '11', 'Shopping Cart', '4294', 'Warren', '', 'New Zealand', '', '3', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(3, '1', '0', '2013-09-18 03:27:52', 'Napier', '2013-09-18 03:36:33', 'Quote', '0', 'Hospital Hill', '7 Coleman Terrace', '2013-09-18 03:27:52', 'Vince', 'Online', '0274186335', '19', 'Shopping Cart', '4110', 'Mayberry', '', 'New Zealand', '', '5', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(4, '1', '0', '2013-09-18 00:00:00', 'Napier', '2013-09-18 17:48:55', 'Quote', '0', 'Bay View', '83 Rogers Rd', '2013-09-18 17:48:27', 'Rosemary', 'Offline', '06 8366997', '23', 'Rosemary - Order (18/9/2013)', '4104', '-Hallamore', '', '', '', '7', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(5, '1', '0', '2013-09-18 19:36:10', 'New Plymouth', '2013-09-18 20:01:34', 'Quote', '0', 'Brooklands', '11a. Exeter Street', '2013-09-18 19:36:10', 'Bev', 'Online', '06 7532465', '25', 'Shopping Cart', '4310', 'Lindsay', '', 'New Zealand', '', '9', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(6, '1', '0', '2013-09-18 23:09:57', '', '2013-09-18 23:11:01', 'Quote', '0', '', '', '2013-09-18 23:09:57', 'John', 'Online', '(555) 555-5555', '11297', 'Order Form', '', 'Infusion', '', '', '', '11', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(7, '1', '0', '2013-09-19 21:36:27', '', '2013-09-19 21:37:05', 'Quote', '0', '', '', '2013-09-19 21:36:27', 'Jo', 'Offline', '06 8739894', '11301', '', '', 'White', '', '', '', '13', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(8, '1', '0', '2013-09-19 00:00:00', 'Tutira, Hawkes Bay', '2013-09-19 21:37:14', 'Quote', '0', '', 'P O Box 90', '2013-09-19 21:19:43', 'Rae', 'Online', '06 8397979', '11067', 'Shopping Cart', '4162', 'Martin', '', 'New Zealand', '', '15', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(9, '1', '0', '2013-09-19 22:16:28', '', '2013-09-19 22:21:44', 'Quote', '0', '', '', '2013-09-19 22:16:28', '', 'Online', '', '11301', 'Shopping Cart', '', '', '', '', '', '17', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(10, '1', '0', '2013-09-20 00:38:46', 'Havelock North', '2013-09-20 01:20:42', 'Quote', '0', '', '563 Maraetotara Rd', '2013-09-20 00:38:46', 'BePure', 'Online', '06 8747663', '7', 'Shopping Cart', '4294', 'Admin', 'BePure', 'New Zealand', '', '19', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(11, '1', '0', '2013-09-20 01:20:46', 'Havelock North', '2013-09-20 01:22:54', 'Quote', '0', '', '563 Maraetotara Rd', '2013-09-20 01:20:46', 'BePure', 'Online', '06 8747663', '7', 'Shopping Cart', '4294', 'Admin', 'BePure', 'New Zealand', '', '21', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(12, '1', '0', '2013-09-21 04:01:28', 'Napier', '2013-09-21 04:41:58', 'Quote', '0', 'Onekawa', '16a Addison Street', '2013-09-21 04:01:28', 'Samantha', 'Online', '0211489094', '11305', 'Shopping Cart', '4112', 'Stevens', '', 'New Zealand', '', '22', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(13, '1', '0', '2013-09-22 00:00:00', 'Te Awanga', '2013-09-22 00:58:36', 'Quote', '0', '', '9 Leyland Road', '2013-09-22 00:45:51', 'Nives', 'Online', '068750731', '11316', 'Shopping Cart', '4102', 'Frigerio', '', 'New Zealand', 'Hawkes bay', '24', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(14, '1', '0', '2013-09-23 03:04:17', 'Waipukurau', '2013-09-23 03:32:08', 'Quote', '0', '', 'P.O. Box 69', '2013-09-23 03:04:17', 'Annette', 'Online', '06 8588698', '761', 'Shopping Cart', '4242', 'Elliott', '', 'New Zealand', '', '26', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(15, '1', '0', '2013-09-23 18:20:31', 'Palmerston North', '2013-09-23 18:27:54', 'Quote', '0', 'Tennant Drive', 'Massey University', '2013-09-23 18:20:31', 'Helen', 'Online', '021 1577766', '11340', 'Shopping Cart', '4410', 'Poole', 'IFNHH', 'New Zealand', '', '28', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(16, '1', '0', '2013-09-23 19:24:36', 'Napier', '2013-09-23 19:43:52', 'Quote', '0', '', '30 Higgins Street', '2013-09-23 19:24:36', 'Debra', 'Online', '021756944', '831', 'Shopping Cart', '4110', 'Springford', '', 'New Zealand', '', '30', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(17, '1', '0', '2013-09-23 23:52:02', 'Aokautere', '2013-09-23 23:55:07', 'Quote', '0', 'RD 1', '6 Homestead Lane', '2013-09-23 23:52:02', 'Sandra', 'Online', '06 3544552', '4909', 'Shopping Cart', '4471', 'Rowe', '', 'New Zealand', '', '48', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(18, '1', '0', '2013-09-23 21:08:17', 'Napier', '2013-09-23 21:13:16', 'Quote', '0', 'Taradale', '46a Murphy Rd', '2013-09-23 21:08:17', 'Karen', 'Online', '06 8451901', '11342', 'Shopping Cart', '4110', 'Molloy', '', 'New Zealand', '', '34', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(19, '1', '0', '2013-09-23 21:13:22', 'Hastings', '2013-09-23 21:19:50', 'Quote', '0', 'Frimley', '1017 Fitzroy Ave', '2013-09-23 21:13:22', 'Julie', 'Online', '06 8783929', '11255', 'Shopping Cart', '4122', 'McCash', '', 'New Zealand', '', '36', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(20, '1', '0', '2013-09-23 21:19:54', 'Napier', '2013-09-23 21:24:32', 'Quote', '0', 'Marewa', '20 Barton Ave', '2013-09-23 21:19:54', 'Sharon', 'Online', '06 8434063 or 027 251 2091', '10971', 'Shopping Cart', '4110', 'Steed', '', 'New Zealand', '', '38', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(21, '1', '0', '2013-09-23 00:00:00', 'Hastings', '2013-09-23 21:32:20', 'Quote', '0', 'Flaxmere', '175 Flaxmere Ave', '2013-09-23 21:24:38', 'Heather', 'Online', '8799464', '3055', 'Shopping Cart', '4120', 'Hartley', '', 'New Zealand', '', '40', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(22, '1', '0', '2013-09-23 22:33:36', 'Napier', '2013-09-23 22:36:51', 'Quote', '0', 'Onekawa', '32/1 Riverbend Road', '2013-09-23 22:33:36', 'Clive', 'Online', '06 8421602 or 021 2668166', '11344', 'Shopping Cart', '4110', 'Hutley', '', 'New Zealand', '', '42', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(23, '1', '0', '2013-09-23 22:37:00', 'Napier', '2013-09-23 22:40:59', 'Quote', '0', 'Bay View', '83 Rogers Road', '2013-09-23 22:37:00', 'Rosemary', 'Online', '06 8366997', '23', 'Shopping Cart', '4104', 'Hallimore', '', 'New Zealand', '', '44', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(24, '1', '0', '2013-09-23 22:48:59', 'RD 7 Inglewood', '2013-09-23 22:51:59', 'Quote', '0', '', '15 Mungu Street', '2013-09-23 22:48:59', 'Anika', 'Online', '067565526', '11314', 'Shopping Cart', '4387', 'Ramholdt', '', 'New Zealand', '', '46', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(25, '1', '0', '2013-09-24 00:00:00', '', '2013-09-24 00:06:38', 'Quote', '0', '', '', '2013-09-24 00:06:07', 'Debbie', 'Offline', '06 8762079', '11279', 'Debbie Cumming Order (24/9/2013)', '', 'Cumming', '', '', '', '50', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(26, '1', '0', '2013-09-24 00:37:25', 'Hastings', '2013-09-24 00:49:55', 'Quote', '0', 'Mahora', '301 Frederick St', '2013-09-24 00:37:25', 'Steve', 'Online', '06 8706092', '9189', 'Shopping Cart', '4120', 'Webb', '', 'New Zealand', 'HAWKES BAY', '52', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(27, '1', '0', '2013-09-24 00:47:30', 'Napier', '2013-09-24 00:53:19', 'Quote', '0', '', '8 Cape Place', '2013-09-24 00:47:30', 'Anne', 'Online', '8432348', '7343', 'Shopping Cart', '4112', 'RAGG', '', 'New Zealand', '', '54', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(28, '1', '0', '2013-09-24 00:35:26', 'Christchurch', '2013-09-24 00:53:21', 'Quote', '0', 'Waimairi Beach', '139 Aston Drive', '2013-09-24 00:35:26', 'Kat', 'Online', '3882933', '9565', 'Shopping Cart', '8083', 'McAra', '', 'New Zealand', '', '56', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(29, '1', '0', '2013-09-24 02:44:07', 'whangarei', '2013-09-24 02:51:00', 'Quote', '0', 'tikipunga', '47 denby cres', '2013-09-24 02:44:07', 'carolyn', 'Online', '021830689', '2493', 'Shopping Cart', '0112', 'mariu', '', 'New Zealand', '', '58', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(30, '1', '0', '2013-09-24 03:10:42', 'Auckland', '2013-09-24 03:23:57', 'Quote', '0', 'Birkenhead', '71B Pupuke Road', '2013-09-24 03:10:42', 'Shereen', 'Online', '0212446677', '11247', 'Shopping Cart', '0627', 'L''Almont', '', 'New Zealand', '', '60', '0', '2014-01-20 14:43:56', '2014-01-20 14:43:56'),
(31, '1', '0', '2013-09-24 03:11:29', 'Takapau', '2013-09-24 03:33:36', 'Quote', '0', '', '1 Charles St', '2013-09-24 03:11:29', 'Bronwyn', 'Online', '06 8558108', '9673', 'Shopping Cart', '4203', 'Ellmers', '', 'New Zealand', 'CENTRAL HAWKES BAY', '62', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(32, '1', '0', '2013-09-24 03:28:51', 'Wellington', '2013-09-24 03:34:04', 'Quote', '0', 'Newlands', '34 Fitzpatrick Street', '2013-09-24 03:28:51', 'Anne', 'Online', '0276167211', '8423', 'Shopping Cart', '6037', 'Phillips', '', 'New Zealand', '', '64', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(33, '1', '0', '2013-09-24 04:02:19', 'Alexandra', '2013-09-24 04:27:21', 'Quote', '0', '', '47 Bantry st', '2013-09-24 04:02:19', 'Maria', 'Online', '034485456', '8567', 'Shopping Cart', '9320', 'Shea', '', 'New Zealand', '', '66', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(34, '1', '0', '2013-09-24 04:45:27', 'Napier', '2013-09-24 04:56:10', 'Quote', '0', 'Taradale', '3/414 Gloucester St', '2013-09-24 04:45:27', 'Anna', 'Online', '0274 150 933', '10925', 'Shopping Cart', '4112', 'Norton', '', 'New Zealand', '', '68', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(35, '1', '0', '2013-09-24 04:16:44', 'Havelock North', '2013-09-24 04:57:31', 'Quote', '0', 'Havelock North', '48 McLean Road RD12', '2013-09-24 04:16:44', 'Linda', 'Online', '0276025901', '10017', 'Shopping Cart', '4294', 'Mulvay', '', 'New Zealand', '', '70', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(36, '1', '0', '2013-09-24 04:54:14', 'Kapiti Coast', '2013-09-24 05:06:33', 'Quote', '0', 'Paekakariki', '8 Pingau Street', '2013-09-24 04:54:14', 'Jan', 'Online', '021 157 27 99', '5509', 'Shopping Cart', '5034', 'Cox', '', 'New Zealand', '', '72', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(37, '1', '0', '2013-09-24 05:12:22', 'Wellington', '2013-09-24 05:31:39', 'Quote', '0', 'Melrose', '4 Buckingham St', '2013-09-24 05:12:22', 'Louise', 'Online', '0212433930', '5613', 'Shopping Cart', '6023', 'Cavanagh', '', 'New Zealand', '', '74', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(38, '1', '0', '2013-09-24 05:14:54', 'Hastings', '2013-09-24 05:31:51', 'Quote', '0', 'RD 2', '76 Farmlet Road', '2013-09-24 05:14:54', 'Tracy', 'Online', '068784268', '7935', 'Shopping Cart', '4172', 'Govett', '', 'New Zealand', '', '76', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(39, '1', '0', '2013-09-24 05:24:33', 'Christchurch', '2013-09-24 06:03:51', 'Quote', '0', 'Huntsbury', '101 HUntsbury Ave', '2013-09-24 05:24:33', 'Anna', 'Online', '02102752045', '10257', 'Shopping Cart', '8022', 'Siggs-Webster', '', 'New Zealand', '', '78', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(40, '1', '0', '2013-09-24 16:29:34', 'Napier', '2013-09-24 16:36:17', 'Quote', '0', 'RD2', '34 Boyd Road', '2013-09-24 16:29:34', 'Beverley', 'Online', '068443174', '97', 'Shopping Cart', '4182', 'Brooks', '', 'New Zealand', '', '80', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(41, '1', '0', '2013-09-24 17:20:11', 'Napier', '2013-09-24 17:26:13', 'Quote', '0', 'Awatoto', '109 Squire Drive', '2013-09-24 17:20:11', 'Ian', 'Online', '06 833 6666', '1789', 'Shopping Cart', '4110', 'Mackenzie', '', 'New Zealand', '', '82', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(42, '1', '0', '2013-09-30 05:45:41', 'Paraparaumu', '2013-09-30 05:52:19', 'Quote', '0', 'Raumati South', '89 The Esplanade', '2013-09-30 05:45:41', 'Nadine', 'Online', '027 4401116', '11400', 'Shopping Cart', '5032', 'Brown', '', 'New Zealand', '', '192', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(43, '1', '0', '2013-09-30 19:24:04', 'Pokeno', '2013-09-30 19:28:56', 'Quote', '0', 'R.D.1', '75 McKenzie Road', '2013-09-30 19:24:04', 'Philippa', 'Online', '021 241 9444', '11402', 'Shopping Cart', '2471', 'Karl', '', 'New Zealand', '', '194', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(44, '1', '0', '2013-09-24 20:38:27', 'Queensland', '2013-09-24 20:43:28', 'Quote', '0', 'Loganholme', 'P O Box 3997', '2013-09-24 20:38:27', 'Tracie', 'Online', '07 3209 7744', '4281', 'Shopping Cart', '4129', 'Madsen', 'Madsen Law', 'Australia', '', '88', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(45, '1', '0', '2013-09-25 00:26:59', 'Napier', '2013-09-25 00:33:58', 'Quote', '0', 'Taradale', '101 Puketapu Road', '2013-09-25 00:26:59', 'Inge', 'Online', '06 845 3629', '1811', 'Shopping Cart', '4112', 'Mills', '', 'New Zealand', '', '90', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(46, '1', '0', '2013-09-25 00:26:42', 'Auckland', '2013-09-25 00:46:25', 'Quote', '0', 'Northcote Pt', '52 Princes St', '2013-09-25 00:26:42', 'Christine', 'Online', '09 418 5505', '4855', 'Shopping Cart', '0627', 'Bell', '', 'New Zealand', '', '92', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(47, '1', '0', '2013-09-25 00:51:36', 'Christchurch', '2013-09-25 01:03:00', 'Quote', '0', 'Halswell', '50 Rearsby Drive', '2013-09-25 00:51:36', 'Neil', 'Online', '03-943-4982', '6147', 'Shopping Cart', '8025', 'Lilley', '', 'New Zealand', 'CANTERBURY', '94', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(48, '1', '0', '2013-09-25 01:03:42', 'Tauranga', '2013-09-25 01:16:52', 'Quote', '0', 'Matua', '88 Manuwai Drive', '2013-09-25 01:03:42', 'Rosalind', 'Online', '07 570 0432', '5879', 'Shopping Cart', '3110', 'Macpherson', '', 'New Zealand', '', '96', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(49, '1', '0', '2013-09-25 02:48:52', 'Hastings', '2013-09-25 02:54:30', 'Quote', '0', 'Havelock North', '11 Woodford Heights', '2013-09-25 02:48:52', 'Sue', 'Online', '0276268040', '8163', 'Shopping Cart', '4130', 'Edwards', '', 'New Zealand', '', '98', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57'),
(50, '1', '0', '2013-09-25 02:53:56', 'Havelock North', '2013-09-25 02:55:37', 'Quote', '0', '', '563 Maraetotara Rd', '2013-09-25 02:53:56', 'Ben', 'Online', '06 8747663', '7', 'Shopping Cart', '4294', 'Warren', 'BePure', 'New Zealand', '', '100', '0', '2014-01-20 14:43:57', '2014-01-20 14:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `infusionsoft_order_items`
--

DROP TABLE IF EXISTS `infusionsoft_order_items`;
CREATE TABLE IF NOT EXISTS `infusionsoft_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` varchar(20) NOT NULL,
  `OrderItem_infu_Id` varchar(20) NOT NULL,
  `ProductId` varchar(20) NOT NULL,
  `ItemName` varchar(20) NOT NULL,
  `Qty` varchar(20) NOT NULL,
  `ItemDescription` varchar(250) NOT NULL,
  `ItemType` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `OrderItem_infu_Id` (`OrderItem_infu_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=195 ;

--
-- Dumping data for table `infusionsoft_order_items`
--

INSERT INTO `infusionsoft_order_items` (`id`, `OrderId`, `OrderItem_infu_Id`, `ProductId`, `ItemName`, `Qty`, `ItemDescription`, `ItemType`, `created_at`, `modified_at`) VALUES
(1, '1', '1', '189', 'Test Product', '1', '', '4', '2014-01-23 16:58:59', '2014-01-23 16:58:59'),
(5, '5', '5', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:00', '2014-01-23 16:59:00'),
(7, '5', '7', '0', 'sorry', '1', 'discount code for 20% gross discount', '11', '2014-01-23 16:59:00', '2014-01-23 16:59:00'),
(11, '9', '11', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:01', '2014-01-23 16:59:01'),
(15, '13', '15', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:02', '2014-01-23 16:59:02'),
(17, '15', '17', '93', 'L- Glutamine', '1', 'Balance L-Glutamine powder for gut healing and sleep', '4', '2014-01-23 16:59:02', '2014-01-23 16:59:02'),
(21, '15', '21', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:03', '2014-01-23 16:59:03'),
(34, '22', '34', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:05', '2014-01-23 16:59:05'),
(36, '22', '36', '0', 'Free Shipping On Ord', '1', 'Free Shipping On Orders Over $80 - International', '14', '2014-01-23 16:59:05', '2014-01-23 16:59:05'),
(38, '24', '38', '129', 'Adrenal Regenerator', '1', 'Regenerate your adrenals, regenerate your life - a raw whole food supplement to support healthy adre', '4', '2014-01-23 16:59:06', '2014-01-23 16:59:06'),
(40, '24', '40', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:06', '2014-01-23 16:59:06'),
(42, '15', '42', '137', 'Herbal Adrenal Formu', '1', 'Rebuild your energy!', '4', '2014-01-23 16:59:06', '2014-01-23 16:59:06'),
(44, '26', '44', '137', 'Herbal Adrenal Formu', '1', 'Rebuild your energy!', '4', '2014-01-23 16:59:07', '2014-01-23 16:59:07'),
(46, '26', '46', '47', 'Joint Flex', '1', 'The ultimate for healthy joints - Quite simply New Zealand''s best ''high quality'' joint formulation.', '4', '2014-01-23 16:59:07', '2014-01-23 16:59:07'),
(48, '26', '48', '67', 'Super Boost C', '1', 'Formerly Daily C - We''ve taken the best Vitamin C on the market and brought it in under the BePure b', '4', '2014-01-23 16:59:05', '2014-01-23 16:59:05'),
(50, '26', '50', '131', 'Adrenal Super Stress', '1', 'The nutrition your adrenals need.', '4', '2014-01-23 16:59:07', '2014-01-23 16:59:07'),
(52, '26', '52', '45', 'John Oneills Advance', '1', 'Simply the best CoQ 10, A 150mg natural CoQ10 in a phosphate delivery system. 60 capsules.', '4', '2014-01-23 16:59:08', '2014-01-23 16:59:08'),
(54, '26', '54', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:08', '2014-01-23 16:59:08'),
(56, '26', '56', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:08', '2014-01-23 16:59:08'),
(58, '26', '58', '0', 'Free Shipping On Ord', '1', 'Free Shipping On Orders Over $80 - International', '14', '2014-01-23 16:59:09', '2014-01-23 16:59:09'),
(60, '28', '60', '31', 'Bio Kult Probiotics ', '1', 'Best Value..$75 for 120 Capsules. The original 14 strain probiotic in NZ - For immune and digestive', '4', '2014-01-23 16:59:09', '2014-01-23 16:59:09'),
(62, '28', '62', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:09', '2014-01-23 16:59:09'),
(64, '30', '64', '7', 'Blue Ice - Cod Liver', '1', 'The only Cod liver oil Capsule in NZ that has the natural levels of Vitamin A and D retained Blue Ic', '4', '2014-01-23 16:59:10', '2014-01-23 16:59:10'),
(66, '30', '66', '5', 'BePure ONE - Single ', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '4', '2014-01-23 16:59:10', '2014-01-23 16:59:10'),
(68, '30', '68', '79', 'Aluminium Free Deodo', '1', 'Finally a natural deodorant without aluminium that works!! ''It''s All Good'' lives up to it''s name!!', '4', '2014-01-23 16:59:11', '2014-01-23 16:59:11'),
(70, '30', '70', '87', 'Elete Electrolytes', '1', 'Turns any drink into a ''Sports Drink'' without any added sugar. Can assist in cellular hydration.', '4', '2014-01-23 16:59:11', '2014-01-23 16:59:11'),
(72, '30', '72', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:11', '2014-01-23 16:59:11'),
(74, '30', '74', '0', 'Free Shipping On Ord', '1', 'Free Shipping On Orders Over $80 - International', '14', '2014-01-23 16:59:12', '2014-01-23 16:59:12'),
(82, '34', '82', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:13', '2014-01-23 16:59:13'),
(88, '36', '88', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:14', '2014-01-23 16:59:14'),
(90, '36', '90', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:14', '2014-01-23 16:59:14'),
(92, '36', '92', '0', 'Free Shipping On Ord', '1', 'Free Shipping On Orders Over $80 - International', '14', '2014-01-23 16:59:15', '2014-01-23 16:59:15'),
(94, '38', '94', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:15', '2014-01-23 16:59:15'),
(96, '38', '96', '0', 'Ship by Order Total ', '1', 'Free Shipping On Orders Over $80.00', '1', '2014-01-23 16:59:16', '2014-01-23 16:59:16'),
(98, '38', '98', '0', 'Free Shipping On Ord', '1', 'Free Shipping On Orders Over $80 - International', '14', '2014-01-23 16:59:16', '2014-01-23 16:59:16'),
(100, '40', '100', '3', 'BePure One - Autoshi', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '9', '2014-01-23 16:59:16', '2014-01-23 16:59:16'),
(192, '64', '192', '5', 'BePure ONE - Single ', '1', 'The Ultimate Daily Supplement - years in development - lose all those supplements and take BePure ON', '4', '2014-01-23 16:59:13', '2014-01-23 16:59:13'),
(194, '64', '194', '0', '20%', '1', '20% off discount code', '11', '2014-01-23 16:59:14', '2014-01-23 16:59:14');
