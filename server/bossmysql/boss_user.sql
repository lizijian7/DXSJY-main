-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2022-06-16 03:35:36
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myemp`
--

-- --------------------------------------------------------

--
-- 表的结构 `boss_user`
--

CREATE TABLE `boss_user` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户序号ID,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
  `password` varchar(32) NOT NULL COMMENT '密码,MD5',
  `boss_img` varchar(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
  `boss_phone` varchar(11) NOT NULL COMMENT '电话号码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `boss_user`
--

INSERT INTO `boss_user` (`id`, `username`, `password`, `boss_img`, `boss_phone`) VALUES
(1, 'Richard', 'c51c8bbd9e8c8bc49042ccd5d3e9864d', '00183a5ab206aea80120be1472a6f5.jpg', '18251982636'),
(2, 'Johnny', 'd0f59baadadd3349e4a9b2674bcceae8', '001f075ad3feeda8012138670b58f0.jpg', '15195852246'),
(3, 'Martin', '81d6f316d169150d0e8733866c38684d', '008c8f59e96a55a801216a4bbcbcb0.jpg', '13863326623'),
(4, 'Christina', '92109e2189cd79072b7df39317d94fa1', '00adca5a0d93daa80121985c9ef05f.jpg', '18222222222'),
(5, 'Margaret', '0513a3da7ff53b1aeb42245ebcc5a16e', '00b2e259575a7da8012193a331099a.jpg', '19199999999'),
(6, 'Barbara', '5c39b18d77d5f297ff92e4942e5522b5', '00b3755b2b6eb6a8012034f78d8b5b.jpg', '16111111111'),
(7, 'Diana', '93b63feb993716772ef3b15b08b8e8a8', '00c1d55af1178ca801206abad941b6.jpg', '18000000000'),
(8, 'Melody', 'ce2f3a5579d231b3b8f8b9e5fc46d361', '00d1345abc83d5a801218207516561.jpg', '1111111111'),
(9, 'Debbie', '28527cdbcc65c696f11897327cb9a6bb', '00d4325a72b3b6a8012134661d177d.jpg', '18222222227'),
(10, 'Scott', 'bc28af6f750004729474ccbb403bd0ee', '00da335a266f21a80120ba3858f56a.jpg', '19111111111'),
(11, 'Shelly', 'f7ba507db5b5b1150eabf5707f0334dd', '00fb2f5b2c9a39a8012034f76e8c48.jpg', '18211144444'),
(12, 'Bob', '2fc1c0beb992cd7096975cfebf9d5c3b', '010b6f5bb09ad5a8012099c8b8a41f.jpg', '1999999999'),
(13, 'Amanda', '9d910c8bf395fce35216f0f4fa85432e', '011b395cdd9efaa801208f8b1fb812.jpg', '18888888888'),
(14, 'George', '578ad8e10dc4edb52ff2bd4ec9bc93a3', '011c4e5ba0fabba801213deacb693c.jpg', '1777777777'),
(15, 'Benjamin', '861a744bccc0da5432f097d5838e4b83', '0120cd5dc0e038a801209e1fc96ef7.jpg', '16666666666'),
(16, '', '', 'unnamed.jpg', '15555555555');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boss_user`
--
ALTER TABLE `boss_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `boss_user`
--
ALTER TABLE `boss_user`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户序号ID,主键且自增', AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
