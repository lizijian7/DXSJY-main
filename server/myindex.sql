-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-06-16 12:57:43
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
-- 表的结构 `myindex`
--

CREATE TABLE `myindex` (
  `title` varchar(100) NOT NULL,
  `sprice` varchar(100) NOT NULL,
  `biaoqian` varchar(100) NOT NULL,
  `gongsi` varchar(100) NOT NULL,
  `zhiwei` varchar(100) NOT NULL,
  `renwu` varchar(100) NOT NULL,
  `dizhi` varchar(100) NOT NULL,
  `id` int(11) NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `myindex`
--

INSERT INTO `myindex` (`title`, `sprice`, `biaoqian`, `gongsi`, `zhiwei`, `renwu`, `dizhi`, `id`, `avatar`) VALUES
('软件运维工程师\r\n', '8K-10K·13薪\r\n\r\n', '不限/大专/系统运维/桌面运维\r\n', '合肥迅宇科技有限公司\r\n', 'HR\r\n', '李女士\r\n', '嘉谷关\r\n', 1, '00adca5a0d93daa80121985c9ef05f.jpg'),
('风电运维工程师\r\n', '9K-12K\r\n', '不限/大专/机械运维/电路设备抢修/处理\r\n', '陕西秦铭基业电力科技有限公司\r\n', '人事经理\r\n', '邓先生\r\n', '峡谷关\r\n', 2, '001f075ad3feeda8012138670b58f0.jpg'),
('运维工程师\r\n', '8K-11K\r\n', '不限/学历不限/风电运维\r\n', '信达电力科技有限公司\r\n', 'HR\r\n', '穆先生\r\n', '峡谷关\r\n', 3, '01d2d05de08600a80120686b96fd7c.jpg'),
('设备技术员\r\n', '7K-10K·15薪\r\n', '不限/本科/自动化设备/动力设备\r\n', '索通发展股份有限公司\r\n', 'HR\r\n', '赵女士\r\n', '峡谷关\r\n', 4, '01df775d721c5aa8012176d7a622a8.jpg'),
('讯飞智慧医疗系统运维\r\n', '6K-9K\r\n', '大专/系统运维/安全运维/应用运维\r\n', '北京外企人力资源服务安徽有限公司\r\n', '主管\r\n', '张女士\r\n', '峡谷关\r\n', 5, '00da335a266f21a80120ba3858f56a.jpg'),
('运维工程师\r\n', '8K-12K\r\n', '不限/学历不限\r\n', '索通发展股份有限公司\r\n', 'HR\r\n', '王女士\r\n', '峡谷关\r\n', 6, '01be175d04cdc4a801205e4ba0779e.jpg'),
('风电运维工程师\r\n', '7K-11K·14薪\r\n', '不限/大专/机械运维/电路设备抢修/处理\r\n', '陕西秦铭基业电力科技有限公司\r\n', '人事经理\r\n', '张先生\r\n', '峡谷关\r\n', 7, '031befe5af98b80a801216045223f9b.jpg'),
('软件运维工程师\r\n', '8K-14K\r\n', '不限/大专/系统运维/桌面运维\r\n', '杭州迅宇科技有限公司\r\n', 'HR\r\n', '李女士\r\n', '峡谷关\r\n', 8, '01a7b05c3d47b5a8012090db918155.jpg'),
('风电运维工程师\r\n', '9K-13K\r\n', '不限/大专/机械运维/电路设备抢修/处理\r\n', '西安秦铭基业电力科技有限公司\r\n', '人事经理\r\n', '邓先生\r\n', '峡谷关\r\n', 9, '00d1345abc83d5a801218207516561.jpg'),
('运维工程师\r\n', '8K-10K·15薪\r\n', '不限/学历不限/风电运维\r\n', '山东电力科技有限公司\r\n', 'HR\r\n', '穆先生\r\n', '峡谷关\r\n', 10, '01beb05dd34dfea8012129e23e4dc8.jpg'),
('设备技术员\r\n', '7K-9K\r\n', '不限/本科/自动化设备/动力设备\r\n', '项发展股份有限公司\r\n', 'HR\r\n', '赵女士\r\n', '峡谷关\r\n', 11, '01a9d35de6963ca80120956851b09a.jpg'),
('讯飞智慧医疗系统运维\r\n', '6K-8K\r\n', '大专/系统运维/安全运维/应用运维\r\n', '北京外企人力资源服务安徽有限公司\r\n', '主管\r\n', '张女士\r\n', '峡谷关\r\n', 12, '01c7fa5de71119a801209568398d87.jpg'),
('运维工程师\r\n', '8K-10K\r\n', '不限/学历不限\r\n', '索通发展股份有限公司\r\n', 'HR\r\n', '王女士\r\n', '峡谷关\r\n', 13, '01e4d25db2859ba801209e1fb4c1b5.jpg'),
('风电运维工程师\r\n', '7K-11K·16薪\r\n', '不限/大专/机械运维/电路设备抢修/处理\r\n', '陕西秦铭基业电力科技有限公司\r\n', '人事经理\r\n', '张先生\r\n', '峡谷关\r\n', 14, '00b2e259575a7da8012193a331099a.jpg');

--
-- 转储表的索引
--

--
-- 表的索引 `myindex`
--
ALTER TABLE `myindex`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `myindex`
--
ALTER TABLE `myindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
