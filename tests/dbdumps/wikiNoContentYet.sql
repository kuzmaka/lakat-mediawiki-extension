-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: database1
-- Generation Time: Jul 14, 2023 at 03:27 PM
-- Server version: 11.0.2-MariaDB-1:11.0.2+maria~ubu2204
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wiki1`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `actor_user` int(10) UNSIGNED DEFAULT NULL,
  `actor_name` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `actor_user`, `actor_name`) VALUES
(1, 1, 0x41646d696e55736572),
(2, 2, 0x4d6564696157696b692064656661756c74);

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `ar_id` int(10) UNSIGNED NOT NULL,
  `ar_namespace` int(11) NOT NULL DEFAULT 0,
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) UNSIGNED NOT NULL,
  `ar_actor` bigint(20) UNSIGNED NOT NULL,
  `ar_timestamp` binary(14) NOT NULL,
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT 0,
  `ar_rev_id` int(10) UNSIGNED NOT NULL,
  `ar_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ar_len` int(10) UNSIGNED DEFAULT NULL,
  `ar_page_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `bot_passwords`
--

CREATE TABLE `bot_passwords` (
  `bp_user` int(10) UNSIGNED NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT 0,
  `cat_subcats` int(11) NOT NULL DEFAULT 0,
  `cat_files` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `categorylinks`
--

CREATE TABLE `categorylinks` (
  `cl_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page'
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `change_tag`
--

CREATE TABLE `change_tag` (
  `ct_id` int(10) UNSIGNED NOT NULL,
  `ct_rc_id` int(10) UNSIGNED DEFAULT NULL,
  `ct_log_id` int(10) UNSIGNED DEFAULT NULL,
  `ct_rev_id` int(10) UNSIGNED DEFAULT NULL,
  `ct_params` blob DEFAULT NULL,
  `ct_tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `change_tag_def`
--

CREATE TABLE `change_tag_def` (
  `ctd_id` int(10) UNSIGNED NOT NULL,
  `ctd_name` varbinary(255) NOT NULL,
  `ctd_user_defined` tinyint(1) NOT NULL,
  `ctd_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_hash`, `comment_text`, `comment_data`) VALUES
(1, 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `content_size` int(10) UNSIGNED NOT NULL,
  `content_sha1` varbinary(32) NOT NULL,
  `content_model` smallint(5) UNSIGNED NOT NULL,
  `content_address` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`content_id`, `content_size`, `content_sha1`, `content_model`, `content_address`) VALUES
(1, 755, 0x3232767a357a6c7861327a63746577696d61756d3262663164756538686b6c, 1, 0x74743a31);

-- --------------------------------------------------------

--
-- Table structure for table `content_models`
--

CREATE TABLE `content_models` (
  `model_id` int(11) NOT NULL,
  `model_name` varbinary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `content_models`
--

INSERT INTO `content_models` (`model_id`, `model_name`) VALUES
(1, 0x77696b6974657874);

-- --------------------------------------------------------

--
-- Table structure for table `externallinks`
--

CREATE TABLE `externallinks` (
  `el_id` int(10) UNSIGNED NOT NULL,
  `el_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  `el_index_60` varbinary(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `filearchive`
--

CREATE TABLE `filearchive` (
  `fa_id` int(10) UNSIGNED NOT NULL,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted_reason_id` bigint(20) UNSIGNED NOT NULL,
  `fa_size` int(10) UNSIGNED DEFAULT 0,
  `fa_width` int(11) DEFAULT 0,
  `fa_height` int(11) DEFAULT 0,
  `fa_metadata` mediumblob DEFAULT NULL,
  `fa_bits` int(11) DEFAULT 0,
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description_id` bigint(20) UNSIGNED NOT NULL,
  `fa_actor` bigint(20) UNSIGNED NOT NULL,
  `fa_timestamp` binary(14) DEFAULT NULL,
  `fa_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fa_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `img_width` int(11) NOT NULL DEFAULT 0,
  `img_height` int(11) NOT NULL DEFAULT 0,
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT 0,
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description_id` bigint(20) UNSIGNED NOT NULL,
  `img_actor` bigint(20) UNSIGNED NOT NULL,
  `img_timestamp` binary(14) NOT NULL,
  `img_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `imagelinks`
--

CREATE TABLE `imagelinks` (
  `il_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  `il_from_namespace` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `interwiki`
--

CREATE TABLE `interwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `interwiki`
--

INSERT INTO `interwiki` (`iw_prefix`, `iw_url`, `iw_api`, `iw_wikiid`, `iw_local`, `iw_trans`) VALUES
(0x6163726f6e796d, 0x68747470733a2f2f7777772e6163726f6e796d66696e6465722e636f6d2f7e2f7365617263682f61662e617370783f737472696e673d6578616374264163726f6e796d3d2431, '', '', 0, 0),
(0x6164766f6761746f, 0x687474703a2f2f7777772e6164766f6761746f2e6f72672f2431, '', '', 0, 0),
(0x6172786976, 0x68747470733a2f2f7777772e61727869762e6f72672f6162732f2431, '', '', 0, 0),
(0x633266696e64, 0x687474703a2f2f63322e636f6d2f6367692f77696b693f46696e64506167652676616c75653d2431, '', '', 0, 0),
(0x6361636865, 0x68747470733a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d63616368653a2431, '', '', 0, 0),
(0x636f6d6d6f6e73, 0x68747470733a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
(0x64696374696f6e617279, 0x687474703a2f2f7777772e646963742e6f72672f62696e2f446963743f44617461626173653d2a26466f726d3d44696374312653747261746567793d2a2651756572793d2431, '', '', 0, 0),
(0x646f69, 0x68747470733a2f2f64782e646f692e6f72672f2431, '', '', 0, 0),
(0x6472756d636f72707377696b69, 0x687474703a2f2f7777772e6472756d636f72707377696b692e636f6d2f2431, 0x687474703a2f2f6472756d636f72707377696b692e636f6d2f6170692e706870, '', 0, 0),
(0x64776a77696b69, 0x687474703a2f2f7777772e737562657269632e6e65742f6367692d62696e2f64776a2f77696b692e6367693f2431, '', '', 0, 0),
(0x656c69627265, 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f696e6465782e7068702f2431, 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f6170692e706870, '', 0, 0),
(0x656d61637377696b69, 0x68747470733a2f2f7777772e656d61637377696b692e6f72672f656d6163732f2431, '', '', 0, 0),
(0x666f6c646f63, 0x68747470733a2f2f666f6c646f632e6f72672f3f2431, '', '', 0, 0),
(0x666f7877696b69, 0x68747470733a2f2f666f782e77696b69732e636f6d2f77632e646c6c3f57696b697e2431, '', '', 0, 0),
(0x667265656273646d616e, 0x68747470733a2f2f7777772e467265654253442e6f72672f6367692f6d616e2e6367693f6170726f706f733d312671756572793d2431, '', '', 0, 0),
(0x67656e746f6f2d77696b69, 0x687474703a2f2f67656e746f6f2d77696b692e636f6d2f2431, '', '', 0, 0),
(0x676f6f676c65, 0x68747470733a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d2431, '', '', 0, 0),
(0x676f6f676c6567726f757073, 0x68747470733a2f2f67726f7570732e676f6f676c652e636f6d2f67726f7570733f713d2431, '', '', 0, 0),
(0x68616d6d6f6e6477696b69, 0x687474703a2f2f7777772e64616972696b692e6f72672f48616d6d6f6e6457696b692f2431, '', '', 0, 0),
(0x687277696b69, 0x687474703a2f2f7777772e687277696b692e6f72672f77696b692f2431, 0x687474703a2f2f7777772e687277696b692e6f72672f772f6170692e706870, '', 0, 0),
(0x696d6462, 0x687474703a2f2f7777772e696d64622e636f6d2f66696e643f713d24312674743d6f6e, '', '', 0, 0),
(0x6b6d77696b69, 0x68747470733a2f2f6b6d77696b692e77696b697370616365732e636f6d2f2431, '', '', 0, 0),
(0x6c696e757877696b69, 0x687474703a2f2f6c696e757877696b692e64652f2431, '', '', 0, 0),
(0x6c6f6a62616e, 0x68747470733a2f2f6d772e6c6f6a62616e2e6f72672f70617072692f2431, '', '', 0, 0),
(0x6c7177696b69, 0x687474703a2f2f77696b692e6c696e75787175657374696f6e732e6f72672f77696b692f2431, '', '', 0, 0),
(0x6d65617462616c6c, 0x687474703a2f2f6d65617462616c6c77696b692e6f72672f77696b692f2431, '', '', 0, 0),
(0x6d6564696177696b6977696b69, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f772f6170692e706870, '', 0, 0),
(0x6d656d6f7279616c706861, 0x687474703a2f2f656e2e6d656d6f72792d616c7068612e6f72672f77696b692f2431, 0x687474703a2f2f656e2e6d656d6f72792d616c7068612e6f72672f6170692e706870, '', 0, 0),
(0x6d65746177696b69, 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f2431, '', '', 0, 0),
(0x6d65746177696b696d65646961, 0x68747470733a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f6d6574612e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
(0x6d6f7a696c6c6177696b69, 0x68747470733a2f2f77696b692e6d6f7a696c6c612e6f72672f2431, 0x68747470733a2f2f77696b692e6d6f7a696c6c612e6f72672f6170692e706870, '', 0, 0),
(0x6d77, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f772f6170692e706870, '', 0, 0),
(0x6f656973, 0x68747470733a2f2f6f6569732e6f72672f2431, '', '', 0, 0),
(0x6f70656e77696b69, 0x687474703a2f2f6f70656e77696b692e636f6d2f6f772e6173703f2431, '', '', 0, 0),
(0x706d6964, 0x68747470733a2f2f7777772e6e6362692e6e6c6d2e6e69682e676f762f7075626d65642f24313f646f70743d4162737472616374, '', '', 0, 0),
(0x707974686f6e696e666f, 0x68747470733a2f2f77696b692e707974686f6e2e6f72672f6d6f696e2f2431, '', '', 0, 0),
(0x726663, 0x68747470733a2f2f746f6f6c732e696574662e6f72672f68746d6c2f7266632431, '', '', 0, 0),
(0x73323377696b69, 0x687474703a2f2f7332332e6f72672f77696b692f2431, 0x687474703a2f2f7332332e6f72672f772f6170692e706870, '', 0, 0),
(0x73656174746c65776972656c657373, 0x687474703a2f2f73656174746c65776972656c6573732e6e65742f2431, '', '', 0, 0),
(0x73656e736569736c696272617279, 0x68747470733a2f2f73656e736569732e786d702e6e65742f3f2431, '', '', 0, 0),
(0x73686f757477696b69, 0x687474703a2f2f7777772e73686f757477696b692e636f6d2f77696b692f2431, 0x687474703a2f2f7777772e73686f757477696b692e636f6d2f772f6170692e706870, '', 0, 0),
(0x73717565616b, 0x687474703a2f2f77696b692e73717565616b2e6f72672f73717565616b2f2431, '', '', 0, 0),
(0x7468656f7065646961, 0x68747470733a2f2f7777772e7468656f70656469612e636f6d2f2431, '', '', 0, 0),
(0x746d6277, 0x687474703a2f2f7777772e746d62772e6e65742f77696b692f2431, 0x687474703a2f2f746d62772e6e65742f77696b692f6170692e706870, '', 0, 0),
(0x746d6e6574, 0x687474703a2f2f7777772e746563686e6f6d616e69666573746f732e6e65742f3f2431, '', '', 0, 0),
(0x7477696b69, 0x687474703a2f2f7477696b692e6f72672f6367692d62696e2f766965772f2431, '', '', 0, 0),
(0x756e6379636c6f7065646961, 0x68747470733a2f2f656e2e756e6379636c6f70656469612e636f2f77696b692f2431, 0x68747470733a2f2f656e2e756e6379636c6f70656469612e636f2f772f6170692e706870, '', 0, 0),
(0x756e7265616c, 0x68747470733a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f2431, 0x68747470733a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f772f6170692e706870, '', 0, 0),
(0x7573656d6f64, 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f77696b692e706c3f2431, '', '', 0, 0),
(0x77696b69, 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, '', '', 0, 0),
(0x77696b6961, 0x687474703a2f2f7777772e77696b69612e636f6d2f77696b692f2431, '', '', 0, 0),
(0x77696b69626f6f6b73, 0x68747470733a2f2f656e2e77696b69626f6f6b732e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69626f6f6b732e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b6964617461, 0x68747470733a2f2f7777772e77696b69646174612e6f72672f77696b692f2431, 0x68747470733a2f2f7777772e77696b69646174612e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b696631, 0x687474703a2f2f7777772e77696b6966312e6f72672f2431, '', '', 0, 0),
(0x77696b69686f77, 0x68747470733a2f2f7777772e77696b69686f772e636f6d2f2431, 0x68747470733a2f2f7777772e77696b69686f772e636f6d2f6170692e706870, '', 0, 0),
(0x77696b696d65646961, 0x68747470733a2f2f666f756e646174696f6e2e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f666f756e646174696f6e2e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b696e657773, 0x68747470733a2f2f656e2e77696b696e6577732e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b696e6577732e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b696e666f, 0x687474703a2f2f77696b696e666f2e636f2f456e676c6973682f696e6465782e7068702f2431, '', '', 0, 0),
(0x77696b697065646961, 0x68747470733a2f2f656e2e77696b6970656469612e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b6970656469612e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b6971756f7465, 0x68747470733a2f2f656e2e77696b6971756f74652e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b6971756f74652e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b69736f75726365, 0x68747470733a2f2f77696b69736f757263652e6f72672f77696b692f2431, 0x68747470733a2f2f77696b69736f757263652e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b6973706563696573, 0x68747470733a2f2f737065636965732e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f737065636965732e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b6976657273697479, 0x68747470733a2f2f656e2e77696b69766572736974792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69766572736974792e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b69766f79616765, 0x68747470733a2f2f656e2e77696b69766f796167652e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69766f796167652e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b74, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f772f6170692e706870, '', 0, 0),
(0x77696b74696f6e617279, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f772f6170692e706870, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ipblocks`
--

CREATE TABLE `ipblocks` (
  `ipb_id` int(10) UNSIGNED NOT NULL,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipb_by_actor` bigint(20) UNSIGNED NOT NULL,
  `ipb_reason_id` bigint(20) UNSIGNED NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL,
  `ipb_auto` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT 1,
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT 1,
  `ipb_expiry` varbinary(14) NOT NULL,
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT 0,
  `ipb_parent_block_id` int(10) UNSIGNED DEFAULT NULL,
  `ipb_sitewide` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `ipblocks_restrictions`
--

CREATE TABLE `ipblocks_restrictions` (
  `ir_ipb_id` int(10) UNSIGNED NOT NULL,
  `ir_type` tinyint(4) NOT NULL,
  `ir_value` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `ip_changes`
--

CREATE TABLE `ip_changes` (
  `ipc_rev_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ipc_rev_timestamp` binary(14) NOT NULL,
  `ipc_hex` varbinary(35) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `iwlinks`
--

CREATE TABLE `iwlinks` (
  `iwl_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iwl_prefix` varbinary(32) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` binary(14) DEFAULT NULL,
  `job_params` mediumblob NOT NULL,
  `job_random` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `job_attempts` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` binary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_cache`
--

CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(35) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `langlinks`
--

CREATE TABLE `langlinks` (
  `ll_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ll_lang` varbinary(35) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `linktarget`
--

CREATE TABLE `linktarget` (
  `lt_id` bigint(20) UNSIGNED NOT NULL,
  `lt_namespace` int(11) NOT NULL,
  `lt_title` varbinary(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_actor` bigint(20) UNSIGNED NOT NULL,
  `log_namespace` int(11) NOT NULL DEFAULT 0,
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) UNSIGNED DEFAULT NULL,
  `log_comment_id` bigint(20) UNSIGNED NOT NULL,
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `logging`
--

INSERT INTO `logging` (`log_id`, `log_type`, `log_action`, `log_timestamp`, `log_actor`, `log_namespace`, `log_title`, `log_page`, `log_comment_id`, `log_params`, `log_deleted`) VALUES
(1, 0x637265617465, 0x637265617465, 0x3230323330373134313532303139, 2, 0, 0x4d61696e5f50616765, 1, 1, 0x613a313a7b733a31373a226173736f6369617465645f7265765f6964223b693a313b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_search`
--

CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `log_search`
--

INSERT INTO `log_search` (`ls_field`, `ls_value`, `ls_log_id`) VALUES
(0x6173736f6369617465645f7265765f6964, 0x31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_deps`
--

CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `objectcache`
--

CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob DEFAULT NULL,
  `exptime` binary(14) NOT NULL,
  `modtoken` varbinary(17) NOT NULL DEFAULT '00000000000000000',
  `flags` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `oldimage`
--

CREATE TABLE `oldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `oi_width` int(11) NOT NULL DEFAULT 0,
  `oi_height` int(11) NOT NULL DEFAULT 0,
  `oi_bits` int(11) NOT NULL DEFAULT 0,
  `oi_description_id` bigint(20) UNSIGNED NOT NULL,
  `oi_actor` bigint(20) UNSIGNED NOT NULL,
  `oi_timestamp` binary(14) NOT NULL,
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `oi_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(10) UNSIGNED NOT NULL,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_is_redirect` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `page_is_new` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `page_random` double UNSIGNED NOT NULL,
  `page_touched` binary(14) NOT NULL,
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) UNSIGNED NOT NULL,
  `page_len` int(10) UNSIGNED NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `page_namespace`, `page_title`, `page_is_redirect`, `page_is_new`, `page_random`, `page_touched`, `page_links_updated`, `page_latest`, `page_len`, `page_content_model`, `page_lang`) VALUES
(1, 0, 0x4d61696e5f50616765, 0, 1, 0.76223868006, 0x3230323330373134313532303139, NULL, 1, 755, 0x77696b6974657874, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pagelinks`
--

CREATE TABLE `pagelinks` (
  `pl_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pl_namespace` int(11) NOT NULL DEFAULT 0,
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  `pl_from_namespace` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `page_props`
--

CREATE TABLE `page_props` (
  `pp_page` int(10) UNSIGNED NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `page_restrictions`
--

CREATE TABLE `page_restrictions` (
  `pr_id` int(10) UNSIGNED NOT NULL,
  `pr_page` int(10) UNSIGNED NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `protected_titles`
--

CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) UNSIGNED NOT NULL,
  `pt_reason_id` bigint(20) UNSIGNED NOT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL,
  `pt_create_perm` varbinary(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `querycache`
--

CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `qc_namespace` int(11) NOT NULL DEFAULT 0,
  `qc_title` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `querycachetwo`
--

CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `qcc_namespace` int(11) NOT NULL DEFAULT 0,
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT 0,
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `querycache_info`
--

CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000'
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `recentchanges`
--

CREATE TABLE `recentchanges` (
  `rc_id` int(10) UNSIGNED NOT NULL,
  `rc_timestamp` binary(14) NOT NULL,
  `rc_actor` bigint(20) UNSIGNED NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT 0,
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) UNSIGNED NOT NULL,
  `rc_minor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_bot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_new` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_cur_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rc_this_oldid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rc_last_oldid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rc_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rc_logid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `redirect`
--

CREATE TABLE `redirect` (
  `rd_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rd_namespace` int(11) NOT NULL DEFAULT 0,
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `revision`
--

CREATE TABLE `revision` (
  `rev_id` int(10) UNSIGNED NOT NULL,
  `rev_page` int(10) UNSIGNED NOT NULL,
  `rev_comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rev_actor` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `rev_timestamp` binary(14) NOT NULL,
  `rev_minor_edit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rev_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rev_len` int(10) UNSIGNED DEFAULT NULL,
  `rev_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `revision`
--

INSERT INTO `revision` (`rev_id`, `rev_page`, `rev_comment_id`, `rev_actor`, `rev_timestamp`, `rev_minor_edit`, `rev_deleted`, `rev_len`, `rev_parent_id`, `rev_sha1`) VALUES
(1, 1, 0, 2, 0x3230323330373134313532303139, 0, 0, 755, 0, 0x3232767a357a6c7861327a63746577696d61756d3262663164756538686b6c);

-- --------------------------------------------------------

--
-- Table structure for table `revision_comment_temp`
--

CREATE TABLE `revision_comment_temp` (
  `revcomment_rev` int(10) UNSIGNED NOT NULL,
  `revcomment_comment_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `revision_comment_temp`
--

INSERT INTO `revision_comment_temp` (`revcomment_rev`, `revcomment_comment_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `si_page` int(10) UNSIGNED NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `site_id` int(10) UNSIGNED NOT NULL,
  `site_global_key` varbinary(64) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(35) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `site_identifiers`
--

CREATE TABLE `site_identifiers` (
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  `si_site` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `site_stats`
--

CREATE TABLE `site_stats` (
  `ss_row_id` int(10) UNSIGNED NOT NULL,
  `ss_total_edits` bigint(20) UNSIGNED DEFAULT NULL,
  `ss_good_articles` bigint(20) UNSIGNED DEFAULT NULL,
  `ss_total_pages` bigint(20) UNSIGNED DEFAULT NULL,
  `ss_users` bigint(20) UNSIGNED DEFAULT NULL,
  `ss_active_users` bigint(20) UNSIGNED DEFAULT NULL,
  `ss_images` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `site_stats`
--

INSERT INTO `site_stats` (`ss_row_id`, `ss_total_edits`, `ss_good_articles`, `ss_total_pages`, `ss_users`, `ss_active_users`, `ss_images`) VALUES
(1, 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `slot_revision_id` bigint(20) UNSIGNED NOT NULL,
  `slot_role_id` smallint(5) UNSIGNED NOT NULL,
  `slot_content_id` bigint(20) UNSIGNED NOT NULL,
  `slot_origin` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`slot_revision_id`, `slot_role_id`, `slot_content_id`, `slot_origin`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `slot_roles`
--

CREATE TABLE `slot_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varbinary(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `slot_roles`
--

INSERT INTO `slot_roles` (`role_id`, `role_name`) VALUES
(1, 0x6d61696e);

-- --------------------------------------------------------

--
-- Table structure for table `templatelinks`
--

CREATE TABLE `templatelinks` (
  `tl_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tl_target_id` bigint(20) UNSIGNED NOT NULL,
  `tl_from_namespace` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `text`
--

CREATE TABLE `text` (
  `old_id` int(10) UNSIGNED NOT NULL,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `text`
--

INSERT INTO `text` (`old_id`, `old_text`, `old_flags`) VALUES
(1, 0x3c7374726f6e673e4d6564696157696b6920686173206265656e20696e7374616c6c65642e3c2f7374726f6e673e0a0a436f6e73756c7420746865205b68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f48656c703a436f6e74656e7473205573657227732047756964655d20666f7220696e666f726d6174696f6e206f6e207573696e67207468652077696b6920736f6674776172652e0a0a3d3d2047657474696e672073746172746564203d3d0a2a205b68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e677320436f6e66696775726174696f6e2073657474696e6773206c6973745d0a2a205b68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a464151204d6564696157696b69204641515d0a2a205b68747470733a2f2f6c697374732e77696b696d656469612e6f72672f706f73746f726975732f6c697374732f6d6564696177696b692d616e6e6f756e63652e6c697374732e77696b696d656469612e6f72672f204d6564696157696b692072656c65617365206d61696c696e67206c6973745d0a2a205b68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4c6f63616c69736174696f6e235472616e736c6174696f6e5f7265736f7572636573204c6f63616c697365204d6564696157696b6920666f7220796f7572206c616e67756167655d0a2a205b68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6d626174696e675f7370616d204c6561726e20686f7720746f20636f6d626174207370616d206f6e20796f75722077696b695d, 0x7574662d38);

-- --------------------------------------------------------

--
-- Table structure for table `updatelog`
--

CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `updatelog`
--

INSERT INTO `updatelog` (`ul_key`, `ul_value`) VALUES
(0x66696c65617263686976652d66615f6d616a6f725f6d696d652d70617463682d66615f6d616a6f725f6d696d652d6368656d6963616c2e73716c, NULL),
(0x696d6167652d696d675f6d616a6f725f6d696d652d70617463682d696d675f6d616a6f725f6d696d652d6368656d6963616c2e73716c, NULL),
(0x6f6c64696d6167652d6f695f6d616a6f725f6d696d652d70617463682d6f695f6d616a6f725f6d696d652d6368656d6963616c2e73716c, NULL),
(0x757365725f666f726d65725f67726f7570732d7566675f67726f75702d70617463682d7566675f67726f75702d6c656e6774682d696e6372656173652d3235352e73716c, NULL),
(0x757365725f67726f7570732d75675f67726f75702d70617463682d75675f67726f75702d6c656e6774682d696e6372656173652d3235352e73716c, NULL),
(0x757365725f70726f706572746965732d75705f70726f70657274792d70617463682d75705f70726f70657274792e73716c, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uploadstash`
--

CREATE TABLE `uploadstash` (
  `us_id` int(10) UNSIGNED NOT NULL,
  `us_user` int(10) UNSIGNED NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` binary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) UNSIGNED DEFAULT NULL,
  `us_props` blob DEFAULT NULL,
  `us_size` int(10) UNSIGNED NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) UNSIGNED DEFAULT NULL,
  `us_image_height` int(10) UNSIGNED DEFAULT NULL,
  `us_image_bits` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL,
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(10) UNSIGNED DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES
(1, 0x41646d696e55736572, '', 0x3a70626b6466323a7368613531323a33303030303a36343a497a474748646869596535727657345a6979513147413d3d3a7939505579744a557547676f44795a7555356f4f4d77446c31666862395678724652366842475837576e4b61356c6976724355774c4d6530414457447543784d456c76435959614354753932677075334d382f4b6c673d3d, '', NULL, '', 0x3230323330373134313532303230, 0x6331643538633861373931373764393031646237653161373563353231616530, NULL, 0x0000000000000000000000000000000000000000000000000000000000000000, NULL, 0x3230323330373134313532303139, 0, NULL),
(2, 0x4d6564696157696b692064656661756c74, '', '', '', NULL, '', 0x3230323330373134313532303139, 0x2a2a2a20494e56414c4944202a2a2a0000000000000000000000000000000000, NULL, NULL, NULL, 0x3230323330373134313532303139, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_autocreate_serial`
--

CREATE TABLE `user_autocreate_serial` (
  `uas_shard` int(10) UNSIGNED NOT NULL,
  `uas_value` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user_former_groups`
--

CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ufg_group` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `ug_user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`ug_user`, `ug_group`, `ug_expiry`) VALUES
(1, 0x62757265617563726174, NULL),
(1, 0x696e746572666163652d61646d696e, NULL),
(1, 0x7379736f70, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_newtalk`
--

CREATE TABLE `user_newtalk` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` binary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user_properties`
--

CREATE TABLE `user_properties` (
  `up_user` int(10) UNSIGNED NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `wl_id` int(10) UNSIGNED NOT NULL,
  `wl_user` int(10) UNSIGNED NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT 0,
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` binary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `watchlist_expiry`
--

CREATE TABLE `watchlist_expiry` (
  `we_item` int(10) UNSIGNED NOT NULL,
  `we_expiry` binary(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=binary;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`),
  ADD UNIQUE KEY `actor_name` (`actor_name`),
  ADD UNIQUE KEY `actor_user` (`actor_user`);

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`ar_id`),
  ADD UNIQUE KEY `ar_revid_uniq` (`ar_rev_id`),
  ADD KEY `ar_name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  ADD KEY `ar_actor_timestamp` (`ar_actor`,`ar_timestamp`);

--
-- Indexes for table `bot_passwords`
--
ALTER TABLE `bot_passwords`
  ADD PRIMARY KEY (`bp_user`,`bp_app_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_title` (`cat_title`),
  ADD KEY `cat_pages` (`cat_pages`);

--
-- Indexes for table `categorylinks`
--
ALTER TABLE `categorylinks`
  ADD PRIMARY KEY (`cl_from`,`cl_to`),
  ADD KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  ADD KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  ADD KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`);

--
-- Indexes for table `change_tag`
--
ALTER TABLE `change_tag`
  ADD PRIMARY KEY (`ct_id`),
  ADD UNIQUE KEY `ct_rc_tag_id` (`ct_rc_id`,`ct_tag_id`),
  ADD UNIQUE KEY `ct_log_tag_id` (`ct_log_id`,`ct_tag_id`),
  ADD UNIQUE KEY `ct_rev_tag_id` (`ct_rev_id`,`ct_tag_id`),
  ADD KEY `ct_tag_id_id` (`ct_tag_id`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`);

--
-- Indexes for table `change_tag_def`
--
ALTER TABLE `change_tag_def`
  ADD PRIMARY KEY (`ctd_id`),
  ADD UNIQUE KEY `ctd_name` (`ctd_name`),
  ADD KEY `ctd_count` (`ctd_count`),
  ADD KEY `ctd_user_defined` (`ctd_user_defined`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_hash` (`comment_hash`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `content_models`
--
ALTER TABLE `content_models`
  ADD PRIMARY KEY (`model_id`),
  ADD UNIQUE KEY `model_name` (`model_name`);

--
-- Indexes for table `externallinks`
--
ALTER TABLE `externallinks`
  ADD PRIMARY KEY (`el_id`),
  ADD KEY `el_from` (`el_from`,`el_to`(40)),
  ADD KEY `el_to` (`el_to`(60),`el_from`),
  ADD KEY `el_index` (`el_index`(60)),
  ADD KEY `el_index_60` (`el_index_60`,`el_id`),
  ADD KEY `el_from_index_60` (`el_from`,`el_index_60`,`el_id`);

--
-- Indexes for table `filearchive`
--
ALTER TABLE `filearchive`
  ADD PRIMARY KEY (`fa_id`),
  ADD KEY `fa_name` (`fa_name`,`fa_timestamp`),
  ADD KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  ADD KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  ADD KEY `fa_actor_timestamp` (`fa_actor`,`fa_timestamp`),
  ADD KEY `fa_sha1` (`fa_sha1`(10));

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`img_name`),
  ADD KEY `img_actor_timestamp` (`img_actor`,`img_timestamp`),
  ADD KEY `img_size` (`img_size`),
  ADD KEY `img_timestamp` (`img_timestamp`),
  ADD KEY `img_sha1` (`img_sha1`(10)),
  ADD KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`);

--
-- Indexes for table `imagelinks`
--
ALTER TABLE `imagelinks`
  ADD PRIMARY KEY (`il_from`,`il_to`),
  ADD KEY `il_to` (`il_to`,`il_from`),
  ADD KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`);

--
-- Indexes for table `interwiki`
--
ALTER TABLE `interwiki`
  ADD PRIMARY KEY (`iw_prefix`);

--
-- Indexes for table `ipblocks`
--
ALTER TABLE `ipblocks`
  ADD PRIMARY KEY (`ipb_id`),
  ADD UNIQUE KEY `ipb_address_unique` (`ipb_address`(255),`ipb_user`,`ipb_auto`),
  ADD KEY `ipb_user` (`ipb_user`),
  ADD KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  ADD KEY `ipb_timestamp` (`ipb_timestamp`),
  ADD KEY `ipb_expiry` (`ipb_expiry`),
  ADD KEY `ipb_parent_block_id` (`ipb_parent_block_id`);

--
-- Indexes for table `ipblocks_restrictions`
--
ALTER TABLE `ipblocks_restrictions`
  ADD PRIMARY KEY (`ir_ipb_id`,`ir_type`,`ir_value`),
  ADD KEY `ir_type_value` (`ir_type`,`ir_value`);

--
-- Indexes for table `ip_changes`
--
ALTER TABLE `ip_changes`
  ADD PRIMARY KEY (`ipc_rev_id`),
  ADD KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  ADD KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`);

--
-- Indexes for table `iwlinks`
--
ALTER TABLE `iwlinks`
  ADD PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  ADD KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  ADD KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `job_sha1` (`job_sha1`),
  ADD KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  ADD KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  ADD KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  ADD KEY `job_timestamp` (`job_timestamp`);

--
-- Indexes for table `l10n_cache`
--
ALTER TABLE `l10n_cache`
  ADD PRIMARY KEY (`lc_lang`,`lc_key`);

--
-- Indexes for table `langlinks`
--
ALTER TABLE `langlinks`
  ADD PRIMARY KEY (`ll_from`,`ll_lang`),
  ADD KEY `ll_lang` (`ll_lang`,`ll_title`);

--
-- Indexes for table `linktarget`
--
ALTER TABLE `linktarget`
  ADD PRIMARY KEY (`lt_id`),
  ADD UNIQUE KEY `lt_namespace_title` (`lt_namespace`,`lt_title`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_type_time` (`log_type`,`log_timestamp`),
  ADD KEY `log_actor_time` (`log_actor`,`log_timestamp`),
  ADD KEY `log_page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  ADD KEY `log_times` (`log_timestamp`),
  ADD KEY `log_actor_type_time` (`log_actor`,`log_type`,`log_timestamp`),
  ADD KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  ADD KEY `log_type_action` (`log_type`,`log_action`,`log_timestamp`);

--
-- Indexes for table `log_search`
--
ALTER TABLE `log_search`
  ADD PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  ADD KEY `ls_log_id` (`ls_log_id`);

--
-- Indexes for table `module_deps`
--
ALTER TABLE `module_deps`
  ADD PRIMARY KEY (`md_module`,`md_skin`);

--
-- Indexes for table `objectcache`
--
ALTER TABLE `objectcache`
  ADD PRIMARY KEY (`keyname`),
  ADD KEY `exptime` (`exptime`);

--
-- Indexes for table `oldimage`
--
ALTER TABLE `oldimage`
  ADD KEY `oi_actor_timestamp` (`oi_actor`,`oi_timestamp`),
  ADD KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  ADD KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  ADD KEY `oi_sha1` (`oi_sha1`(10)),
  ADD KEY `oi_timestamp` (`oi_timestamp`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_name_title` (`page_namespace`,`page_title`),
  ADD KEY `page_random` (`page_random`),
  ADD KEY `page_len` (`page_len`),
  ADD KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`);

--
-- Indexes for table `pagelinks`
--
ALTER TABLE `pagelinks`
  ADD PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  ADD KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  ADD KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`);

--
-- Indexes for table `page_props`
--
ALTER TABLE `page_props`
  ADD PRIMARY KEY (`pp_page`,`pp_propname`),
  ADD UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  ADD UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`);

--
-- Indexes for table `page_restrictions`
--
ALTER TABLE `page_restrictions`
  ADD PRIMARY KEY (`pr_id`),
  ADD UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  ADD KEY `pr_typelevel` (`pr_type`,`pr_level`),
  ADD KEY `pr_level` (`pr_level`),
  ADD KEY `pr_cascade` (`pr_cascade`);

--
-- Indexes for table `protected_titles`
--
ALTER TABLE `protected_titles`
  ADD PRIMARY KEY (`pt_namespace`,`pt_title`),
  ADD KEY `pt_timestamp` (`pt_timestamp`);

--
-- Indexes for table `querycache`
--
ALTER TABLE `querycache`
  ADD KEY `qc_type` (`qc_type`,`qc_value`);

--
-- Indexes for table `querycachetwo`
--
ALTER TABLE `querycachetwo`
  ADD KEY `qcc_type` (`qcc_type`,`qcc_value`),
  ADD KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  ADD KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`);

--
-- Indexes for table `querycache_info`
--
ALTER TABLE `querycache_info`
  ADD PRIMARY KEY (`qci_type`);

--
-- Indexes for table `recentchanges`
--
ALTER TABLE `recentchanges`
  ADD PRIMARY KEY (`rc_id`),
  ADD KEY `rc_timestamp` (`rc_timestamp`),
  ADD KEY `rc_namespace_title_timestamp` (`rc_namespace`,`rc_title`,`rc_timestamp`),
  ADD KEY `rc_cur_id` (`rc_cur_id`),
  ADD KEY `rc_new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  ADD KEY `rc_ip` (`rc_ip`),
  ADD KEY `rc_ns_actor` (`rc_namespace`,`rc_actor`),
  ADD KEY `rc_actor` (`rc_actor`,`rc_timestamp`),
  ADD KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`),
  ADD KEY `rc_this_oldid` (`rc_this_oldid`);

--
-- Indexes for table `redirect`
--
ALTER TABLE `redirect`
  ADD PRIMARY KEY (`rd_from`),
  ADD KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`);

--
-- Indexes for table `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`rev_id`),
  ADD KEY `rev_timestamp` (`rev_timestamp`),
  ADD KEY `rev_page_timestamp` (`rev_page`,`rev_timestamp`),
  ADD KEY `rev_actor_timestamp` (`rev_actor`,`rev_timestamp`,`rev_id`),
  ADD KEY `rev_page_actor_timestamp` (`rev_page`,`rev_actor`,`rev_timestamp`);

--
-- Indexes for table `revision_comment_temp`
--
ALTER TABLE `revision_comment_temp`
  ADD PRIMARY KEY (`revcomment_rev`,`revcomment_comment_id`),
  ADD UNIQUE KEY `revcomment_rev` (`revcomment_rev`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD UNIQUE KEY `si_page` (`si_page`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `si_title` (`si_title`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `si_text` (`si_text`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`site_id`),
  ADD UNIQUE KEY `site_global_key` (`site_global_key`),
  ADD KEY `site_type` (`site_type`),
  ADD KEY `site_group` (`site_group`),
  ADD KEY `site_source` (`site_source`),
  ADD KEY `site_language` (`site_language`),
  ADD KEY `site_protocol` (`site_protocol`),
  ADD KEY `site_domain` (`site_domain`),
  ADD KEY `site_forward` (`site_forward`);

--
-- Indexes for table `site_identifiers`
--
ALTER TABLE `site_identifiers`
  ADD PRIMARY KEY (`si_type`,`si_key`),
  ADD KEY `si_site` (`si_site`),
  ADD KEY `si_key` (`si_key`);

--
-- Indexes for table `site_stats`
--
ALTER TABLE `site_stats`
  ADD PRIMARY KEY (`ss_row_id`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`slot_revision_id`,`slot_role_id`),
  ADD KEY `slot_revision_origin_role` (`slot_revision_id`,`slot_origin`,`slot_role_id`);

--
-- Indexes for table `slot_roles`
--
ALTER TABLE `slot_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `templatelinks`
--
ALTER TABLE `templatelinks`
  ADD PRIMARY KEY (`tl_from`,`tl_target_id`),
  ADD KEY `tl_target_id` (`tl_target_id`,`tl_from`),
  ADD KEY `tl_backlinks_namespace_target_id` (`tl_from_namespace`,`tl_target_id`,`tl_from`);

--
-- Indexes for table `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`old_id`);

--
-- Indexes for table `updatelog`
--
ALTER TABLE `updatelog`
  ADD PRIMARY KEY (`ul_key`);

--
-- Indexes for table `uploadstash`
--
ALTER TABLE `uploadstash`
  ADD PRIMARY KEY (`us_id`),
  ADD UNIQUE KEY `us_key` (`us_key`),
  ADD KEY `us_user` (`us_user`),
  ADD KEY `us_timestamp` (`us_timestamp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_email_token` (`user_email_token`),
  ADD KEY `user_email` (`user_email`(50));

--
-- Indexes for table `user_autocreate_serial`
--
ALTER TABLE `user_autocreate_serial`
  ADD PRIMARY KEY (`uas_shard`);

--
-- Indexes for table `user_former_groups`
--
ALTER TABLE `user_former_groups`
  ADD PRIMARY KEY (`ufg_user`,`ufg_group`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`ug_user`,`ug_group`),
  ADD KEY `ug_group` (`ug_group`),
  ADD KEY `ug_expiry` (`ug_expiry`);

--
-- Indexes for table `user_newtalk`
--
ALTER TABLE `user_newtalk`
  ADD KEY `un_user_id` (`user_id`),
  ADD KEY `un_user_ip` (`user_ip`);

--
-- Indexes for table `user_properties`
--
ALTER TABLE `user_properties`
  ADD PRIMARY KEY (`up_user`,`up_property`),
  ADD KEY `up_property` (`up_property`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`wl_id`),
  ADD UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  ADD KEY `wl_namespace_title` (`wl_namespace`,`wl_title`),
  ADD KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`);

--
-- Indexes for table `watchlist_expiry`
--
ALTER TABLE `watchlist_expiry`
  ADD PRIMARY KEY (`we_item`),
  ADD KEY `we_expiry` (`we_expiry`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `actor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tag`
--
ALTER TABLE `change_tag`
  MODIFY `ct_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `change_tag_def`
--
ALTER TABLE `change_tag_def`
  MODIFY `ctd_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `content_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content_models`
--
ALTER TABLE `content_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `externallinks`
--
ALTER TABLE `externallinks`
  MODIFY `el_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filearchive`
--
ALTER TABLE `filearchive`
  MODIFY `fa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipblocks`
--
ALTER TABLE `ipblocks`
  MODIFY `ipb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linktarget`
--
ALTER TABLE `linktarget`
  MODIFY `lt_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_restrictions`
--
ALTER TABLE `page_restrictions`
  MODIFY `pr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recentchanges`
--
ALTER TABLE `recentchanges`
  MODIFY `rc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revision`
--
ALTER TABLE `revision`
  MODIFY `rev_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `site_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slot_roles`
--
ALTER TABLE `slot_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `text`
--
ALTER TABLE `text`
  MODIFY `old_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploadstash`
--
ALTER TABLE `uploadstash`
  MODIFY `us_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `wl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
