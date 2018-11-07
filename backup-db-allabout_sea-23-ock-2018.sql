-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2018 at 01:50 PM
-- Server version: 5.5.61-cll
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `allabout_sea`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_member`
--

CREATE TABLE `alamat_member` (
  `id_alamat` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `nama_alamat` varchar(150) NOT NULL,
  `idpropinsi` int(11) NOT NULL,
  `idkota` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alamat_member`
--

INSERT INTO `alamat_member` (`id_alamat`, `id_member`, `nama_alamat`, `idpropinsi`, `idkota`, `alamat`, `date_add`, `date_upd`, `level`) VALUES
(1, 1, 'alamat', 8, 135, '', '2018-05-16 12:51:35', '2018-05-16 12:51:35', 0),
(2, 5, 'alamat', 15, 242, '', '2018-05-26 11:16:48', '2018-05-26 11:16:48', 0),
(3, 1, 'alamat', 21, 328, '', '2018-05-30 15:20:30', '2018-05-30 15:20:30', 0),
(4, 4, 'alamat', 20, 313, '', '2018-05-31 09:45:09', '2018-05-31 09:45:09', 0),
(5, 5, 'alamat', 3, 65, '', '2018-08-21 10:14:28', '2018-08-21 10:14:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_transaction` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `qty` varchar(50) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cat` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cat`, `id_parent`, `category`, `level`) VALUES
(1, 0, 'Wetsuit', 0),
(2, 1, 'Man', 0),
(3, 1, 'Woman', 0),
(4, 0, 'Swimming', 0),
(5, 0, 'Accessories', 0),
(6, 4, 'Man', 0),
(7, 4, 'Women', 0),
(11, 4, 'Unisex', 0),
(13, 1, 'Unisex', 0),
(14, 5, 'Knee Pad', 0),
(15, 5, 'Stubby Holder', 0),
(16, 5, 'Hat', 0),
(17, 5, 'Vest', 0),
(18, 5, 'Hood', 0),
(19, 5, 'Others', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` varchar(2250) NOT NULL,
  `messages` varchar(5250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `subject`, `messages`) VALUES
(1, 'aaa', 'dd', 'ss', 'asdad');

-- --------------------------------------------------------

--
-- Table structure for table `custom_cart`
--

CREATE TABLE `custom_cart` (
  `id_custom_cart` int(11) NOT NULL,
  `kode_custom_cart` varchar(50) NOT NULL,
  `id_member` int(11) NOT NULL,
  `gender` varchar(55) NOT NULL,
  `wet_suit_type` varchar(50) NOT NULL,
  `arm_zipper` varchar(50) NOT NULL,
  `ankle_zipper` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_cart`
--

INSERT INTO `custom_cart` (`id_custom_cart`, `kode_custom_cart`, `id_member`, `gender`, `wet_suit_type`, `arm_zipper`, `ankle_zipper`, `image`) VALUES
(6, '8ksf4', 3, 'male', 'front', 'no', 'no', 'Custom8cb63a92dd789215a66c1d6aca62d920.png'),
(7, 'rsMYg', 3, 'male', 'front', 'no', 'no', 'Custom2791d68e703086d2145f3be3fb224bcd.png'),
(8, 'lyNAX', 3, '', '', '', '', 'Custombad3562b3096222f71ff023330ed7280.png');

-- --------------------------------------------------------

--
-- Table structure for table `custom_measure`
--

CREATE TABLE `custom_measure` (
  `id_measure` int(11) NOT NULL,
  `kode_custom_cart` varchar(50) NOT NULL,
  `id_member` int(11) NOT NULL,
  `total_body_height` int(11) NOT NULL,
  `head` int(11) NOT NULL,
  `neck` int(11) NOT NULL,
  `bust_chest` int(11) NOT NULL,
  `waist` int(11) NOT NULL,
  `stomach` int(11) NOT NULL,
  `abdomen` int(11) NOT NULL,
  `hip` int(11) NOT NULL,
  `shoulder` int(11) NOT NULL,
  `shoulder_elbow` int(11) NOT NULL,
  `shoulder_wrist` int(11) NOT NULL,
  `arm_hole` int(11) NOT NULL,
  `upper_arm` int(11) NOT NULL,
  `bicep` int(11) NOT NULL,
  `elbow` int(11) NOT NULL,
  `forarm` int(11) NOT NULL,
  `wrist` int(11) NOT NULL,
  `outside_leg_length` int(11) NOT NULL,
  `inside_leg_length` int(11) NOT NULL,
  `upper_thigh` int(11) NOT NULL,
  `thigh` int(11) NOT NULL,
  `above_knee` int(11) NOT NULL,
  `knee` int(11) NOT NULL,
  `below_knee` int(11) NOT NULL,
  `calf` int(11) NOT NULL,
  `below_calf` int(11) NOT NULL,
  `above_ankle` int(11) NOT NULL,
  `shoulder_burst` int(11) NOT NULL,
  `shoulder_waist` int(11) NOT NULL,
  `shoulder_hip` int(11) NOT NULL,
  `hip_knee_length` int(11) NOT NULL,
  `knee_ankle_length` int(11) NOT NULL,
  `back_shoulder` int(11) NOT NULL,
  `dorsum` int(11) NOT NULL,
  `crotch_point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_measure`
--

INSERT INTO `custom_measure` (`id_measure`, `kode_custom_cart`, `id_member`, `total_body_height`, `head`, `neck`, `bust_chest`, `waist`, `stomach`, `abdomen`, `hip`, `shoulder`, `shoulder_elbow`, `shoulder_wrist`, `arm_hole`, `upper_arm`, `bicep`, `elbow`, `forarm`, `wrist`, `outside_leg_length`, `inside_leg_length`, `upper_thigh`, `thigh`, `above_knee`, `knee`, `below_knee`, `calf`, `below_calf`, `above_ankle`, `shoulder_burst`, `shoulder_waist`, `shoulder_hip`, `hip_knee_length`, `knee_ankle_length`, `back_shoulder`, `dorsum`, `crotch_point`) VALUES
(2, 'lJaGN', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '23glW', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'E2gQP', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `detail` text NOT NULL,
  `description` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `code`, `title`, `id_category`, `id_cat`, `price`, `detail`, `description`, `date_add`, `date_upd`, `level`) VALUES
(1, 'iLjEE', 'blue Wetsuit', 4, 7, '250', 'lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime', ' lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime', '0000-00-00 00:00:00', '2018-04-18 11:39:58', 0),
(3, 'vSsFs', 'orange wetsuit', 1, 3, '900', 'lsdkfj;ldfj\r\nsjldkfjsldf\r\nalkfja\r\n\r\njfklajf', ' lfkjfa\r\n\r\nlakjd\r\n\r\najlskdj', '2018-02-08 15:52:31', '2018-04-18 11:40:08', 0),
(4, 'DNLCz', 'green wetsuit', 4, 6, '56', 'csdsdfs sdfgdf', ' dfgykmytmy tym tyum ytu', '2018-03-03 12:48:14', '2018-04-18 11:40:12', 0),
(5, 'AuzdD', 'green wetsuit', 4, 6, '30', 'csdsdfs sdfgdf', ' dfgykmytmy tym tyum ytu', '2018-03-03 12:53:30', '2018-04-18 11:40:18', 0),
(6, '8ch1W', 'red wetsuit', 4, 6, '777', 'csdsdfs sdfgdf', ' dfgykmytmy tym tyum ytu', '2018-03-07 16:28:30', '2018-04-18 11:40:22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `idKota` int(5) NOT NULL,
  `namaKota` varchar(255) NOT NULL,
  `idProvinsi` int(5) NOT NULL,
  `ongkos_kirim` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`idKota`, `namaKota`, `idProvinsi`, `ongkos_kirim`, `date_add`, `date_upd`, `level`) VALUES
(1, 'Kabupaten Aceh Barat', 1, 70000, '0000-00-00 00:00:00', '2014-01-23 12:55:45', 0),
(2, 'Kabupaten Aceh Barat Daya', 1, 70000, '2014-01-22 00:00:00', '2014-01-23 12:55:55', 0),
(3, 'Kabupaten Aceh Besar', 1, 60000, '0000-00-00 00:00:00', '2014-01-23 12:56:18', 0),
(4, 'Kabupaten Aceh Jaya', 1, 63000, '0000-00-00 00:00:00', '2014-01-23 13:03:37', 0),
(5, 'Kabupaten Aceh Selatan', 1, 72000, '0000-00-00 00:00:00', '2014-01-23 13:04:09', 0),
(6, 'Kabupaten Aceh Singkil', 1, 80000, '0000-00-00 00:00:00', '2014-01-23 13:04:33', 0),
(7, 'Kabupaten Aceh Tamiang', 1, 70000, '0000-00-00 00:00:00', '2014-01-23 13:06:13', 0),
(8, 'Kabupaten Aceh Tengah', 1, 50000, '0000-00-00 00:00:00', '2014-01-23 13:06:50', 0),
(9, 'Kabupaten Aceh Tenggara', 1, 82000, '0000-00-00 00:00:00', '2014-01-23 13:07:17', 0),
(10, 'Kabupaten Aceh Timur', 1, 63000, '0000-00-00 00:00:00', '2014-01-23 13:07:47', 0),
(11, 'Kabupaten Aceh Utara', 1, 59000, '0000-00-00 00:00:00', '2014-01-23 13:08:05', 0),
(12, 'Kabupaten Bener Meriah', 1, 75000, '0000-00-00 00:00:00', '2014-01-23 14:41:29', 0),
(13, 'Kabupaten Bireuen', 1, 60000, '0000-00-00 00:00:00', '2014-01-23 14:41:57', 0),
(14, 'Kabupaten Gayo Lues', 1, 75000, '0000-00-00 00:00:00', '2014-01-23 16:30:25', 0),
(15, 'Kabupaten Nagan Raya', 1, 50000, '0000-00-00 00:00:00', '2014-01-23 16:39:21', 0),
(16, 'Kabupaten Pidie', 1, 61000, '0000-00-00 00:00:00', '2014-01-23 17:21:27', 0),
(17, 'Kabupaten Pidie Jaya', 1, 72000, '0000-00-00 00:00:00', '2014-01-23 17:21:47', 0),
(18, 'Kabupaten Simeulue', 1, 92000, '0000-00-00 00:00:00', '2014-01-23 17:51:59', 0),
(19, 'Kota Banda Aceh', 1, 36000, '0000-00-00 00:00:00', '2014-01-24 15:08:38', 0),
(20, 'Kota Langsa', 1, 50000, '0000-00-00 00:00:00', '2014-01-24 15:26:58', 0),
(21, 'Kota Lhokseumawe', 1, 48000, '0000-00-00 00:00:00', '2014-01-24 15:27:12', 0),
(22, 'Kota Sabang', 1, 48000, '0000-00-00 00:00:00', '2014-01-24 16:05:40', 0),
(23, 'Kota Subulussalam', 1, 48000, '0000-00-00 00:00:00', '2014-01-24 16:22:50', 0),
(24, 'Kabupaten Asahan', 2, 45000, '0000-00-00 00:00:00', '2014-01-23 14:35:34', 0),
(25, 'Kabupaten Batubara', 2, 45000, '0000-00-00 00:00:00', '2014-01-23 14:42:28', 0),
(26, 'Kabupaten Dairi', 2, 65000, '0000-00-00 00:00:00', '2014-01-23 16:04:08', 0),
(27, 'Kabupaten Deli Serdang', 2, 45000, '0000-00-00 00:00:00', '2014-01-23 16:03:44', 0),
(28, 'Kabupaten Humbang Hasundutan', 2, 75000, '0000-00-00 00:00:00', '2014-01-23 16:42:54', 0),
(29, 'Kabupaten Karo', 2, 45000, '0000-00-00 00:00:00', '2014-01-23 17:03:50', 0),
(30, 'Kabupaten Labuhanbatu', 2, 58000, '0000-00-00 00:00:00', '2014-01-24 15:16:53', 0),
(31, 'Kabupaten Labuhanbatu Selatan', 2, 60000, '0000-00-00 00:00:00', '2014-01-24 15:17:30', 0),
(32, 'Kabupaten Labuhanbatu Utara', 2, 60000, '0000-00-00 00:00:00', '2014-01-24 15:17:40', 0),
(33, 'Kabupaten Langkat', 2, 43000, '0000-00-00 00:00:00', '2014-01-24 15:23:38', 0),
(34, 'Kabupaten Mandailing Natal', 2, 62000, '0000-00-00 00:00:00', '2014-01-24 15:41:53', 0),
(35, 'Kabupaten Nias', 2, 80000, '0000-00-00 00:00:00', '2014-01-23 16:48:02', 0),
(36, 'Kabupaten Nias Barat', 2, 80000, '0000-00-00 00:00:00', '2014-01-23 16:50:25', 0),
(37, 'Kabupaten Nias Selatan', 2, 80000, '0000-00-00 00:00:00', '2014-01-23 16:50:57', 0),
(38, 'Kabupaten Nias Utara', 2, 80000, '0000-00-00 00:00:00', '2014-01-23 16:51:13', 0),
(40, 'Kabupaten Padang Lawas', 2, 51000, '0000-00-00 00:00:00', '2014-01-23 16:57:41', 0),
(41, 'Kabupaten Padang Lawas Utara', 2, 71000, '0000-00-00 00:00:00', '2014-01-23 16:58:13', 0),
(42, 'Kabupaten Pakpak Bharat', 2, 62000, '0000-00-00 00:00:00', '2014-01-23 17:00:43', 0),
(43, 'Kabupaten Samosir', 2, 62000, '0000-00-00 00:00:00', '2014-01-23 17:39:11', 0),
(44, 'Kabupaten Serdang Bedagai', 2, 48000, '0000-00-00 00:00:00', '2014-01-23 17:45:29', 0),
(45, 'Kabupaten Simalungun', 2, 49000, '0000-00-00 00:00:00', '2014-01-23 17:51:34', 0),
(46, 'Kabupaten Tapanuli Selatan', 2, 50000, '0000-00-00 00:00:00', '2014-01-24 09:12:32', 0),
(47, 'Kabupaten Tapanuli Tengah', 2, 52000, '0000-00-00 00:00:00', '2014-01-24 09:13:21', 0),
(48, 'Kabupaten Tapanuli Utara', 2, 59000, '0000-00-00 00:00:00', '2014-01-24 09:14:05', 0),
(49, 'Kabupaten Toba Samosir', 2, 70000, '0000-00-00 00:00:00', '2014-01-24 09:20:21', 0),
(50, 'Kota Binjai', 2, 34000, '0000-00-00 00:00:00', '2014-01-24 15:15:26', 0),
(51, 'Kota Gunungsitoli', 2, 61000, '0000-00-00 00:00:00', '2014-01-24 15:22:27', 0),
(52, 'Kota Medan', 2, 32000, '0000-00-00 00:00:00', '2014-01-24 15:31:20', 0),
(53, 'Kota Padangsidempuan', 2, 40000, '0000-00-00 00:00:00', '2014-01-24 15:47:04', 0),
(54, 'Kota Pematangsiantar', 2, 37000, '0000-00-00 00:00:00', '2014-01-24 16:04:05', 0),
(55, 'Kota Sibolga', 2, 41000, '0000-00-00 00:00:00', '2014-01-24 16:08:00', 0),
(56, 'Kota Tanjungbalai', 2, 40000, '0000-00-00 00:00:00', '2014-01-24 16:28:48', 0),
(57, 'Kota Tebing Tinggi', 2, 36000, '0000-00-00 00:00:00', '2014-01-24 16:30:10', 0),
(58, 'Kabupaten Bengkulu Selatan', 3, 45000, '0000-00-00 00:00:00', '2014-01-23 14:47:22', 0),
(59, 'Kabupaten Bengkulu Tengah', 3, 45000, '0000-00-00 00:00:00', '2014-01-23 15:04:36', 0),
(60, 'Kabupaten Bengkulu Utara', 3, 40000, '0000-00-00 00:00:00', '2014-01-23 14:46:48', 0),
(61, 'Kabupaten Kaur', 3, 60000, '0000-00-00 00:00:00', '2014-01-23 17:06:15', 0),
(62, 'Kabupaten Kepahiang', 3, 50000, '0000-00-00 00:00:00', '2014-01-23 17:12:05', 0),
(63, 'Kabupaten Lebong', 3, 60000, '0000-00-00 00:00:00', '2014-01-24 15:25:17', 0),
(64, 'Kabupaten Mukomuko', 3, 60000, '0000-00-00 00:00:00', '2014-01-23 16:25:38', 0),
(65, 'Kabupaten Rejang Lebong', 3, 51000, '0000-00-00 00:00:00', '2014-01-23 17:34:19', 0),
(66, 'Kabupaten Seluma', 3, 48000, '0000-00-00 00:00:00', '2014-01-23 17:42:26', 0),
(67, 'Kota Bengkulu', 3, 26000, '0000-00-00 00:00:00', '2014-01-24 15:13:42', 0),
(68, 'Kabupaten Batanghari', 4, 40000, '0000-00-00 00:00:00', '2014-01-23 17:15:03', 0),
(69, 'Kabupaten Bungo', 4, 45000, '0000-00-00 00:00:00', '2014-01-23 14:44:32', 0),
(70, 'Kabupaten Kerinci', 4, 45000, '0000-00-00 00:00:00', '2014-01-23 17:22:27', 0),
(71, 'Kabupaten Merangin', 4, 45000, '0000-00-00 00:00:00', '2014-01-24 15:47:18', 0),
(72, 'Kabupaten Muaro Jambi', 4, 58000, '0000-00-00 00:00:00', '2014-01-23 16:23:56', 0),
(73, 'Kabupaten Sarolangun', 4, 47000, '0000-00-00 00:00:00', '2014-01-23 17:41:24', 0),
(74, 'Kabupaten Tanjung Jabung Barat', 4, 45000, '0000-00-00 00:00:00', '2014-01-24 09:11:31', 0),
(75, 'Kabupaten Tanjung Jabung Timur', 4, 61000, '0000-00-00 00:00:00', '2014-01-24 09:11:51', 0),
(76, 'Kabupaten Tebo', 4, 46000, '0000-00-00 00:00:00', '2014-01-24 09:16:49', 0),
(77, 'Kota Jambi', 4, 24000, '0000-00-00 00:00:00', '2014-01-24 15:22:50', 0),
(78, 'Kota Sungai Penuh', 4, 36000, '0000-00-00 00:00:00', '2014-01-24 16:23:59', 0),
(79, 'Kabupaten Bengkalis', 5, 50000, '0000-00-00 00:00:00', '2014-01-23 14:43:16', 0),
(80, 'Kabupaten Indragiri Hilir', 5, 55000, '0000-00-00 00:00:00', '2014-01-23 16:57:58', 0),
(81, 'Kabupaten Indragiri Hulu', 5, 56000, '0000-00-00 00:00:00', '2014-01-23 16:59:14', 0),
(82, 'Kabupaten Kampar', 5, 53000, '0000-00-00 00:00:00', '2014-01-23 16:57:31', 0),
(83, 'Kabupaten Kuantan Singingi', 5, 55000, '0000-00-00 00:00:00', '2014-01-24 09:25:42', 0),
(84, 'Kabupaten Pelalawan', 5, 47000, '0000-00-00 00:00:00', '2014-01-23 17:17:14', 0),
(85, 'Kabupaten Rokan Hilir', 5, 59000, '0000-00-00 00:00:00', '2014-01-23 17:35:58', 0),
(86, 'Kabupaten Rokan Hulu', 5, 53000, '0000-00-00 00:00:00', '2014-01-23 17:36:18', 0),
(87, 'Kabupaten Siak', 5, 56000, '0000-00-00 00:00:00', '2014-01-23 17:46:41', 0),
(88, 'Kabupaten Kepulauan Meranti', 5, 60000, '0000-00-00 00:00:00', '2014-01-23 17:16:59', 0),
(89, 'Kota Dumai', 5, 31000, '0000-00-00 00:00:00', '2014-01-24 15:20:46', 0),
(90, 'Kota Pekanbaru', 5, 29000, '0000-00-00 00:00:00', '2014-01-24 16:03:46', 0),
(91, 'Kabupaten Agam', 6, 53000, '0000-00-00 00:00:00', '2014-01-23 13:10:03', 0),
(92, 'Kabupaten Dharmasraya', 6, 65000, '0000-00-00 00:00:00', '2014-01-23 16:25:14', 0),
(93, 'Kabupaten Kepulauan Mentawai', 6, 68000, '0000-00-00 00:00:00', '2014-01-23 17:14:27', 0),
(94, 'Kabupaten Lima Puluh Kota', 6, 43000, '0000-00-00 00:00:00', '2014-01-24 15:26:47', 0),
(95, 'Kabupaten Padang Pariaman', 6, 50000, '0000-00-00 00:00:00', '2014-01-23 16:59:13', 0),
(96, 'Kabupaten Pasaman', 6, 56000, '0000-00-00 00:00:00', '2014-01-23 17:09:46', 0),
(97, 'Kabupaten Pasaman Barat', 6, 58000, '0000-00-00 00:00:00', '2014-01-23 17:10:59', 0),
(98, 'Kabupaten Pesisir Selatan', 6, 49000, '0000-00-00 00:00:00', '2014-01-23 17:20:42', 0),
(99, 'Kabupaten Sijunjung', 6, 54000, '0000-00-00 00:00:00', '2014-01-23 17:50:11', 0),
(100, 'Kabupaten Solok', 6, 44000, '0000-00-00 00:00:00', '2014-01-23 17:54:42', 0),
(101, 'Kabupaten Solok Selatan', 6, 46000, '0000-00-00 00:00:00', '2014-01-23 17:55:12', 0),
(102, 'Kabupaten Tanah Datar', 6, 39000, '0000-00-00 00:00:00', '2014-01-24 09:08:14', 0),
(103, 'Kota Bukittinggi', 6, 35000, '0000-00-00 00:00:00', '2014-01-24 15:17:48', 0),
(104, 'Kota Padang', 6, 28000, '0000-00-00 00:00:00', '2014-01-24 15:32:32', 0),
(105, 'Kota Padangpanjang', 6, 34000, '0000-00-00 00:00:00', '2014-01-24 15:32:43', 0),
(106, 'Kota Pariaman', 6, 37000, '0000-00-00 00:00:00', '2014-01-24 16:01:16', 0),
(107, 'Kota Payakumbuh', 6, 34000, '0000-00-00 00:00:00', '2014-01-24 16:02:46', 0),
(108, 'Kota Sawahlunto', 6, 30000, '0000-00-00 00:00:00', '2014-01-24 16:06:45', 0),
(109, 'Kota Solok', 6, 34000, '0000-00-00 00:00:00', '2014-01-24 16:21:59', 0),
(110, 'Kabupaten Banyuasin', 7, 40000, '0000-00-00 00:00:00', '2014-01-23 14:34:12', 0),
(111, 'Kabupaten Empat Lawang', 7, 60000, '0000-00-00 00:00:00', '2014-01-23 16:27:17', 0),
(112, 'Kabupaten Lahat', 7, 45000, '0000-00-00 00:00:00', '2014-01-24 15:18:04', 0),
(113, 'Kabupaten Muara Enim', 7, 45000, '0000-00-00 00:00:00', '2014-01-23 16:23:09', 0),
(114, 'Kabupaten Musi Banyuasin', 7, 45000, '0000-00-00 00:00:00', '2014-01-23 16:32:04', 0),
(115, 'Kabupaten Musi Rawas', 7, 45000, '0000-00-00 00:00:00', '2014-01-23 16:32:32', 0),
(116, 'Kabupaten Ogan Ilir', 7, 36000, '0000-00-00 00:00:00', '2014-01-23 16:53:26', 0),
(117, 'Kabupaten Ogan Komering Ilir', 7, 41000, '0000-00-00 00:00:00', '2014-01-23 16:54:00', 0),
(118, 'Kabupaten Ogan Komering Ulu', 7, 45000, '0000-00-00 00:00:00', '2014-01-23 16:54:40', 0),
(119, 'Kabupaten Ogan Komering Ulu Selatan', 7, 46000, '0000-00-00 00:00:00', '2014-01-23 16:55:23', 0),
(120, 'Kabupaten Ogan Komering Ulu Timur', 7, 46000, '0000-00-00 00:00:00', '2014-01-23 16:55:35', 0),
(121, 'Kota Lubuklinggau', 7, 35000, '0000-00-00 00:00:00', '2014-01-24 15:28:47', 0),
(122, 'Kota Pagar Alam', 7, 43000, '0000-00-00 00:00:00', '2014-01-24 15:48:35', 0),
(123, 'Kota Palembang', 7, 25000, '0000-00-00 00:00:00', '2014-01-24 15:50:13', 0),
(124, 'Kota Prabumulih', 7, 35000, '0000-00-00 00:00:00', '2014-01-24 16:04:54', 0),
(125, 'Kabupaten Lampung Barat', 8, 60000, '0000-00-00 00:00:00', '2014-01-24 15:20:21', 0),
(126, 'Kabupaten Lampung Selatan', 8, 43000, '0000-00-00 00:00:00', '2014-01-24 15:20:52', 0),
(127, 'Kabupaten Lampung Tengah', 8, 40000, '0000-00-00 00:00:00', '2014-01-24 15:21:10', 0),
(128, 'Kabupaten Lampung Timur', 8, 40000, '0000-00-00 00:00:00', '2014-01-24 15:21:53', 0),
(129, 'Kabupaten Lampung Utara', 8, 40000, '0000-00-00 00:00:00', '2014-01-24 15:22:23', 0),
(130, 'Kabupaten Mesuji', 8, 65000, '0000-00-00 00:00:00', '2014-01-24 15:48:37', 0),
(131, 'Kabupaten Pesawaran', 8, 61000, '0000-00-00 00:00:00', '2014-01-23 17:19:40', 0),
(132, 'Kabupaten Pringsewu', 8, 60000, '0000-00-00 00:00:00', '2014-01-23 17:27:50', 0),
(133, 'Kabupaten Tanggamus', 8, 45000, '0000-00-00 00:00:00', '2014-01-24 09:09:51', 0),
(134, 'Kabupaten Tulang Bawang', 8, 60000, '0000-00-00 00:00:00', '2014-01-24 09:26:22', 0),
(135, 'Kabupaten Tulang Bawang Barat', 8, 61000, '0000-00-00 00:00:00', '2014-01-24 09:26:56', 0),
(136, 'Kabupaten Way Kanan', 8, 60000, '0000-00-00 00:00:00', '2014-01-24 09:29:58', 0),
(137, 'Kota Bandar Lampung', 8, 22000, '0000-00-00 00:00:00', '2014-01-24 15:09:06', 0),
(138, 'Kota Metro', 8, 32000, '0000-00-00 00:00:00', '2014-01-24 15:31:48', 0),
(139, 'Kabupaten Bangka', 9, 38000, '0000-00-00 00:00:00', '2014-01-23 13:14:58', 0),
(140, 'Kabupaten Bangka Barat', 9, 46000, '0000-00-00 00:00:00', '2014-01-23 13:15:41', 0),
(141, 'Kabupaten Bangka Selatan', 9, 46000, '0000-00-00 00:00:00', '2014-01-23 13:16:20', 0),
(142, 'Kabupaten Bangka Tengah', 9, 43000, '0000-00-00 00:00:00', '2014-01-23 13:16:48', 0),
(143, 'Kabupaten Belitung', 9, 30000, '0000-00-00 00:00:00', '2014-01-23 14:46:12', 0),
(144, 'Kabupaten Belitung Timur', 9, 40000, '0000-00-00 00:00:00', '2014-01-23 14:45:46', 0),
(145, 'Kota Pangkal Pinang', 9, 30000, '0000-00-00 00:00:00', '2014-01-24 16:00:14', 0),
(146, 'Kabupaten Bintan', 10, 70000, '0000-00-00 00:00:00', '2014-01-23 14:43:47', 0),
(147, 'Kabupaten Karimun', 10, 50000, '0000-00-00 00:00:00', '2014-01-23 17:03:17', 0),
(148, 'Kabupaten Kepulauan Anambas', 10, 55000, '0000-00-00 00:00:00', '2014-01-23 17:12:54', 0),
(149, 'Kabupaten Lingga', 10, 73000, '0000-00-00 00:00:00', '2014-01-24 15:27:11', 0),
(150, 'Kabupaten Natuna', 10, 70000, '0000-00-00 00:00:00', '2014-01-23 16:42:47', 0),
(151, 'Kota Batam', 10, 28000, '0000-00-00 00:00:00', '2014-01-24 15:12:11', 0),
(152, 'Kota Tanjung Pinang', 10, 36000, '0000-00-00 00:00:00', '2014-01-24 16:27:55', 0),
(153, 'Kabupaten Tangerang', 11, 40000, '0000-00-00 00:00:00', '2014-01-24 09:09:22', 0),
(154, 'Kabupaten Serang', 11, 40000, '0000-00-00 00:00:00', '2014-01-23 17:44:49', 0),
(155, 'Kabupaten Lebak', 11, 23000, '0000-00-00 00:00:00', '2014-01-24 15:24:48', 0),
(156, 'Kabupaten Pandeglang', 11, 23000, '0000-00-00 00:00:00', '2014-01-23 17:03:20', 0),
(157, 'Kota Tangerang', 11, 16000, '0000-00-00 00:00:00', '2014-01-24 16:26:48', 0),
(158, 'Kota Serang', 11, 16000, '0000-00-00 00:00:00', '2014-01-24 16:07:36', 0),
(159, 'Kota Cilegon', 11, 15000, '0000-00-00 00:00:00', '2014-01-24 15:18:07', 0),
(160, 'Kota Tangerang Selatan', 11, 17000, '0000-00-00 00:00:00', '2014-01-24 16:27:03', 0),
(161, 'Kabupaten Bandung', 12, 24000, '0000-00-00 00:00:00', '2014-01-23 13:12:18', 0),
(163, 'Kabupaten Bandung Barat', 12, 23000, '0000-00-00 00:00:00', '2014-01-23 14:33:09', 0),
(164, 'Kabupaten Bekasi', 12, 20000, '0000-00-00 00:00:00', '2014-01-23 14:48:09', 0),
(165, 'Kabupaten Bogor', 12, 20000, '0000-00-00 00:00:00', '2014-01-23 15:07:53', 0),
(166, 'Kabupaten Ciamis', 12, 25000, '0000-00-00 00:00:00', '2014-01-23 15:43:08', 0),
(167, 'Kabupaten Cianjur', 12, 23000, '0000-00-00 00:00:00', '2014-01-23 15:43:23', 0),
(168, 'Kabupaten Cirebon', 12, 35000, '0000-00-00 00:00:00', '2014-01-23 15:46:51', 0),
(169, 'Kabupaten Garut', 12, 25000, '0000-00-00 00:00:00', '2014-01-23 16:29:47', 0),
(170, 'Kabupaten Indramayu', 12, 25000, '0000-00-00 00:00:00', '2014-01-23 16:45:30', 0),
(171, 'Kabupaten Karawang', 12, 20000, '0000-00-00 00:00:00', '2014-01-23 17:02:44', 0),
(172, 'Kabupaten Kuningan', 12, 25000, '0000-00-00 00:00:00', '2014-01-24 09:29:05', 0),
(173, 'Kabupaten Majalengka', 12, 30000, '0000-00-00 00:00:00', '2014-01-24 15:34:06', 0),
(174, 'Kabupaten Purwakarta', 12, 23000, '0000-00-00 00:00:00', '2014-01-23 17:32:46', 0),
(175, 'Kabupaten Subang', 12, 26000, '0000-00-00 00:00:00', '2014-01-23 17:59:10', 0),
(176, 'Kabupaten Sukabumi', 12, 26000, '0000-00-00 00:00:00', '2014-01-23 17:59:37', 0),
(177, 'Kabupaten Sumedang', 12, 29000, '0000-00-00 00:00:00', '2014-01-23 18:03:50', 0),
(178, 'Kabupaten Tasikmalaya', 12, 39000, '0000-00-00 00:00:00', '2014-01-24 09:16:26', 0),
(179, 'Kota Bandung', 12, 16000, '0000-00-00 00:00:00', '2014-01-24 15:09:24', 0),
(180, 'Kota Banjar', 12, 23000, '0000-00-00 00:00:00', '2014-01-24 15:10:24', 0),
(181, 'Kota Bekasi', 12, 15000, '0000-00-00 00:00:00', '2014-01-24 15:13:22', 0),
(182, 'Kota Bogor', 12, 15000, '0000-00-00 00:00:00', '2014-01-24 15:16:52', 0),
(183, 'Kota Cimahi', 12, 18000, '0000-00-00 00:00:00', '2014-01-24 15:18:25', 0),
(184, 'Kota Cirebon', 12, 16000, '0000-00-00 00:00:00', '2014-01-24 15:18:40', 0),
(185, 'Kota Depok', 12, 15000, '0000-00-00 00:00:00', '2014-01-24 15:20:07', 0),
(186, 'Kota Sukabumi', 12, 20000, '0000-00-00 00:00:00', '2014-01-24 16:23:35', 0),
(187, 'Kota Tasikmalaya', 12, 20000, '0000-00-00 00:00:00', '2014-01-24 16:29:46', 0),
(188, 'Kabupaten Administrasi Kepulauan Seribu', 13, 40000, '0000-00-00 00:00:00', '2014-01-23 14:39:54', 0),
(189, 'Kota Administrasi Jakarta Barat', 13, 15000, '0000-00-00 00:00:00', '2014-01-24 09:33:33', 0),
(190, 'Kota Administrasi Jakarta Pusat', 13, 15000, '0000-00-00 00:00:00', '2014-01-24 15:04:22', 0),
(191, 'Kota Administrasi Jakarta Selatan', 13, 15000, '0000-00-00 00:00:00', '2014-01-24 15:04:32', 0),
(192, 'Kota Administrasi Jakarta Timur', 13, 15000, '0000-00-00 00:00:00', '2014-01-24 15:04:45', 0),
(193, 'Kota Administrasi Jakarta Utara', 13, 15000, '0000-00-00 00:00:00', '2014-01-24 15:04:55', 0),
(194, 'Kabupaten Banjarnegara', 14, 25000, '0000-00-00 00:00:00', '2014-01-23 14:32:33', 0),
(195, 'Kabupaten Banyumas', 14, 24000, '0000-00-00 00:00:00', '2014-01-23 14:31:59', 0),
(196, 'Kabupaten Batang', 14, 26000, '0000-00-00 00:00:00', '2014-01-23 14:48:53', 0),
(197, 'Kabupaten Blora', 14, 30000, '0000-00-00 00:00:00', '2014-01-23 15:06:16', 0),
(198, 'Kabupaten Boyolali', 14, 25000, '0000-00-00 00:00:00', '2014-01-23 15:06:29', 0),
(199, 'Kabupaten Brebes', 14, 30000, '0000-00-00 00:00:00', '2014-01-23 15:05:40', 0),
(200, 'Kabupaten Cilacap', 14, 30000, '0000-00-00 00:00:00', '2014-01-23 15:46:25', 0),
(201, 'Kabupaten Demak', 14, 25000, '0000-00-00 00:00:00', '2014-01-23 16:22:12', 0),
(202, 'Kabupaten Grobogan', 14, 35000, '0000-00-00 00:00:00', '2014-01-23 16:34:41', 0),
(203, 'Kabupaten Jepara', 14, 22000, '0000-00-00 00:00:00', '2014-01-23 16:51:45', 0),
(204, 'Kabupaten Karanganyar', 14, 23000, '0000-00-00 00:00:00', '2014-01-23 17:01:38', 0),
(205, 'Kabupaten Kebumen', 14, 30000, '0000-00-00 00:00:00', '2014-01-23 17:09:36', 0),
(206, 'Kabupaten Kendal', 14, 22000, '0000-00-00 00:00:00', '2014-01-23 17:11:42', 0),
(207, 'Kabupaten Klaten', 14, 25000, '0000-00-00 00:00:00', '2014-01-23 17:23:56', 0),
(208, 'Kabupaten Kudus', 14, 20000, '0000-00-00 00:00:00', '2014-01-24 09:27:12', 0),
(209, 'Kabupaten Magelang', 14, 38000, '0000-00-00 00:00:00', '2014-01-24 15:32:18', 0),
(210, 'Kabupaten Pati', 14, 23000, '0000-00-00 00:00:00', '2014-01-23 17:13:06', 0),
(211, 'Kabupaten Pekalongan', 14, 33000, '0000-00-00 00:00:00', '2014-01-23 17:16:09', 0),
(212, 'Kabupaten Pemalang', 14, 28000, '0000-00-00 00:00:00', '2014-01-23 17:17:42', 0),
(213, 'Kabupaten Purbalingga', 14, 26000, '0000-00-00 00:00:00', '2014-01-23 17:32:18', 0),
(214, 'Kabupaten Purworejo', 14, 33000, '0000-00-00 00:00:00', '2014-01-23 17:33:10', 0),
(215, 'Kabupaten Rembang', 14, 31000, '0000-00-00 00:00:00', '2014-01-23 17:35:14', 0),
(216, 'Kabupaten Semarang', 14, 40000, '0000-00-00 00:00:00', '2014-01-23 17:43:01', 0),
(217, 'Kabupaten Sragen', 14, 24000, '0000-00-00 00:00:00', '2014-01-23 17:58:38', 0),
(218, 'Kabupaten Sukoharjo', 14, 23000, '0000-00-00 00:00:00', '2014-01-23 18:00:51', 0),
(219, 'Kabupaten Tegal', 14, 39000, '0000-00-00 00:00:00', '2014-01-24 09:17:21', 0),
(220, 'Kabupaten Temanggung', 14, 39000, '0000-00-00 00:00:00', '2014-01-24 09:18:45', 0),
(221, 'Kabupaten Wonogiri', 14, 23000, '0000-00-00 00:00:00', '2014-01-24 09:30:38', 0),
(222, 'Kabupaten Wonosobo', 14, 33000, '0000-00-00 00:00:00', '2014-01-24 09:30:57', 0),
(223, 'Kota Magelang', 14, 17000, '0000-00-00 00:00:00', '2014-01-24 15:29:41', 0),
(224, 'Kota Pekalongan', 14, 21000, '0000-00-00 00:00:00', '2014-01-24 16:03:08', 0),
(225, 'Kota Salatiga', 14, 19000, '0000-00-00 00:00:00', '2014-01-24 16:06:01', 0),
(226, 'Kota Semarang', 14, 16000, '0000-00-00 00:00:00', '2014-01-24 16:07:17', 0),
(227, 'Kota Surakarta', 14, 16000, '0000-00-00 00:00:00', '2014-01-24 16:24:53', 0),
(228, 'Kota Tegal', 14, 21000, '0000-00-00 00:00:00', '2014-01-24 16:30:38', 0),
(229, 'Kabupaten Bangkalan', 15, 26000, '0000-00-00 00:00:00', '2014-01-23 13:18:50', 0),
(230, 'Kabupaten Banyuwangi', 15, 20000, '0000-00-00 00:00:00', '2014-01-23 14:21:54', 0),
(231, 'Kabupaten Blitar', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 15:08:46', 0),
(232, 'Kabupaten Bojonegoro', 15, 30000, '0000-00-00 00:00:00', '2014-01-23 14:49:54', 0),
(233, 'Kabupaten Bondowoso', 15, 23000, '0000-00-00 00:00:00', '2014-01-23 14:50:29', 0),
(234, 'Kabupaten Gresik', 15, 12000, '0000-00-00 00:00:00', '2014-01-23 16:33:48', 0),
(235, 'Kabupaten Jember', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 16:48:34', 0),
(236, 'Kabupaten Jombang', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 16:52:20', 0),
(237, 'Kabupaten Kediri', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 17:10:24', 0),
(238, 'Kabupaten Lamongan', 15, 10000, '0000-00-00 00:00:00', '2014-01-24 15:19:35', 0),
(239, 'Kabupaten Lumajang', 15, 15000, '0000-00-00 00:00:00', '2014-01-24 15:30:00', 0),
(240, 'Kabupaten Madiun', 15, 21000, '0000-00-00 00:00:00', '2014-01-24 15:31:50', 0),
(241, 'Kabupaten Magetan', 15, 21000, '0000-00-00 00:00:00', '2014-01-24 15:33:13', 0),
(242, 'Kabupaten Malang', 15, 20000, '0000-00-00 00:00:00', '2014-01-24 15:36:07', 0),
(243, 'Kabupaten Mojokerto', 15, 23000, '0000-00-00 00:00:00', '2014-01-24 15:51:14', 0),
(244, 'Kabupaten Nganjuk', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 16:46:36', 0),
(245, 'Kabupaten Ngawi', 15, 22000, '0000-00-00 00:00:00', '2014-01-23 16:47:01', 0),
(246, 'Kabupaten Pacitan', 15, 34000, '0000-00-00 00:00:00', '2014-01-23 16:56:31', 0),
(247, 'Kabupaten Pamekasan', 15, 33000, '0000-00-00 00:00:00', '2014-01-23 17:02:24', 0),
(248, 'Kabupaten Pasuruan', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 17:12:37', 0),
(249, 'Kabupaten Ponorogo', 15, 26000, '0000-00-00 00:00:00', '2014-01-23 17:24:50', 0),
(250, 'Kabupaten Probolinggo', 15, 21000, '0000-00-00 00:00:00', '2014-01-23 17:28:25', 0),
(251, 'Kabupaten Sampang', 15, 33000, '0000-00-00 00:00:00', '2014-01-23 17:39:44', 0),
(252, 'Kabupaten Sidoarjo', 15, 15000, '0000-00-00 00:00:00', '2014-01-23 17:48:25', 0),
(253, 'Kabupaten Situbondo', 15, 22000, '0000-00-00 00:00:00', '2014-01-23 17:53:45', 0),
(254, 'Kabupaten Sumenep', 15, 33000, '0000-00-00 00:00:00', '2014-01-23 18:04:14', 0),
(255, 'Kabupaten Trenggalek', 15, 22000, '0000-00-00 00:00:00', '2014-01-24 09:24:39', 0),
(256, 'Kabupaten Tuban', 15, 15000, '0000-00-00 00:00:00', '2014-01-24 09:25:04', 0),
(257, 'Kabupaten Tulungagung', 15, 15000, '0000-00-00 00:00:00', '2014-01-24 09:27:32', 0),
(258, 'Kota Batu', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 15:12:36', 0),
(259, 'Kota Blitar', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 15:16:23', 0),
(260, 'Kota Kediri', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 15:24:52', 0),
(261, 'Kota Madiun', 15, 16000, '0000-00-00 00:00:00', '2014-01-24 15:29:15', 0),
(262, 'Kota Malang', 15, 10000, '0000-00-00 00:00:00', '2014-01-23 11:01:00', 0),
(263, 'Kota Mojokerto', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 15:32:08', 0),
(264, 'Kota Pasuruan', 15, 10000, '0000-00-00 00:00:00', '2014-01-24 16:02:18', 0),
(265, 'Kota Probolinggo', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 16:05:15', 0),
(266, 'Kota Surabaya', 15, 12000, '0000-00-00 00:00:00', '2014-01-24 16:24:23', 0),
(267, 'Kabupaten Bantul', 16, 20000, '0000-00-00 00:00:00', '2014-01-23 14:31:25', 0),
(268, 'Kabupaten Gunung Kidul', 16, 25000, '0000-00-00 00:00:00', '2014-01-23 16:35:07', 0),
(269, 'Kabupaten Kulon Progo', 16, 25000, '0000-00-00 00:00:00', '2014-01-24 09:28:33', 0),
(270, 'Kabupaten Sleman', 16, 22000, '0000-00-00 00:00:00', '2014-01-23 17:54:10', 0),
(271, 'Kota Yogyakarta', 16, 16000, '0000-00-00 00:00:00', '2014-01-24 16:32:40', 0),
(272, 'Kabupaten Badung', 17, 42000, '0000-00-00 00:00:00', '2014-01-23 13:20:20', 0),
(273, 'Kabupaten Bangli', 17, 41000, '0000-00-00 00:00:00', '2014-01-23 13:21:54', 0),
(274, 'Kabupaten Buleleng', 17, 50000, '0000-00-00 00:00:00', '2014-01-23 14:51:16', 0),
(275, 'Kabupaten Gianyar', 17, 43000, '0000-00-00 00:00:00', '2014-01-23 16:30:54', 0),
(276, 'Kabupaten Jembrana', 17, 63000, '0000-00-00 00:00:00', '2014-01-23 16:48:59', 0),
(277, 'Kabupaten Karangasem', 17, 53000, '0000-00-00 00:00:00', '2014-01-23 17:02:11', 0),
(278, 'Kabupaten Klungkung', 17, 45000, '0000-00-00 00:00:00', '2014-01-24 09:20:31', 0),
(279, 'Kabupaten Tabanan', 17, 48000, '0000-00-00 00:00:00', '2014-01-23 18:05:58', 0),
(280, 'Kota Denpasar', 17, 27000, '0000-00-00 00:00:00', '2014-01-24 15:19:45', 0),
(281, 'Kabupaten Bima', 18, 35000, '0000-00-00 00:00:00', '2014-01-23 14:59:40', 0),
(282, 'Kabupaten Dompu', 18, 40000, '0000-00-00 00:00:00', '2014-01-23 16:08:12', 0),
(283, 'Kabupaten Lombok Barat', 18, 27000, '0000-00-00 00:00:00', '2014-01-24 15:28:13', 0),
(284, 'Kabupaten Lombok Tengah', 18, 28000, '0000-00-00 00:00:00', '2014-01-24 15:28:32', 0),
(285, 'Kabupaten Lombok Timur', 18, 28000, '0000-00-00 00:00:00', '2014-01-24 15:28:54', 0),
(286, 'Kabupaten Lombok Utara', 18, 30000, '0000-00-00 00:00:00', '2014-01-24 15:29:23', 0),
(287, 'Kabupaten Sumbawa', 18, 40000, '0000-00-00 00:00:00', '2014-01-23 18:03:02', 0),
(288, 'Kabupaten Sumbawa Barat', 18, 40000, '0000-00-00 00:00:00', '2014-01-23 18:03:20', 0),
(289, 'Kota Bima', 18, 24000, '0000-00-00 00:00:00', '2014-01-24 15:14:07', 0),
(290, 'Kota Mataram', 18, 20000, '0000-00-00 00:00:00', '2014-01-24 15:30:50', 0),
(291, 'Kabupaten Alor', 19, 70000, '0000-00-00 00:00:00', '2014-01-23 14:26:48', 0),
(292, 'Kabupaten Belu', 19, 80000, '0000-00-00 00:00:00', '2014-01-23 15:00:27', 0),
(293, 'Kabupaten Ende', 19, 80000, '0000-00-00 00:00:00', '2014-01-23 16:08:41', 0),
(294, 'Kabupaten Flores Timur', 19, 80000, '0000-00-00 00:00:00', '2014-01-23 16:29:02', 0),
(295, 'Kabupaten Kupang', 19, 62000, '0000-00-00 00:00:00', '2014-01-24 15:13:45', 0),
(296, 'Kabupaten Lembata', 19, 82000, '0000-00-00 00:00:00', '2014-01-24 15:26:22', 0),
(297, 'Kabupaten Manggarai', 19, 88000, '0000-00-00 00:00:00', '2014-01-24 15:42:36', 0),
(298, 'Kabupaten Manggarai Barat', 19, 73000, '0000-00-00 00:00:00', '2014-01-24 15:43:01', 0),
(299, 'Kabupaten Manggarai Timur', 19, 110000, '0000-00-00 00:00:00', '2014-01-24 15:43:34', 0),
(300, 'Kabupaten Ngada', 19, 81000, '0000-00-00 00:00:00', '2014-01-23 16:45:55', 0),
(301, 'Kabupaten Nagekeo', 19, 110000, '0000-00-00 00:00:00', '2014-01-23 16:41:23', 0),
(302, 'Kabupaten Rote Ndao', 19, 83000, '0000-00-00 00:00:00', '2014-01-23 17:37:16', 0),
(303, 'Kabupaten Sabu Raijua', 19, 113000, '0000-00-00 00:00:00', '2014-01-23 17:38:01', 0),
(304, 'Kabupaten Sikka', 19, 82000, '0000-00-00 00:00:00', '2014-01-23 17:51:00', 0),
(305, 'Kabupaten Sumba Barat', 19, 82000, '0000-00-00 00:00:00', '2014-01-23 18:01:47', 0),
(306, 'Kabupaten Sumba Barat Daya', 19, 115000, '0000-00-00 00:00:00', '2014-01-23 18:02:03', 0),
(307, 'Kabupaten Sumba Tengah', 19, 82000, '0000-00-00 00:00:00', '2014-01-23 18:02:20', 0),
(308, 'Kabupaten Sumba Timur', 19, 82000, '0000-00-00 00:00:00', '2014-01-23 18:02:35', 0),
(309, 'Kabupaten Timor Tengah Selatan', 19, 79000, '0000-00-00 00:00:00', '2014-01-24 09:19:26', 0),
(310, 'Kabupaten Timor Tengah Utara', 19, 79000, '0000-00-00 00:00:00', '2014-01-24 09:19:43', 0),
(311, 'Kota Kupang', 19, 50000, '0000-00-00 00:00:00', '2014-01-24 15:26:32', 0),
(312, 'Kabupaten Bengkayang', 20, 52000, '0000-00-00 00:00:00', '2014-01-23 14:51:56', 0),
(313, 'Kabupaten Kapuas Hulu', 20, 70000, '0000-00-00 00:00:00', '2014-01-23 17:01:07', 0),
(314, 'Kabupaten Kayong Utara', 20, 58000, '0000-00-00 00:00:00', '2014-01-23 17:07:27', 0),
(315, 'Kabupaten Ketapang', 20, 60000, '0000-00-00 00:00:00', '2014-01-23 17:22:54', 0),
(316, 'Kabupaten Kubu Raya', 20, 58000, '0000-00-00 00:00:00', '2014-01-24 09:26:27', 0),
(317, 'Kabupaten Landak', 20, 55000, '0000-00-00 00:00:00', '2014-01-24 15:22:59', 0),
(318, 'Kabupaten Pontianak', 20, 51000, '0000-00-00 00:00:00', '2014-01-23 17:26:18', 0),
(319, 'Kabupaten Sambas', 20, 58000, '0000-00-00 00:00:00', '2014-01-23 17:38:36', 0),
(320, 'Kabupaten Sanggau', 20, 59000, '0000-00-00 00:00:00', '2014-01-23 17:40:08', 0),
(321, 'Kabupaten Sekadau', 20, 59000, '0000-00-00 00:00:00', '2014-01-23 17:41:59', 0),
(322, 'Kabupaten Sintang', 20, 59000, '0000-00-00 00:00:00', '2014-01-23 17:53:18', 0),
(323, 'Kota Pontianak', 20, 30000, '0000-00-00 00:00:00', '2014-01-24 16:04:29', 0),
(324, 'Kota Singkawang', 20, 40000, '0000-00-00 00:00:00', '2014-01-24 16:08:22', 0),
(325, 'Kabupaten Balangan', 21, 52000, '0000-00-00 00:00:00', '2014-01-23 14:29:18', 0),
(326, 'Kabupaten Banjar', 21, 34000, '0000-00-00 00:00:00', '2014-01-23 13:22:35', 0),
(327, 'Kabupaten Barito Kuala', 21, 41000, '0000-00-00 00:00:00', '2014-01-23 13:23:26', 0),
(328, 'Kabupaten Hulu Sungai Selatan', 21, 40000, '0000-00-00 00:00:00', '2014-01-23 16:40:16', 0),
(329, 'Kabupaten Hulu Sungai Tengah', 21, 40000, '0000-00-00 00:00:00', '2014-01-23 16:40:37', 0),
(330, 'Kabupaten Hulu Sungai Utara', 21, 45000, '0000-00-00 00:00:00', '2014-01-23 16:41:25', 0),
(331, 'Kabupaten Kotabaru', 21, 45000, '0000-00-00 00:00:00', '2014-01-24 09:24:19', 0),
(332, 'Kabupaten Tabalong', 21, 42000, '0000-00-00 00:00:00', '2014-01-23 18:05:12', 0),
(333, 'Kabupaten Tanah Bumbu', 21, 45000, '0000-00-00 00:00:00', '2014-01-24 09:07:30', 0),
(334, 'Kabupaten Tanah Laut', 21, 38000, '0000-00-00 00:00:00', '2014-01-24 09:08:49', 0),
(335, 'Kabupaten Tapin', 21, 55000, '0000-00-00 00:00:00', '2014-01-24 09:15:52', 0),
(336, 'Kota Banjarbaru', 21, 28000, '0000-00-00 00:00:00', '2014-01-24 15:10:50', 0),
(337, 'Kota Banjarmasin', 21, 25000, '0000-00-00 00:00:00', '2014-01-24 15:11:18', 0),
(338, 'Kabupaten Barito Selatan', 22, 60000, '0000-00-00 00:00:00', '2014-01-23 14:17:35', 0),
(339, 'Kabupaten Barito Timur', 22, 69000, '0000-00-00 00:00:00', '2014-01-23 14:19:06', 0),
(340, 'Kabupaten Barito Utara', 22, 63000, '0000-00-00 00:00:00', '2014-01-23 14:18:23', 0),
(341, 'Kabupaten Gunung Mas', 22, 75000, '0000-00-00 00:00:00', '2014-01-23 16:35:37', 0),
(342, 'Kabupaten Kapuas', 22, 65000, '0000-00-00 00:00:00', '2014-01-23 17:00:21', 0),
(343, 'Kabupaten Katingan', 22, 52000, '0000-00-00 00:00:00', '2014-01-23 17:04:53', 0),
(344, 'Kabupaten Kotawaringin Barat', 22, 60000, '0000-00-00 00:00:00', '2014-01-24 09:24:51', 0),
(345, 'Kabupaten Kotawaringin Timur', 22, 60000, '0000-00-00 00:00:00', '2014-01-24 09:25:06', 0),
(346, 'Kabupaten Lamandau', 22, 80000, '0000-00-00 00:00:00', '2014-01-24 15:18:58', 0),
(347, 'Kabupaten Murung Raya', 22, 71000, '0000-00-00 00:00:00', '2014-01-23 16:30:34', 0),
(348, 'Kabupaten Pulang Pisau', 22, 74000, '0000-00-00 00:00:00', '2014-01-23 17:29:00', 0),
(349, 'Kabupaten Sukamara', 22, 74000, '0000-00-00 00:00:00', '2014-01-23 18:00:23', 0),
(350, 'Kabupaten Seruyan', 22, 78000, '0000-00-00 00:00:00', '2014-01-23 17:46:09', 0),
(351, 'Kota Palangka Raya', 22, 33000, '0000-00-00 00:00:00', '2014-01-24 15:49:37', 0),
(352, 'Kabupaten Berau', 23, 70000, '0000-00-00 00:00:00', '2014-01-23 14:52:58', 0),
(353, 'Kabupaten Bulungan', 23, 65000, '0000-00-00 00:00:00', '2014-01-23 14:53:32', 0),
(354, 'Kabupaten Kutai Barat', 23, 55000, '0000-00-00 00:00:00', '2014-01-24 15:14:21', 0),
(355, 'Kabupaten Kutai Kartanegara', 23, 50000, '0000-00-00 00:00:00', '2014-01-24 15:14:44', 0),
(356, 'Kabupaten Kutai Timur', 23, 50000, '0000-00-00 00:00:00', '2014-01-24 15:15:09', 0),
(357, 'Kabupaten Malinau', 23, 65000, '0000-00-00 00:00:00', '2014-01-24 15:36:30', 0),
(358, 'Kabupaten Nunukan', 23, 65000, '0000-00-00 00:00:00', '2014-01-23 16:52:15', 0),
(359, 'Kabupaten Paser', 23, 66000, '0000-00-00 00:00:00', '2014-01-23 17:11:54', 0),
(360, 'Kabupaten Penajam Paser Utara', 23, 62000, '0000-00-00 00:00:00', '2014-01-23 17:18:35', 0),
(361, 'Kabupaten Tana Tidung', 23, 65000, '0000-00-00 00:00:00', '2014-01-24 09:06:20', 0),
(362, 'Kota Balikpapan', 23, 30000, '0000-00-00 00:00:00', '2014-01-24 15:08:01', 0),
(363, 'Kota Bontang', 23, 38000, '0000-00-00 00:00:00', '2014-01-24 15:17:18', 0),
(364, 'Kota Samarinda', 23, 34000, '0000-00-00 00:00:00', '2014-01-24 16:06:17', 0),
(365, 'Kota Tarakan', 23, 41000, '0000-00-00 00:00:00', '2014-01-24 16:29:09', 0),
(366, 'Kabupaten Boalemo', 24, 80000, '0000-00-00 00:00:00', '2014-01-23 15:01:12', 0),
(367, 'Kabupaten Bone Bolango', 24, 70000, '0000-00-00 00:00:00', '2014-01-23 15:01:54', 0),
(368, 'Kabupaten Gorontalo', 24, 73000, '0000-00-00 00:00:00', '2014-01-23 16:31:32', 0),
(369, 'Kabupaten Gorontalo Utara', 24, 78000, '0000-00-00 00:00:00', '2014-01-23 16:31:50', 0),
(370, 'Kabupaten Pohuwato', 24, 63000, '0000-00-00 00:00:00', '2014-01-23 17:23:38', 0),
(371, 'Kota Gorontalo', 24, 46000, '0000-00-00 00:00:00', '2014-01-24 15:21:34', 0),
(372, 'Kabupaten Melawi', 20, 60000, '0000-00-00 00:00:00', '2014-01-24 15:46:42', 0),
(373, 'Kabupaten Bantaeng', 25, 55000, '0000-00-00 00:00:00', '2014-01-23 14:25:42', 0),
(374, 'Kabupaten Barru', 25, 52000, '0000-00-00 00:00:00', '2014-01-23 14:25:05', 0),
(375, 'Kabupaten Bone', 25, 60000, '0000-00-00 00:00:00', '2014-01-23 14:54:59', 0),
(376, 'Kabupaten Bulukumba', 25, 55000, '0000-00-00 00:00:00', '2014-01-23 14:54:25', 0),
(377, 'Kabupaten Enrekang', 25, 65000, '0000-00-00 00:00:00', '2014-01-23 16:28:15', 0),
(378, 'Kabupaten Gowa', 25, 43000, '0000-00-00 00:00:00', '2014-01-23 16:33:02', 0),
(379, 'Kabupaten Jeneponto', 25, 53000, '0000-00-00 00:00:00', '2014-01-23 16:51:14', 0),
(380, 'Kabupaten Kepulauan Selayar', 25, 70000, '0000-00-00 00:00:00', '2014-01-23 17:19:07', 0),
(381, 'Kabupaten Luwu', 25, 60000, '0000-00-00 00:00:00', '2014-01-24 15:30:35', 0),
(382, 'Kabupaten Luwu Timur', 25, 60000, '0000-00-00 00:00:00', '2014-01-24 15:30:52', 0),
(383, 'Kabupaten Luwu Utara', 25, 73000, '0000-00-00 00:00:00', '2014-01-24 15:31:07', 0),
(384, 'Kabupaten Maros', 25, 45000, '0000-00-00 00:00:00', '2014-01-24 15:45:09', 0),
(385, 'Kabupaten Pangkajene dan Kepulauan', 25, 65000, '0000-00-00 00:00:00', '2014-01-23 17:04:45', 0),
(386, 'Kabupaten Pinrang', 25, 57000, '0000-00-00 00:00:00', '2014-01-23 17:22:36', 0),
(387, 'Kabupaten Sidenreng Rappang', 25, 57000, '0000-00-00 00:00:00', '2014-01-23 17:47:18', 0),
(388, 'Kabupaten Sinjai', 25, 61000, '0000-00-00 00:00:00', '2014-01-23 17:52:41', 0),
(389, 'Kabupaten Soppeng', 25, 59000, '0000-00-00 00:00:00', '2014-01-23 17:56:01', 0),
(390, 'Kabupaten Takalar', 25, 48000, '0000-00-00 00:00:00', '2014-01-23 18:06:19', 0),
(391, 'Kabupaten Tana Toraja', 25, 66000, '0000-00-00 00:00:00', '2014-01-24 09:06:59', 0),
(392, 'Kabupaten Toraja Utara', 25, 66000, '0000-00-00 00:00:00', '2014-01-24 09:23:40', 0),
(393, 'Kabupaten Wajo', 25, 56000, '0000-00-00 00:00:00', '2014-01-24 09:28:31', 0),
(394, 'Kota Makassar', 25, 30000, '0000-00-00 00:00:00', '2014-01-24 15:30:11', 0),
(395, 'Kota Palopo', 25, 50000, '0000-00-00 00:00:00', '2014-01-24 15:51:10', 0),
(396, 'Kota Parepare', 25, 43000, '0000-00-00 00:00:00', '2014-01-24 16:00:46', 0),
(397, 'Kabupaten Bombana', 26, 90000, '0000-00-00 00:00:00', '2014-01-23 14:56:15', 0),
(398, 'Kabupaten Buton', 26, 95000, '0000-00-00 00:00:00', '2014-01-23 15:45:04', 0),
(400, 'Kabupaten Buton Utara', 26, 100000, '0000-00-00 00:00:00', '2014-01-23 15:45:20', 0),
(401, 'Kabupaten Kolaka', 26, 80000, '0000-00-00 00:00:00', '2014-01-24 09:22:07', 0),
(402, 'Kabupaten Kolaka Utara', 26, 83000, '0000-00-00 00:00:00', '2014-01-24 09:22:27', 0),
(403, 'Kabupaten Konawe', 26, 80000, '0000-00-00 00:00:00', '2014-01-24 09:22:53', 0),
(404, 'Kabupaten Konawe Selatan', 26, 85000, '0000-00-00 00:00:00', '2014-01-24 09:23:17', 0),
(405, 'Kabupaten Konawe Utara', 26, 85000, '0000-00-00 00:00:00', '2014-01-24 09:23:50', 0),
(406, 'Kabupaten Muna', 26, 84000, '0000-00-00 00:00:00', '2014-01-23 16:29:16', 0),
(407, 'Kabupaten Wakatobi', 26, 82000, '0000-00-00 00:00:00', '2014-01-24 09:28:52', 0),
(408, 'Kota Bau-Bau', 26, 63000, '0000-00-00 00:00:00', '2014-01-24 15:12:57', 0),
(409, 'Kota Kendari', 26, 44000, '0000-00-00 00:00:00', '2014-01-24 15:25:45', 0),
(410, 'Kabupaten Banggai', 27, 73000, '0000-00-00 00:00:00', '2014-01-23 14:24:07', 0),
(411, 'Kabupaten Banggai Kepulauan', 27, 88000, '0000-00-00 00:00:00', '2014-01-23 14:24:40', 0),
(412, 'Kabupaten Buol', 27, 70000, '0000-00-00 00:00:00', '2014-01-23 15:04:14', 0),
(413, 'Kabupaten Donggala', 27, 60000, '0000-00-00 00:00:00', '2014-01-23 16:07:13', 0),
(414, 'Kabupaten Morowali', 27, 85000, '0000-00-00 00:00:00', '2014-01-24 15:51:46', 0),
(415, 'Kabupaten Parigi Moutong', 27, 65000, '0000-00-00 00:00:00', '2014-01-23 17:08:09', 0),
(416, 'Kabupaten Poso', 27, 79000, '0000-00-00 00:00:00', '2014-01-23 17:26:28', 0),
(417, 'Kabupaten Tojo Una-Una', 27, 73000, '0000-00-00 00:00:00', '2014-01-24 09:20:49', 0),
(418, 'Kabupaten Toli-Toli', 27, 73000, '0000-00-00 00:00:00', '2014-01-24 09:21:16', 0),
(419, 'Kabupaten Sigi', 27, 90000, '0000-00-00 00:00:00', '2014-01-23 17:49:25', 0),
(420, 'Kota Palu', 27, 42000, '0000-00-00 00:00:00', '2014-01-24 15:51:37', 0),
(421, 'Kabupaten Bolaang Mongondow', 28, 100000, '0000-00-00 00:00:00', '2014-01-23 14:57:52', 0),
(422, 'Kabupaten Bolaang Mongondow Selatan', 28, 115000, '0000-00-00 00:00:00', '2014-01-23 15:06:52', 0),
(423, 'Kabupaten Bolaang Mongondow Timur', 28, 100000, '0000-00-00 00:00:00', '2014-01-23 15:07:13', 0),
(424, 'Kabupaten Bolaang Mongondow Utara', 28, 105000, '0000-00-00 00:00:00', '2014-01-23 14:57:17', 0),
(425, 'Kabupaten Kepulauan Sangihe', 28, 105000, '0000-00-00 00:00:00', '2014-01-23 17:18:25', 0),
(426, 'Kabupaten Kepulauan Siau Tagulandang Biaro', 28, 110000, '0000-00-00 00:00:00', '2014-01-23 17:19:57', 0),
(427, 'Kabupaten Kepulauan Talaud', 28, 110000, '0000-00-00 00:00:00', '2014-01-23 17:21:14', 0),
(428, 'Kabupaten Minahasa', 28, 68000, '0000-00-00 00:00:00', '2014-01-24 15:49:30', 0),
(429, 'Kabupaten Minahasa Selatan', 28, 98000, '0000-00-00 00:00:00', '2014-01-24 15:49:55', 0),
(430, 'Kabupaten Minahasa Tenggara', 28, 105000, '0000-00-00 00:00:00', '2014-01-24 15:50:20', 0),
(431, 'Kabupaten Minahasa Utara', 28, 80000, '0000-00-00 00:00:00', '2014-01-24 15:50:39', 0),
(432, 'Kota Bitung', 28, 64000, '0000-00-00 00:00:00', '2014-01-24 15:16:05', 0),
(433, 'Kota Kotamobagu', 28, 75000, '0000-00-00 00:00:00', '2014-01-24 15:26:13', 0),
(434, 'Kota Manado', 28, 51000, '0000-00-00 00:00:00', '2014-01-24 15:30:28', 0),
(435, 'Kota Tomohon', 28, 52000, '0000-00-00 00:00:00', '2014-01-24 16:32:01', 0),
(436, 'Kabupaten Majene', 29, 80000, '0000-00-00 00:00:00', '2014-01-24 15:35:45', 0),
(437, 'Kabupaten Mamasa', 29, 78000, '0000-00-00 00:00:00', '2014-01-24 15:39:20', 0),
(438, 'Kabupaten Mamuju', 29, 85000, '0000-00-00 00:00:00', '2014-01-24 15:40:50', 0),
(439, 'Kabupaten Mamuju Utara', 29, 78000, '0000-00-00 00:00:00', '2014-01-24 15:41:07', 0),
(440, 'Kabupaten Polewali Mandar', 29, 88000, '0000-00-00 00:00:00', '2014-01-23 17:24:24', 0),
(441, 'Kabupaten Buru', 30, 100000, '0000-00-00 00:00:00', '2014-01-23 14:58:22', 0),
(442, 'Kabupaten Buru Selatan', 30, 115000, '0000-00-00 00:00:00', '2014-01-23 15:45:37', 0),
(443, 'Kabupaten Kepulauan Aru', 30, 130000, '0000-00-00 00:00:00', '2014-01-23 17:13:41', 0),
(444, 'Kabupaten Maluku Barat Daya', 30, 130000, '0000-00-00 00:00:00', '2014-01-24 15:37:15', 0),
(445, 'Kabupaten Maluku Tengah', 30, 100000, '0000-00-00 00:00:00', '2014-01-24 15:37:36', 0),
(446, 'Kabupaten Maluku Tenggara', 30, 130000, '0000-00-00 00:00:00', '2014-01-24 15:38:21', 0),
(447, 'Kabupaten Maluku Tenggara Barat', 30, 140000, '0000-00-00 00:00:00', '2014-01-24 15:38:36', 0),
(448, 'Kabupaten Seram Bagian Barat', 30, 126000, '0000-00-00 00:00:00', '2014-01-23 17:43:56', 0),
(449, 'Kabupaten Seram Bagian Timur', 30, 126000, '0000-00-00 00:00:00', '2014-01-23 17:44:16', 0),
(450, 'Kota Ambon', 30, 52000, '0000-00-00 00:00:00', '2014-01-24 15:07:36', 0),
(451, 'Kota Tual', 30, 100000, '0000-00-00 00:00:00', '2014-01-24 16:32:17', 0),
(452, 'Kabupaten Halmahera Barat', 31, 72000, '0000-00-00 00:00:00', '2014-01-23 16:37:13', 0),
(453, 'Kabupaten Halmahera Tengah', 31, 80000, '0000-00-00 00:00:00', '2014-01-23 16:38:25', 0),
(454, 'Kabupaten Halmahera Utara', 31, 100000, '0000-00-00 00:00:00', '2014-01-23 16:41:52', 0),
(455, 'Kabupaten Halmahera Selatan', 31, 95000, '0000-00-00 00:00:00', '2014-01-23 16:37:43', 0),
(456, 'Kabupaten Kepulauan Sula', 31, 100000, '0000-00-00 00:00:00', '2014-01-23 17:20:30', 0),
(457, 'Kabupaten Halmahera Timur', 31, 65000, '0000-00-00 00:00:00', '2014-01-23 16:38:57', 0),
(458, 'Kabupaten Pulau Morotai', 31, 125000, '0000-00-00 00:00:00', '2014-01-23 17:30:12', 0),
(459, 'Kota Ternate', 31, 52000, '0000-00-00 00:00:00', '2014-01-24 16:31:32', 0),
(460, 'Kota Tidore Kepulauan', 31, 64000, '0000-00-00 00:00:00', '2014-01-24 16:31:46', 0),
(461, 'Kabupaten Asmat', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 14:37:44', 0),
(462, 'Kabupaten Biak Numfor', 32, 130000, '0000-00-00 00:00:00', '2014-01-23 15:02:38', 0),
(463, 'Kabupaten Boven Digoel', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 15:03:22', 0),
(464, 'Kabupaten Deiyai', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 16:21:11', 0),
(465, 'Kabupaten Dogiyai', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 16:26:08', 0),
(466, 'Kabupaten Intan Jaya', 32, 120000, '0000-00-00 00:00:00', '2014-01-23 16:46:56', 0),
(467, 'Kabupaten Jayapura', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 16:47:27', 0),
(468, 'Kabupaten Jayawijaya', 32, 110000, '0000-00-00 00:00:00', '2014-01-23 16:47:51', 0),
(469, 'Kabupaten Keerom', 32, 125000, '0000-00-00 00:00:00', '2014-01-23 17:11:12', 0),
(470, 'Kabupaten Kepulauan Yapen', 32, 140000, '0000-00-00 00:00:00', '2014-01-23 17:21:45', 0),
(471, 'Kabupaten Lanny Jaya', 32, 150000, '0000-00-00 00:00:00', '2014-01-24 15:24:23', 0),
(472, 'Kabupaten Mamberamo Raya', 32, 140000, '0000-00-00 00:00:00', '2014-01-24 15:39:59', 0),
(473, 'Kabupaten Mamberamo Tengah', 32, 140000, '0000-00-00 00:00:00', '2014-01-24 15:40:19', 0),
(474, 'Kabupaten Mappi', 32, 123000, '0000-00-00 00:00:00', '2014-01-24 15:44:28', 0),
(475, 'Kabupaten Merauke', 32, 125000, '0000-00-00 00:00:00', '2014-01-24 15:47:51', 0),
(476, 'Kabupaten Mimika', 32, 110000, '0000-00-00 00:00:00', '2014-01-24 15:49:03', 0),
(477, 'Kabupaten Nabire', 32, 125000, '0000-00-00 00:00:00', '2014-01-23 16:36:13', 0),
(478, 'Kabupaten Nduga', 32, 110000, '0000-00-00 00:00:00', '2014-01-23 16:45:05', 0),
(479, 'Kabupaten Paniai', 32, 150000, '0000-00-00 00:00:00', '2014-01-23 17:07:08', 0),
(480, 'Kabupaten Pegunungan Bintang', 32, 125000, '0000-00-00 00:00:00', '2014-01-23 17:14:01', 0),
(481, 'Kabupaten Puncak', 32, 120000, '0000-00-00 00:00:00', '2014-01-23 17:31:10', 0),
(482, 'Kabupaten Puncak Jaya', 32, 120000, '0000-00-00 00:00:00', '2014-01-23 17:31:22', 0),
(483, 'Kabupaten Sarmi', 32, 126000, '0000-00-00 00:00:00', '2014-01-23 17:40:45', 0),
(484, 'Kabupaten Supiori', 32, 126000, '0000-00-00 00:00:00', '2014-01-23 18:04:44', 0),
(485, 'Kabupaten Tolikara', 32, 140000, '0000-00-00 00:00:00', '2014-01-24 09:22:24', 0),
(486, 'Kabupaten Waropen', 32, 140000, '0000-00-00 00:00:00', '2014-01-24 09:29:17', 0),
(487, 'Kabupaten Yahukimo', 32, 141000, '0000-00-00 00:00:00', '2014-01-24 09:31:34', 0),
(488, 'Kabupaten Yalimo', 32, 140000, '0000-00-00 00:00:00', '2014-01-24 09:32:16', 0),
(489, 'Kota Jayapura', 32, 74000, '0000-00-00 00:00:00', '2014-01-24 15:24:23', 0),
(490, 'Kabupaten Fakfak', 33, 140000, '0000-00-00 00:00:00', '2014-01-23 16:09:23', 0),
(491, 'Kabupaten Kaimana', 33, 145000, '0000-00-00 00:00:00', '2014-01-23 16:55:31', 0),
(492, 'Kabupaten Manokwari', 33, 140000, '0000-00-00 00:00:00', '2014-01-24 15:44:05', 0),
(493, 'Kabupaten Maybrat', 33, 145000, '0000-00-00 00:00:00', '2014-01-24 15:45:58', 0),
(494, 'Kabupaten Raja Ampat', 33, 146000, '0000-00-00 00:00:00', '2014-01-23 17:33:49', 0),
(495, 'Kabupaten Sorong', 33, 97000, '0000-00-00 00:00:00', '2014-01-23 17:57:25', 0),
(496, 'Kabupaten Sorong Selatan', 33, 117000, '0000-00-00 00:00:00', '2014-01-23 17:57:50', 0),
(497, 'Kabupaten Tambrauw', 33, 140000, '0000-00-00 00:00:00', '2014-01-23 18:07:05', 0),
(498, 'Kabupaten Teluk Bintuni', 33, 140000, '0000-00-00 00:00:00', '2014-01-24 09:17:56', 0),
(499, 'Kabupaten Teluk Wondama', 33, 140000, '0000-00-00 00:00:00', '2014-01-24 09:18:14', 0),
(500, 'Kota Sorong', 33, 73000, '0000-00-00 00:00:00', '2014-01-24 16:22:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `namapengguna` varchar(300) NOT NULL,
  `foto` varchar(300) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `idpropinsi` int(11) NOT NULL,
  `idkota` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `alamat` text NOT NULL,
  `alamat2` text NOT NULL,
  `notelp` varchar(100) NOT NULL,
  `level_notelp` int(1) NOT NULL,
  `pinbb` varchar(50) NOT NULL,
  `wechatid` varchar(50) NOT NULL,
  `yahooid` varchar(50) NOT NULL,
  `akunfacebook` varchar(100) NOT NULL,
  `akuntwitter` varchar(100) NOT NULL,
  `norek` varchar(200) NOT NULL,
  `level_norek` int(11) NOT NULL,
  `bio` text NOT NULL,
  `new_member` date NOT NULL,
  `id_alamat` int(11) NOT NULL,
  `id_rekening` int(11) NOT NULL,
  `kode_pos` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `namapengguna`, `foto`, `firstname`, `lastname`, `idpropinsi`, `idkota`, `email`, `alamat`, `alamat2`, `notelp`, `level_notelp`, `pinbb`, `wechatid`, `yahooid`, `akunfacebook`, `akuntwitter`, `norek`, `level_norek`, `bio`, `new_member`, `id_alamat`, `id_rekening`, `kode_pos`, `date_add`, `date_upd`, `level`) VALUES
(3, '', '', 'Adit', 'Global', 21, 328, 'masihtahapbelajar@gmail.com', '', '', '085756363121', 0, '', '', '', '', '', '', 0, '', '2018-05-30', 3, 0, 0, '2018-05-30 15:20:30', '2018-05-30 15:20:30', 0),
(4, '', '', 'test', 'test', 20, 313, 'test@gmail.com', '', '', '085756363121', 0, '', '', '', '', '', '', 0, '', '2018-05-31', 4, 0, 0, '2018-05-31 09:45:09', '2018-05-31 09:45:09', 0),
(5, '', '', 'mas', 'xander', 3, 65, 'xander@gmail.com', '', '', '094637892', 0, '', '', '', '', '', '', 0, '', '2018-08-21', 5, 0, 0, '2018-08-21 10:14:28', '2018-08-21 10:14:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `about` longtext NOT NULL,
  `production` longtext NOT NULL,
  `buyer` longtext NOT NULL,
  `custom` longtext NOT NULL,
  `payment` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `about`, `production`, `buyer`, `custom`, `payment`) VALUES
(1, '<div class=\"post-content\">\r\n                                  <p>SeaGods Wetsuit is a neoprene \r\nclothing and accessories manufacturer, specializing in the production of\r\n wetsuits, rash guards, neoprene fashion and accessories. We offer \r\ncustom-fit wetsuits that will take your diving and other sports to the \r\nnext level. A level of comfort and warmth not found in an off-the-rack \r\nsuit with the ability to customize the suit to allow your personality \r\nand preferences to shine through. We also offer a wide-range of neoprene\r\n fashion and accessories, from bikinis to underwater dome covers. We are\r\n happy to work with you to design anything you need.</p>\r\n\r\n<p>With over 20 years experience in expert tailoring and neoprene manufacturing, we can guarantee your satisfaction.</p>\r\n\r\n<p>Our work is inspired by the sea and fits you like a dream.</p>\r\n                              </div>', 'More information will follow soon - Please stay tuned!', '<div class=\"post-content\">\r\n                                  <p>Sea Gods Westsuit offers a variety \r\nof materials and designs to ensure you an ideal underwater experience. \r\nWe know that a perfect-fitting wetsuit minimizes the amount of water \r\nentering the suit and keeps you warm and comfortable underwater.</p>\r\n\r\n<p><br>\r\nThree main factors determine your choice of wetsuit: planned maximum \r\ndepth, anticipated water temperature, and amount of time spent in the \r\nwater.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Planned maximum depth - you need to be concerned about compression of the material as you descend.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Anticipated water temperature - the colder the water, the thicker the suit!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Amount of time spent underwater - the longer you dive, the more protection you will need to stay warm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This is why we offer suits ranging from 2.1 to 6.5 mm thickness. Not \r\nsure what best suits your needs? Just ask our friendly staff to advise.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When you buy a Sea Gods Wetsuit, you can be assured that you are \r\nbuying the best product on the market. Made from only the best materials\r\n and constructed by precision tailors, we can guarantee your suit will \r\nfit like a dream.</p>\r\n                              </div>\r\n            \r\n          \r\n        \r\n      \r\n    ', 'Hello Summernote', '<div class=\"post-content\">\r\n                                  <p>We accept payment by Paypal or bank transfer. &nbsp;You can find the details for each below.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You don\'t need a Paypal account to use Paypal. You can use this with your Visa or Mastercard.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please contact us if you need more information.&nbsp;</p>\r\n                              </div>');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id_photo` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id_photo`, `id_item`, `photo`, `date_add`, `date_upd`, `level`) VALUES
(1, 4, '258d9448a19a554a106f9c62c162cd6f--community-logo-civil-society.jpg', '2018-03-03 12:48:14', '2018-03-03 12:48:14', 0),
(2, 4, 'Cara Mudah Membuat Logo Android Menggunakan CorelDRAW by teoridesain.jpg', '2018-03-03 12:48:14', '2018-03-03 12:48:14', 0),
(3, 5, 'dscn0412.jpg', '2018-03-03 12:53:30', '2018-03-03 12:53:30', 0),
(4, 5, 'elephant1.jpg', '2018-03-03 12:53:30', '2018-03-03 12:53:30', 0),
(5, 5, 'ttttttttttttt.jpg', '2018-03-03 12:53:30', '2018-03-03 12:53:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `idProvinsi` int(5) NOT NULL,
  `namaProvinsi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`idProvinsi`, `namaProvinsi`) VALUES
(1, 'Aceh'),
(2, 'Sumatera Utara'),
(3, 'Bengkulu'),
(4, 'Jambi'),
(5, 'Riau'),
(6, 'Sumatera Barat'),
(7, 'Sumatera Selatan'),
(8, 'Lampung'),
(9, 'Kepulauan Bangka Belitung'),
(10, 'Kepulauan Riau'),
(11, 'Banten'),
(12, 'Jawa Barat'),
(13, 'DKI Jakarta'),
(14, 'Jawa Tengah'),
(15, 'Jawa Timur'),
(16, 'Daerah Istimewa Yogyakarta'),
(17, 'Bali'),
(18, 'Nusa Tenggara Barat'),
(19, 'Nusa Tenggara Timur'),
(20, 'Kalimantan Barat'),
(21, 'Kalimantan Selatan'),
(22, 'Kalimantan Tengah'),
(23, 'Kalimantan Timur'),
(24, 'Gorontalo'),
(25, 'Sulawesi Selatan'),
(26, 'Sulawesi Tenggara'),
(27, 'Sulawesi Tengah'),
(28, 'Sulawesi Utara'),
(29, 'Sulawesi Barat'),
(30, 'Maluku'),
(31, 'Maluku Utara'),
(32, 'Papua'),
(33, 'Papua Barat');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(50) NOT NULL,
  `sess_id` varchar(200) NOT NULL,
  `uid` varchar(6) NOT NULL,
  `logged` varchar(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `waktu` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `sess_id`, `uid`, `logged`, `ip`, `waktu`) VALUES
(1, 'o14a2kabs5ubg62q3tl71bl5v4', '1', '0', '127.0.0.1', '2018-02-07 3:56:48'),
(2, 'rf9f7q1bj387qp2ch4gf00b0s1', '1', '0', '127.0.0.1', '2018-02-08 2:28:09'),
(3, '493ff272ff6ffa35039ad35ea025ff8f', '1', '0', '202.58.196.94', '2018-02-19 13:38:53'),
(4, '271a81229c3e18cda01fb1aaaa6d9516', '1', '1', '202.58.200.146', ''),
(5, '9d2d4212f3a2f234ade22d077f357803', '1', '0', '202.58.200.146', '2018-03-02 9:21:46'),
(6, '768d5fcb4f30b8a88ddcdd0bf84a63af', '1', '0', '202.58.200.10', '2018-03-02 9:35:10'),
(7, '30510620a4c3dcea800a037aadedd9bc', '1', '0', '202.58.200.10', '2018-03-02 10:37:25'),
(8, '014f16862904c56ee6468c10d86703fc', '1', '0', '202.58.200.10', '2018-03-03 10:08:08'),
(9, '4465204501c9302c3651779b712587fc', '1', '0', '202.58.200.2', '2018-03-03 12:51:11'),
(10, '92a4b56eb04e3925ab9dbac2455f75b9', '1', '1', '202.58.200.10', ''),
(11, 'd1909a55dfbd2c1fad133a29fc5b34b6', '1', '0', '202.58.200.2', '2018-03-06 9:28:25'),
(12, '2d88d1da0328c78d6f41c567158ce7b1', '1', '0', '202.58.200.146', '2018-03-07 16:21:05'),
(13, 'dc8e5c0ccbf54f513eb4c3d005947d6d', '1', '0', '202.58.200.10', '2018-03-07 16:21:53'),
(14, 'f8c6002e38dec6665acc53cbcf12a29d', '1', '0', '202.58.200.10', '2018-03-10 16:44:47'),
(15, 'b3e0bfc17f3ebbec91f73f3a5e9f220a', '1', '0', '202.58.200.146', '2018-03-16 10:20:11'),
(16, '0cd13e06230f0c4462ce9c788b52ea74', '1', '0', '202.58.200.146', '2018-03-22 9:33:17'),
(17, '3576f6f990c62fd61d81e246ba58ff68', '1', '0', '202.58.200.10', '2018-03-22 9:36:06'),
(18, '468b8e3f9750ed7fea924bca5ca5cf54', '1', '0', '202.58.200.146', '2018-03-22 16:08:08'),
(19, '3745b92729ff0462a8bf703e24f37d05', '1', '0', '202.58.196.94', '2018-03-26 13:14:36'),
(20, '903940ab6b3b5c387b54ab8f6d643ebc', '1', '0', '202.58.200.10', '2018-03-27 13:54:42'),
(21, '64b77ceea4b626b581c6fe3a7875c942', '1', '0', '43.252.104.38', '2018-04-07 16:04:47'),
(22, 'f383a81b54a0437d6f0f824137906dbd', '1', '0', '202.58.200.146', '2018-04-07 16:05:27'),
(23, '918ac8455ba0b3598309e54b992fcb68', '1', '0', '202.58.200.2', '2018-04-10 12:23:15'),
(24, '906ab22cb314ffc5843d105a1953e3a1', '1', '0', '202.58.200.10', '2018-04-11 14:55:32'),
(25, '53fbadcbfa9776c6484dd0be407ce162', '1', '0', '202.58.200.2', '2018-04-16 10:33:04'),
(26, 'd5d834a4c25fc4dd825c97317714c808', '1', '0', '202.58.200.2', '2018-04-16 14:25:50'),
(27, '0dcf97440a2ca5d3b76b2efc0918c87b', '1', '0', '202.58.200.2', '2018-04-18 9:43:00'),
(28, 'e657cd27ee7bd8f8157af6bb53110636', '1', '0', '202.58.200.2', '2018-04-23 12:55:45'),
(29, '8d183e82ca77b0054312c42221e49403', '5', '0', '202.58.200.146', '2018-05-26 11:18:22'),
(30, '3b7fccc63734c40f4181a1aa29dcdd89', '1', '0', '202.58.200.2', '2018-05-30 14:22:37'),
(31, 'fb496115c9b7c19a79a71f7dd84db458', '6', '1', '202.58.200.146', '2018-05-30 15:22:05'),
(32, 'fb496115c9b7c19a79a71f7dd84db458', '6', '1', '202.58.200.146', '2018-05-30 15:24:28'),
(33, 'fb496115c9b7c19a79a71f7dd84db458', '1', '0', '202.58.200.146', '2018-05-30 16:23:27'),
(34, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '1', '202.58.200.146', '2018-05-31 12:56:45'),
(35, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '1', '202.58.200.146', '2018-05-31 12:57:22'),
(36, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '1', '202.58.200.146', '2018-05-31 12:57:51'),
(37, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '1', '202.58.200.146', '2018-05-31 12:58:35'),
(38, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '1', '202.58.200.146', '2018-05-31 13:04:09'),
(39, '8bbaa91f8f86f1daed6b6ebdb7cd2539', '6', '1', '202.58.200.146', '2018-05-31 13:03:15'),
(40, 'bbdcfa8a590c1ed970216687bf9bcde0', '6', '0', '202.58.200.146', '2018-05-31 13:04:19'),
(41, '8bbaa91f8f86f1daed6b6ebdb7cd2539', '6', '1', '202.58.200.146', '2018-05-31 14:11:35'),
(42, '8bbaa91f8f86f1daed6b6ebdb7cd2539', '6', '1', '202.58.200.146', ''),
(43, '8bbaa91f8f86f1daed6b6ebdb7cd2539', '6', '0', '202.58.200.146', '2018-05-31 15:52:12'),
(44, '5d777c146daab10b7617b2906ccf8f13', '6', '0', '202.58.200.146', '2018-06-02 10:27:58'),
(45, 'c9f3576abc2081498274e669c60d12f8', '6', '1', '202.58.200.146', '2018-06-02 17:31:04'),
(46, '5d777c146daab10b7617b2906ccf8f13', '1', '0', '202.58.200.146', '2018-06-02 11:16:31'),
(47, 'a4390cc97b620f9dad687a3699ac984f', '1', '0', '202.58.200.146', '2018-06-02 13:50:44'),
(48, 'c9f3576abc2081498274e669c60d12f8', '1', '1', '202.58.200.146', ''),
(49, '93e663799b3c180f5d77ed732da7eb23', '6', '0', '202.58.200.146', '2018-06-09 16:51:17'),
(50, 'd1b9039131c1156630c52ec0975bba28', '6', '0', '202.58.200.146', '2018-06-26 10:04:57'),
(51, 'ad57be68aff3a20428bbedf60eb222cd', '6', '0', '202.58.196.94', '2018-06-26 10:05:55'),
(52, 'd1b9039131c1156630c52ec0975bba28', '1', '1', '202.58.200.146', ''),
(53, '75cf3e57a9760f5d7103383b3176f55e', '1', '1', '202.58.200.146', ''),
(54, '75cf3e57a9760f5d7103383b3176f55e', '6', '1', '202.58.200.146', '2018-07-02 16:40:49'),
(55, '75cf3e57a9760f5d7103383b3176f55e', '1', '1', '202.58.200.146', ''),
(56, '5fca66fe930250757487ccd067e00fa3', '1', '0', '202.58.200.146', '2018-07-03 11:19:38'),
(57, '0f575fc4d8d67d268fb934ac53ff6aaf', '1', '0', '202.58.200.146', '2018-07-04 10:31:37'),
(58, 'b2bb3238143fafacdc9c84c6cf68a775', '1', '0', '202.58.196.94', '2018-07-09 20:46:35'),
(59, 'b2bb3238143fafacdc9c84c6cf68a775', '6', '0', '202.58.196.94', '2018-07-09 20:47:26'),
(60, '5f7616d3edb66a63bdaba58acf772366', '1', '1', '202.58.196.110', ''),
(61, '830c2e15d0479a2e490fa1f161b7a903', '6', '1', '202.58.200.146', '2018-07-13 17:56:01'),
(62, '5790d8bb29796881b9004244b68640cf', '1', '1', '202.58.200.146', ''),
(63, '5790d8bb29796881b9004244b68640cf', '6', '0', '202.58.200.146', '2018-08-20 11:00:25'),
(64, 'f58983593335bda877adbe8428eb812d', '6', '1', '202.58.200.146', '2018-08-21 10:13:07'),
(65, 'f58983593335bda877adbe8428eb812d', '1', '0', '202.58.200.146', '2018-08-21 10:12:07'),
(66, 'f58983593335bda877adbe8428eb812d', '8', '0', '202.58.200.146', '2018-08-21 10:15:18'),
(67, '8f2a2f88f29c0d895ffc7bef193e1075', '8', '0', '209.58.163.219', '2018-08-21 15:47:31'),
(68, '8f2a2f88f29c0d895ffc7bef193e1075', '1', '0', '209.58.162.210', '2018-08-21 15:50:26'),
(69, 'e62f1faff0cea26a3e110f88cf1c5f75', '6', '1', '202.58.200.146', '2018-10-12 16:06:23'),
(70, 'e62f1faff0cea26a3e110f88cf1c5f75', '6', '0', '202.58.200.146', '2018-10-12 16:42:35'),
(71, '330ac6720a3df19b5caaf76dfe9d510c', '6', '1', '202.58.200.146', '2018-10-17 15:13:22'),
(72, '477c1019282de5cc027851b1600943c7', '6', '0', '202.58.200.146', '2018-10-17 15:11:14'),
(73, '330ac6720a3df19b5caaf76dfe9d510c', '6', '0', '202.58.200.146', '2018-10-17 15:13:34'),
(74, '752ecbc0d87ea0bdd65d2296297f32f5', '6', '0', '202.58.200.146', '2018-10-19 10:47:51'),
(75, '591742774a4555f01ed057860342af92', '6', '0', '202.58.200.146', '2018-10-23 11:48:35'),
(76, 'c32fa6fcc3c20a76f2469a702adb7d6d', '6', '0', '202.58.196.110', '2018-10-23 11:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `kode_transaction` varchar(50) NOT NULL,
  `id_member` int(20) NOT NULL,
  `status` varchar(40) NOT NULL,
  `konfirm` varchar(40) NOT NULL,
  `total` int(30) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(6) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(90) NOT NULL,
  `email` varchar(255) NOT NULL,
  `group` enum('admin','member','admin_toko') NOT NULL,
  `lastvisit` datetime NOT NULL,
  `online` varchar(2) NOT NULL,
  `blokir` enum('ya','tidak') NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `group`, `lastvisit`, `online`, `blokir`, `id_member`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'adit@globalxtreme.net', 'admin', '2018-08-21 15:50:26', '0', 'tidak', 1),
(8, 'xander', '25d55ad283aa400af464c76d713c07ad', 'xander@gmail.com', 'member', '2018-08-21 15:47:31', '0', 'tidak', 5),
(7, 'test', '25d55ad283aa400af464c76d713c07ad', 'test@gmail.com', 'member', '2018-05-31 09:45:09', '0', 'tidak', 4),
(6, 'sccs', '25d55ad283aa400af464c76d713c07ad', 'masihtahapbelajar@gmail.com', 'member', '2018-10-23 11:52:15', '0', 'tidak', 3);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id_wishlist`, `id_member`, `code`, `title`, `price`) VALUES
(1, 3, 'DNLCz', 'green wetsuit', '56'),
(2, 3, 'AuzdD', 'green wetsuit', '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_member`
--
ALTER TABLE `alamat_member`
  ADD PRIMARY KEY (`id_alamat`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_cart`
--
ALTER TABLE `custom_cart`
  ADD PRIMARY KEY (`id_custom_cart`);

--
-- Indexes for table `custom_measure`
--
ALTER TABLE `custom_measure`
  ADD PRIMARY KEY (`id_measure`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`idKota`),
  ADD KEY `idProvinsi` (`idProvinsi`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id_photo`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`idProvinsi`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_member`
--
ALTER TABLE `alamat_member`
  MODIFY `id_alamat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_cart`
--
ALTER TABLE `custom_cart`
  MODIFY `id_custom_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `custom_measure`
--
ALTER TABLE `custom_measure`
  MODIFY `id_measure` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `idKota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
