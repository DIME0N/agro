-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 14 2021 г., 09:40
-- Версия сервера: 5.7.33-36
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dimeon_uniteagro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_action_admin`
--

CREATE TABLE IF NOT EXISTS `bot_shop_action_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_basket`
--

CREATE TABLE IF NOT EXISTS `bot_shop_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_category`
--

CREATE TABLE IF NOT EXISTS `bot_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_category`
--

INSERT INTO `bot_shop_category` (`id`, `name`, `hide`) VALUES
(1, 'Мясо', 0),
(2, 'Фрукты', 0),
(3, 'Овощи', 0),
(4, 'Орехи', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_contact`
--

CREATE TABLE IF NOT EXISTS `bot_shop_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_contact`
--

INSERT INTO `bot_shop_contact` (`id`, `description`) VALUES
(1, '+79001234567');

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_order`
--

CREATE TABLE IF NOT EXISTS `bot_shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_pay` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_order`
--

INSERT INTO `bot_shop_order` (`id`, `user_id`, `date`, `status`, `name`, `phone`, `adress`, `type_pay`) VALUES
(1, 754543833, '2021-11-14 01:20:51', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 1),
(2, 754543833, '2021-11-14 01:46:25', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 1),
(3, 754543833, '2021-11-14 08:04:08', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 1),
(4, 754543833, '2021-11-14 09:26:44', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 0),
(5, 754543833, '2021-11-14 09:27:43', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 0),
(6, 754543833, '2021-11-14 09:28:40', 0, 'Dmitry Sergeev', '+79996964050', 'Таганрог', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_order_product`
--

CREATE TABLE IF NOT EXISTS `bot_shop_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_count` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_order_product`
--

INSERT INTO `bot_shop_order_product` (`id`, `parent_id`, `product_id`, `product_count`) VALUES
(1, 1, 1, 4),
(2, 2, 1, 7),
(3, 3, 1, 5),
(4, 4, 1, 3),
(5, 5, 1, 1),
(6, 6, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_product`
--

CREATE TABLE IF NOT EXISTS `bot_shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_tlg` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_product`
--

INSERT INTO `bot_shop_product` (`id`, `parent`, `name`, `description`, `image_tlg`, `image`, `price`, `unit`, `hide`) VALUES
(1, 1, 'Свинина', 'Мясо домашних свиней', 'AgACAgIAAxkBAANlYZA10Xxp0fFaAt3JtQ9ov2_tdiIAAu63MRvlgIBIBC-iToOjIKgBAAMCAAN5AAMiBA', 'img/1636840913.jpg', '240.00', '1 кг.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_product_temp`
--

CREATE TABLE IF NOT EXISTS `bot_shop_product_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_tlg` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `bot_shop_profile`
--

CREATE TABLE IF NOT EXISTS `bot_shop_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bot_shop_profile`
--

INSERT INTO `bot_shop_profile` (`id`, `user_id`, `first_name`, `last_name`, `phone`, `adress`, `action`) VALUES
(1, 754543833, 'Dmitry', 'Sergeev', '+79996964050', 'а', 'step_3_ready');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_action_logs`
--

CREATE TABLE IF NOT EXISTS `fd_action_logs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_action_logs`
--

INSERT INTO `fd_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
(1, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2021-11-14 05:07:23', 'com_users', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(2, 'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:08:11', 'com_config.application', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(3, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_TEMPLATE\",\"id\":10003,\"name\":\"yootheme\",\"extension_name\":\"yootheme\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10003, 'COM_ACTIONLOGS_DISABLED'),
(4, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":10004,\"name\":\"System - YOOtheme Framework\",\"extension_name\":\"System - YOOtheme Framework\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10004, 'COM_ACTIONLOGS_DISABLED'),
(5, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":10005,\"name\":\"Installer - YOOtheme\",\"extension_name\":\"Installer - YOOtheme\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10005, 'COM_ACTIONLOGS_DISABLED'),
(6, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":10006,\"name\":\"Fields - YOOtheme Location\",\"extension_name\":\"Fields - YOOtheme Location\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10006, 'COM_ACTIONLOGS_DISABLED'),
(7, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":10007,\"name\":\"MOD_YOOTHEME_BUILDER\",\"extension_name\":\"MOD_YOOTHEME_BUILDER\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10007, 'COM_ACTIONLOGS_DISABLED'),
(8, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":10008,\"name\":\"YOOtheme\",\"extension_name\":\"YOOtheme\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:11:01', 'com_installer', 948, 10008, 'COM_ACTIONLOGS_DISABLED'),
(9, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":10010,\"name\":\"PLG_INSTALLER_ZOOLANDERS\",\"extension_name\":\"PLG_INSTALLER_ZOOLANDERS\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:13:47', 'com_installer', 948, 10010, 'COM_ACTIONLOGS_DISABLED'),
(10, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":10009,\"name\":\"System - Essentials YOOtheme Pro\",\"extension_name\":\"System - Essentials YOOtheme Pro\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:13:47', 'com_installer', 948, 10009, 'COM_ACTIONLOGS_DISABLED'),
(11, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:14:09', 'com_content.article', 948, 1, 'COM_ACTIONLOGS_DISABLED'),
(12, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:14:49', 'com_menus.item', 948, 101, 'COM_ACTIONLOGS_DISABLED'),
(13, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__menu\"}', '2021-11-14 05:14:49', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(14, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Rectangle_11-3.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:17:55', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(15, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Rectangle_1.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:21:12', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(16, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"aged-greenhouse.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:26:33', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(17, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"android-icon-96x96.png\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:34:59', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(18, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"apple-icon-180x180.png\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:35:03', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(19, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":91,\"title\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"extension_name\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=91\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:41:00', 'com_modules.module', 948, 91, 'COM_ACTIONLOGS_DISABLED'),
(20, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__modules\"}', '2021-11-14 05:41:07', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(21, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":91,\"title\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"extension_name\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=91\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:41:58', 'com_modules.module', 948, 91, 'COM_ACTIONLOGS_DISABLED'),
(22, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__modules\"}', '2021-11-14 05:41:58', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(23, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":91,\"title\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"extension_name\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=91\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:42:15', 'com_modules.module', 948, 91, 'COM_ACTIONLOGS_DISABLED'),
(24, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__modules\"}', '2021-11-14 05:42:15', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(25, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":91,\"title\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"extension_name\":\"\\u041f\\u043e\\u0438\\u0441\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=91\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:42:32', 'com_modules.module', 948, 91, 'COM_ACTIONLOGS_DISABLED'),
(26, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__modules\"}', '2021-11-14 05:42:32', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(27, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__modules\"}', '2021-11-14 05:42:43', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(28, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Group_47.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:43:18', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(29, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"photo1.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 05:48:49', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(30, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Rectangle11-3.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:11:35', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(31, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Rectangle211-3.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:14:28', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(32, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Rectangle511-3.jpg\",\"itemlink\":\"index.php?option=com_media&view=media\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:16:58', 'com_media.file', 948, 0, 'COM_ACTIONLOGS_DISABLED'),
(33, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_STYLE\",\"id\":9,\"title\":\"yootheme - \\u041f\\u043e \\u0443\\u043c\\u043e\\u043b\\u0447\\u0430\\u043d\\u0438\\u044e\",\"extension_name\":\"yootheme - \\u041f\\u043e \\u0443\\u043c\\u043e\\u043b\\u0447\\u0430\\u043d\\u0438\\u044e\",\"itemlink\":\"index.php?option=com_templates&task=style.edit&id=9\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:18:26', 'com_templates.style', 948, 9, 'COM_ACTIONLOGS_DISABLED'),
(34, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:18:38', 'com_menus.item', 948, 101, 'COM_ACTIONLOGS_DISABLED'),
(35, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":\"948\",\"title\":\"Dimeon\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\",\"table\":\"#__menu\"}', '2021-11-14 06:18:38', 'com_checkin', 948, 948, 'COM_ACTIONLOGS_DISABLED'),
(36, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"\\u041f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u044f\\u043c\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:19:09', 'com_menus.item', 948, 102, 'COM_ACTIONLOGS_DISABLED'),
(37, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":103,\"title\":\"\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044f\\u043c\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=103\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:19:28', 'com_menus.item', 948, 103, 'COM_ACTIONLOGS_DISABLED'),
(38, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"\\u041f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0437\\u0447\\u0438\\u043a\\u0430\\u043c\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":\"948\",\"username\":\"Dimeon\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=948\"}', '2021-11-14 06:19:40', 'com_menus.item', 948, 104, 'COM_ACTIONLOGS_DISABLED');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_action_logs_extensions`
--

CREATE TABLE IF NOT EXISTS `fd_action_logs_extensions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_action_logs_extensions`
--

INSERT INTO `fd_action_logs_extensions` (`id`, `extension`) VALUES
(1, 'com_banners'),
(2, 'com_cache'),
(3, 'com_categories'),
(4, 'com_config'),
(5, 'com_contact'),
(6, 'com_content'),
(7, 'com_installer'),
(8, 'com_media'),
(9, 'com_menus'),
(10, 'com_messages'),
(11, 'com_modules'),
(12, 'com_newsfeeds'),
(13, 'com_plugins'),
(14, 'com_redirect'),
(15, 'com_tags'),
(16, 'com_templates'),
(17, 'com_users'),
(18, 'com_checkin');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_action_logs_users`
--

CREATE TABLE IF NOT EXISTS `fd_action_logs_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `notify` tinyint(3) UNSIGNED NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_action_log_config`
--

CREATE TABLE IF NOT EXISTS `fd_action_log_config` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_action_log_config`
--

INSERT INTO `fd_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_assets`
--

CREATE TABLE IF NOT EXISTS `fd_assets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_assets`
--

INSERT INTO `fd_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 121, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1}}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 27, 30, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1}}'),
(12, 1, 31, 32, 1, 'com_login', 'com_login', '{}'),
(13, 1, 33, 34, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 35, 36, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 37, 38, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 39, 42, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1}}'),
(17, 1, 43, 44, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 45, 86, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1}}'),
(19, 1, 87, 90, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20, 1, 91, 92, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1}}'),
(21, 1, 93, 94, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1}}'),
(22, 1, 95, 96, 1, 'com_search', 'com_search', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(23, 1, 97, 98, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1}}'),
(24, 1, 99, 102, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1}}'),
(26, 1, 103, 104, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 88, 89, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 100, 101, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 105, 106, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 107, 108, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 109, 110, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 111, 112, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 113, 114, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 115, 116, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 46, 47, 2, 'com_modules.module.1', 'Main Menu', '{}'),
(40, 18, 48, 49, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 50, 51, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 52, 53, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 54, 55, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 56, 57, 2, 'com_modules.module.9', 'Quick Icons', '{}'),
(45, 18, 58, 59, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 60, 61, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(47, 18, 62, 63, 2, 'com_modules.module.13', 'Admin Submenu', '{}'),
(48, 18, 64, 65, 2, 'com_modules.module.14', 'User Status', '{}'),
(49, 18, 66, 67, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 68, 69, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 70, 71, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 72, 73, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 74, 75, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 40, 41, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 18, 76, 77, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(56, 1, 117, 118, 1, 'com_privacy', 'com_privacy', '{}'),
(57, 1, 119, 120, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
(58, 18, 78, 79, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
(59, 18, 80, 81, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
(60, 11, 28, 29, 2, 'com_languages.language.2', 'Russian (ru-RU)', '{}'),
(61, 18, 82, 83, 2, 'com_modules.module.90', 'Builder', '{}'),
(62, 27, 19, 20, 3, 'com_content.article.1', 'Главная страница', '{}'),
(63, 18, 84, 85, 2, 'com_modules.module.91', 'Поиск', '{}');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_associations`
--

CREATE TABLE IF NOT EXISTS `fd_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_banners`
--

CREATE TABLE IF NOT EXISTS `fd_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_banner_clients`
--

CREATE TABLE IF NOT EXISTS `fd_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `fd_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_categories`
--

CREATE TABLE IF NOT EXISTS `fd_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_categories`
--

INSERT INTO `fd_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 948, '2021-11-14 05:06:52', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_contact_details`
--

CREATE TABLE IF NOT EXISTS `fd_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_content`
--

CREATE TABLE IF NOT EXISTS `fd_content` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_content`
--

INSERT INTO `fd_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`, `note`) VALUES
(1, 62, 'Главная страница', 'glavnaya-stranitsa', '<!-- Builder #page --><img src=\"/images/Group48.svg\" alt=\"\">\n<h1>Онлайн платформа объединяющая покупателей и производителей сельхозпродукции</h1>\n<p>\n    <a href=\"#\">Зарегистрироваться</a>\n</p>\n<h1>Каталог продукции</h1>\n<ul>\n        <li>\n\n        <img src=\"/images/Rectangle_11-3.jpg\" alt=\"\">\n\n<h3>Фрукты</h3>\n\n\n\n\n    </li>\n        <li>\n\n        <img src=\"/images/Rectangle11-3.jpg\" alt=\"\">\n\n<h3>Крупы</h3>\n\n\n\n\n    </li>\n        <li>\n\n        <img src=\"/images/Rectangle211-3.jpg\" alt=\"\">\n\n<h3>Мясо</h3>\n\n\n\n\n    </li>\n        <li>\n\n        <img src=\"/images/Rectangle511-3.jpg\" alt=\"\">\n\n<h3>Овощи</h3>\n\n\n\n\n    </li>\n    </ul>\n<p>\n    <a href=\"#\">Показать все категории</a>\n</p>\n', '<!-- {\"type\":\"layout\",\"children\":[{\"type\":\"section\",\"props\":{\"style\":\"default\",\"width\":\"default\",\"vertical_align\":\"middle\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"title_breakpoint\":\"xl\",\"image_position\":\"center-center\",\"padding\":\"xsmall\",\"padding_remove_bottom\":false},\"children\":[{\"type\":\"row\",\"children\":[{\"type\":\"column\",\"props\":{\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\"},\"children\":[{\"type\":\"image\",\"props\":{\"margin\":\"default\",\"image_svg_color\":\"emphasis\",\"image\":\"images\\/Group48.svg\",\"margin_remove_top\":true,\"margin_remove_bottom\":true}}]}]}]},{\"type\":\"section\",\"props\":{\"style\":\"default\",\"width\":\"default\",\"vertical_align\":\"middle\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"title_breakpoint\":\"xl\",\"image_position\":\"center-center\",\"image\":\"\",\"padding_remove_top\":true},\"children\":[{\"type\":\"row\",\"children\":[{\"type\":\"column\",\"props\":{\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\",\"width_medium\":\"\",\"image\":\"images\\/aged-greenhouse.jpg\",\"image_size\":\"cover\",\"image_effect\":\"parallax\",\"image_parallax_bgx_start\":\"0\",\"image_parallax_bgy_start\":\"0\",\"image_parallax_bgx_end\":\"0\",\"image_parallax_bgy_end\":\"50\",\"css\":\".el-column {\\n\\tmin-height: 460px;\\n}\\n.el-column .uk-tile {\\n    border-radius: 20px;\\n}\",\"vertical_align\":\"bottom\",\"text_color\":\"light\"},\"children\":[{\"type\":\"headline\",\"props\":{\"title_element\":\"h1\",\"content\":\"\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438\",\"title_style\":\"h2\",\"maxwidth\":\"2xlarge\"}},{\"type\":\"button\",\"props\":{\"grid_column_gap\":\"small\",\"grid_row_gap\":\"small\",\"margin\":\"medium\"},\"children\":[{\"type\":\"button_item\",\"props\":{\"button_style\":\"primary\",\"icon_align\":\"left\",\"content\":\"\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f\",\"link\":\"#\"}}]}]}]}]},{\"type\":\"section\",\"props\":{\"style\":\"muted\",\"width\":\"default\",\"vertical_align\":\"middle\",\"title_position\":\"top-left\",\"title_rotation\":\"left\",\"title_breakpoint\":\"xl\",\"image_position\":\"center-center\"},\"children\":[{\"type\":\"row\",\"children\":[{\"type\":\"column\",\"props\":{\"image_position\":\"center-center\",\"media_overlay_gradient\":\"\"},\"children\":[{\"type\":\"headline\",\"props\":{\"title_element\":\"h1\",\"content\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438\"}},{\"type\":\"grid\",\"props\":{\"show_title\":true,\"show_meta\":true,\"show_content\":true,\"show_image\":true,\"show_link\":true,\"grid_default\":\"1\",\"grid_medium\":\"4\",\"filter_style\":\"tab\",\"filter_all\":true,\"filter_position\":\"top\",\"filter_align\":\"left\",\"filter_grid_width\":\"auto\",\"filter_grid_breakpoint\":\"m\",\"title_hover_style\":\"reset\",\"title_element\":\"h3\",\"title_align\":\"top\",\"title_grid_width\":\"1-2\",\"title_grid_breakpoint\":\"m\",\"meta_style\":\"meta\",\"meta_align\":\"below-title\",\"meta_element\":\"div\",\"content_column_breakpoint\":\"m\",\"icon_width\":80,\"image_align\":\"bottom\",\"image_grid_width\":\"1-2\",\"image_grid_breakpoint\":\"m\",\"image_svg_color\":\"emphasis\",\"link_text\":\"Read more\",\"link_style\":\"default\",\"margin\":\"default\",\"item_animation\":true,\"panel_style\":\"card-default\",\"panel_link\":true,\"panel_card_image\":true,\"css\":\".el-item {\\n\\tborder-radius: 15px;\\n    overflow: hidden;\\n}\"},\"children\":[{\"type\":\"grid_item\",\"props\":{\"image\":\"images\\/Rectangle_11-3.jpg\",\"title\":\"\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b\"}},{\"type\":\"grid_item\",\"props\":{\"image\":\"images\\/Rectangle11-3.jpg\",\"title\":\"\\u041a\\u0440\\u0443\\u043f\\u044b\"}},{\"type\":\"grid_item\",\"props\":{\"image\":\"images\\/Rectangle211-3.jpg\",\"title\":\"\\u041c\\u044f\\u0441\\u043e\"}},{\"type\":\"grid_item\",\"props\":{\"image\":\"images\\/Rectangle511-3.jpg\",\"title\":\"\\u041e\\u0432\\u043e\\u0449\\u0438\"}}]},{\"type\":\"button\",\"props\":{\"grid_column_gap\":\"small\",\"grid_row_gap\":\"small\",\"margin\":\"default\",\"class\":\"uk-text-center uk-margin-large-top\"},\"children\":[{\"type\":\"button_item\",\"props\":{\"button_style\":\"default\",\"icon_align\":\"left\",\"content\":\"\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438\",\"link\":\"#\"}}]}]}]}]}],\"version\":\"2.6.6\",\"yooessentialsVersion\":\"1.4.7\"} -->', 1, 2, '2021-11-14 05:14:09', 948, '', '2021-11-14 06:34:34', 948, 0, '0000-00-00 00:00:00', '2021-11-14 05:14:09', '0000-00-00 00:00:00', '{\"image_intro\":\"\",\"float_intro\":\"\",\"image_intro_alt\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"float_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":false,\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":false,\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":false,\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_vote\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\"}', 15, 0, '', '', 1, 212, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}', 0, '*', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `fd_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(9) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Структура таблицы `fd_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `fd_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_content_rating`
--

CREATE TABLE IF NOT EXISTS `fd_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_content_types`
--

CREATE TABLE IF NOT EXISTS `fd_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_content_types`
--

INSERT INTO `fd_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `fd_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_extensions`
--

CREATE TABLE IF NOT EXISTS `fd_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_extensions`
--

INSERT INTO `fd_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_advanced\":0,\"sef_ids\":0,\"custom_fields_enable\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"Jun 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"show_jed_info\":\"1\",\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"ru-RU\",\"site\":\"ru-RU\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}', '{\"enabled\":\"0\",\"search_phrases\":\"1\",\"search_areas\":\"1\",\"show_date\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"0\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.1\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"January 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(35, 0, 'com_privacy', 'component', 'com_privacy', '', 1, 1, 1, 1, '{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(36, 0, 'com_actionlogs', 'component', 'com_actionlogs', '', 1, 1, 1, 1, '{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_tags\",\"com_templates\",\"com_users\"]}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPUTF8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"LIB_JOOMLA\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"mediaversion\":\"9c81b973afbbcac383ba6b0a2beb6053\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{\"name\":\"LIB_IDNA\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{\"name\":\"LIB_PHPASS\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(318, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', 1, 1, 1, 0, '{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(319, 0, 'mod_latestactions', 'module', 'mod_latestactions', '', 1, 1, 1, 0, '{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(320, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', '', 1, 1, 1, 0, '{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}', '{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0);
INSERT INTO `fd_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.60.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2020\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"4.5.12\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}', '{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1636866436}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '{\"mode\":3,\"lastrun\":1636866447,\"unique_id\":\"f59f9073e842f48835ffda47cee3cd0ad468637b\",\"interval\":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"October 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"March 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"February 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(479, 0, 'plg_sampledata_blog', 'plugin', 'blog', 'sampledata', 0, 1, 1, 0, '{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"July 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(480, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"February 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(481, 0, 'plg_fields_repeatable', 'plugin', 'repeatable', 'fields', 0, 1, 1, 0, '{\"name\":\"plg_fields_repeatable\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_FIELDS_REPEATABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"repeatable\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(482, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', 'content', 0, 0, 1, 0, '{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(483, 0, 'PLG_SYSTEM_ACTIONLOGS', 'plugin', 'actionlogs', 'system', 0, 1, 1, 0, '{\"name\":\"PLG_SYSTEM_ACTIONLOGS\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(484, 0, 'PLG_ACTIONLOG_JOOMLA', 'plugin', 'joomla', 'actionlog', 0, 1, 1, 0, '{\"name\":\"PLG_ACTIONLOG_JOOMLA\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(485, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', 'system', 0, 0, 1, 0, '{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"April 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(486, 0, 'plg_system_logrotation', 'plugin', 'logrotation', 'system', 0, 1, 1, 0, '{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}', '{\"lastrun\":1636866436}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(487, 0, 'plg_privacy_user', 'plugin', 'user', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"May 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(488, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', 'quickicon', 0, 1, 1, 0, '{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(489, 0, 'plg_user_terms', 'plugin', 'terms', 'user', 0, 0, 1, 0, '{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"June 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(490, 0, 'plg_privacy_contact', 'plugin', 'contact', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(491, 0, 'plg_privacy_content', 'plugin', 'content', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(492, 0, 'plg_privacy_message', 'plugin', 'message', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(493, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(494, 0, 'plg_captcha_recaptcha_invisible', 'plugin', 'recaptcha_invisible', 'captcha', 0, 0, 1, 0, '{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"November 2017\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(495, 0, 'plg_privacy_consents', 'plugin', 'consents', 'privacy', 0, 1, 1, 0, '{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"July 2018\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `fd_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(496, 0, 'plg_quickicon_eos310', 'plugin', 'eos310', 'quickicon', 0, 1, 1, 0, '{\"name\":\"plg_quickicon_eos310\",\"type\":\"plugin\",\"creationDate\":\"June 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.0\",\"description\":\"PLG_QUICKICON_EOS310_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"eos310\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"templateColor\":\"\",\"logoFile\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"October 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.3\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"October 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.3\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"October 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.3\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"October 2021\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.10.3.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 10002, 'Russianru-RU', 'language', 'ru-RU', '', 0, 1, 0, 0, '{\"name\":\"Russian (ru-RU)\",\"type\":\"language\",\"creationDate\":\"17\\/08\\/2021\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2021 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"3.10.0.1\",\"description\":\"<p>Russian language pack (site) for Joomla!<\\/p>\",\"group\":\"\",\"filename\":\"install\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 10002, 'Russianru-RU', 'language', 'ru-RU', '', 1, 1, 0, 0, '{\"name\":\"Russian (ru-RU)\",\"type\":\"language\",\"creationDate\":\"17\\/08\\/2021\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2021 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"3.10.0.1\",\"description\":\"<p>Russian language pack (administrator) for Joomla!<\\/p>\",\"group\":\"\",\"filename\":\"install\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 0, 'Russian (ru-RU) Language Pack', 'package', 'pkg_ru-RU', '', 0, 1, 1, 0, '{\"name\":\"Russian (ru-RU) Language Pack\",\"type\":\"package\",\"creationDate\":\"17\\/08\\/2021\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2021 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"3.10.0.1\",\"description\":\"<div class=\'alert alert-info\' style=\'font-weight: 400\'><h3 style=\'font-weight: 400\'>Joomla 3.10.0 Russian Language Pack<\\/h3><p>\\u041e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f Joomla, \\u043a\\u043e\\u0442\\u043e\\u0440\\u0430\\u044f \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u044f\\u0437\\u044b\\u0447\\u043d\\u044b\\u043c \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u0441\\u0442\\u0432\\u043e\\u043c.<br>\\u041c\\u044b \\u0440\\u0430\\u0434\\u044b \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\u043c \\u0438 \\u043f\\u043e\\u043c\\u043e\\u0449\\u0438 \\u0432 \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438 Joomla! \\u0421\\u043e\\u043e\\u0431\\u0449\\u0438\\u0442\\u044c \\u043e \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c\\u0435 \\u0438\\u043b\\u0438 \\u0432\\u043d\\u0435\\u0441\\u0442\\u0438 \\u0438\\u0441\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u043d\\u0430 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0435 <a href=\'https:\\/\\/github.com\\/JPathRu\\/localisation\' target=\'_blank\'>Github<\\/a>.<\\/p><ul><li><a href=\'https:\\/\\/joomlaportal.ru\' target=\'_blank\'>\\u041f\\u043e\\u0440\\u0442\\u0430\\u043b Joomla \\u043f\\u043e-\\u0440\\u0443\\u0441\\u0441\\u043a\\u0438<\\/a>,<\\/li><li><a href=\'https:\\/\\/joomlaforum.ru\' target=\'_blank\'>\\u0424\\u043e\\u0440\\u0443\\u043c \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u0439 \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0438 Joomla<\\/a>,<\\/li><li><a href=\'https:\\/\\/joomlaportal.ru\\/russian-joomla\' target=\'_blank\'>\\u041e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430 \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438<\\/a>.<\\/li><\\/ul><\\/div>\",\"group\":\"\",\"filename\":\"pkg_ru-RU\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 10008, 'yootheme', 'template', 'yootheme', '', 0, 1, 1, 0, '{\"name\":\"yootheme\",\"type\":\"template\",\"creationDate\":\"October 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"2.6.6\",\"description\":\"\\n        \\n            <div id=\\\"tmpl-description\\\">A powerful, flexible and elegant website builder that allows you to create complex pages within minutes and customize every aspect of the theme.<\\/div>\\n            <script src=\\\"..\\/templates\\/yootheme\\/templateDetails.min.js\\\" defer><\\/script>\\n        \\n    \",\"group\":\"\",\"filename\":\"templateDetails\"}', '{\"yootheme\":\"true\",\"uikit3\":\"true\",\"widgetkit\":\"noconflict\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 10008, 'System - YOOtheme Framework', 'plugin', 'yootheme', 'system', 0, 1, 1, 0, '{\"name\":\"System - YOOtheme Framework\",\"type\":\"plugin\",\"creationDate\":\"October 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"2.6.6\",\"description\":\"System Plugin for YOOtheme Pro.\",\"group\":\"\",\"filename\":\"yootheme\"}', '{}', '{\"news\":\"79999fc1\"}', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 10008, 'Installer - YOOtheme', 'plugin', 'yootheme', 'installer', 0, 1, 1, 0, '{\"name\":\"Installer - YOOtheme\",\"type\":\"plugin\",\"creationDate\":\"April 2017\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"http:\\/\\/yootheme.com\",\"version\":\"1.0.3\",\"description\":\"PLG_INSTALLER_YOOTHEME_DESCRIPTION\",\"group\":\"\",\"filename\":\"yootheme\"}', '{\"apikey\":\"\"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 10008, 'Fields - YOOtheme Location', 'plugin', 'location', 'fields', 0, 1, 1, 0, '{\"name\":\"Fields - YOOtheme Location\",\"type\":\"plugin\",\"creationDate\":\"October 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"2.6.6\",\"description\":\"Fields Location Plugin for YOOtheme Pro.\",\"group\":\"\",\"filename\":\"location\"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 10008, 'MOD_YOOTHEME_BUILDER', 'module', 'mod_yootheme_builder', '', 0, 1, 0, 0, '{\"name\":\"MOD_YOOTHEME_BUILDER\",\"type\":\"module\",\"creationDate\":\"October 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"2.6.6\",\"description\":\"MOD_YOOTHEME_BUILDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_yootheme_builder\"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 0, 'YOOtheme', 'package', 'pkg_yootheme', '', 0, 1, 1, 0, '{\"name\":\"YOOtheme\",\"type\":\"package\",\"creationDate\":\"October 2021\",\"author\":\"YOOtheme\",\"copyright\":\"Copyright (C) YOOtheme GmbH\",\"authorEmail\":\"info@yootheme.com\",\"authorUrl\":\"https:\\/\\/yootheme.com\",\"version\":\"2.6.6\",\"description\":\"A powerful, flexible and elegant website builder that allows you to create complex pages within minutes and customize every aspect of the theme.\",\"group\":\"\",\"filename\":\"pkg_yootheme\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 0, 'System - Essentials YOOtheme Pro', 'plugin', 'yooessentials', 'system', 0, 1, 1, 0, '{\"name\":\"System - Essentials YOOtheme Pro\",\"type\":\"plugin\",\"creationDate\":\"September 2021\",\"author\":\"ZOOlanders\",\"copyright\":\"Copyright (C) Joolanders, SL\",\"authorEmail\":\"\",\"authorUrl\":\"https:\\/\\/www.zoolanders.com\",\"version\":\"1.4.7\",\"description\":\"Essential Addons for YOOtheme Pro by ZOOlanders\",\"group\":\"\",\"filename\":\"yooessentials\"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 0, 'PLG_INSTALLER_ZOOLANDERS', 'plugin', 'zoolanders', 'installer', 0, 1, 1, 0, '{\"name\":\"PLG_INSTALLER_ZOOLANDERS\",\"type\":\"plugin\",\"creationDate\":\"June 2020\",\"author\":\"ZOOlanders\",\"copyright\":\"Copyright (c)2020 JOOlanders SL\",\"authorEmail\":\"info@zoolanders.com\",\"authorUrl\":\"https:\\/\\/www.zoolanders.com\",\"version\":\"1.0.0\",\"description\":\"PLG_INSTALLER_ZOOLANDERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"zoolanders\"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_fields`
--

CREATE TABLE IF NOT EXISTS `fd_fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_fields_categories`
--

CREATE TABLE IF NOT EXISTS `fd_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_fields_groups`
--

CREATE TABLE IF NOT EXISTS `fd_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_fields_values`
--

CREATE TABLE IF NOT EXISTS `fd_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_filters`
--

CREATE TABLE IF NOT EXISTS `fd_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `state` int(11) DEFAULT '1',
  `access` int(11) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `fd_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `fd_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fd_finder_taxonomy`
--

INSERT INTO `fd_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `fd_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_terms`
--

CREATE TABLE IF NOT EXISTS `fd_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(11) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `fd_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fd_finder_terms_common`
--

INSERT INTO `fd_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('any', 'en'),
('are', 'en'),
('aren\'t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn\'t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `fd_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `fd_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_finder_types`
--

CREATE TABLE IF NOT EXISTS `fd_finder_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_languages`
--

CREATE TABLE IF NOT EXISTS `fd_languages` (
  `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_languages`
--

INSERT INTO `fd_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 2),
(2, 60, 'ru-RU', 'Russian (ru-RU)', 'Русский (Россия)', 'ru', 'ru_ru', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_menu`
--

CREATE TABLE IF NOT EXISTS `fd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_menu`
--

INSERT INTO `fd_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 49, 0, '*', 0),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 20, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 21, 26, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 22, 23, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 24, 25, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 27, 28, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 33, 34, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 35, 36, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 37, 38, 0, '*', 1),
(22, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 0, 'class:associations', 0, '', 39, 40, 0, '*', 1),
(101, 'mainmenu', 'Главная страница', 'home', '', 'home', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 41, 42, 1, '*', 0),
(102, 'mainmenu', 'Покупателям', 'pokupatelyam', '', 'pokupatelyam', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"page_subheading\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 43, 44, 0, '*', 0),
(103, 'mainmenu', 'Производителям', 'proizvoditelyam', '', 'proizvoditelyam', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"page_subheading\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 45, 46, 0, '*', 0),
(104, 'mainmenu', 'Перевозчикам', 'perevozchikam', '', 'perevozchikam', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"num_intro_articles\":\"\",\"num_columns\":\"\",\"num_links\":\"\",\"multi_column_order\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"page_subheading\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_associations\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}', 47, 48, 0, '*', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_menu_types`
--

CREATE TABLE IF NOT EXISTS `fd_menu_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_menu_types`
--

INSERT INTO `fd_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_messages`
--

CREATE TABLE IF NOT EXISTS `fd_messages` (
  `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `fd_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_modules`
--

CREATE TABLE IF NOT EXISTS `fd_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_modules`
--

INSERT INTO `fd_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{\"greeting\":\"1\",\"name\":\"0\"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_sampledata', 6, 1, '{}', 1, '*'),
(88, 58, 'Latest Actions', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latestactions', 6, 1, '{}', 1, '*'),
(89, 59, 'Privacy Dashboard', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_privacy_dashboard', 6, 1, '{}', 1, '*'),
(90, 61, 'Builder', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_yootheme_builder', 1, 1, '', 0, '*'),
(91, 63, 'Поиск', '', '<a class=\"uk-button uk-button-default\" href=\"#modal-full\" uk-toggle><span uk-icon=\"icon: search; ratio: 1\"></span> &nbsp;Поиск</a>', 1, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{\"prepare_content\":0,\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\",\"yoo_config\":\"{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_style\\\":\\\"\\\"}\"}', 0, '*');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_modules_menu`
--

CREATE TABLE IF NOT EXISTS `fd_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_modules_menu`
--

INSERT INTO `fd_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(91, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `fd_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_overrider`
--

CREATE TABLE IF NOT EXISTS `fd_overrider` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `fd_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(4) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_postinstall_messages`
--

INSERT INTO `fd_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
(5, 700, 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_TITLE', 'COM_CPANEL_MSG_JOOMLA40_PRE_CHECKS_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/joomla40checks.php', 'admin_postinstall_joomla40checks_condition', '3.7.0', 1),
(6, 700, 'TPL_HATHOR_MESSAGE_POSTINSTALL_TITLE', 'TPL_HATHOR_MESSAGE_POSTINSTALL_BODY', 'TPL_HATHOR_MESSAGE_POSTINSTALL_ACTION', 'tpl_hathor', 1, 'action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_action', 'admin://templates/hathor/postinstall/hathormessage.php', 'hathormessage_postinstall_condition', '3.7.0', 1),
(7, 700, 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_TITLE', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_BODY', 'PLG_PLG_RECAPTCHA_VERSION_1_POSTINSTALL_ACTION', 'plg_captcha_recaptcha', 1, 'action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_action', 'site://plugins/captcha/recaptcha/postinstall/actions.php', 'recaptcha_postinstall_condition', '3.8.6', 1),
(8, 700, 'COM_ACTIONLOGS_POSTINSTALL_TITLE', 'COM_ACTIONLOGS_POSTINSTALL_BODY', '', 'com_actionlogs', 1, 'message', '', '', '', '', '3.9.0', 1),
(9, 700, 'COM_PRIVACY_POSTINSTALL_TITLE', 'COM_PRIVACY_POSTINSTALL_BODY', '', 'com_privacy', 1, 'message', '', '', '', '', '3.9.0', 1),
(10, 700, 'COM_ADMIN_POSTINSTALL_MSG_FLOC_BLOCKER_TITLE', 'COM_ADMIN_POSTINSTALL_MSG_FLOC_BLOCKER_DESCRIPTION', '', 'com_admin', 1, 'message', '', '', '', '', '3.9.27', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_privacy_consents`
--

CREATE TABLE IF NOT EXISTS `fd_privacy_consents` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_privacy_requests`
--

CREATE TABLE IF NOT EXISTS `fd_privacy_requests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_redirect_links`
--

CREATE TABLE IF NOT EXISTS `fd_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(6) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_schemas`
--

CREATE TABLE IF NOT EXISTS `fd_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_schemas`
--

INSERT INTO `fd_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.10.0-2021-05-28');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_session`
--

CREATE TABLE IF NOT EXISTS `fd_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(3) UNSIGNED DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_session`
--

INSERT INTO `fd_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(0x3233383533343438353139353137356231383637643464363561646333626335, 0, 1, 1636871316, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTMxNjtzOjQ6Imxhc3QiO2k6MTYzNjg3MTMxNjtzOjM6Im5vdyI7aToxNjM2ODcxMzE2O31zOjU6InRva2VuIjtzOjMyOiI5alU0T3AzWEc0eUIwT052eHluajNkWkgybGNCSkxoUSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x3236333363353430363061633666623864376634383666666161613334396262, 0, 1, 1636871402, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTQwMTtzOjQ6Imxhc3QiO2k6MTYzNjg3MTQwMTtzOjM6Im5vdyI7aToxNjM2ODcxNDAxO31zOjU6InRva2VuIjtzOjMyOiJnRGhsT2JrVHBGM1U4bVRBRkVxTHlYMVg2VHFJS0xpRyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x3432313839636432646236353738313938613134616266306462346238386264, 0, 1, 1636871669, 'joomla|s:9064:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjM2ODY2OTM5O3M6NDoibGFzdCI7aToxNjM2ODcxNjU5O3M6Mzoibm93IjtpOjE2MzY4NzE2Njg7fXM6NToidG9rZW4iO3M6MzI6IkVScEZmZjVsbDlsQ01PY3VuaWxFNlFGSU9tYXRmRG5yIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fXM6MzI6IjEzM2FmNjQyMGRhOTA5MDZlYWYzNDdkMzlhMjU4OTJhIjthOjM6e3M6NToiYWRtaW4iO2I6MTtzOjY6ImNvbmZpZyI7YTozMTp7czoxNToieW9vdGhlbWVfYXBpa2V5IjtzOjA6IiI7czo0OiJtZW51IjthOjI6e3M6NToiaXRlbXMiO2E6MDp7fXM6OToicG9zaXRpb25zIjthOjI6e3M6NjoibmF2YmFyIjtzOjg6Im1haW5tZW51IjtzOjY6Im1vYmlsZSI7czowOiIiO319czo0OiJzaXRlIjthOjk6e3M6NjoibGF5b3V0IjtzOjQ6ImZ1bGwiO3M6NToiYm94ZWQiO2E6MTp7czo5OiJhbGlnbm1lbnQiO2k6MTt9czoxMDoiaW1hZ2Vfc2l6ZSI7czo1OiJjb3ZlciI7czoxNDoiaW1hZ2VfcG9zaXRpb24iO3M6MTM6ImNlbnRlci1jZW50ZXIiO3M6MTI6ImltYWdlX2VmZmVjdCI7czo1OiJmaXhlZCI7czoxMzoidG9vbGJhcl93aWR0aCI7czo3OiJkZWZhdWx0IjtzOjIxOiJicmVhZGNydW1ic19zaG93X2hvbWUiO2I6MTtzOjI0OiJicmVhZGNydW1ic19zaG93X2N1cnJlbnQiO2I6MTtzOjIxOiJicmVhZGNydW1ic19ob21lX3RleHQiO3M6MDoiIjt9czo2OiJoZWFkZXIiO2E6NTp7czo2OiJsYXlvdXQiO3M6MTY6Imhvcml6b250YWwtcmlnaHQiO3M6NToid2lkdGgiO3M6NzoiZGVmYXVsdCI7czoxMDoic29jaWFsX2dhcCI7czo1OiJzbWFsbCI7czo2OiJzZWFyY2giO3M6MDoiIjtzOjEyOiJzZWFyY2hfc3R5bGUiO3M6NToibW9kYWwiO31zOjY6Im5hdmJhciI7YTo0OntzOjY6InN0aWNreSI7aTowO3M6MTQ6ImRyb3Bkb3duX2FsaWduIjtzOjQ6ImxlZnQiO3M6MTc6InRvZ2dsZV9tZW51X3N0eWxlIjtzOjc6ImRlZmF1bHQiO3M6OToib2ZmY2FudmFzIjthOjE6e3M6NDoibW9kZSI7czo1OiJzbGlkZSI7fX1zOjY6Im1vYmlsZSI7YTo5OntzOjEwOiJicmVha3BvaW50IjtzOjE6Im0iO3M6NDoibG9nbyI7czo2OiJjZW50ZXIiO3M6NjoidG9nZ2xlIjtiOjA7czo2OiJzZWFyY2giO2I6MDtzOjEwOiJtZW51X3N0eWxlIjtzOjc6ImRlZmF1bHQiO3M6OToiYW5pbWF0aW9uIjtiOjA7czoxMjoiY2xvc2VfYnV0dG9uIjtiOjE7czo5OiJvZmZjYW52YXMiO2E6MTp7czo0OiJtb2RlIjtzOjU6InNsaWRlIjt9czo4OiJkcm9wZG93biI7czo1OiJzbGlkZSI7fXM6MzoidG9wIjthOjQ6e3M6NToic3R5bGUiO3M6NzoiZGVmYXVsdCI7czo1OiJ3aWR0aCI7czo3OiJkZWZhdWx0IjtzOjEwOiJicmVha3BvaW50IjtzOjE6Im0iO3M6MTQ6ImltYWdlX3Bvc2l0aW9uIjtzOjEzOiJjZW50ZXItY2VudGVyIjt9czoxMjoibWFpbl9zaWRlYmFyIjthOjY6e3M6NToid2lkdGgiO3M6MzoiMS00IjtzOjk6Im1pbl93aWR0aCI7czozOiIyMDAiO3M6MTA6ImJyZWFrcG9pbnQiO3M6MToibSI7czo1OiJmaXJzdCI7aTowO3M6NjoiZ3V0dGVyIjtzOjA6IiI7czo3OiJkaXZpZGVyIjtpOjA7fXM6NjoiYm90dG9tIjthOjQ6e3M6NToic3R5bGUiO3M6NzoiZGVmYXVsdCI7czo1OiJ3aWR0aCI7czo3OiJkZWZhdWx0IjtzOjEwOiJicmVha3BvaW50IjtzOjE6Im0iO3M6MTQ6ImltYWdlX3Bvc2l0aW9uIjtzOjEzOiJjZW50ZXItY2VudGVyIjt9czo2OiJmb290ZXIiO2E6MTp7czo3OiJjb250ZW50IjthOjU6e3M6NDoidHlwZSI7czo2OiJsYXlvdXQiO3M6ODoiY2hpbGRyZW4iO2E6MTp7aTowO2E6Mzp7czo0OiJ0eXBlIjtzOjc6InNlY3Rpb24iO3M6NToicHJvcHMiO2E6Nzp7czo1OiJzdHlsZSI7czo3OiJkZWZhdWx0IjtzOjU6IndpZHRoIjtzOjc6ImRlZmF1bHQiO3M6MTQ6InZlcnRpY2FsX2FsaWduIjtzOjY6Im1pZGRsZSI7czoxNDoidGl0bGVfcG9zaXRpb24iO3M6ODoidG9wLWxlZnQiO3M6MTQ6InRpdGxlX3JvdGF0aW9uIjtzOjQ6ImxlZnQiO3M6MTY6InRpdGxlX2JyZWFrcG9pbnQiO3M6MjoieGwiO3M6MTQ6ImltYWdlX3Bvc2l0aW9uIjtzOjEzOiJjZW50ZXItY2VudGVyIjt9czo4OiJjaGlsZHJlbiI7YToxOntpOjA7YTozOntzOjQ6InR5cGUiO3M6Mzoicm93IjtzOjU6InByb3BzIjthOjA6e31zOjg6ImNoaWxkcmVuIjthOjE6e2k6MDthOjM6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NToicHJvcHMiO2E6Mjp7czoxNDoiaW1hZ2VfcG9zaXRpb24iO3M6MTM6ImNlbnRlci1jZW50ZXIiO3M6MjI6Im1lZGlhX292ZXJsYXlfZ3JhZGllbnQiO3M6MDoiIjt9czo4OiJjaGlsZHJlbiI7YToxOntpOjA7YToyOntzOjQ6InR5cGUiO3M6NDoiaHRtbCI7czo1OiJwcm9wcyI7YToxOntzOjc6ImNvbnRlbnQiO3M6NDQ5OiI8ZGl2IGlkPSJtb2RhbC1mdWxsIiBjbGFzcz0idWstbW9kYWwtZnVsbCIgdWstbW9kYWw+CiAgICA8ZGl2IGNsYXNzPSJ1ay1tb2RhbC1kaWFsb2ciPgogICAgICAgIDxidXR0b24gY2xhc3M9InVrLW1vZGFsLWNsb3NlLWZ1bGwgdWstY2xvc2UtbGFyZ2UiIHR5cGU9ImJ1dHRvbiIgdWstY2xvc2U+PC9idXR0b24+CiAgICAgICAgPGRpdiBjbGFzcz0idWstZ3JpZC1jb2xsYXBzZSB1ay1jaGlsZC13aWR0aC0xLTFAcyB1ay1mbGV4LW1pZGRsZSIgdWstZ3JpZD4KICAgICAgICAgICAgPGRpdiBjbGFzcz0idWstYmFja2dyb3VuZC1ub3JlcGVhdCB1ay1iYWNrZ3JvdW5kLWNlbnRlci1jZW50ZXIiIHN0eWxlPSJiYWNrZ3JvdW5kLWltYWdlOiB1cmwoJy9pbWFnZXMvcGhvdG8xLmpwZycpOyIgdWstaGVpZ2h0LXZpZXdwb3J0PjwvZGl2PgogICAgICAgIDwvZGl2PgogICAgPC9kaXY+CjwvZGl2PiI7fX19fX19fX19czo3OiJ2ZXJzaW9uIjtzOjU6IjIuNi42IjtzOjU6InByb3BzIjthOjA6e31zOjIwOiJ5b29lc3NlbnRpYWxzVmVyc2lvbiI7czo1OiIxLjQuNyI7fX1zOjY6ImNvb2tpZSI7YTo5OntzOjQ6InR5cGUiO3M6MzoiYmFyIjtzOjEyOiJiYXJfcG9zaXRpb24iO3M6NjoiYm90dG9tIjtzOjk6ImJhcl9zdHlsZSI7czo1OiJtdXRlZCI7czoyMToibm90aWZpY2F0aW9uX3Bvc2l0aW9uIjtzOjEzOiJib3R0b20tY2VudGVyIjtzOjc6Im1lc3NhZ2UiO3M6OTA6IkJ5IHVzaW5nIHRoaXMgd2Vic2l0ZSwgeW91IGFncmVlIHRvIHRoZSB1c2Ugb2YgY29va2llcyBhcyBkZXNjcmliZWQgaW4gb3VyIFByaXZhY3kgUG9saWN5LiI7czoyMDoiYnV0dG9uX2NvbnNlbnRfc3R5bGUiO3M6NDoiaWNvbiI7czoxOToiYnV0dG9uX2NvbnNlbnRfdGV4dCI7czoyOiJPayI7czoxOToiYnV0dG9uX3JlamVjdF9zdHlsZSI7czo3OiJkZWZhdWx0IjtzOjE4OiJidXR0b25fcmVqZWN0X3RleHQiO3M6MTA6Ik5vLCBUaGFua3MiO31zOjg6Imxhenlsb2FkIjtiOjE7czo0OiJwb3N0IjthOjEyOntzOjU6IndpZHRoIjtzOjc6ImRlZmF1bHQiO3M6NzoicGFkZGluZyI7czowOiIiO3M6MTM6ImNvbnRlbnRfd2lkdGgiO3M6MDoiIjtzOjEyOiJpbWFnZV9tYXJnaW4iO3M6NjoibWVkaXVtIjtzOjExOiJpbWFnZV93aWR0aCI7czowOiIiO3M6MTI6ImltYWdlX2hlaWdodCI7czowOiIiO3M6MTI6ImhlYWRlcl9hbGlnbiI7aTowO3M6MTI6InRpdGxlX21hcmdpbiI7czo3OiJkZWZhdWx0IjtzOjExOiJtZXRhX21hcmdpbiI7czo3OiJkZWZhdWx0IjtzOjEwOiJtZXRhX3N0eWxlIjtzOjg6InNlbnRlbmNlIjtzOjE0OiJjb250ZW50X21hcmdpbiI7czo2OiJtZWRpdW0iO3M6MTU6ImNvbnRlbnRfZHJvcGNhcCI7aTowO31zOjQ6ImJsb2ciO2E6MTk6e3M6NToid2lkdGgiO3M6NzoiZGVmYXVsdCI7czo3OiJwYWRkaW5nIjtzOjA6IiI7czoxNToiZ3JpZF9jb2x1bW5fZ2FwIjtzOjA6IiI7czoxMjoiZ3JpZF9yb3dfZ2FwIjtzOjA6IiI7czoxNToiZ3JpZF9icmVha3BvaW50IjtzOjE6Im0iO3M6MTI6ImltYWdlX21hcmdpbiI7czo2OiJtZWRpdW0iO3M6MTE6ImltYWdlX3dpZHRoIjtzOjA6IiI7czoxMjoiaW1hZ2VfaGVpZ2h0IjtzOjA6IiI7czoxMjoiaGVhZGVyX2FsaWduIjtpOjA7czoxMToidGl0bGVfc3R5bGUiO3M6MDoiIjtzOjEyOiJ0aXRsZV9tYXJnaW4iO3M6NzoiZGVmYXVsdCI7czoxMToibWV0YV9tYXJnaW4iO3M6NzoiZGVmYXVsdCI7czoxNToiY29udGVudF9leGNlcnB0IjtpOjA7czoxNDoiY29udGVudF9sZW5ndGgiO3M6MDoiIjtzOjE0OiJjb250ZW50X21hcmdpbiI7czo2OiJtZWRpdW0iO3M6MTM6ImNvbnRlbnRfYWxpZ24iO2k6MDtzOjEyOiJidXR0b25fc3R5bGUiO3M6NzoiZGVmYXVsdCI7czoxMzoiYnV0dG9uX21hcmdpbiI7czo2OiJtZWRpdW0iO3M6MTA6Im5hdmlnYXRpb24iO3M6MTA6InBhZ2luYXRpb24iO31zOjEyOiJtZWRpYV9mb2xkZXIiO3M6ODoieW9vdGhlbWUiO3M6MTM6InNlYXJjaF9tb2R1bGUiO3M6MTA6Im1vZF9zZWFyY2giO3M6OToiYm9vdHN0cmFwIjtiOjE7czo0OiJsZXNzIjthOjQ6e3M6Mjc6IkBidXR0b24tZGVmYXVsdC1ob3Zlci1jb2xvciI7czo3OiIjRkZGRkZGIjtzOjIwOiJAYnV0dG9uLWJvcmRlci13aWR0aCI7czozOiIxcHgiO3M6MjE6IkBidXR0b24tYm9yZGVyLXJhZGl1cyI7czozOiI1cHgiO3M6MTk6IkBidXR0b24tbGluZS1oZWlnaHQiO3M6NDoiNTRweCI7fXM6MTE6ImN1c3RvbV9sZXNzIjtzOjA6IiI7czo1OiJzdHlsZSI7czoxMDoiamFjay1iYWtlciI7czo3OiJ2ZXJzaW9uIjtzOjU6IjIuNi42IjtzOjEzOiJ5b29lc3NlbnRpYWxzIjthOjU6e3M6Njoic291cmNlIjthOjI6e3M6Nzoic291cmNlcyI7YTowOnt9czo1OiJzdGF0ZSI7aToxO31zOjQ6ImZvcm0iO2E6MTp7czo1OiJzdGF0ZSI7aToxO31zOjY6ImFjY2VzcyI7YToxOntzOjU6InN0YXRlIjtpOjE7fXM6NDoiaWNvbiI7YToxOntzOjU6InN0YXRlIjtpOjE7fXM6NzoiZWxlbWVudCI7YToxOntzOjU6InN0YXRlIjtpOjE7fX1zOjQ6ImxvZ28iO2E6Njp7czo1OiJpbWFnZSI7czoxNzoiaW1hZ2VzL2xvZ28tdy5zdmciO3M6MTE6ImltYWdlX3dpZHRoIjtzOjM6IjE3NyI7czoxMjoiaW1hZ2VfaGVpZ2h0IjtzOjI6IjQyIjtzOjEyOiJpbWFnZV9tb2JpbGUiO3M6MTc6ImltYWdlcy9sb2dvLXcuc3ZnIjtzOjE4OiJpbWFnZV9tb2JpbGVfd2lkdGgiO3M6MzoiMTUyIjtzOjE5OiJpbWFnZV9tb2JpbGVfaGVpZ2h0IjtzOjI6IjM2Ijt9czo3OiJmYXZpY29uIjtzOjMwOiIvaW1hZ2VzL2FuZHJvaWQtaWNvbi05Nng5Ni5wbmciO3M6OToidG91Y2hpY29uIjtzOjMwOiIvaW1hZ2VzL2FwcGxlLWljb24tMTgweDE4MC5wbmciO3M6ODoic2l0ZV91cmwiO3M6MjY6Imh0dHBzOi8vY2xvdWQudW5pdGVhbS5wcm8vIjtzOjk6ImRpcmVjdGlvbiI7czozOiJsdHIiO3M6MTA6InBhZ2VfY2xhc3MiO047czoxMDoiYm9keV9jbGFzcyI7YToxOntpOjA7Tjt9czo3OiJtb2R1bGVzIjthOjU6e2k6MTthOjU6e3M6OToic2hvd3RpdGxlIjtzOjE6IjEiO3M6NToiY2xhc3MiO2E6MTp7aTowO3M6NToiX21lbnUiO31zOjk6InRpdGxlX3RhZyI7czoyOiJoMyI7czoxMToidGl0bGVfY2xhc3MiO3M6MDoiIjtzOjc6ImlzX2xpc3QiO2I6MDt9aToxNjthOjU6e3M6OToic2hvd3RpdGxlIjtzOjE6IjEiO3M6NToiY2xhc3MiO2E6MTp7aTowO3M6MDoiIjt9czo5OiJ0aXRsZV90YWciO3M6MjoiaDMiO3M6MTE6InRpdGxlX2NsYXNzIjtzOjA6IiI7czo3OiJpc19saXN0IjtiOjA7fWk6MTc7YTo1OntzOjk6InNob3d0aXRsZSI7czoxOiIxIjtzOjU6ImNsYXNzIjthOjE6e2k6MDtzOjA6IiI7fXM6OToidGl0bGVfdGFnIjtzOjI6ImgzIjtzOjExOiJ0aXRsZV9jbGFzcyI7czowOiIiO3M6NzoiaXNfbGlzdCI7YjowO31pOjkxO2E6MTc6e3M6MTA6InZpc2liaWxpdHkiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxMToidGl0bGVfc3R5bGUiO3M6MDoiIjtzOjE2OiJ0aXRsZV9kZWNvcmF0aW9uIjtzOjA6IiI7czoxMDoidGV4dF9hbGlnbiI7czowOiIiO3M6MjE6InRleHRfYWxpZ25fYnJlYWtwb2ludCI7czowOiIiO3M6MTk6InRleHRfYWxpZ25fZmFsbGJhY2siO3M6MDoiIjtzOjU6IndpZHRoIjtzOjA6IiI7czo4OiJtYXh3aWR0aCI7czowOiIiO3M6MTA6Imxpc3Rfc3R5bGUiO3M6MDoiIjtzOjEwOiJsaW5rX3N0eWxlIjtzOjA6IiI7czoxMDoibWVudV9zdHlsZSI7czowOiIiO3M6OToic2hvd3RpdGxlIjtzOjE6IjAiO3M6NToiY2xhc3MiO2E6MTp7aTowO3M6MDoiIjt9czo5OiJ0aXRsZV90YWciO3M6MjoiaDMiO3M6MTE6InRpdGxlX2NsYXNzIjtzOjA6IiI7czo3OiJpc19saXN0IjtiOjA7fXM6MTE6Im1lbnUtbmF2YmFyIjthOjU6e3M6OToic2hvd3RpdGxlIjtpOjA7czo1OiJjbGFzcyI7YToxOntpOjA7czowOiIiO31zOjk6InRpdGxlX3RhZyI7czoyOiJoMyI7czoxMToidGl0bGVfY2xhc3MiO3M6MDoiIjtzOjc6ImlzX2xpc3QiO2I6MDt9fXM6MTE6InBhZ2VfbGF5b3V0IjtzOjQ6ImJsb2ciO31zOjc6InVzZXJfaWQiO3M6MzoiOTQ4Ijt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 0, ''),
(0x3461366232643933666131373236613138656163626264633237616662386131, 0, 1, 1636871343, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTM0MztzOjQ6Imxhc3QiO2k6MTYzNjg3MTM0MztzOjM6Im5vdyI7aToxNjM2ODcxMzQzO31zOjU6InRva2VuIjtzOjMyOiJYeGlsazlIRDFJeG1ySG9nMXNFYmdxaTR0a05pa1RQUCI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x3565383234313939323965303466363137646132653434626265386162396131, 1, 0, 1636871674, 'joomla|s:2368:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo1OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMDI7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjM2ODY2NDM2O3M6NDoibGFzdCI7aToxNjM2ODcxNjYxO3M6Mzoibm93IjtpOjE2MzY4NzE2NzM7fXM6NToidG9rZW4iO3M6MzI6IlBIOVVBQ1hpNm85Rzdod1RPNlJXQW81Z1kydGhKUnU0Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6MTM6ImNvbV9pbnN0YWxsZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NzoibWVzc2FnZSI7czowOiIiO3M6MTc6ImV4dGVuc2lvbl9tZXNzYWdlIjtzOjA6IiI7czoxMjoicmVkaXJlY3RfdXJsIjtOO31zOjEwOiJjb21fY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6ImNvbmZpZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJnbG9iYWwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjExOiJjb21fY29udGVudCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImFydGljbGUiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZGF0YSI7Tjt9fX1zOjk6ImNvbV9tZW51cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJpdGVtcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJtZW51dHlwZSI7czo4OiJtYWlubWVudSI7czo5OiJjbGllbnRfaWQiO2k6MDtzOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6Iml0ZW0iO086ODoic3RkQ2xhc3MiOjQ6e3M6MjoiaWQiO2E6MDp7fXM6NDoiZGF0YSI7TjtzOjQ6InR5cGUiO047czo0OiJsaW5rIjtOO319fXM6MTM6ImNvbV90ZW1wbGF0ZXMiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJzdHlsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YToxOntpOjA7aTo5O31zOjQ6ImRhdGEiO047fX19czoxMToiY29tX21vZHVsZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJtb2R1bGUiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7TjtzOjI6ImlkIjthOjE6e2k6MDtpOjkxO319fXM6MzoiYWRkIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Im1vZHVsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMjoiZXh0ZW5zaW9uX2lkIjtOO3M6NjoicGFyYW1zIjtOO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtzOjM6Ijk0OCI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319czo5OiJjb21fbWVkaWEiO086ODoic3RkQ2xhc3MiOjE6e3M6MTA6InJldHVybl91cmwiO3M6MjY6ImluZGV4LnBocD9vcHRpb249Y29tX21lZGlhIjt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 948, 'Dimeon'),
(0x3963326531363866343963306437616161666262333734336163323536373164, 0, 1, 1636871291, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTI5MTtzOjQ6Imxhc3QiO2k6MTYzNjg3MTI5MTtzOjM6Im5vdyI7aToxNjM2ODcxMjkxO31zOjU6InRva2VuIjtzOjMyOiIzcmlvSGFIT0pZbnFOYXNQMEVtU0JueTBCalZHY3UzNyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x3963623766393061623136356130353439663432333836393563336439616566, 0, 1, 1636871377, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTM3NjtzOjQ6Imxhc3QiO2k6MTYzNjg3MTM3NjtzOjM6Im5vdyI7aToxNjM2ODcxMzc2O31zOjU6InRva2VuIjtzOjMyOiIxUHBiNlVHelR4MHdNWU9pNTYwZzA4MUJBQW1YRUVZSCI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x6166326561623939616231656564303634613837393434313366336163623563, 0, 1, 1636872007, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTk5NztzOjQ6Imxhc3QiO2k6MTYzNjg3MTk5NztzOjM6Im5vdyI7aToxNjM2ODcxOTk3O31zOjU6InRva2VuIjtzOjMyOiJUQThQQm1DZHhCc0xSSUg4d2VqcjVQWDRsMVZSckFGYiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x6537303161303037366662366433306537346261396532306566373266623439, 0, 1, 1636866490, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg2NjQ5MDtzOjQ6Imxhc3QiO2k6MTYzNjg2NjQ5MDtzOjM6Im5vdyI7aToxNjM2ODY2NDkwO31zOjU6InRva2VuIjtzOjMyOiJSMlNNYWtmUTdBWTZ1ZEJnRXh5UDlhenhBbTNkWVNTSiI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, ''),
(0x6566393930393963633365643962326162356134333731343530323362656562, 0, 1, 1636871391, 'joomla|s:736:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTYzNjg3MTM5MTtzOjQ6Imxhc3QiO2k6MTYzNjg3MTM5MTtzOjM6Im5vdyI7aToxNjM2ODcxMzkxO31zOjU6InRva2VuIjtzOjMyOiJuR1BtY0FvdFpmWjhMVHZCV2tlNVhvRDJtYlBjS2szRSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_tags`
--

CREATE TABLE IF NOT EXISTS `fd_tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_tags`
--

INSERT INTO `fd_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 948, '2021-11-14 05:06:52', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_template_styles`
--

CREATE TABLE IF NOT EXISTS `fd_template_styles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint(4) NOT NULL DEFAULT '0',
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_template_styles`
--

INSERT INTO `fd_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', 0, '', '{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', 0, '', '{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),
(7, 'protostar', 0, '0', 'protostar - Default', 0, '', '{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),
(8, 'isis', 1, '1', 'isis - Default', 0, '', '{\"templateColor\":\"\",\"logoFile\":\"\"}'),
(9, 'yootheme', 0, '1', 'yootheme - По умолчанию', 0, '', '{\"config\":\"{\\\"menu\\\":{\\\"items\\\":[],\\\"positions\\\":{\\\"navbar\\\":\\\"mainmenu\\\",\\\"mobile\\\":\\\"\\\"}},\\\"site\\\":{\\\"layout\\\":\\\"full\\\",\\\"boxed\\\":{\\\"alignment\\\":1},\\\"image_size\\\":\\\"cover\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image_effect\\\":\\\"fixed\\\",\\\"toolbar_width\\\":\\\"default\\\",\\\"breadcrumbs_show_home\\\":true,\\\"breadcrumbs_show_current\\\":true,\\\"breadcrumbs_home_text\\\":\\\"\\\"},\\\"header\\\":{\\\"layout\\\":\\\"horizontal-right\\\",\\\"width\\\":\\\"default\\\",\\\"social_gap\\\":\\\"small\\\",\\\"search\\\":\\\"\\\",\\\"search_style\\\":\\\"modal\\\"},\\\"navbar\\\":{\\\"sticky\\\":0,\\\"dropdown_align\\\":\\\"left\\\",\\\"toggle_menu_style\\\":\\\"default\\\",\\\"offcanvas\\\":{\\\"mode\\\":\\\"slide\\\"}},\\\"mobile\\\":{\\\"breakpoint\\\":\\\"m\\\",\\\"logo\\\":\\\"center\\\",\\\"toggle\\\":false,\\\"search\\\":false,\\\"menu_style\\\":\\\"default\\\",\\\"animation\\\":false,\\\"close_button\\\":true,\\\"offcanvas\\\":{\\\"mode\\\":\\\"slide\\\"},\\\"dropdown\\\":\\\"slide\\\"},\\\"top\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"main_sidebar\\\":{\\\"width\\\":\\\"1-4\\\",\\\"min_width\\\":\\\"200\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"first\\\":0,\\\"gutter\\\":\\\"\\\",\\\"divider\\\":0},\\\"bottom\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"breakpoint\\\":\\\"m\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"footer\\\":{\\\"content\\\":{\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"props\\\":[],\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"html\\\",\\\"props\\\":{\\\"content\\\":\\\"<div id=\\\\\\\"modal-full\\\\\\\" class=\\\\\\\"uk-modal-full\\\\\\\" uk-modal>\\\\n    <div class=\\\\\\\"uk-modal-dialog\\\\\\\">\\\\n        <button class=\\\\\\\"uk-modal-close-full uk-close-large\\\\\\\" type=\\\\\\\"button\\\\\\\" uk-close><\\\\\\/button>\\\\n        <div class=\\\\\\\"uk-grid-collapse uk-child-width-1-1@s uk-flex-middle\\\\\\\" uk-grid>\\\\n            <div class=\\\\\\\"uk-background-norepeat uk-background-center-center\\\\\\\" style=\\\\\\\"background-image: url(\'\\\\\\/images\\\\\\/photo1.jpg\');\\\\\\\" uk-height-viewport><\\\\\\/div>\\\\n        <\\\\\\/div>\\\\n    <\\\\\\/div>\\\\n<\\\\\\/div>\\\"}}]}]}]}],\\\"version\\\":\\\"2.6.6\\\"}},\\\"cookie\\\":{\\\"type\\\":\\\"bar\\\",\\\"bar_position\\\":\\\"bottom\\\",\\\"bar_style\\\":\\\"muted\\\",\\\"notification_position\\\":\\\"bottom-center\\\",\\\"message\\\":\\\"By using this website, you agree to the use of cookies as described in our Privacy Policy.\\\",\\\"button_consent_style\\\":\\\"icon\\\",\\\"button_consent_text\\\":\\\"Ok\\\",\\\"button_reject_style\\\":\\\"default\\\",\\\"button_reject_text\\\":\\\"No, Thanks\\\"},\\\"lazyload\\\":true,\\\"post\\\":{\\\"width\\\":\\\"default\\\",\\\"padding\\\":\\\"\\\",\\\"content_width\\\":\\\"\\\",\\\"image_margin\\\":\\\"medium\\\",\\\"image_width\\\":\\\"\\\",\\\"image_height\\\":\\\"\\\",\\\"header_align\\\":0,\\\"title_margin\\\":\\\"default\\\",\\\"meta_margin\\\":\\\"default\\\",\\\"meta_style\\\":\\\"sentence\\\",\\\"content_margin\\\":\\\"medium\\\",\\\"content_dropcap\\\":0},\\\"blog\\\":{\\\"width\\\":\\\"default\\\",\\\"padding\\\":\\\"\\\",\\\"grid_column_gap\\\":\\\"\\\",\\\"grid_row_gap\\\":\\\"\\\",\\\"grid_breakpoint\\\":\\\"m\\\",\\\"image_margin\\\":\\\"medium\\\",\\\"image_width\\\":\\\"\\\",\\\"image_height\\\":\\\"\\\",\\\"header_align\\\":0,\\\"title_style\\\":\\\"\\\",\\\"title_margin\\\":\\\"default\\\",\\\"meta_margin\\\":\\\"default\\\",\\\"content_excerpt\\\":0,\\\"content_length\\\":\\\"\\\",\\\"content_margin\\\":\\\"medium\\\",\\\"content_align\\\":0,\\\"button_style\\\":\\\"default\\\",\\\"button_margin\\\":\\\"medium\\\",\\\"navigation\\\":\\\"pagination\\\"},\\\"media_folder\\\":\\\"yootheme\\\",\\\"search_module\\\":\\\"mod_search\\\",\\\"bootstrap\\\":true,\\\"less\\\":{\\\"@button-default-hover-color\\\":\\\"#FFFFFF\\\",\\\"@button-border-width\\\":\\\"1px\\\",\\\"@button-border-radius\\\":\\\"5px\\\",\\\"@button-line-height\\\":\\\"54px\\\"},\\\"custom_less\\\":\\\"\\\",\\\"style\\\":\\\"jack-baker\\\",\\\"yootheme_apikey\\\":\\\"\\\",\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentials\\\":{\\\"source\\\":{\\\"sources\\\":[],\\\"state\\\":1},\\\"form\\\":{\\\"state\\\":1},\\\"access\\\":{\\\"state\\\":1},\\\"icon\\\":{\\\"state\\\":1},\\\"element\\\":{\\\"state\\\":1}},\\\"logo\\\":{\\\"image\\\":\\\"images\\\\\\/logo-w.svg\\\",\\\"image_width\\\":\\\"177\\\",\\\"image_height\\\":\\\"42\\\",\\\"image_mobile\\\":\\\"images\\\\\\/logo-w.svg\\\",\\\"image_mobile_width\\\":\\\"152\\\",\\\"image_mobile_height\\\":\\\"36\\\"},\\\"favicon\\\":\\\"\\\\\\/images\\\\\\/android-icon-96x96.png\\\",\\\"touchicon\\\":\\\"\\\\\\/images\\\\\\/apple-icon-180x180.png\\\",\\\"site_url\\\":\\\"https:\\\\\\/\\\\\\/cloud.uniteam.pro\\\\\\/\\\",\\\"direction\\\":\\\"ltr\\\",\\\"page_class\\\":null,\\\"body_class\\\":[null],\\\"modules\\\":{\\\"menu-navbar\\\":{\\\"showtitle\\\":0,\\\"class\\\":[\\\"\\\"],\\\"title_tag\\\":\\\"h3\\\",\\\"title_class\\\":\\\"\\\",\\\"is_list\\\":false},\\\"91\\\":{\\\"visibility\\\":\\\"\\\",\\\"style\\\":\\\"\\\",\\\"title_style\\\":\\\"\\\",\\\"title_decoration\\\":\\\"\\\",\\\"text_align\\\":\\\"\\\",\\\"text_align_breakpoint\\\":\\\"\\\",\\\"text_align_fallback\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"maxwidth\\\":\\\"\\\",\\\"list_style\\\":\\\"\\\",\\\"link_style\\\":\\\"\\\",\\\"menu_style\\\":\\\"\\\",\\\"showtitle\\\":\\\"0\\\",\\\"class\\\":[\\\"\\\"],\\\"title_tag\\\":\\\"h3\\\",\\\"title_class\\\":\\\"\\\",\\\"is_list\\\":false},\\\"17\\\":{\\\"showtitle\\\":\\\"1\\\",\\\"class\\\":[\\\"\\\"],\\\"title_tag\\\":\\\"h3\\\",\\\"title_class\\\":\\\"\\\",\\\"is_list\\\":false},\\\"1\\\":{\\\"showtitle\\\":\\\"1\\\",\\\"class\\\":[\\\"_menu\\\"],\\\"title_tag\\\":\\\"h3\\\",\\\"title_class\\\":\\\"\\\",\\\"is_list\\\":false},\\\"16\\\":{\\\"showtitle\\\":\\\"1\\\",\\\"class\\\":[\\\"\\\"],\\\"title_tag\\\":\\\"h3\\\",\\\"title_class\\\":\\\"\\\",\\\"is_list\\\":false}},\\\"page_layout\\\":\\\"blog\\\"}\",\"yootheme\":\"true\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_ucm_base`
--

CREATE TABLE IF NOT EXISTS `fd_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(11) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_ucm_content`
--

CREATE TABLE IF NOT EXISTS `fd_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint(4) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci,
  `core_urls` text COLLATE utf8mb4_unicode_ci,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Структура таблицы `fd_ucm_history`
--

CREATE TABLE IF NOT EXISTS `fd_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_ucm_history`
--

INSERT INTO `fd_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(6, 1, 1, '', '2021-11-14 05:34:13', 948, 8845, 'feb76ff6600d54f2f483a54f1d924908d7d89bc0', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"top\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 05:34:13\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":6,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"107\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(7, 1, 1, '', '2021-11-14 05:34:30', 948, 8844, '440743f2ad758f93801a872d6d4117244d160231', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"top\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 05:34:30\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":7,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"108\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(8, 1, 1, '', '2021-11-14 06:04:15', 948, 8926, '7a2856250d487be1b0acc32bf73f2db34cc41c5f', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:04:15\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":8,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"150\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(9, 1, 1, '', '2021-11-14 06:08:18', 948, 8924, 'f0cf641695b806ed85a5202a02784a2f61fa6d5e', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:08:18\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":9,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"151\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0);
INSERT INTO `fd_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(10, 1, 1, '', '2021-11-14 06:15:27', 948, 8961, '8290c1e02422c5695f82e6948d8d81d31f5610d0', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:15:27\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":10,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"180\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(11, 1, 1, '', '2021-11-14 06:17:14', 948, 8948, '352053db63831b02428a51c1c128bccb7105cb38', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle511-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041e\\u0432\\u043e\\u0449\\u0438<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle511-3.jpg\\\",\\\"title\\\":\\\"\\\\u041e\\\\u0432\\\\u043e\\\\u0449\\\\u0438\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:17:14\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":11,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"188\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(12, 1, 1, '', '2021-11-14 06:17:38', 948, 7812, '54fc497ec3dfeefe9ab7fe9a1d45c9b65799464c', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle511-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041e\\u0432\\u043e\\u0449\\u0438<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle511-3.jpg\\\",\\\"title\\\":\\\"\\\\u041e\\\\u0432\\\\u043e\\\\u0449\\\\u0438\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:17:38\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":12,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"193\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(13, 1, 1, '', '2021-11-14 06:34:16', 948, 8495, 'b0a5311919edbb60eb4287da3612afd52cd717d8', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><img src=\\\"\\/images\\/Group48.svg\\\" alt=\\\"\\\">\\n<h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle511-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041e\\u0432\\u043e\\u0449\\u0438<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"padding\\\":\\\"xsmall\\\",\\\"padding_remove_bottom\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"image\\\",\\\"props\\\":{\\\"margin\\\":\\\"default\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"image\\\":\\\"images\\\\\\/Group48.svg\\\",\\\"margin_remove_top\\\":true,\\\"margin_remove_bottom\\\":true}}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle511-3.jpg\\\",\\\"title\\\":\\\"\\\\u041e\\\\u0432\\\\u043e\\\\u0449\\\\u0438\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:34:16\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":13,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"209\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0);
INSERT INTO `fd_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(14, 1, 1, '', '2021-11-14 06:34:22', 948, 8496, '65ff0c277e3b8b335127ace0ed4cebcca4eafd22', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><img src=\\\"\\/images\\/Group48.svg\\\" alt=\\\"\\\">\\n<h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle511-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041e\\u0432\\u043e\\u0449\\u0438<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"padding\\\":\\\"xsmall\\\",\\\"padding_remove_bottom\\\":false},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"image\\\",\\\"props\\\":{\\\"margin\\\":\\\"default\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"image\\\":\\\"images\\\\\\/Group48.svg\\\",\\\"margin_remove_top\\\":true,\\\"margin_remove_bottom\\\":true}}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle511-3.jpg\\\",\\\"title\\\":\\\"\\\\u041e\\\\u0432\\\\u043e\\\\u0449\\\\u0438\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:34:22\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":14,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"209\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0),
(15, 1, 1, '', '2021-11-14 06:34:34', 948, 8524, '58c1585caa16d8d249f458888c64bacb110c1842', '{\"id\":\"1\",\"asset_id\":\"62\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<!-- Builder #page --><img src=\\\"\\/images\\/Group48.svg\\\" alt=\\\"\\\">\\n<h1>\\u041e\\u043d\\u043b\\u0430\\u0439\\u043d \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0430 \\u043e\\u0431\\u044a\\u0435\\u0434\\u0438\\u043d\\u044f\\u044e\\u0449\\u0430\\u044f \\u043f\\u043e\\u043a\\u0443\\u043f\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0441\\u0435\\u043b\\u044c\\u0445\\u043e\\u0437\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<p>\\n    <a href=\\\"#\\\">\\u0417\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f<\\/a>\\n<\\/p>\\n<h1>\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438<\\/h1>\\n<ul>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle_11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u0424\\u0440\\u0443\\u043a\\u0442\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle11-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041a\\u0440\\u0443\\u043f\\u044b<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle211-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041c\\u044f\\u0441\\u043e<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n        <li>\\n\\n        <img src=\\\"\\/images\\/Rectangle511-3.jpg\\\" alt=\\\"\\\">\\n\\n<h3>\\u041e\\u0432\\u043e\\u0449\\u0438<\\/h3>\\n\\n\\n\\n\\n    <\\/li>\\n    <\\/ul>\\n<p>\\n    <a href=\\\"#\\\">\\u041f\\u043e\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0432\\u0441\\u0435 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438<\\/a>\\n<\\/p>\\n\",\"fulltext\":\"<!-- {\\\"type\\\":\\\"layout\\\",\\\"children\\\":[{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"padding\\\":\\\"xsmall\\\",\\\"padding_remove_bottom\\\":false},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"image\\\",\\\"props\\\":{\\\"margin\\\":\\\"default\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"image\\\":\\\"images\\\\\\/Group48.svg\\\",\\\"margin_remove_top\\\":true,\\\"margin_remove_bottom\\\":true}}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"default\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\",\\\"image\\\":\\\"\\\",\\\"padding_remove_top\\\":true},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\",\\\"width_medium\\\":\\\"\\\",\\\"image\\\":\\\"images\\\\\\/aged-greenhouse.jpg\\\",\\\"image_size\\\":\\\"cover\\\",\\\"image_effect\\\":\\\"parallax\\\",\\\"image_parallax_bgx_start\\\":\\\"0\\\",\\\"image_parallax_bgy_start\\\":\\\"0\\\",\\\"image_parallax_bgx_end\\\":\\\"0\\\",\\\"image_parallax_bgy_end\\\":\\\"50\\\",\\\"css\\\":\\\".el-column {\\\\n\\\\tmin-height: 460px;\\\\n}\\\\n.el-column .uk-tile {\\\\n    border-radius: 20px;\\\\n}\\\",\\\"vertical_align\\\":\\\"bottom\\\",\\\"text_color\\\":\\\"light\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041e\\\\u043d\\\\u043b\\\\u0430\\\\u0439\\\\u043d \\\\u043f\\\\u043b\\\\u0430\\\\u0442\\\\u0444\\\\u043e\\\\u0440\\\\u043c\\\\u0430 \\\\u043e\\\\u0431\\\\u044a\\\\u0435\\\\u0434\\\\u0438\\\\u043d\\\\u044f\\\\u044e\\\\u0449\\\\u0430\\\\u044f \\\\u043f\\\\u043e\\\\u043a\\\\u0443\\\\u043f\\\\u0430\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0438 \\\\u043f\\\\u0440\\\\u043e\\\\u0438\\\\u0437\\\\u0432\\\\u043e\\\\u0434\\\\u0438\\\\u0442\\\\u0435\\\\u043b\\\\u0435\\\\u0439 \\\\u0441\\\\u0435\\\\u043b\\\\u044c\\\\u0445\\\\u043e\\\\u0437\\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\",\\\"title_style\\\":\\\"h2\\\",\\\"maxwidth\\\":\\\"2xlarge\\\"}},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"medium\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"primary\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u0417\\\\u0430\\\\u0440\\\\u0435\\\\u0433\\\\u0438\\\\u0441\\\\u0442\\\\u0440\\\\u0438\\\\u0440\\\\u043e\\\\u0432\\\\u0430\\\\u0442\\\\u044c\\\\u0441\\\\u044f\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]},{\\\"type\\\":\\\"section\\\",\\\"props\\\":{\\\"style\\\":\\\"muted\\\",\\\"width\\\":\\\"default\\\",\\\"vertical_align\\\":\\\"middle\\\",\\\"title_position\\\":\\\"top-left\\\",\\\"title_rotation\\\":\\\"left\\\",\\\"title_breakpoint\\\":\\\"xl\\\",\\\"image_position\\\":\\\"center-center\\\"},\\\"children\\\":[{\\\"type\\\":\\\"row\\\",\\\"children\\\":[{\\\"type\\\":\\\"column\\\",\\\"props\\\":{\\\"image_position\\\":\\\"center-center\\\",\\\"media_overlay_gradient\\\":\\\"\\\"},\\\"children\\\":[{\\\"type\\\":\\\"headline\\\",\\\"props\\\":{\\\"title_element\\\":\\\"h1\\\",\\\"content\\\":\\\"\\\\u041a\\\\u0430\\\\u0442\\\\u0430\\\\u043b\\\\u043e\\\\u0433 \\\\u043f\\\\u0440\\\\u043e\\\\u0434\\\\u0443\\\\u043a\\\\u0446\\\\u0438\\\\u0438\\\"}},{\\\"type\\\":\\\"grid\\\",\\\"props\\\":{\\\"show_title\\\":true,\\\"show_meta\\\":true,\\\"show_content\\\":true,\\\"show_image\\\":true,\\\"show_link\\\":true,\\\"grid_default\\\":\\\"1\\\",\\\"grid_medium\\\":\\\"4\\\",\\\"filter_style\\\":\\\"tab\\\",\\\"filter_all\\\":true,\\\"filter_position\\\":\\\"top\\\",\\\"filter_align\\\":\\\"left\\\",\\\"filter_grid_width\\\":\\\"auto\\\",\\\"filter_grid_breakpoint\\\":\\\"m\\\",\\\"title_hover_style\\\":\\\"reset\\\",\\\"title_element\\\":\\\"h3\\\",\\\"title_align\\\":\\\"top\\\",\\\"title_grid_width\\\":\\\"1-2\\\",\\\"title_grid_breakpoint\\\":\\\"m\\\",\\\"meta_style\\\":\\\"meta\\\",\\\"meta_align\\\":\\\"below-title\\\",\\\"meta_element\\\":\\\"div\\\",\\\"content_column_breakpoint\\\":\\\"m\\\",\\\"icon_width\\\":80,\\\"image_align\\\":\\\"bottom\\\",\\\"image_grid_width\\\":\\\"1-2\\\",\\\"image_grid_breakpoint\\\":\\\"m\\\",\\\"image_svg_color\\\":\\\"emphasis\\\",\\\"link_text\\\":\\\"Read more\\\",\\\"link_style\\\":\\\"default\\\",\\\"margin\\\":\\\"default\\\",\\\"item_animation\\\":true,\\\"panel_style\\\":\\\"card-default\\\",\\\"panel_link\\\":true,\\\"panel_card_image\\\":true,\\\"css\\\":\\\".el-item {\\\\n\\\\tborder-radius: 15px;\\\\n    overflow: hidden;\\\\n}\\\"},\\\"children\\\":[{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle_11-3.jpg\\\",\\\"title\\\":\\\"\\\\u0424\\\\u0440\\\\u0443\\\\u043a\\\\u0442\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle11-3.jpg\\\",\\\"title\\\":\\\"\\\\u041a\\\\u0440\\\\u0443\\\\u043f\\\\u044b\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle211-3.jpg\\\",\\\"title\\\":\\\"\\\\u041c\\\\u044f\\\\u0441\\\\u043e\\\"}},{\\\"type\\\":\\\"grid_item\\\",\\\"props\\\":{\\\"image\\\":\\\"images\\\\\\/Rectangle511-3.jpg\\\",\\\"title\\\":\\\"\\\\u041e\\\\u0432\\\\u043e\\\\u0449\\\\u0438\\\"}}]},{\\\"type\\\":\\\"button\\\",\\\"props\\\":{\\\"grid_column_gap\\\":\\\"small\\\",\\\"grid_row_gap\\\":\\\"small\\\",\\\"margin\\\":\\\"default\\\",\\\"class\\\":\\\"uk-text-center uk-margin-large-top\\\"},\\\"children\\\":[{\\\"type\\\":\\\"button_item\\\",\\\"props\\\":{\\\"button_style\\\":\\\"default\\\",\\\"icon_align\\\":\\\"left\\\",\\\"content\\\":\\\"\\\\u041f\\\\u043e\\\\u043a\\\\u0430\\\\u0437\\\\u0430\\\\u0442\\\\u044c \\\\u0432\\\\u0441\\\\u0435 \\\\u043a\\\\u0430\\\\u0442\\\\u0435\\\\u0433\\\\u043e\\\\u0440\\\\u0438\\\\u0438\\\",\\\"link\\\":\\\"#\\\"}}]}]}]}]}],\\\"version\\\":\\\"2.6.6\\\",\\\"yooessentialsVersion\\\":\\\"1.4.7\\\"} -->\",\"state\":\"1\",\"catid\":\"2\",\"created\":\"2021-11-14 05:14:09\",\"created_by\":\"948\",\"created_by_alias\":\"\",\"modified\":\"2021-11-14 06:34:34\",\"modified_by\":\"948\",\"checked_out\":\"0\",\"checked_out_time\":\"0000-00-00 00:00:00\",\"publish_up\":\"2021-11-14 05:14:09\",\"publish_down\":\"0000-00-00 00:00:00\",\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":false,\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":false,\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":false,\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_associations\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_icons\\\":\\\"\\\",\\\"show_print_icon\\\":\\\"\\\",\\\"show_email_icon\\\":\\\"\\\",\\\"show_vote\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\"}\",\"version\":15,\"ordering\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"access\":\"1\",\"hits\":\"211\",\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\",\\\"xreference\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"xreference\":\"\",\"note\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_updates`
--

CREATE TABLE IF NOT EXISTS `fd_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(4) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Дамп данных таблицы `fd_updates`
--

INSERT INTO `fd_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.9.16.1', '', 'https://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(2, 2, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.2', '', 'https://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(3, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.9.27.1', '', 'https://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(4, 2, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '3.4.4.1', '', 'https://update.joomla.org/language/details3/hy-AM_details.xml', '', ''),
(5, 2, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '3.9.24.1', '', 'https://update.joomla.org/language/details3/eu-ES_details.xml', '', ''),
(6, 2, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.2', '', 'https://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(7, 2, 0, 'Bengali, Bangladesh', '', 'pkg_bn-BD', 'package', '', 0, '3.8.10.1', '', 'https://update.joomla.org/language/details3/bn-BD_details.xml', '', ''),
(8, 2, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.9.24.1', '', 'https://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(9, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.6.5.2', '', 'https://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(10, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.9.23.1', '', 'https://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(11, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(12, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.8.0.1', '', 'https://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(13, 2, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(14, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.10.2.1', '', 'https://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(15, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(16, 2, 0, 'Dari Persian', '', 'pkg_prs-AF', 'package', '', 0, '3.4.4.3', '', 'https://update.joomla.org/language/details3/prs-AF_details.xml', '', ''),
(17, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(18, 2, 0, 'Dzongkha', '', 'pkg_dz-BT', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/dz-BT_details.xml', '', ''),
(19, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(20, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(21, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/en-NZ_details.xml', '', ''),
(22, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(23, 2, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '3.8.11.1', '', 'https://update.joomla.org/language/details3/eo-XX_details.xml', '', ''),
(24, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.9.21.1', '', 'https://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(25, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.9.16.1', '', 'https://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(26, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(27, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(28, 2, 0, 'French, Canada', '', 'pkg_fr-CA', 'package', '', 0, '3.6.5.1', '', 'https://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(29, 2, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/gl-ES_details.xml', '', ''),
(30, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '3.10.3.2', '', 'https://update.joomla.org/language/details3/ka-GE_details.xml', '', ''),
(31, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(32, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/de-AT_details.xml', '', ''),
(33, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/de-LI_details.xml', '', ''),
(34, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/de-LU_details.xml', '', ''),
(35, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/de-CH_details.xml', '', ''),
(36, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(37, 2, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.2', '', 'https://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(38, 2, 0, 'Hindi, India', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.2', '', 'https://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(39, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.10.1.1', '', 'https://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(40, 2, 0, 'Indonesian, Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.6.2.1', '', 'https://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(41, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '3.8.13.1', '', 'https://update.joomla.org/language/details3/ga-IE_details.xml', '', ''),
(42, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(43, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(44, 2, 0, 'Kazakh', '', 'pkg_kk-KZ)', 'package', '', 0, '3.9.23.1', '', 'https://update.joomla.org/language/details3/kk-KZ)_details.xml', '', ''),
(45, 2, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/km-KH_details.xml', '', ''),
(46, 2, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.8.9.1', '', 'https://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(47, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.9.25.2', '', 'https://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(48, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '3.9.16.1', '', 'https://update.joomla.org/language/details3/lt-LT_details.xml', '', ''),
(49, 2, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.6.5.1', '', 'https://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(50, 2, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.4.1.2', '', 'https://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(51, 2, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(52, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '3.10.0.1', '', 'https://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(53, 2, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.2.1', '', 'https://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(54, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(55, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(56, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.9.21.1', '', 'https://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(57, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '3.9.29.2', '', 'https://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(58, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.10.1.1', '', 'https://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(60, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.10.2.1', '', 'https://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(61, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.10.2.1', '', 'https://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(62, 2, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.2', '', 'https://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(63, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(64, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/sl-SI_details.xml', '', ''),
(65, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(66, 2, 0, 'Spanish, Colombia', '', 'pkg_es-CO', 'package', '', 0, '3.9.15.1', '', 'https://update.joomla.org/language/details3/es-CO_details.xml', '', ''),
(67, 2, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.10.3.3', '', 'https://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(68, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(69, 2, 0, 'Syriac, East', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.5.1', '', 'https://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(70, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(71, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(72, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.9.28.1', '', 'https://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(73, 2, 0, 'Turkmen', '', 'pkg_tk-TM', 'package', '', 0, '3.5.0.2', '', 'https://update.joomla.org/language/details3/tk-TM_details.xml', '', ''),
(74, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.10.2.1', '', 'https://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(75, 2, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.7.5.2', '', 'https://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(76, 2, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.2', '', 'https://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(77, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.10.3.1', '', 'https://update.joomla.org/language/details3/cy-GB_details.xml', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_update_sites`
--

CREATE TABLE IF NOT EXISTS `fd_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Дамп данных таблицы `fd_update_sites`
--

INSERT INTO `fd_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1636866436, ''),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 1636866416, ''),
(3, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1636866445, ''),
(4, 'YOOtheme', 'extension', 'https://yootheme.com/api/update/yootheme_j33.xml', 1, 0, ''),
(5, 'YOOtheme Installer', 'extension', 'http://yootheme.com/api/update/installer_yootheme_j33.xml', 1, 0, ''),
(6, 'PLG_INSTALLER_ZOOLANDERS', 'extension', 'http://static.zoolanders.com/updates/plg_installer_zoolanders.xml', 1, 0, ''),
(7, 'Essentials YOOtheme Pro', 'extension', 'http://static.zoolanders.com/updates/yooessentials-joomla-premium.xml', 1, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `fd_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Дамп данных таблицы `fd_update_sites_extensions`
--

INSERT INTO `fd_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 802),
(2, 10002),
(3, 28),
(4, 10003),
(4, 10004),
(4, 10006),
(4, 10007),
(4, 10008),
(5, 10005),
(6, 10010),
(7, 10009);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_usergroups`
--

CREATE TABLE IF NOT EXISTS `fd_usergroups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_usergroups`
--

INSERT INTO `fd_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Структура таблицы `fd_users`
--

CREATE TABLE IF NOT EXISTS `fd_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=949 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_users`
--

INSERT INTO `fd_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(948, 'Super User', 'Dimeon', 'support@uniteam.pro', '$2y$10$g0EuTclXrao7FH1BhuqN7.1ucAq0ufHKOCYfowZAvfcvgORvEr7um', 0, 1, '2021-11-14 05:06:52', '2021-11-14 05:07:23', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_user_keys`
--

CREATE TABLE IF NOT EXISTS `fd_user_keys` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_user_notes`
--

CREATE TABLE IF NOT EXISTS `fd_user_notes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `fd_user_profiles`
--

CREATE TABLE IF NOT EXISTS `fd_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Структура таблицы `fd_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `fd_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_user_usergroup_map`
--

INSERT INTO `fd_user_usergroup_map` (`user_id`, `group_id`) VALUES
(948, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_utf8_conversion`
--

CREATE TABLE IF NOT EXISTS `fd_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_utf8_conversion`
--

INSERT INTO `fd_utf8_conversion` (`converted`) VALUES
(5);

-- --------------------------------------------------------

--
-- Структура таблицы `fd_viewlevels`
--

CREATE TABLE IF NOT EXISTS `fd_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fd_viewlevels`
--

INSERT INTO `fd_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
