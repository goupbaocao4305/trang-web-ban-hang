-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2017 at 04:53 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taphoa`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `level` bit(1) NOT NULL,
  `hoten` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `sdt` int(11) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` bit(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id_user`, `username`, `password`, `level`, `hoten`, `sdt`, `avatar`, `status`, `email`) VALUES
(1, 'boss', '3', b'1', 'Ã”ng chá»§', 925592105, 'joey.jpg', b'1', 'quocnam901@gmail.com'),
(2, 'anhhai', '2', b'1', 'Xáº¿p lá»›n', 91, 'IH.jpg', b'1', 'I@avengers.com'),
(3, 'boss2', '10', b'1', 'BÃ  chá»§', 93, 'hulk.jpg', b'1', 'B@avengers.com'),
(4, 'ut', '4', b'1', 'Xáº¿p nhá»', 94, 'ct.jpg', b'1', 'C@avengers.com'),
(5, 'o2o', 'ab', b'0', 'Osin', 95, 'th.jpg', b'0', 'T@avengers.com');

-- --------------------------------------------------------

--
-- Table structure for table `banhang`
--

CREATE TABLE `banhang` (
  `tenhang` varchar(255) CHARACTER SET latin1 NOT NULL,
  `soluong` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gia` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `nguoiban` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `banhang`
--

INSERT INTO `banhang` (`tenhang`, `soluong`, `gia`, `nguoiban`, `date`) VALUES
('71', '1', '600.000 VND', '1', '2016-12-29 00:00:00'),
('73', '1', '1.000 VND', '2', '2016-12-29 00:00:00'),
('74', '1', '2000', '1', '2016-12-29 00:00:00'),
('75', '1', '1', '1', '2016-12-29 14:33:07'),
('76', '2', '50', '2', '2016-12-29 00:00:00'),
('79', '1', '4000', '1', '2016-12-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chitietsp`
--

CREATE TABLE `chitietsp` (
  `id_sp` int(11) NOT NULL,
  `tensp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinhanh` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay` date NOT NULL,
  `soluong` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thongtin` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_loaisp` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chitietsp`
--

INSERT INTO `chitietsp` (`id_sp`, `tensp`, `hinhanh`, `gia`, `ngay`, `soluong`, `thongtin`, `id_loaisp`) VALUES
(71, 'Sá»¯a Milo 1 kg', 'milo1kg.jpg', '370.000 VNÄ/lon', '0000-00-00', '60 Lon', 'Sá»¯a Milo â€“ Ãšc\r\nSá»¯a Milo (Nestle Milo) cÃ¹ng vá»›i Kid Essentials lÃ  má»™t trong nhá»¯ng sáº£n pháº©m cá»§a NestlÃ© Ãšc. ÄÃ¢y lÃ  thá»©c uá»‘ng nÄƒng lÆ°á»£ng lÃ m tá»« sÃ´-cÃ´-la máº¡ch nha ngon cÃ³ bá»• sung vitamin vÃ  khoÃ¡ng cháº¥t vÃ  dinh dÆ°á»¡ng cao. NESTLÃ‰ MILO cung cáº¥p cho sá»± tá»± tin, nÄƒng lÆ°á»£ng vÃ  tinh tháº§n Ä‘á»ƒ thÃ nh cÃ´ng trong má»™t cuá»™c sá»‘ng nÄƒng Ä‘á»™ng.\r\nSá»¯a MILO Ä‘Æ°á»£c Ä‘áº·t theo tÃªn nhÃ  vÃ´ Ä‘á»‹ch Milon, má»™t huyá»n thoáº¡i thá»ƒ thao ngÆ°á»i Hy Láº¡p vá»›i sá»©c khoáº» phi thÆ°á»ng. NestlÃ© MILO cÃ¹ng cÃ´ng thá»©c cáº£i tiáº¿n ACTIV-GO chiáº¿t xuáº¥t máº§m lÃºa máº¡ch, vitamin vÃ  khoÃ¡ng cháº¥t má»›i, mang láº¡i giÃ¡ trá»‹ dinh dÆ°á»¡ng thiáº¿t yáº¿u, cung cáº¥p nÄƒng lÆ°á»£ng bá»n bá»‰ Ä‘á»ƒ tráº» nÄƒng Ä‘á»™ng vÃ  vÆ°Æ¡n xa hÆ¡n.', 17),
(72, 'Sá»¯a TH True Milk nguyÃªn cháº¥t 220ml', 'sttt-th-milk-kd-bich-220ml-thung-1.jpg', '285,000 VNÄ/ thÃ¹ng', '0000-00-00', '30 thÃ¹ng; 48 bá»‹ch/ thÃ¹ng', 'Xuáº¥t xá»© nguyÃªn liá»‡u Ä‘áº§u vÃ o: Sá»­ dá»¥ng hoÃ n toÃ n sá»¯a tÆ°Æ¡i sáº¡ch nguyÃªn cháº¥t cá»§a trang tráº¡i TH, khÃ´ng bá»• sung sá»¯a bá»™t, cháº¥t bÃ©o sá»¯a,â€¦\r\n\r\nChá»‰ sáº£n pháº©m Ä‘Æ°á»£c cháº¿ biáº¿n hoÃ n toÃ n tá»« sá»¯a tÆ°Æ¡i nguyÃªn liá»‡u má»›i Ä‘Æ°á»£c gá»i lÃ  â€œSá»¯a TÆ°Æ¡i Tiá»‡t TrÃ¹ngâ€. Sá»¯a tiá»‡t trÃ¹ng khÃ´ng pháº£i Ä‘Æ°á»£c lÃ m hoÃ n toÃ n tá»« sá»¯a tÆ°Æ¡i (Theo TCVN 7028 : 2009).\r\n\r\nHÃ£y cáº£m nháº­n sá»± khÃ¡c biá»‡t vá»›i nhá»¯ng giá»t sá»¯a tÆ°Æ¡i nguyÃªn cháº¥t Ä‘áº¿n tá»« trang tráº¡i bÃ² sá»¯a Trang tráº¡i xÃ¡c láº­p ká»· lá»¥c lá»›n nháº¥t ChÃ¢u Ã.\r\n', 16),
(73, 'BÃ¡nh snack cua Vinabico 14g', 'l_snack_crab.jpg', '195,800VNÄ/thÃ¹ng', '0000-00-00', '50 thÃ¹ng', ' (20 gÃ³i / bá»‹ch);(6 bá»‹ch / thÃ¹ng)', 19),
(74, ' Káº¹o cao su thá»•i Big Babol ', 'ImgMain-903.jpg', '768,000VNÄ/thÃ¹ng', '0000-00-00', '50 thÃ¹ng', 'bá»‹ch 190g (50 viÃªn); thÃ¹ng (40 bá»‹ch)', 22),
(75, 'Káº¹o Oishi 90g', 'sanpham195.png', '336,900VNÄ/thÃ¹ng', '0000-00-00', '100 thÃ¹ng; 800 gÃ³i', 'thÃ¹ng (80 gÃ³i)', 22),
(76, 'Sá»¯a Táº¯m Lifebuoy MÃ¡t Láº¡nh 850g ', 'sua-tam-lifebuoy-bao-ve-vuot-troi-850g-6896-5000612-1-product.jpg', '99.000 VNÄ', '0000-00-00', '120 Chai', 'Sá»¯a táº¯m Lifebuoy Báº£o vá»‡ VÆ°á»£t trá»™i 10 chá»©a cÃ¡c thÃ nh pháº§n Ä‘Ã£ Ä‘Æ°á»£c Ä‘Äƒng kÃ½ báº±ng sÃ¡ng cháº¿ cá»§a Lifebuoy vÃ  hoáº¡t cháº¥t Active5. Bá»t kem chá»©a trong sáº£n pháº©m cÃ³ thá»ƒ tháº¥m sÃ¢u vÃ o cÃ¡c lá»— chÃ¢n lÃ´ng, lÃ m sáº¡ch sÃ¢u vÃ  loáº¡i bá» 10 loáº¡i vi khuáº©n gÃ¢y bá»‡nh, giÃºp báº¡n cÃ³ lÃ n da sáº¡ch khá»e.\r\n\r\nThÃ nh pháº§n:ThÃ nh pháº§n diá»‡t khuáº©n tiÃªn tiáº¿n, hoáº¡t cháº¥t Active5', 23),
(78, 'Dáº§u Gá»™i Lifebuoy TÃ³c DÃ y Ã“ng áº¢ 170g ', 'daugoi.jpg', '26.000 VNÄ', '0000-00-00', '120 Chai', 'HÃ£y cÃ¹ng chÄƒm sÃ³c tÃ³c cho cáº£ gia Ä‘Ã¬nh vá»›i Dáº§u gá»™i LIFEBUOY TÃ³c dÃ y Ã³ng áº£. Vá»›i thÃ nh pháº§n giÃ u dÆ°á»¡ng cháº¥t, sáº£n pháº©m sáº½ giÃºp mÃ¡i tÃ³c báº¡n trá»Ÿ nÃªn bÃ³ng mÆ°á»£t tá»± nhiÃªn mÃ  khÃ´ng cáº§n sá»­ dá»¥ng thÃªm dáº§u xáº£. Dáº§u gá»™i gá»™i sáº¡ch nháº¹ dá»‹u, khÃ´ng gÃ¢y kÃ­ch á»©ng da phÃ¹ há»£p vá»›i nhiá»u Ä‘á»‘i tÆ°á»£ng.\r\n\r\nCÃ´ng thá»©c Ä‘á»™c Ä‘Ã¡o sá»¯a giÃ u dÆ°á»¡ng cháº¥t giÃºp lÃ m sáº¡ch tÃ³c, láº¥y Ä‘i má»“ hÃ´i, bá»¥i báº©n vÃ  vi khuáº©n, lÃ m tÃ³c trá»Ÿ nÃªn Ã³ng áº£, mÆ°á»£t mÃ , Ä‘áº§y sá»©c sá»‘ng. Dáº§u gá»™i Lifebuoy TÃ³c dÃ y & Ã³ng áº£ sáº½ cho báº¡n mÃ¡i tÃ³c cháº¯c khá»e bÃªn trong vÃ  dÃ y, Ã³ng áº£ hÆ¡n sau má»—i láº§n gá»™i.\r\n\r\nHÆ°Æ¡ng thÆ¡m dá»‹u nháº¹, phÃ¹ há»£p vá»›i má»i Ä‘á»‘i tÆ°á»£ng.\r\n\r\nCÃ´ng thá»©c Ä‘Æ°á»£c nghiÃªn cá»©u bá»Ÿi cÃ¡c chuyÃªn gia Ä‘áº£m báº£o khÃ´ng gÃ¢y khÃ´ hoáº·c kÃ­ch á»©ng da, Ä‘áº£m báº£o an toÃ n cho cáº£ gia Ä‘Ã¬nh', 23),
(79, ' XÃ  bÃ´ng Lifebuoy báº£o vá»‡ vÆ°á»£t trá»™i 10 125g ', 'xabong.jpg', '11.500 VNÄ', '0000-00-00', '300 há»™p', 'HÆ°á»›ng dáº«n sá»­ dá»¥ng 	\r\n\r\n    LÃ m Æ°á»›t cÆ¡ thá»ƒ\r\n    DÃ¹ng tay Ä‘á»ƒ láº¥y sáº£n pháº©m vÃ  táº¡o bá»t, sau Ä‘Ã³ mÃ¡t-xa lÃªn cÆ¡ thá»ƒ theo chuyá»ƒn Ä‘á»™ng trÃ²n\r\n    Táº¯m sáº¡ch láº¡i vá»›i nÆ°á»›c\r\n    Láº¥y 1 lÆ°á»£ng vá»«a Ä‘á»§ vÃ o lÃ²ng bÃ n tay\r\n    Táº¡o bá»t vÃ  xoa Ä‘á»u kháº¯p lÃ²ng bÃ n tay trong 10 giÃ¢y\r\n    Rá»­a sáº¡ch vá»›i nÆ°á»›c\r\n', 23),
(80, 'Sá»¯a Vinamilk 100% KHÃ”NG ÄÆ¯á»œNG', 'gia-sua-vinamilk-khong-duong.jpg', '320.000 VNÄ /thÃ¹ng', '0000-00-00', '30 thÃ¹ng', '1 thÃ¹ng = 12 lá»‘c = 48 há»™p loáº¡i 180ml', 15),
(84, 'Káº¹o Mentos', '073390005746_1.jpg', '1.200.000 VNÄ/thÃ¹ng', '0000-00-00', '10', 'Káº¹o ngon', 22);

-- --------------------------------------------------------

--
-- Table structure for table `loaisp`
--

CREATE TABLE `loaisp` (
  `id_loaisp` int(11) NOT NULL,
  `tenloaisp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loaisp`
--

INSERT INTO `loaisp` (`id_loaisp`, `tenloaisp`, `ncc`) VALUES
(15, 'Sá»¯a Vinamilk', 'Vinamilk'),
(16, 'Sá»¯a TH truemilk', 'TH truemart'),
(17, 'Sá»¯a Milo', 'Nestle'),
(19, 'Snack', 'nguyenhang.vn'),
(22, 'Káº¹o-Gum', 'nguyenhang.vn'),
(23, 'XÃ  bÃ´ng-Sá»¯a táº¯m- Dáº§u gá»™i', 'tiki.vn');

-- --------------------------------------------------------

--
-- Table structure for table `statuss`
--

CREATE TABLE `statuss` (
  `level` bit(1) NOT NULL,
  `tt` varchar(9) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `statuss`
--

INSERT INTO `statuss` (`level`, `tt`, `role`) VALUES
(b'0', 'deactive', 'member'),
(b'1', 'active', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `banhang`
--
ALTER TABLE `banhang`
  ADD PRIMARY KEY (`tenhang`);

--
-- Indexes for table `chitietsp`
--
ALTER TABLE `chitietsp`
  ADD PRIMARY KEY (`id_sp`);

--
-- Indexes for table `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`id_loaisp`);

--
-- Indexes for table `statuss`
--
ALTER TABLE `statuss`
  ADD PRIMARY KEY (`level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `chitietsp`
--
ALTER TABLE `chitietsp`
  MODIFY `id_sp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `loaisp`
--
ALTER TABLE `loaisp`
  MODIFY `id_loaisp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
