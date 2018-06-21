-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2018 at 09:16 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms_db`
--
CREATE DATABASE pms_db;
USE pms_db;
-- --------------------------------------------------------

--
-- Table structure for table `tblbranch`
--

CREATE TABLE `tblbranch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `b_contact_no` int(15) NOT NULL,
  `b_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblbranch`
--

INSERT INTO `tblbranch` (`branch_id`, `branch_name`, `b_email`, `b_contact_no`, `b_address`, `b_status`, `created_date`) VALUES
(7, 'Alpha House', 'alpha@gmail.com', 1717445566, 'F-Block,alpha,Oginga Odinga Street', 'enable', '2016-06-22 06:50:30'),
(8, 'Mirpur-10', 'mirpur.10@gmail.com', 1717445567, 'K-Block,Mirpur-10,Dhaka-1216', 'disable', '2016-06-22 07:23:45'),
(9, 'Fce', 'segtism@gmail.com', 2147483647, 'FCE', 'enable', '2016-07-26 04:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblsuper_admin`
--

CREATE TABLE `tblsuper_admin` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `password` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblsuper_admin`
--

INSERT INTO `tblsuper_admin` (`user_id`, `name`, `email`, `password`, `added_date`) VALUES
(1, 'Robert', 'devsolver@gmail.com', 123456, '2015-06-29 03:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_admin`
--

CREATE TABLE `tbl_add_admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_admin`
--

INSERT INTO `tbl_add_admin` (`aid`, `name`, `email`, `password`, `branch_id`, `added_date`) VALUES
(2, 'Joseph Odhiambo', 'devsolver@gmail.com', '654321', 7, '2016-06-22 07:00:10'),
(4, 'Shoaib Mohammad Saleheen', 'shoaib@gmail.com', '123456', 8, '2016-06-22 08:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_bill`
--

CREATE TABLE `tbl_add_bill` (
  `bill_id` int(11) NOT NULL,
  `bill_type` int(6) NOT NULL,
  `bill_date` varchar(200) NOT NULL,
  `bill_month` int(11) NOT NULL,
  `bill_year` int(11) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `deposit_bank_name` varchar(200) NOT NULL,
  `bill_details` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_bill`
--

INSERT INTO `tbl_add_bill` (`bill_id`, `bill_type`, `bill_date`, `bill_month`, `bill_year`, `total_amount`, `deposit_bank_name`, `bill_details`, `branch_id`, `added_date`) VALUES
(2, 1, '01/05/2016', 6, 8, '25000.00', 'Australian Military Bank', 'Done', 7, '2016-05-07 06:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_bill_type`
--

CREATE TABLE `tbl_add_bill_type` (
  `bt_id` int(11) NOT NULL,
  `bill_type` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_bill_type`
--

INSERT INTO `tbl_add_bill_type` (`bt_id`, `bill_type`, `added_date`) VALUES
(1, 'Gas', '2016-05-05 06:49:35'),
(3, 'Water', '2016-05-05 06:50:39'),
(4, 'Electric', '2016-05-05 06:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_builder_info`
--

CREATE TABLE `tbl_add_builder_info` (
  `bldrid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_building_info`
--

CREATE TABLE `tbl_add_building_info` (
  `bldid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `security_guard_mobile` varchar(200) NOT NULL,
  `secrataty_mobile` varchar(200) NOT NULL,
  `moderator_mobile` varchar(200) NOT NULL,
  `building_make_year` varchar(200) NOT NULL,
  `b_name` varchar(200) NOT NULL,
  `b_address` varchar(200) NOT NULL,
  `b_phone` varchar(200) NOT NULL,
  `building_image` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_building_info`
--

INSERT INTO `tbl_add_building_info` (`bldid`, `name`, `address`, `security_guard_mobile`, `secrataty_mobile`, `moderator_mobile`, `building_make_year`, `b_name`, `b_address`, `b_phone`, `building_image`, `branch_id`, `added_date`) VALUES
(9, 'Ocean House', '199 George Street, Sydney, New South Wales 2000, Australia.', '98765423', '98654123', '986542315', '8', 'Adam Bore', '201 George Street, Sydney, New South Wales 2000, Australia.', '987564231', '8603E2A0-5A86-541C-C1B9-4A774F1C4CB1.jpg', 7, '2016-07-26 04:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_complain`
--

CREATE TABLE `tbl_add_complain` (
  `complain_id` int(11) NOT NULL,
  `c_title` varchar(200) NOT NULL,
  `c_description` varchar(200) NOT NULL,
  `c_date` varchar(200) NOT NULL,
  `c_month` int(6) NOT NULL,
  `c_year` int(6) NOT NULL,
  `c_userid` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_complain`
--

INSERT INTO `tbl_add_complain` (`complain_id`, `c_title`, `c_description`, `c_date`, `c_month`, `c_year`, `c_userid`, `branch_id`, `added_date`) VALUES
(8, 'Water Problem', 'Every day getting water problem', '07/05/2016', 5, 8, 1, 7, '2016-05-07 06:41:42'),
(9, 'Water Problem', 'Water has gone for 3 days...', '25/06/2016', 6, 8, 0, 8, '2016-06-25 07:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_employee`
--

CREATE TABLE `tbl_add_employee` (
  `eid` int(11) NOT NULL,
  `e_name` varchar(200) NOT NULL,
  `e_email` varchar(200) NOT NULL,
  `e_contact` varchar(200) NOT NULL,
  `e_pre_address` varchar(200) NOT NULL,
  `e_per_address` varchar(200) NOT NULL,
  `e_nid` varchar(200) NOT NULL,
  `e_designation` int(11) NOT NULL,
  `e_date` varchar(200) NOT NULL,
  `ending_date` varchar(200) NOT NULL,
  `e_status` int(1) NOT NULL DEFAULT '0',
  `e_password` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_employee`
--

INSERT INTO `tbl_add_employee` (`eid`, `e_name`, `e_email`, `e_contact`, `e_pre_address`, `e_per_address`, `e_nid`, `e_designation`, `e_date`, `ending_date`, `e_status`, `e_password`, `image`, `branch_id`, `added_date`) VALUES
(5, 'Jhonson', 'jhonson@yahoo.com', '98654722', 'Sydney, Australia', 'Mildura, Australia', '98654723', 5, '01/05/2016', '', 1, '123456', 'F3364889-C40D-4CD7-36AE-CBF3502C5E70.jpg', 7, '2016-05-07 05:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_employee_salary_setup`
--

CREATE TABLE `tbl_add_employee_salary_setup` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `month_id` int(11) NOT NULL,
  `xyear` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `issue_date` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_employee_salary_setup`
--

INSERT INTO `tbl_add_employee_salary_setup` (`emp_id`, `emp_name`, `designation`, `month_id`, `xyear`, `amount`, `issue_date`, `branch_id`, `added_date`) VALUES
(8, '5', 'Security Gard', 5, 8, '10000.00', '05/05/2016', 7, '2016-05-07 06:57:11'),
(9, '5', 'Security Gard', 4, 8, '10000.00', '05/04/2016', 7, '2016-05-07 07:01:59'),
(10, '5', 'Security Gard', 1, 8, '50.25', '22/06/2016', 8, '2016-06-26 05:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_fair`
--

CREATE TABLE `tbl_add_fair` (
  `f_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `unit_no` int(11) NOT NULL,
  `rid` int(11) NOT NULL DEFAULT '0',
  `month_id` int(11) NOT NULL,
  `xyear` int(11) NOT NULL,
  `rent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `water_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `electric_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gas_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `security_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `utility_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `other_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_rent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `issue_date` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_fair`
--

INSERT INTO `tbl_add_fair` (`f_id`, `type`, `floor_no`, `unit_no`, `rid`, `month_id`, `xyear`, `rent`, `water_bill`, `electric_bill`, `gas_bill`, `security_bill`, `utility_bill`, `other_bill`, `total_rent`, `issue_date`, `branch_id`, `added_date`) VALUES
(21, 'Rented', 4, 18, 10, 5, 8, '10000.00', '500.00', '500.00', '650.00', '700.00', '200.00', '200.00', '12750.00', '01/05/2016', 7, '2016-05-07 06:21:34'),
(23, 'Rented', 1, 14, 11, 5, 8, '12000.00', '500.00', '500.00', '500.00', '500.00', '500.00', '500.00', '15000.00', '09/05/2016', 7, '2016-05-09 07:52:44'),
(24, 'Owner', 1, 15, 6, 5, 8, '0.00', '500.00', '500.00', '500.00', '500.00', '500.00', '500.00', '3000.00', '09/05/2016', 7, '2016-05-09 07:56:34'),
(25, 'Rented', 1, 14, 11, 6, 8, '12000.00', '500.00', '500.00', '500.00', '500.00', '500.00', '500.00', '15000.00', '18/05/2016', 8, '2016-05-18 09:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_floor`
--

CREATE TABLE `tbl_add_floor` (
  `fid` int(11) NOT NULL,
  `floor_no` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_floor`
--

INSERT INTO `tbl_add_floor` (`fid`, `floor_no`, `branch_id`, `added_date`) VALUES
(1, 'First Floor', 7, '2016-03-22 09:07:46'),
(3, 'Second Floor', 7, '2016-03-22 09:09:25'),
(4, 'Third Floor', 7, '2016-03-22 09:09:38'),
(5, 'Fourth Floor', 7, '2016-03-22 09:09:53'),
(6, 'Fifth Floor', 7, '2016-03-22 09:10:05'),
(8, 'Sixth Floor', 7, '2016-05-02 08:27:51'),
(9, '7th Floor', 8, '2016-06-22 07:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_fund`
--

CREATE TABLE `tbl_add_fund` (
  `fund_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `xyear` int(11) NOT NULL,
  `f_date` varchar(200) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `purpose` varchar(400) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_fund`
--

INSERT INTO `tbl_add_fund` (`fund_id`, `owner_id`, `month_id`, `xyear`, `f_date`, `total_amount`, `purpose`, `branch_id`, `added_date`) VALUES
(2, 6, 5, 8, '01/05/2016', '5000.00', 'Monthly Collection', 7, '2016-05-07 06:30:25'),
(3, 7, 5, 8, '01/05/2016', '5000.00', 'Monthly Collection', 7, '2016-05-07 06:30:54'),
(4, 6, 1, 10, '19/01/2018', '100000.00', 'Rent', 7, '2018-01-19 05:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_maintenance_cost`
--

CREATE TABLE `tbl_add_maintenance_cost` (
  `mcid` int(11) NOT NULL,
  `m_title` varchar(200) NOT NULL,
  `m_date` varchar(200) NOT NULL,
  `m_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `m_details` varchar(200) NOT NULL,
  `xmonth` int(11) NOT NULL DEFAULT '0',
  `xyear` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_maintenance_cost`
--

INSERT INTO `tbl_add_maintenance_cost` (`mcid`, `m_title`, `m_date`, `m_amount`, `m_details`, `xmonth`, `xyear`, `branch_id`, `added_date`) VALUES
(3, 'Making Color', '05/05/2016', '15000.00', 'Making Color', 5, 8, 7, '2016-05-07 06:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_management_committee`
--

CREATE TABLE `tbl_add_management_committee` (
  `mc_id` int(11) NOT NULL,
  `mc_name` varchar(200) NOT NULL,
  `mc_email` varchar(200) NOT NULL,
  `mc_contact` varchar(200) NOT NULL,
  `mc_pre_address` varchar(500) NOT NULL,
  `mc_per_address` varchar(500) NOT NULL,
  `mc_nid` varchar(200) NOT NULL,
  `member_type` int(11) NOT NULL,
  `mc_joining_date` varchar(200) NOT NULL,
  `mc_ending_date` varchar(200) NOT NULL,
  `mc_status` int(1) NOT NULL DEFAULT '0',
  `image` varchar(200) NOT NULL,
  `mc_password` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_management_committee`
--

INSERT INTO `tbl_add_management_committee` (`mc_id`, `mc_name`, `mc_email`, `mc_contact`, `mc_pre_address`, `mc_per_address`, `mc_nid`, `member_type`, `mc_joining_date`, `mc_ending_date`, `mc_status`, `image`, `mc_password`, `branch_id`, `added_date`) VALUES
(3, 'Mark Tailor', 'mark@yahoo.com', '9760895241', 'Sydney, Australia.', 'Sydney, Australia.', '989755621', 2, '01/05/2016', '', 1, 'E651453C-5E11-1390-FA0E-3185C562BFF2.jpg', 'vRDk5@Uxk', 7, '2016-05-07 06:28:16'),
(4, 'Mark Wough', 'wough@yahoo.com', '9760895245', 'Sydney, Australia', 'Sydney, Australia', '989755625', 1, '01/05/2016', '', 1, 'F01633C5-A25E-401D-D461-B4CCFBC7D077.jpg', '?ZsEf3tve', 7, '2016-05-07 06:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_member_type`
--

CREATE TABLE `tbl_add_member_type` (
  `member_id` int(11) NOT NULL,
  `member_type` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_member_type`
--

INSERT INTO `tbl_add_member_type` (`member_id`, `member_type`, `added_date`) VALUES
(1, 'Moderator', '2016-04-10 08:56:20'),
(2, 'Secretary General', '2016-04-10 08:59:10'),
(3, 'Member', '2016-04-10 08:59:22'),
(6, 'Caretaker', '2016-04-10 09:00:17'),
(7, 'Pioneer', '2018-01-04 06:37:29'),
(8, 'Security Guard', '2018-01-04 07:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_month_setup`
--

CREATE TABLE `tbl_add_month_setup` (
  `m_id` int(11) NOT NULL,
  `month_name` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_month_setup`
--

INSERT INTO `tbl_add_month_setup` (`m_id`, `month_name`, `added_date`) VALUES
(1, 'January', '2016-04-11 09:16:15'),
(2, 'February', '2016-04-11 09:16:25'),
(3, 'March', '2016-04-11 09:16:30'),
(4, 'April', '2016-04-11 09:16:36'),
(5, 'May', '2018-01-04 12:27:49'),
(6, 'June', '2016-04-11 09:16:48'),
(7, 'July', '2016-04-11 09:16:53'),
(8, 'August', '2016-04-11 09:16:59'),
(9, 'September', '2016-04-11 09:17:06'),
(10, 'October', '2016-04-11 09:17:14'),
(11, 'November', '2016-04-11 09:17:24'),
(12, 'December', '2016-04-11 09:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner`
--

CREATE TABLE `tbl_add_owner` (
  `ownid` int(11) NOT NULL,
  `o_name` varchar(200) NOT NULL,
  `o_email` varchar(200) NOT NULL,
  `o_contact` varchar(200) NOT NULL,
  `o_pre_address` varchar(500) NOT NULL,
  `o_per_address` varchar(500) NOT NULL,
  `o_nid` varchar(200) NOT NULL,
  `o_password` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_owner`
--

INSERT INTO `tbl_add_owner` (`ownid`, `o_name`, `o_email`, `o_contact`, `o_pre_address`, `o_per_address`, `o_nid`, `o_password`, `image`, `branch_id`, `created_date`) VALUES
(6, 'Tailor', 'mark@yahoo.com', '9760895241', 'Sydney, Australia.', 'Sydney, Australia.', '989755621', '123456', 'B763C074-5F01-CA16-2F66-B1301F4711D5.jpg', 8, '2016-05-07 05:36:33'),
(7, 'Mr. Kamal', 'wough@yahoo.com', '01818245789', 'Mirpur-1,Dhaka-1216', 'Mirpur-1,Dhaka-1216', '152158475468765465', '123456', '75460C0D-FF83-345E-07F0-35945B714882.jpg', 7, '2016-05-07 05:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner_unit_relation`
--

CREATE TABLE `tbl_add_owner_unit_relation` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_owner_unit_relation`
--

INSERT INTO `tbl_add_owner_unit_relation` (`id`, `owner_id`, `unit_id`) VALUES
(1, 6, 14),
(2, 6, 15),
(3, 7, 17),
(4, 7, 16);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_owner_utility`
--

CREATE TABLE `tbl_add_owner_utility` (
  `owner_utility_id` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `unit_no` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `rent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `water_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `electric_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gas_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `security_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `utility_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `other_bill` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_rent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `issue_date` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_rent`
--

CREATE TABLE `tbl_add_rent` (
  `rid` int(11) NOT NULL,
  `r_name` varchar(200) NOT NULL,
  `r_email` varchar(200) NOT NULL,
  `r_contact` varchar(200) NOT NULL,
  `r_address` varchar(200) NOT NULL,
  `r_nid` varchar(200) NOT NULL,
  `r_floor_no` int(11) NOT NULL,
  `r_unit_no` int(11) NOT NULL,
  `r_advance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `r_rent_pm` decimal(15,2) NOT NULL DEFAULT '0.00',
  `r_date` varchar(200) NOT NULL,
  `r_gone_date` varchar(200) NOT NULL,
  `r_password` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `r_status` int(1) NOT NULL DEFAULT '1',
  `r_month` int(11) NOT NULL,
  `r_year` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_rent`
--

INSERT INTO `tbl_add_rent` (`rid`, `r_name`, `r_email`, `r_contact`, `r_address`, `r_nid`, `r_floor_no`, `r_unit_no`, `r_advance`, `r_rent_pm`, `r_date`, `r_gone_date`, `r_password`, `image`, `r_status`, `r_month`, `r_year`, `branch_id`, `added_date`) VALUES
(10, 'Ricky', 'ricky@yahoo.com', '97605412', 'Melbourne, Australia', '9865321', 4, 18, '20000.00', '10000.00', '07/05/2016', '', '123456', '4F48CED3-86CC-D435-B42B-730D3BC36FC4.png', 1, 5, 8, 7, '2016-05-07 05:42:54'),
(11, 'Mishel Johnson', 'michel@gmail.com', '01717456321', 'Mirpur-1,Dhaka-1216', '1521807785324', 1, 14, '12000.00', '12000.00', '09/05/2016', '', '123456', '853C9E05-44BF-A647-7749-9782F98E667A.jpg', 1, 5, 8, 8, '2016-05-09 07:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_unit`
--

CREATE TABLE `tbl_add_unit` (
  `uid` int(11) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `unit_no` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_unit`
--

INSERT INTO `tbl_add_unit` (`uid`, `floor_no`, `unit_no`, `branch_id`, `status`, `added_date`) VALUES
(14, 1, '1B', 7, 1, '2016-05-07 05:30:42'),
(15, 1, '1A', 7, 0, '2016-05-07 05:30:53'),
(16, 3, '2B', 7, 0, '2016-05-07 05:31:02'),
(17, 3, '2A', 7, 0, '2016-05-07 05:31:11'),
(18, 4, '3A', 7, 1, '2016-05-07 05:31:22'),
(19, 4, '3B', 7, 0, '2016-05-07 05:31:33'),
(20, 5, '4B', 7, 0, '2016-05-07 05:31:48'),
(21, 5, '4A', 7, 0, '2016-05-07 05:31:57'),
(22, 6, '5B', 7, 0, '2016-05-07 05:32:07'),
(23, 6, '5A', 7, 0, '2016-05-07 05:32:16'),
(24, 8, '6A', 7, 0, '2016-05-07 05:32:24'),
(25, 8, '6B', 7, 0, '2016-05-07 05:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_utility_bill`
--

CREATE TABLE `tbl_add_utility_bill` (
  `utility_id` int(11) NOT NULL,
  `gas_bill` varchar(200) NOT NULL,
  `security_bill` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_utility_bill`
--

INSERT INTO `tbl_add_utility_bill` (`utility_id`, `gas_bill`, `security_bill`, `added_date`) VALUES
(3, '650', '1000', '2016-05-07 06:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_year_setup`
--

CREATE TABLE `tbl_add_year_setup` (
  `y_id` int(11) NOT NULL,
  `xyear` varchar(200) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_year_setup`
--

INSERT INTO `tbl_add_year_setup` (`y_id`, `xyear`, `added_date`) VALUES
(3, '2011', '2016-04-13 11:02:33'),
(4, '2012', '2016-04-13 11:02:38'),
(5, '2013', '2016-04-13 11:02:42'),
(6, '2014', '2016-04-13 11:02:47'),
(7, '2015', '2016-04-13 11:02:51'),
(8, '2016', '2016-04-13 11:02:56'),
(9, '2017', '2016-04-13 11:03:04'),
(10, '2018', '2016-04-13 11:03:08'),
(11, '2019', '2016-04-13 11:03:12'),
(12, '2020', '2016-04-13 11:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `lang_code` varchar(100) CHARACTER SET utf8 NOT NULL,
  `currency` varchar(20) CHARACTER SET utf8 NOT NULL,
  `currency_seperator` varchar(5) CHARACTER SET utf8 NOT NULL,
  `currency_position` varchar(10) NOT NULL,
  `date_format` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`lang_code`, `currency`, `currency_seperator`, `currency_position`, `date_format`) VALUES
('English', 'Ksh', '.', 'left', '2018-01-04 02:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitor`
--

CREATE TABLE `tbl_visitor` (
  `vid` int(11) NOT NULL,
  `issue_date` varchar(100) CHARACTER SET utf8 NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(100) CHARACTER SET utf8 NOT NULL,
  `address` varchar(500) CHARACTER SET utf8 NOT NULL,
  `floor_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `intime` varchar(50) CHARACTER SET utf8 NOT NULL,
  `outtime` varchar(50) CHARACTER SET utf8 NOT NULL,
  `xmonth` int(11) NOT NULL,
  `xyear` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_visitor`
--

INSERT INTO `tbl_visitor` (`vid`, `issue_date`, `name`, `mobile`, `address`, `floor_id`, `unit_id`, `intime`, `outtime`, `xmonth`, `xyear`, `branch_id`, `added_date`) VALUES
(8, '07/05/2016', 'Stuward Macgill', '98745632', '34 Railway Street, Sydney, Australia', 4, 18, '09:00', '05:00', 5, 8, 7, '2016-05-07 06:46:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbranch`
--
ALTER TABLE `tblbranch`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `b_email` (`b_email`);

--
-- Indexes for table `tblsuper_admin`
--
ALTER TABLE `tblsuper_admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_add_admin`
--
ALTER TABLE `tbl_add_admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_add_bill`
--
ALTER TABLE `tbl_add_bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `bill_month` (`bill_month`),
  ADD KEY `bill_year` (`bill_year`),
  ADD KEY `bill_type` (`bill_type`);

--
-- Indexes for table `tbl_add_bill_type`
--
ALTER TABLE `tbl_add_bill_type`
  ADD PRIMARY KEY (`bt_id`);

--
-- Indexes for table `tbl_add_builder_info`
--
ALTER TABLE `tbl_add_builder_info`
  ADD PRIMARY KEY (`bldrid`);

--
-- Indexes for table `tbl_add_building_info`
--
ALTER TABLE `tbl_add_building_info`
  ADD PRIMARY KEY (`bldid`),
  ADD UNIQUE KEY `address` (`address`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_add_complain`
--
ALTER TABLE `tbl_add_complain`
  ADD PRIMARY KEY (`complain_id`),
  ADD KEY `c_month` (`c_month`,`c_year`,`c_userid`,`branch_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `c_year` (`c_year`);

--
-- Indexes for table `tbl_add_employee`
--
ALTER TABLE `tbl_add_employee`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_add_employee_salary_setup`
--
ALTER TABLE `tbl_add_employee_salary_setup`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `xyear` (`xyear`);

--
-- Indexes for table `tbl_add_fair`
--
ALTER TABLE `tbl_add_fair`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `floor_no` (`floor_no`),
  ADD KEY `unit_no` (`unit_no`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `xyear` (`xyear`);

--
-- Indexes for table `tbl_add_floor`
--
ALTER TABLE `tbl_add_floor`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_add_fund`
--
ALTER TABLE `tbl_add_fund`
  ADD PRIMARY KEY (`fund_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `xyear` (`xyear`);

--
-- Indexes for table `tbl_add_maintenance_cost`
--
ALTER TABLE `tbl_add_maintenance_cost`
  ADD PRIMARY KEY (`mcid`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `xmonth` (`xmonth`),
  ADD KEY `xyear` (`xyear`);

--
-- Indexes for table `tbl_add_management_committee`
--
ALTER TABLE `tbl_add_management_committee`
  ADD PRIMARY KEY (`mc_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `member_type` (`member_type`);

--
-- Indexes for table `tbl_add_member_type`
--
ALTER TABLE `tbl_add_member_type`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `tbl_add_month_setup`
--
ALTER TABLE `tbl_add_month_setup`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `tbl_add_owner`
--
ALTER TABLE `tbl_add_owner`
  ADD PRIMARY KEY (`ownid`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_add_owner_unit_relation`
--
ALTER TABLE `tbl_add_owner_unit_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `tbl_add_owner_utility`
--
ALTER TABLE `tbl_add_owner_utility`
  ADD PRIMARY KEY (`owner_utility_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `month_id` (`month_id`);

--
-- Indexes for table `tbl_add_rent`
--
ALTER TABLE `tbl_add_rent`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `r_floor_no` (`r_floor_no`),
  ADD KEY `r_unit_no` (`r_unit_no`),
  ADD KEY `r_month` (`r_month`),
  ADD KEY `r_year` (`r_year`);

--
-- Indexes for table `tbl_add_unit`
--
ALTER TABLE `tbl_add_unit`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `floor_no` (`floor_no`);

--
-- Indexes for table `tbl_add_utility_bill`
--
ALTER TABLE `tbl_add_utility_bill`
  ADD PRIMARY KEY (`utility_id`);

--
-- Indexes for table `tbl_add_year_setup`
--
ALTER TABLE `tbl_add_year_setup`
  ADD PRIMARY KEY (`y_id`);

--
-- Indexes for table `tbl_visitor`
--
ALTER TABLE `tbl_visitor`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `floor_id` (`floor_id`),
  ADD KEY `xmonth` (`xmonth`),
  ADD KEY `xyear` (`xyear`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbranch`
--
ALTER TABLE `tblbranch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tblsuper_admin`
--
ALTER TABLE `tblsuper_admin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_add_admin`
--
ALTER TABLE `tbl_add_admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_add_bill`
--
ALTER TABLE `tbl_add_bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_add_bill_type`
--
ALTER TABLE `tbl_add_bill_type`
  MODIFY `bt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_add_builder_info`
--
ALTER TABLE `tbl_add_builder_info`
  MODIFY `bldrid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_add_building_info`
--
ALTER TABLE `tbl_add_building_info`
  MODIFY `bldid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_add_complain`
--
ALTER TABLE `tbl_add_complain`
  MODIFY `complain_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_add_employee`
--
ALTER TABLE `tbl_add_employee`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_add_employee_salary_setup`
--
ALTER TABLE `tbl_add_employee_salary_setup`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_add_fair`
--
ALTER TABLE `tbl_add_fair`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_add_floor`
--
ALTER TABLE `tbl_add_floor`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_add_fund`
--
ALTER TABLE `tbl_add_fund`
  MODIFY `fund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_add_maintenance_cost`
--
ALTER TABLE `tbl_add_maintenance_cost`
  MODIFY `mcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_add_management_committee`
--
ALTER TABLE `tbl_add_management_committee`
  MODIFY `mc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_add_member_type`
--
ALTER TABLE `tbl_add_member_type`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_add_month_setup`
--
ALTER TABLE `tbl_add_month_setup`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_add_owner`
--
ALTER TABLE `tbl_add_owner`
  MODIFY `ownid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_add_owner_unit_relation`
--
ALTER TABLE `tbl_add_owner_unit_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_add_owner_utility`
--
ALTER TABLE `tbl_add_owner_utility`
  MODIFY `owner_utility_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_add_rent`
--
ALTER TABLE `tbl_add_rent`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_add_unit`
--
ALTER TABLE `tbl_add_unit`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_add_utility_bill`
--
ALTER TABLE `tbl_add_utility_bill`
  MODIFY `utility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_add_year_setup`
--
ALTER TABLE `tbl_add_year_setup`
  MODIFY `y_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_visitor`
--
ALTER TABLE `tbl_visitor`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_add_admin`
--
ALTER TABLE `tbl_add_admin`
  ADD CONSTRAINT `tbl_add_admin_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_bill`
--
ALTER TABLE `tbl_add_bill`
  ADD CONSTRAINT `tbl_add_bill_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_bill_ibfk_2` FOREIGN KEY (`bill_month`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_bill_ibfk_3` FOREIGN KEY (`bill_year`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_bill_ibfk_5` FOREIGN KEY (`bill_type`) REFERENCES `tbl_add_bill_type` (`bt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_building_info`
--
ALTER TABLE `tbl_add_building_info`
  ADD CONSTRAINT `tbl_add_building_info_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_complain`
--
ALTER TABLE `tbl_add_complain`
  ADD CONSTRAINT `tbl_add_complain_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_complain_ibfk_2` FOREIGN KEY (`c_year`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_complain_ibfk_3` FOREIGN KEY (`c_month`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_employee`
--
ALTER TABLE `tbl_add_employee`
  ADD CONSTRAINT `tbl_add_employee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_employee_salary_setup`
--
ALTER TABLE `tbl_add_employee_salary_setup`
  ADD CONSTRAINT `tbl_add_employee_salary_setup_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_employee_salary_setup_ibfk_2` FOREIGN KEY (`month_id`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_employee_salary_setup_ibfk_3` FOREIGN KEY (`xyear`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_fair`
--
ALTER TABLE `tbl_add_fair`
  ADD CONSTRAINT `tbl_add_fair_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fair_ibfk_2` FOREIGN KEY (`floor_no`) REFERENCES `tbl_add_floor` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fair_ibfk_3` FOREIGN KEY (`unit_no`) REFERENCES `tbl_add_unit` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fair_ibfk_4` FOREIGN KEY (`month_id`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fair_ibfk_5` FOREIGN KEY (`xyear`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_floor`
--
ALTER TABLE `tbl_add_floor`
  ADD CONSTRAINT `tbl_add_floor_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_fund`
--
ALTER TABLE `tbl_add_fund`
  ADD CONSTRAINT `tbl_add_fund_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fund_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `tbl_add_owner` (`ownid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fund_ibfk_3` FOREIGN KEY (`month_id`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_fund_ibfk_4` FOREIGN KEY (`xyear`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_maintenance_cost`
--
ALTER TABLE `tbl_add_maintenance_cost`
  ADD CONSTRAINT `tbl_add_maintenance_cost_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_maintenance_cost_ibfk_2` FOREIGN KEY (`xmonth`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_maintenance_cost_ibfk_3` FOREIGN KEY (`xyear`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_management_committee`
--
ALTER TABLE `tbl_add_management_committee`
  ADD CONSTRAINT `tbl_add_management_committee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_management_committee_ibfk_2` FOREIGN KEY (`member_type`) REFERENCES `tbl_add_member_type` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_owner`
--
ALTER TABLE `tbl_add_owner`
  ADD CONSTRAINT `tbl_add_owner_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_owner_unit_relation`
--
ALTER TABLE `tbl_add_owner_unit_relation`
  ADD CONSTRAINT `tbl_add_owner_unit_relation_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `tbl_add_unit` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_owner_unit_relation_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `tbl_add_owner` (`ownid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_owner_utility`
--
ALTER TABLE `tbl_add_owner_utility`
  ADD CONSTRAINT `tbl_add_owner_utility_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_owner_utility_ibfk_2` FOREIGN KEY (`month_id`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_rent`
--
ALTER TABLE `tbl_add_rent`
  ADD CONSTRAINT `tbl_add_rent_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_rent_ibfk_2` FOREIGN KEY (`r_floor_no`) REFERENCES `tbl_add_floor` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_rent_ibfk_3` FOREIGN KEY (`r_unit_no`) REFERENCES `tbl_add_unit` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_rent_ibfk_4` FOREIGN KEY (`r_month`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_rent_ibfk_5` FOREIGN KEY (`r_year`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_add_unit`
--
ALTER TABLE `tbl_add_unit`
  ADD CONSTRAINT `tbl_add_unit_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_add_unit_ibfk_2` FOREIGN KEY (`floor_no`) REFERENCES `tbl_add_floor` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_visitor`
--
ALTER TABLE `tbl_visitor`
  ADD CONSTRAINT `tbl_visitor_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `tblbranch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_visitor_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `tbl_add_unit` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_visitor_ibfk_3` FOREIGN KEY (`floor_id`) REFERENCES `tbl_add_floor` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_visitor_ibfk_4` FOREIGN KEY (`xmonth`) REFERENCES `tbl_add_month_setup` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_visitor_ibfk_5` FOREIGN KEY (`xyear`) REFERENCES `tbl_add_year_setup` (`y_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
