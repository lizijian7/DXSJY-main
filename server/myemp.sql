-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-06-15 17:51:49
-- 服务器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `myemp`
--

-- --------------------------------------------------------

--
-- 表的结构 `myemp`
--

CREATE TABLE `myemp` (
  `id` int(16) NOT NULL,
  `empname` varchar(15) NOT NULL,
  `emppwd` varchar(12) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `toudi` varchar(64) NOT NULL,
  `shoucang` int(15) NOT NULL,
  `zuji` int(12) NOT NULL,
  `guanzhu` int(12) NOT NULL,
  `hudong` int(12) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `myemp`
--

INSERT INTO `myemp` (`id`, `empname`, `emppwd`, `phone`, `toudi`, `shoucang`, `zuji`, `guanzhu`, `hudong`, `url`) VALUES
(1, 'sabo', '123456', '13879513674', 0, 5, 16, 7, 6, 'http://localhost:4000/2482554c-afb1-4393-885c-51ac1e6a5baa.jpg'),
(2, 'ACE', '123456', '18797879875', 0, 9, 19, 8, 9, 'http://localhost:4000/6b91af29-cf3a-4628-90ef-85d542acdcdd.jpg'),
(3, 'kls', '123456', '18798735167', 0, 5, 68, 17, 59, 'http://localhost:4000/e5953b7f-5c56-4fc4-a5c8-1ba020c876eb.png'),
(4, 'luo', '123456', '19788546351', 0, 15, 15, 15, 18, 'http://localhost:4000/3beebfd2-8d1b-4df3-95b8-19a94221d533.jpg'),
(5, 'sz', '123456', '18798463158', 0, 65, 13, 85, 53, 'http://localhost:4000/e2890301-a196-4007-9c46-2307a2ced994.jpg'),
(6, 'lf', '123456', '15798643582', 0, 65, 85, 93, 16, 'http://localhost:4000/e356909a-65f5-4a7b-8a2f-48469f1ec0e5.jpg'),
(7, 'hkk', '123456', '15798686326', 0, 96, 56, 85, 26, 'http://localhost:4000/b9faa883-9ec3-4d23-a324-21f2e2476c58.jpg'),
(8, 'snae', '123456', '19875678463', 0, 63, 16, 85, 16, 'http://localhost:4000/7ad8b6c2-f0c4-403c-9edc-2ad801d2fefc.jpg'),
(9, 'suolong', '123456', '16878986463', 0, 6, 16, 85, 69, 'http://localhost:4000/7aa2111f-427c-4931-92d4-20b733e8f616.jpg');

--
-- 转储表的索引
--

--
-- 表的索引 `myemp`
--
ALTER TABLE `myemp`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `myemp`
--
ALTER TABLE `myemp`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
