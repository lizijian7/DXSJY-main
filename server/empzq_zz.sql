-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2022-06-15 17:51:38
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
-- 表的结构 `empzq_zz`
--

CREATE TABLE `empzq_zz` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章id主键自增',
  `subject` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '文章标题',
  `descrption` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT '介绍',
  `content` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章图片',
  `author id` int(10) UNSIGNED NOT NULL COMMENT '作者 id',
  `create at` int(10) UNSIGNED NOT NULL COMMENT '发表日期',
  `avatar` varchar(100) NOT NULL,
  `name` varchar(15) NOT NULL,
  `zhiwei` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `empzq_zz`
--

INSERT INTO `empzq_zz` (`id`, `subject`, `descrption`, `content`, `image`, `author id`, `create at`, `avatar`, `name`, `zhiwei`) VALUES
(1, 'css样式的一些基本写法', 'css样式', '\"font-size文字大小\r\nfont-family字体样式类似幼圆\r\nfont-weight字体间宽度\r\nvm为单位,将可视窗口分为100份\r\nletter-spacing表示字符之间的空白间距\r\n其中position定位类型,分为:fixed绝对定位元素(相对于浏览器进行定位)、absolute绝对定位元素(相对于父元素进行定位)、relative相对定位(相对于元素本身进行调整,\"\"left:20\"\"即元素向左边位移20px、static是html文档的默认值、inherit规定复制position属性的值\r\n\"\r\n', 'a0b40ae6-8e21-11ea-b48b-482ae31b2081.jpg', 5, 1626908800, 'http://localhost:4000/2482554c-afb1-4393-885c-51ac1e6a5baa.jpg', 'sabo', '运维工程师'),
(2, 'css样式的一些基本写法2', 'css样式', '\"作用是再html中找到元素并且渲染他,利用某一个元素的名称\r\n1、元素选择器:(标签选择器)权值最低,通过html的标签名找到元素并且渲染样式\r\n特点:好记,直观,所有的该标签名全部改变,无法精确定位元素,无法做到给予相同标签名不同样式\r\n2、通用选择器:(样式为:*{})\"\"*\"\"表示所有元素,书写效率高,但所有元素都将被渲染一遍\r\n3、id选择器:(专属定制,精准定位),权值最大,特点:每个页面只能有一个id,复用性低,一般情况下不适用id选择器渲染元素(js中用的比较多)\r\n4、类选择器 权值次重要\r\n具备相同的class属性值的元素可以通过类属性给予相同的样式,复用性强.(快捷写法:\"\"div.d2*2\"\"生成两个div class=\"\"d2\"\"的属性)\r\n哪个元素需要,就使用哪个相同类属性值的,如果某一个元素有不同样式时,可以再增加一个类进行渲染,同一个元素可以进行多个渲染,分别进行渲染.\r\n5、群组选择器\r\n多个\"\"选择器\"\"使用共同的样式,可以将这些选择器用\"\",\"\"将相邻的类名称隔开.在使用公共的样式.\"	\r\n', 'a0b65a3a-8e21-11ea-9444-482ae31b2081.jpg', 6, 1566736000, 'http://localhost:4000/e5953b7f-5c56-4fc4-a5c8-1ba020c876eb.png', 'kls', '前端WEB工程师'),
(3, '网页不会做，那是画册看得少（上）', '学习网页设计', '当我们想要学习网页设计的时候，我们通常会问去哪里找好的网页设计作品，尤其是当我们刚刚踏入这个领域的时候，怎么去快速的区分和识别网页设计的不同类型？</p>\r\n<p>这就很考验你快速寻找资料的能力，很多小伙伴就会去买一些关于网页设计的书，但是，因为书籍的特性，它没有办法实时更新，并且资料的数量有限', 'a0b93b74-8e21-11ea-be15-482ae31b2081.jpg', 3, 1654852000, 'http://localhost:4000/3beebfd2-8d1b-4df3-95b8-19a94221d533.jpg', 'luo', '后端java工程师'),
(4, 'QQ VIP 官网', '组件', '有破有立，再造升级。官网作为会员体系中最主要的营销渠道，突破原有的资源壁垒，将 QQ 三大会员体系官网进行再造升级，对商业目标的达成起到至关重要的作用，同时也能给 QQ 用户提供更为全面的会员服务。我们将从确定目标价值、构建官网架构、设计语言升级、打造通用组件这几个方面一一道来 QQ VIP 官网的再设计之路。', 'a0b85c90-8e21-11ea-ae3e-482ae31b2081.jpg', 3, 1568836000, 'http://localhost:4000/e356909a-65f5-4a7b-8a2f-48469f1ec0e5.jpg', 'lf', '项目经理'),
(5, 'css样式的一些基本写法2', 'css样式', '\"作用是再html中找到元素并且渲染他,利用某一个元素的名称\r\n1、元素选择器:(标签选择器)权值最低,通过html的标签名找到元素并且渲染样式\r\n特点:好记,直观,所有的该标签名全部改变,无法精确定位元素,无法做到给予相同标签名不同样式\r\n2、通用选择器:(样式为:*{})\"\"*\"\"表示所有元素,书写效率高,但所有元素都将被渲染一遍\r\n3、id选择器:(专属定制,精准定位),权值最大,特点:每个页面只能有一个id,复用性低,一般情况下不适用id选择器渲染元素(js中用的比较多)\r\n4、类选择器 权值次重要\r\n具备相同的class属性值的元素可以通过类属性给予相同的样式,复用性强.(快捷写法:\"\"div.d2*2\"\"生成两个div class=\"\"d2\"\"的属性)\r\n哪个元素需要,就使用哪个相同类属性值的,如果某一个元素有不同样式时,可以再增加一个类进行渲染,同一个元素可以进行多个渲染,分别进行渲染.\r\n5、群组选择器\r\n多个\"\"选择器\"\"使用共同的样式,可以将这些选择器用\"\",\"\"将相邻的类名称隔开.在使用公共的样式.\"	\r\n', 'a0b65a3a-8e21-11ea-9444-482ae31b2081.jpg', 6, 1566736000, 'http://localhost:4000/b9faa883-9ec3-4d23-a324-21f2e2476c58.jpg', 'hkk', '测试'),
(6, '网页不会做，那是画册看得少（下）', '学习网页设计2', '当我们想要学习网页设计的时候，我们通常会问去哪里找好的网页设计作品，尤其是当我们刚刚踏入这个领域的时候，怎么去快速的区分和识别网页设计的不同类型？\r\n', 'a0b93b74-8e21-11ea-be15-482ae31b2081.jpg', 3, 1657852000, 'http://localhost:4000/7ad8b6c2-f0c4-403c-9edc-2ad801d2fefc.jpg', 'snae', 'UI'),
(7, '网页设计趋势', '网页设计的趋势', '想知道 2020 年网页设计的趋势吗？在今天的这篇文章当中，我们将会围绕着这一趋势进行说明。在即将到来的 2020 年，平面视觉和不断发展的新技术将会有更加深入的结合。只要我们稍加观察，就会注意到新技术对于现代网页设计的影响，这些正在', 'a0ba914a-8e21-11ea-826f-482ae31b2081.jpg', 2, 1654852000, 'http://localhost:4000/e2890301-a196-4007-9c46-2307a2ced994.jpg', 'sz', '前端WEB工程师'),
(8, '可能是最容易看懂的响应式知识科普', '响应式网站', '响应式布局这个名词相信大部分设计师都不陌生，也能清楚知道它的基本呈现效果。但具体操作及与开发人员协作时，可能会遇到很多问题。寻找资料时发现大多数教程都是针对前端开发工程师打造的，并伴随着许多晦涩难懂的专业名词，让人难以理解。', 'a0bc46de-8e21-11ea-8a65-482ae31b2081.gif', 2, 1566958800, 'http://localhost:4000/7aa2111f-427c-4931-92d4-20b733e8f616.jpg', 'suolong', '技术总监');

--
-- 转储表的索引
--

--
-- 表的索引 `empzq_zz`
--
ALTER TABLE `empzq_zz`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `empzq_zz`
--
ALTER TABLE `empzq_zz`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id主键自增', AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
