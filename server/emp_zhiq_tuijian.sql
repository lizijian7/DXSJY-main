-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-06-12 15:52:51
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
-- 数据库： `news`
--

-- --------------------------------------------------------

--
-- 表的结构 `emp_zhiq_tuijian`
--

CREATE TABLE `emp_zhiq_tuijian` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `subjects` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `emp_zhiq_tuijian`
--

INSERT INTO `emp_zhiq_tuijian` (`id`, `image`, `uname`, `title`, `subjects`) VALUES
(1, '', '张三', '工程师', '天天下班开会到底有什么意义，什么公司会占用员工下班时间'),
(2, '', '张三', '工程师', '天天下班开会到底有什么意义，什么公司会占用员工下班时间'),
(3, '', '张三', '工程师', '天天下班开会到底有什么意义，什么公司会占用员工下班时间三');

--
-- 转储表的索引
--

--
-- 表的索引 `emp_zhiq_tuijian`
--
ALTER TABLE `emp_zhiq_tuijian`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `emp_zhiq_tuijian`
--
ALTER TABLE `emp_zhiq_tuijian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
