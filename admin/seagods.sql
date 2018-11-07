-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2018 at 05:35 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `seagods`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`id_cat` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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
(8, 0, 'NewTes', 0),
(9, 0, 'tetsnmj dfgdfg', 0),
(10, 0, 'fffffffffffffff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
`id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` varchar(2250) NOT NULL,
  `messages` varchar(5250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
`id_item` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `detail` text NOT NULL,
  `description` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `title`, `id_cat`, `price`, `detail`, `description`, `date_add`, `date_upd`, `level`) VALUES
(1, 'blue Wetsuit', 1, '$ 250', ' lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime ', ' lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime  lorem ipsum dolor sit aime ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 'orange wetsuit', 3, '$ 900', 'lsdkfj;ldfj\r\nsjldkfjsldf\r\nalkfja\r\n\r\njfklajf', 'lfkjfa\r\n\r\nlakjd\r\n\r\najlskdj', '2018-02-08 15:52:31', '2018-02-08 15:52:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
`id_member` int(25) NOT NULL,
  `foto` varchar(300) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `addrs` text NOT NULL,
  `notelp` varchar(100) NOT NULL,
  `kode_pos` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `foto`, `firstname`, `lastname`, `addrs`, `notelp`, `kode_pos`, `date_add`, `date_upd`, `level`) VALUES
(1, 'images/s-logo.png', 'admin', 'seagods', 'Jl Raya Malang No 12<br>Malang', '081236574849', 65151, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, '', 'John', 'Guwe', 'adhfadfdsf', '43523356356', 335635, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(3, 'images/s-logo.png', '', 'Tama', 'sdfsaddsa\r\nadsfasdfas\r\nasdfads', '0823456774', 64123, '2018-02-08 12:54:47', '2018-02-08 12:54:47', 0),
(4, 'images/s-logo.png', '', 'Tama', 'dvasvaw  asdasd as asd sd', '08234567746', 64123, '2018-02-08 13:00:20', '2018-02-08 13:00:20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
`id_photo` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
`id` int(50) NOT NULL,
  `sess_id` varchar(200) NOT NULL,
  `uid` varchar(6) NOT NULL,
  `logged` varchar(1) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `waktu` varchar(30) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `sess_id`, `uid`, `logged`, `ip`, `waktu`) VALUES
(1, 'o14a2kabs5ubg62q3tl71bl5v4', '1', '0', '127.0.0.1', '2018-02-07 3:56:48'),
(2, 'rf9f7q1bj387qp2ch4gf00b0s1', '1', '0', '127.0.0.1', '2018-02-08 2:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id_user` int(6) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(90) NOT NULL,
  `email` varchar(255) NOT NULL,
  `group` enum('admin','member','admin_toko') NOT NULL,
  `lastvisit` datetime NOT NULL,
  `online` varchar(2) NOT NULL,
  `blokir` enum('ya','tidak') NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `group`, `lastvisit`, `online`, `blokir`, `id_member`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'adit@globalxtreme.net', 'admin', '2018-02-08 09:28:09', '0', 'tidak', 1),
(2, 'john', 'e10adc3949ba59abbe56e057f20f883e', 'john@tabuni.com', 'member', '0000-00-00 00:00:00', '', 'tidak', 2),
(3, 'aditya', 'd41d8cd98f00b204e9800998ecf8427e', 'adit@gx.com', 'member', '0000-00-00 00:00:00', '', 'tidak', 1),
(4, 'admin1', 'd9b317eb8eb9977c88403eab8d1ab935', 'adit@gx.comw', 'member', '0000-00-00 00:00:00', '', 'tidak', 5);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `item`
--
ALTER TABLE `item`
 ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
 ADD PRIMARY KEY (`id_photo`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `id_member` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
