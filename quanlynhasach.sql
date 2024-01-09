-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2024 lúc 04:50 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlynhasach`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMonthlyStatistics` (IN `p_category_id` INT)   BEGIN
    SELECT 
        MONTH(bl.date_start) AS month,
        SUM(bi.quantity * bi.price) AS revenue, 
        SUM(bi.quantity) AS quantity
    FROM 
        bill_info bi
    JOIN 
        book b ON bi.id_book = b.id
    JOIN 
        bill bl ON bi.id_bill = bl.id
    WHERE 
        b.category_id = p_category_id
        AND MONTH(bl.date_start) > 0 AND MONTH(bl.date_start) < 13
    GROUP BY
        MONTH(bl.date_start)
    ORDER BY
        MONTH(bl.date_start);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `date_start` varchar(15) DEFAULT date_format(current_timestamp(),'%Y-%m-%d'),
  `customer_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `emp_name`, `date_start`, `customer_name`) VALUES
(39, '', '2024-01-09', ''),
(40, '', '2024-01-09', ''),
(41, '', '2024-02-09', ''),
(42, '', '2024-03-09', ''),
(43, '', '2024-04-09', ''),
(44, '', '2024-05-09', ''),
(45, '', '2024-06-09', ''),
(46, '', '2024-07-09', ''),
(47, '', '2024-08-09', ''),
(48, '', '2024-09-09', ''),
(49, '', '2024-10-09', ''),
(50, '', '2024-11-09', ''),
(51, '', '2024-12-09', ''),
(52, '', '2024-01-09', ''),
(53, '', '2024-02-09', ''),
(54, '', '2024-03-09', ''),
(55, '', '2024-04-09', ''),
(56, '', '2024-05-09', ''),
(57, '', '2024-06-09', ''),
(58, '', '2024-07-09', ''),
(59, '', '2024-08-09', ''),
(60, '', '2024-09-09', ''),
(61, '', '2024-10-09', ''),
(62, '', '2024-11-09', ''),
(63, '', '2024-12-09', ''),
(64, '', '2024-01-09', ''),
(65, '', '2024-02-09', ''),
(66, '', '2024-03-09', ''),
(67, '', '2024-04-09', ''),
(68, '', '2024-05-09', ''),
(69, '', '2024-06-09', ''),
(70, '', '2024-07-09', ''),
(71, '', '2024-08-09', ''),
(72, '', '2024-09-09', ''),
(73, '', '2024-10-09', ''),
(74, '', '2024-11-09', ''),
(75, '', '2024-12-09', ''),
(76, '', '2024-01-09', ''),
(77, '', '2024-02-09', ''),
(78, '', '2024-03-09', ''),
(79, '', '2024-04-09', ''),
(80, '', '2024-05-09', ''),
(81, '', '2024-06-09', ''),
(82, '', '2024-07-09', ''),
(83, '', '2024-08-09', ''),
(84, '', '2024-09-09', ''),
(85, '', '2024-10-09', ''),
(86, '', '2024-11-09', ''),
(87, '', '2024-12-09', ''),
(88, '', '2024-01-09', ''),
(89, '', '2024-02-09', ''),
(90, '', '2024-03-09', ''),
(91, '', '2024-04-09', ''),
(92, '', '2024-05-09', ''),
(93, '', '2024-06-09', ''),
(94, '', '2024-07-09', ''),
(95, '', '2024-08-09', ''),
(96, '', '2024-09-09', ''),
(97, '', '2024-10-09', ''),
(98, '', '2024-11-09', ''),
(99, '', '2024-12-09', ''),
(100, '', '2024-01-09', ''),
(101, '', '2024-02-09', ''),
(102, '', '2024-03-09', ''),
(103, '', '2024-04-09', ''),
(104, '', '2024-05-09', ''),
(105, '', '2024-06-09', ''),
(106, '', '2024-07-09', ''),
(107, '', '2024-08-09', ''),
(108, '', '2024-09-09', ''),
(109, '', '2024-10-09', ''),
(110, '', '2024-11-09', ''),
(111, '', '2024-12-09', ''),
(112, '', '2024-01-09', ''),
(113, '', '2024-02-09', ''),
(114, '', '2024-03-09', ''),
(115, '', '2024-04-09', ''),
(116, '', '2024-05-09', ''),
(117, '', '2024-06-09', ''),
(118, '', '2024-07-09', ''),
(119, '', '2024-08-09', ''),
(120, '', '2024-09-09', ''),
(121, '', '2024-10-09', ''),
(122, '', '2024-11-09', ''),
(123, '', '2024-12-09', ''),
(124, '', '2024-01-09', ''),
(125, '', '2024-02-09', ''),
(126, '', '2024-03-09', ''),
(127, '', '2024-04-09', ''),
(128, '', '2024-05-09', ''),
(129, '', '2024-06-09', ''),
(130, '', '2024-07-09', ''),
(131, '', '2024-08-09', ''),
(132, '', '2024-09-09', ''),
(133, '', '2024-10-09', ''),
(134, '', '2024-11-09', ''),
(135, '', '2024-12-09', ''),
(136, '', '2024-01-09', ''),
(137, '', '2024-02-09', ''),
(138, '', '2024-03-09', ''),
(139, '', '2024-04-09', ''),
(140, '', '2024-05-09', ''),
(141, '', '2024-06-09', ''),
(142, '', '2024-07-09', ''),
(143, '', '2024-08-09', ''),
(144, '', '2024-09-09', ''),
(145, '', '2024-10-09', ''),
(146, '', '2024-11-09', ''),
(147, '', '2024-12-09', ''),
(148, '', '2024-01-09', ''),
(149, '', '2024-02-09', ''),
(150, '', '2024-03-09', ''),
(151, '', '2024-04-09', ''),
(152, '', '2024-05-09', ''),
(153, '', '2024-06-09', ''),
(154, '', '2024-07-09', ''),
(155, '', '2024-08-09', ''),
(156, '', '2024-09-09', ''),
(157, '', '2024-10-09', ''),
(158, '', '2024-11-09', ''),
(159, '', '2024-12-09', ''),
(160, '', '2024-01-09', ''),
(161, '', '2024-02-09', ''),
(162, '', '2024-03-09', ''),
(163, '', '2024-04-09', ''),
(164, '', '2024-05-09', ''),
(165, '', '2024-06-09', ''),
(166, '', '2024-07-09', ''),
(167, '', '2024-08-09', ''),
(168, '', '2024-09-09', ''),
(169, '', '2024-10-09', ''),
(170, '', '2024-11-09', ''),
(171, '', '2024-12-09', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_info`
--

