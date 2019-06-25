-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2019 at 11:47 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbclassifiedweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `adId` int(10) NOT NULL,
  `adTitle` varchar(40) NOT NULL,
  `adDescription` varchar(40) NOT NULL,
  `adPrice` decimal(10,0) NOT NULL,
  `articleQuantity` int(11) NOT NULL,
  `adPostedDate` date NOT NULL,
  `adExpiredDate` date NOT NULL,
  `adPicture` blob NOT NULL,
  `idCategory` int(10) NOT NULL,
  `idMember` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`adId`, `adTitle`, `adDescription`, `adPrice`, `articleQuantity`, `adPostedDate`, `adExpiredDate`, `adPicture`, `idCategory`, `idMember`) VALUES
(6, 'Iphone 8', 'Like New!', '150', 1, '2019-04-06', '2019-04-16', 0x6970686f6e65382e6a7067, 2, 11),
(7, 'Ford Focus', 'Great Condition', '30000', 1, '2019-04-01', '2019-04-30', 0x5553433530464f43313232423032313030312e6a7067, 1, 12),
(8, 'Imac 21', 'Never Repaired', '500', 1, '2019-04-10', '2019-05-10', 0x7265667572622d323031372d696d61632d32372d67616c6c6572792e6a7067, 2, 12),
(9, 'Speakers', 'Like new!', '20', 1, '2019-04-04', '2019-04-24', 0x61357769626c61636b2e6a7067, 2, 11),
(10, 'Ferrari', 'I need some cash', '1000000', 1, '2019-05-01', '2019-05-31', 0x666572726172692d3831322d7375706572666173742d6578746572696f722d6d646d2d30303031345f313932307831363030632e6a7067, 1, 13),
(11, 'Murcielago', 'A cheap car for everybody', '900000', 1, '2019-04-26', '2019-05-30', 0x687164656661756c742e6a7067, 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(10) NOT NULL,
  `categoryName` varchar(40) NOT NULL,
  `categoryLanguage` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`, `categoryLanguage`) VALUES
(1, 'Vehicles', 'English'),
(2, 'Electronics', 'English'),
(3, 'Clothing', 'English'),
(4, 'Sports', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member_id` int(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(15) NOT NULL,
  `State` varchar(5) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `name`, `Address`, `City`, `State`, `Phone`, `Email`, `Password`) VALUES
(11, 'Carolina', '5000 Claranal', 'Montreal', 'QC', '5143335431', 'caro@gmail.com', '12345678'),
(12, 'Miguel Arcay', '500 St Lauren', 'Montreal', 'QC', '5145661232', 'miguel@gmail.com', '12345678'),
(13, 'Carlos Goncalves', 'cgoncalves18@gmail.com', 'Montreal', 'QC', '4385021540', 'cgoncalves18@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment-ID` int(10) NOT NULL,
  `cardName` varchar(40) NOT NULL,
  `cardType` varchar(20) NOT NULL,
  `cardNumber` varchar(16) NOT NULL,
  `cardCvc` varchar(3) NOT NULL,
  `expiredMonth` varchar(2) NOT NULL,
  `expiredYear` varchar(4) NOT NULL,
  `idMember` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment-ID`, `cardName`, `cardType`, `cardNumber`, `cardCvc`, `expiredMonth`, `expiredYear`, `idMember`) VALUES
(3, 'Carolina Perez', '01', '4538123415408562', '585', '02', '22', 11),
(5, 'Miguel Arcay Di Venere', '01', '5485123454968745', '352', '02', '20', 12),
(6, 'Carlos Goncalves', '02', '4598789578954585', '895', '11', '20', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`adId`),
  ADD KEY `ID-Category` (`idCategory`,`idMember`),
  ADD KEY `ID-Member` (`idMember`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment-ID`),
  ADD KEY `ID-Member` (`idMember`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `adId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `member_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment-ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `ads_ibfk_4` FOREIGN KEY (`idCategory`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `member` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
