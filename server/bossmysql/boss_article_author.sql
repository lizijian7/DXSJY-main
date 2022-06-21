-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2022-06-16 08:52:24
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
-- 表的结构 `boss_article_author`
--

CREATE TABLE `boss_article_author` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '作者ID,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
  `password` varchar(32) NOT NULL COMMENT '密码,MD5',
  `nickname` varchar(30) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
  `article_number` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的文章数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `boss_article_author`
--

INSERT INTO `boss_article_author` (`id`, `username`, `password`, `nickname`, `avatar`, `article_number`) VALUES
(1, 'Richard', 'c51c8bbd9e8c8bc49042ccd5d3e9864d', '黑色纯牛M奶', '00183a5ab206aea80120be1472a6f5.jpg', 0),
(2, 'Johnny', 'd0f59baadadd3349e4a9b2674bcceae8', '风之谷z', '001f075ad3feeda8012138670b58f0.jpg', 0),
(3, 'Martin', '81d6f316d169150d0e8733866c38684d', '庚方丽理', '008c8f59e96a55a801216a4bbcbcb0.jpg', 0),
(4, 'Christina', '92109e2189cd79072b7df39317d94fa1', '阐炜辉', '00adca5a0d93daa80121985c9ef05f.jpg', 0),
(5, 'Margaret', '0513a3da7ff53b1aeb42245ebcc5a16e', '伯启根', '00b2e259575a7da8012193a331099a.jpg', 0),
(6, 'Barbara', '5c39b18d77d5f297ff92e4942e5522b5', '旅行泡沫', '00b3755b2b6eb6a8012034f78d8b5b.jpg', 0),
(7, 'Diana', '93b63feb993716772ef3b15b08b8e8a8', '燕雨y传', '00c1d55af1178ca801206abad941b6.jpg', 0),
(8, 'Melody', 'ce2f3a5579d231b3b8f8b9e5fc46d361', '稀稀哩哩', '00d1345abc83d5a801218207516561.jpg', 0),
(9, 'Debbie', '28527cdbcc65c696f11897327cb9a6bb', '最爱Kitty', '00d4325a72b3b6a8012134661d177d.jpg', 0),
(10, 'Scott', 'bc28af6f750004729474ccbb403bd0ee', '游客学者麦', '00da335a266f21a80120ba3858f56a.jpg', 0),
(11, 'Shelly', 'f7ba507db5b5b1150eabf5707f0334dd', '天街小雨', '00fb2f5b2c9a39a8012034f76e8c48.jpg', 0),
(12, 'Bob', '2fc1c0beb992cd7096975cfebf9d5c3b', '浮云不说话', '010b6f5bb09ad5a8012099c8b8a41f.jpg', 0),
(13, 'Amanda', '9d910c8bf395fce35216f0f4fa85432e', '左耳似水正', '011b395cdd9efaa801208f8b1fb812.jpg', 0),
(14, 'George', '578ad8e10dc4edb52ff2bd4ec9bc93a3', '吃草莓要吐籽', '011c4e5ba0fabba801213deacb693c.jpg', 0),
(15, 'Benjamin', '861a744bccc0da5432f097d5838e4b83', '没表有时间', '0120cd5dc0e038a801209e1fc96ef7.jpg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boss_article_author`
--
ALTER TABLE `boss_article_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `boss_article_author`
--
ALTER TABLE `boss_article_author`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增', AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