CREATE TABLE `bill_info` (
  `id` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_info`
--

INSERT INTO `bill_info` (`id`, `id_book`, `id_bill`, `quantity`, `price`) VALUES
(30, 50, 39, 2, 50000),
(31, 51, 39, 2, 60000),
(32, 52, 39, 2, 70000),
(33, 53, 39, 2, 55000),
(34, 54, 39, 2, 12312),
(35, 55, 39, 2, 32332),
(36, 56, 39, 2, 12312),
(37, 57, 39, 2, 55323),
(38, 58, 39, 2, 32411),
(39, 59, 39, 2, 23432),
(40, 60, 40, 12, 53000),
(41, 52, 41, 21, 123123),
(42, 50, 42, 12, 50000),
(43, 52, 43, 21, 53000),
(44, 55, 44, 12, 123123),
(45, 54, 45, 12, 32211),
(46, 53, 46, 2, 53000),
(47, 56, 47, 21, 50000),
(48, 50, 48, 4, 13123),
(49, 50, 49, 4, 13123),
(50, 52, 50, 5, 21312),
(51, 54, 50, 3, 42321),
(52, 52, 51, 3, 21312),
(53, 54, 51, 2, 42321),
(54, 52, 52, 3, 21312),
(55, 54, 52, 2, 42321),
(56, 61, 53, 2, 23421),
(57, 60, 53, 5, 35232),
(58, 61, 54, 4, 23421),
(59, 60, 54, 7, 35232),
(60, 61, 55, 1, 23421),
(61, 60, 55, 2, 35232),
(62, 61, 56, 3, 23421),
(63, 60, 56, 5, 35232),
(64, 61, 57, 4, 23421),
(65, 60, 57, 8, 35232),
(66, 61, 58, 2, 23421),
(67, 60, 58, 8, 35232),
(68, 61, 59, 3, 23421),
(69, 60, 59, 8, 35232),
(70, 61, 60, 3, 23421),
(71, 60, 60, 1, 35232),
(72, 61, 61, 3, 23421),
(73, 60, 61, 2, 35232),
(74, 61, 62, 3, 23421),
(75, 60, 62, 4, 35232),
(76, 61, 63, 3, 23421),
(77, 60, 63, 9, 35232),
(78, 70, 64, 3, 23421),
(79, 73, 64, 9, 35232),
(80, 70, 65, 2, 23421),
(81, 73, 65, 9, 35232),
(82, 70, 66, 3, 23421),
(83, 73, 66, 9, 35232),
(84, 70, 67, 4, 23421),
(85, 73, 67, 9, 35232),
(86, 70, 68, 5, 23421),
(87, 73, 68, 9, 35232),
(88, 70, 69, 6, 23421),
(89, 73, 69, 9, 35232),
(90, 70, 70, 7, 23421),
(91, 73, 70, 9, 35232),
(92, 70, 71, 7, 23421),
(93, 73, 71, 8, 35232),
(94, 70, 72, 7, 23421),
(95, 73, 72, 6, 35232),
(96, 70, 73, 7, 23421),
(97, 73, 73, 5, 35232),
(98, 70, 74, 7, 23421),
(99, 73, 74, 4, 35232),
(100, 70, 75, 7, 23421),
(101, 73, 75, 3, 35232),
(102, 80, 76, 2, 23421),
(103, 84, 76, 2, 35232),
(104, 80, 77, 2, 23421),
(105, 84, 77, 3, 35232),
(106, 80, 78, 2, 23421),
(107, 84, 78, 4, 35232),
(108, 80, 79, 2, 23421),
(109, 84, 79, 5, 35232),
(110, 80, 80, 2, 23421),
(111, 84, 80, 6, 35232),
(112, 80, 81, 2, 23421),
(113, 84, 81, 7, 35232),
(114, 80, 82, 2, 23421),
(115, 84, 82, 7, 35232),
(116, 80, 83, 3, 23421),
(117, 84, 83, 7, 35232),
(118, 80, 84, 4, 23421),
(119, 84, 84, 7, 35232),
(120, 80, 85, 5, 23421),
(121, 84, 85, 7, 35232),
(122, 80, 86, 6, 23421),
(123, 84, 86, 7, 35232),
(124, 80, 87, 8, 23421),
(125, 84, 87, 7, 35232),
(126, 90, 88, 1, 53421),
(127, 93, 88, 1, 35232),
(128, 90, 89, 1, 53421),
(129, 93, 89, 2, 35232),
(130, 90, 90, 2, 53421),
(131, 93, 90, 2, 35232),
(132, 90, 91, 3, 53421),
(133, 93, 91, 2, 35232),
(134, 90, 92, 3, 53421),
(135, 93, 92, 3, 35232),
(136, 90, 93, 3, 53421),
(137, 93, 93, 4, 35232),
(138, 90, 94, 5, 53421),
(139, 93, 94, 4, 35232),
(140, 90, 95, 5, 53421),
(141, 93, 95, 5, 35232),
(142, 90, 96, 5, 53421),
(143, 93, 96, 6, 35232),
(144, 90, 97, 6, 53421),
(145, 93, 97, 6, 35232),
(146, 90, 98, 7, 53421),
(147, 93, 98, 6, 35232),
(148, 90, 99, 7, 53421),
(149, 93, 99, 6, 35232),
(150, 100, 100, 2, 53421),
(151, 102, 100, 2, 35232),
(152, 100, 101, 2, 53421),
(153, 102, 101, 3, 35232),
(154, 100, 102, 3, 53421),
(155, 102, 102, 3, 35232),
(156, 100, 103, 4, 53421),
(157, 102, 103, 3, 35232),
(158, 100, 104, 4, 53421),
(159, 102, 104, 4, 35232),
(160, 100, 105, 4, 53421),
(161, 102, 105, 5, 35232),
(162, 100, 106, 5, 53421),
(163, 102, 106, 5, 35232),
(164, 100, 107, 5, 53421),
(165, 102, 107, 6, 35232),
(166, 100, 108, 6, 53421),
(167, 102, 108, 6, 35232),
(168, 100, 109, 6, 53421),
(169, 102, 109, 7, 35232),
(170, 100, 110, 7, 53421),
(171, 102, 110, 7, 35232),
(172, 100, 111, 7, 53421),
(173, 102, 111, 8, 35232),
(174, 110, 112, 1, 99999),
(175, 113, 112, 1, 88000),
(176, 110, 113, 1, 99999),
(177, 113, 113, 2, 88000),
(178, 110, 114, 2, 99999),
(179, 113, 114, 2, 88000),
(180, 110, 115, 2, 99999),
(181, 113, 115, 3, 88000),
(182, 110, 116, 3, 99999),
(183, 113, 116, 3, 88000),
(184, 110, 117, 4, 99999),
(185, 113, 117, 3, 88000),
(186, 110, 118, 4, 99999),
(187, 113, 118, 4, 88000),
(188, 110, 119, 4, 99999),
(189, 113, 119, 5, 88000),
(190, 110, 120, 5, 99999),
(191, 113, 120, 5, 88000),
(192, 110, 121, 5, 99999),
(193, 113, 121, 6, 88000),
(194, 110, 122, 6, 99999),
(195, 113, 122, 6, 88000),
(196, 110, 123, 7, 99999),
(197, 113, 123, 6, 88000),
(198, 122, 124, 7, 99999),
(199, 120, 124, 7, 88000),
(200, 122, 125, 6, 99999),
(201, 120, 125, 7, 88000),
(202, 122, 126, 6, 99999),
(203, 120, 126, 6, 88000),
(204, 122, 127, 6, 99999),
(205, 120, 127, 5, 88000),
(206, 122, 128, 5, 99999),
(207, 120, 128, 5, 88000),
(208, 122, 129, 4, 99999),
(209, 120, 129, 5, 88000),
(210, 122, 130, 4, 99999),
(211, 120, 130, 4, 88000),
(212, 122, 131, 4, 99999),
(213, 120, 131, 3, 88000),
(214, 122, 132, 3, 99999),
(215, 120, 132, 3, 88000),
(216, 122, 133, 2, 99999),
(217, 120, 133, 3, 88000),
(218, 122, 134, 2, 99999),
(219, 120, 134, 2, 88000),
(220, 122, 135, 2, 99999),
(221, 120, 135, 1, 88000),
(222, 130, 136, 1, 99999),
(223, 133, 136, 1, 88000),
(224, 130, 137, 1, 99999),
(225, 133, 137, 2, 88000),
(226, 130, 138, 2, 99999),
(227, 133, 138, 2, 88000),
(228, 130, 139, 3, 99999),
(229, 133, 139, 2, 88000),
(230, 130, 140, 3, 99999),
(231, 133, 140, 3, 88000),
(232, 130, 141, 4, 99999),
(233, 133, 141, 3, 88000),
(234, 130, 142, 4, 99999),
(235, 133, 142, 4, 88000),
(236, 130, 143, 4, 99999),
(237, 133, 143, 5, 88000),
(238, 130, 144, 5, 99999),
(239, 133, 144, 5, 88000),
(240, 130, 145, 6, 99999),
(241, 133, 145, 5, 88000),
(242, 130, 146, 6, 99999),
(243, 133, 146, 6, 88000),
(244, 130, 147, 6, 99999),
(245, 133, 147, 7, 88000),
(246, 140, 148, 7, 99999),
(247, 143, 148, 7, 88000),
(248, 140, 149, 6, 99999),
(249, 143, 149, 7, 88000),
(250, 140, 150, 6, 99999),
(251, 143, 150, 6, 88000),
(252, 140, 151, 6, 99999),
(253, 143, 151, 5, 88000),
(254, 140, 152, 5, 99999),
(255, 143, 152, 5, 88000),
(256, 140, 153, 4, 99999),
(257, 143, 153, 5, 88000),
(258, 140, 154, 4, 99999),
(259, 143, 154, 4, 88000),
(260, 140, 155, 4, 99999),
(261, 143, 155, 3, 88000),
(262, 140, 156, 3, 99999),
(263, 143, 156, 3, 88000),
(264, 140, 157, 2, 99999),
(265, 143, 157, 3, 88000),
(266, 140, 158, 2, 99999),
(267, 143, 158, 2, 88000),
(268, 140, 159, 2, 99999),
(269, 143, 159, 1, 88000),
(270, 158, 160, 1, 99999),
(271, 155, 160, 1, 88000),
(272, 158, 161, 2, 99999),
(273, 155, 161, 1, 88000),
(274, 158, 162, 2, 99999),
(275, 155, 162, 2, 88000),
(276, 158, 163, 2, 99999),
(277, 155, 163, 3, 88000),
(278, 158, 164, 3, 99999),
(279, 155, 164, 3, 88000),
(280, 158, 165, 4, 99999),
(281, 155, 165, 3, 88000),
(282, 158, 166, 4, 99999),
(283, 155, 166, 4, 88000),
(284, 158, 167, 4, 99999),
(285, 155, 167, 5, 88000),
(286, 158, 168, 5, 99999),
(287, 155, 168, 5, 88000),
(288, 158, 169, 6, 99999),
(289, 155, 169, 5, 88000),
(290, 158, 170, 6, 99999),
(291, 155, 170, 6, 88000),
(292, 158, 171, 6, 99999),
(293, 155, 171, 7, 88000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id`, `name`, `category_id`, `author`, `quantity`) VALUES
(50, 'Mật mã Da Vinci', 1, 'Dan Brown', 300),
(51, 'Sherlock Holmes', 1, 'Arthur Conan Doyle', 300),
(52, 'Sự im lặng của bầy cừu', 1, 'Thomas Harris', 300),
(53, 'Án mạng trên sông Nile', 1, 'Agatha Christie', 300),
(54, 'Án mạng trên chuyến tàu tốc hành Phương Đông', 1, 'Agatha Christie', 300),
(55, 'Phía sau Nghi can X', 1, 'Higashino Keigo', 300),
(56, 'Hỏa ngục', 1, 'Dan Brown', 300),
(57, 'Thú tội', 1, 'Kanae Minato', 300),
(58, 'Cô gái có hình xăm rồng', 1, 'Stieg Larsson', 300),
(59, 'Kỳ án ánh trăng', 1, 'Quỷ Cổ Nữ', 300),
(60, 'A Tidy Ending', 2, 'Joanna Cannon', 300),
(61, 'The 13th Hour', 2, 'Richard Doetsch', 300),
(62, 'Blood Sugar', 2, 'Sascha Rothchild', 300),
(63, 'The Unforgotten', 2, 'Laura Powell', 300),
(64, 'The Appeal', 2, 'Janice Hallett', 300),
(65, 'All the Missing Girls', 2, 'Megan Miranda', 300),
(66, 'The Resting Place', 2, 'Camilla Sten', 300),
(67, 'Mouth to Mouth', 2, 'Antoine Wilson', 300),
(68, 'A Paper Son', 2, 'Jason Buchholz', 300),
(69, 'A Head Full of Ghosts', 2, 'Paul Tremblay', 300),
(70, 'The Selfish Gene', 3, 'Richard Dawkins', 300),
(71, 'The structure of scientific revolutions', 3, 'Thomas Kuhn', 300),
(72, 'Origin of species', 3, 'Charles Darwin', 300),
(73, 'Guns germs and steel', 3, 'Jared Diamond', 300),
(74, 'The grand design', 3, 'Stephen Hawking', 300),
(75, 'Cosmos', 3, 'Carl Sagan', 300),
(76, 'Những nhà khám phá', 3, 'Daniel Boorstin', 300),
(77, 'The Creators', 3, 'Daniel Boorstin', 300),
(78, 'The Seekers', 3, 'Daniel Boorstin', 300),
(79, 'Lược sử thời gian', 3, 'Stephen Hawking', 300),
(80, 'Cà phê cùng Tony', 4, 'Tony buổi sáng', 300),
(81, 'Tuổi trẻ đáng giá bao nhiêu', 4, 'Rosie Nguyễn', 300),
(82, 'Trên đường băng', 4, 'Tony buổi sáng', 300),
(83, 'Đắc nhân tâm', 4, 'Dale Carnegie', 300),
(84, 'Nhà giả kim', 4, 'Paulo Coelho', 300),
(85, 'Nghĩ giàu và làm giàu', 4, 'Napoleon Hill', 300),
(86, 'Đánh thức con người phi thường trong bạn', 4, 'Anthony Robbins', 300),
(87, 'Người bán hàng vĩ đại nhất thế giới', 4, 'Og Mandino', 300),
(88, 'Tất cả đều là chuyện nhỏ', 4, 'Richard Calson', 300),
(89, 'Tôi tài giỏi – Bạn cũng thế', 4, 'Adam Khoo', 300),
(90, 'Trà hoa nữ', 5, 'Trà hoa nữ', 300),
(91, 'Rừng Na Uy', 5, 'Murakami Haruki', 300),
(92, 'Đàn ông sao Hỏa, đàn bà sao Kim', 5, 'John Gray', 300),
(93, 'Cuốn theo chiều gió', 5, 'Margaret Munnerlyn Mitchell', 300),
(94, 'Cô gái năm ấy chúng ta cùng theo đuổi', 5, 'Cửu Bả Đao', 300),
(95, 'Xin Cạch Đàn Ông!', 5, 'Katarzyna Grochola', 300),
(96, 'Tiếng chim hót trong bụi mận gai', 5, 'Colleen McCullough', 300),
(97, '10 bí mật của tình yêu', 5, 'Adam Jackson', 300),
(98, '999 bức thư gửi cho bản thân', 5, 'Miêu Công Tử', 300),
(99, 'Phụ nữ yêu như thế nào', 5, 'Robin Norwood', 300),
(100, 'Hồ Sơ Mật – Những Bí Ẩn Nổi Tiếng Trên Thế Giới', 6, 'Nhiều tác giả', 300),
(101, 'Những Hiện Tượng Bí Ẩn Về Thế Giới', 6, 'Văn Quyên', 300),
(102, 'Bộ sách Bí Ẩn Mãi Mãi Là Bí Ẩn', 6, 'Nhiều tác giả', 300),
(103, '109 Hiện Tượng Bí Ẩn Trên Thế Giới', 6, 'Kính Vạn Lý', 300),
(104, 'Những Bí Ẩn Trên Thế Giới Chưa Được Giải Đáp', 6, 'Nguyễn Văn Huân', 300),
(105, 'Bí Ẩn Hiện Tượng Đáng Sợ Nhất Thế Giới', 6, 'Văn Quyên', 300),
(106, 'Thế Giới 5000 Năm Những Điều Bí Ẩn', 6, 'Nhiều tác giả', 300),
(107, 'Bí Ẩn Những Hiện Tượng Kỳ Lạ Trên Thế Giới', 6, 'Song Linh', 300),
(108, '157 Hiện Tượng Bí Ẩn Trên Thế Giới Chưa Được Giải Đáp', 6, 'Nguyễn Hồng Lân', 300),
(109, 'Bí Ẩn Của Nhân Loại', 6, 'Hình Đào, Kỷ Giang Hồng', 300),
(110, 'Ubik', 7, 'Philip K. Dick', 300),
(111, 'Dune', 7, 'Frank Herbert', 300),
(112, 'Labyrinths', 7, 'Jorge Luis Borges', 300),
(113, '1984', 7, 'George Orwell', 300),
(114, 'Neuromancer', 7, 'William Gibson', 300),
(115, 'The Ghost in the Shell', 7, 'Masamune Shirow', 300),
(116, 'Do Androids Dream of Electric Sheep?', 7, 'Philip K. Dick', 300),
(117, 'The Wind-Up Bird Chronicle', 7, 'Haruki Murakami', 300),
(118, 'Akira', 7, 'Katsuhiro Otomo', 300),
(119, 'Never Let Me Go', 7, 'Kazuo Ishiguro', 300),
(120, 'Khi hơi thở hóa thinh không', 8, 'Paul Kalanithi', 300),
(121, 'Đi tìm lẽ sống', 8, 'Viktor E.Frankl', 300),
(122, 'Becoming – Chất Michelle', 8, 'Michelle Obama', 300),
(123, 'Nhật ký Đặng Thùy Trâm', 8, 'Đặng Thùy Trâm', 300),
(124, 'Vào trong hoang dã', 8, 'Jon Krakauer', 300),
(125, 'Feynman Chuyện thật như đùa', 8, 'Richard P. Feynman', 300),
(126, 'Tự Truyện Andrew Carnegie', 8, 'Andrew Carnegie', 300),
(127, 'Keanu Reeves – Ma trận cuộc đời', 8, 'Marc Shapiro', 300),
(128, 'Một lít nước mắt', 8, 'Kito Aya', 300),
(129, 'Tiểu sử Steve Jobs', 8, 'Walter Isaacson', 300),
(130, 'Tư duy cá mập suy nghĩ cá vàng', 9, 'Jon Gordon', 300),
(131, 'Không gục ngã', 9, 'Nguyễn Bích Lan', 300),
(132, 'Hãy có lòng tốt', 9, 'Đức Đạt-lai Lạt-ma', 300),
(133, 'An lạc từng bước chân', 9, 'Thích Nhất Hạnh', 300),
(134, 'Bạn chỉ sống có một lần', 9, 'Christopher Morley', 300),
(135, 'Lagom - Vừa đủ - Đẳng cấp sống của người Thụy Điển', 9, 'Linnea Dunne', 300),
(136, 'Thay đổi tư duy – Hãy cứ phi lý', 9, 'Rod Judkins', 300),
(137, 'Loài Plastic – Khi nhựa trỗi dậy', 9, 'Team Loài Plastic', 300),
(138, 'Phong cách sống Minimalism - Sống tối giản cho đời thanh thản', 9, 'Cindy Trần', 300),
(139, 'Trói buộc', 9, 'Đỗ Thảo Nguyên', 300),
(140, 'The Science of Cooking: Every Question Answered to Perfect Your Cooking', 10, 'Dr. Stuart Farrimond', 300),
(141, 'Đầu Bếp Tự Do', 10, 'Hungazit – Nguyễn Mạnh Hùng', 300),
(142, '80 Ngày Ăn Khắp Thế Giới', 10, 'Phan Anh', 300),
(143, 'Chào Juice', 10, 'Thanh Huyền', 300),
(144, 'Về Nhà Ăn Cơm', 10, 'Đức Nguyễn', 300),
(145, 'Mặn Béo Chua Nóng', 10, 'Samin Nosrat', 300),
(146, 'Nấu Ăn Bằng Cả Trái Tim', 10, 'Christine Hà', 300),
(147, 'Gordon Ramsay\'s Ultimate Cookery Course', 10, 'Gordon Ramsay', 300),
(148, '30 Món Ngon Đãi Tiệc', 10, 'Đỗ Kim Trung', 300),
(149, 'Khởi Sự Ăn Chay', 10, 'Đức Nguyễn', 300),
(150, 'Sapiens: Lược sử loài người', 11, 'Yuval Noah Harari', 300),
(151, 'Lịch sử thế giới theo dòng sự kiện - Từ thời đồ đá tới thời hiện đại', 11, 'Jane Chisholm', 300),
(152, 'Lược sử thế giới', 11, 'E H Gombrich', 300),
(153, 'Bách khoa lịch sử thế giới', 11, 'Jane Bingham, Fiona Chandler và Sam Taplin', 300),
(154, 'Lịch sử thế giới', 11, 'Nguyễn Hiến Lê, Thiên Giang', 300),
(155, 'Bộ lịch sử nhân loại: Biến động', 11, 'Jared Diamond', 300),
(156, 'Những cuộc chinh phạt của Alexander đại đế', 11, 'Arrian', 300),
(157, 'Những bài học lịch sử', 11, 'Will Durant', 300),
(158, 'Sự trỗi dậy và suy tàn của đế chế thứ ba', 11, 'William Lawrence Shirer', 300),
(159, 'Tâm thức Israel', 11, 'Alon Gratch', 300);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Trinh thám'),
(2, 'Kinh dị'),
(3, 'Khoa học'),
(4, 'Truyền cảm hứng'),
(5, 'Tình cảm'),
(6, 'Bí ẩn'),
(7, 'Giả tưởng và khoa học viễn tưởng'),
(8, 'Tiểu sử, tự truyện và hồi ký'),
(9, 'Truyện ngắn'),
(10, 'dạy nấu ăn'),
(11, 'lịch sử');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_info`
--
ALTER TABLE `bill_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_book_id` (`id_book`),
  ADD KEY `FK_bill_id` (`id_bill`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT cho bảng `bill_info`
--
ALTER TABLE `bill_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill_info`
--
ALTER TABLE `bill_info`
  ADD CONSTRAINT `FK_bill_id` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `FK_book_id` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`);

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
