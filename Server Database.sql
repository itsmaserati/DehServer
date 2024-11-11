-- --------------------------------------------------------
-- Host:                         143.110.151.6
-- Server version:               10.6.18-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for s1_origenv2qb
CREATE DATABASE IF NOT EXISTS `s1_origenv2qb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `s1_origenv2qb`;

-- Dumping structure for table s1_origenv2qb.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `identifier` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` longtext NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `transactions` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.accounts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.apartments: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.bank_statements: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.bans: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.crypto: ~0 rows (approximately)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 2101, '[{"PreviousWorth":2100,"NewWorth":2101},{"PreviousWorth":2100,"NewWorth":2101},{"PreviousWorth":2100,"NewWorth":2101},{"PreviousWorth":2101,"NewWorth":2101}]');

-- Dumping structure for table s1_origenv2qb.cryptominers
CREATE TABLE IF NOT EXISTS `cryptominers` (
  `citizenid` varchar(50) NOT NULL,
  `card` varchar(50) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.cryptominers: ~2 rows (approximately)
INSERT INTO `cryptominers` (`citizenid`, `card`, `balance`) VALUES
	('IIE26687', 'shitgpu', 7.8),
	('ZEN90470', '4090gpu', 0);

-- Dumping structure for table s1_origenv2qb.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.darkchat_messages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.dealers: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.debux_petshop
CREATE TABLE IF NOT EXISTS `debux_petshop` (
  `identifier` varchar(50) DEFAULT NULL,
  `pet_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.debux_petshop: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.elixir_clothing
CREATE TABLE IF NOT EXISTS `elixir_clothing` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT 0,
  `model` varchar(50) NOT NULL DEFAULT '',
  `drawables_texture` text NOT NULL,
  `props_texture` text NOT NULL,
  `hairColor` text NOT NULL,
  `fadeLayer` text DEFAULT '0',
  `customHeadModel` text NOT NULL DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.elixir_clothing: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.elixir_head_clothing
CREATE TABLE IF NOT EXISTS `elixir_head_clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `head_blend` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `head_overlays` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fade` longtext DEFAULT '""',
  `eye_color` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `head_blend` CHECK (json_valid(`head_blend`)),
  CONSTRAINT `head_features` CHECK (json_valid(`head_features`)),
  CONSTRAINT `head_overlays` CHECK (json_valid(`head_overlays`))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.elixir_head_clothing: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.elixir_outfits
CREATE TABLE IF NOT EXISTS `elixir_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `drawables_texture` text DEFAULT NULL,
  `props_texture` text DEFAULT NULL,
  `hairColor` text DEFAULT NULL,
  `fadeLayer` text DEFAULT NULL,
  `customHeadModel` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_cid_slot` (`cid`,`slot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.elixir_outfits: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.evidence_storage
CREATE TABLE IF NOT EXISTS `evidence_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.evidence_storage: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.fuel_stations: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.gfx_racing
CREATE TABLE IF NOT EXISTS `gfx_racing` (
  `identifier` varchar(50) DEFAULT NULL,
  `routes` longtext DEFAULT NULL,
  `racehistory` longtext DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `lose` int(11) DEFAULT NULL,
  `favouritecar` longtext DEFAULT NULL,
  `distance` bigint(20) DEFAULT NULL,
  `charname` varchar(50) DEFAULT NULL,
  `incomingrace` int(11) DEFAULT NULL,
  `lastrace` varchar(50) DEFAULT NULL,
  `playerphoto` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.gfx_racing: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.gloveboxitems: ~4 rows (approximately)
INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(4, '1ZP178LV', '[{"weight":2000,"unique":true,"name":"tunerlaptop","type":"item","useable":true,"info":{"quality":100},"label":"Tunerchip","amount":1,"slot":1,"created":1727494134,"image":"tunerchip.png"},{"weight":1000,"unique":false,"name":"weed_brick","type":"item","useable":false,"info":{"quality":100},"label":"Weed Brick","amount":1,"created":1727545412,"slot":2,"image":"weed_brick.png"}]'),
	(1, '2TN960DW', '[]'),
	(25, '2ZH577RH', '[]'),
	(5, '9AO721AY', '[]'),
	(29, 'YABUT', '[]');

-- Dumping structure for table s1_origenv2qb.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.houselocations: ~2 rows (approximately)
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `tier`, `garage`) VALUES
	(3, 'south rockford dr1', 'South Rockford Dr 1', '{"cam":{"yaw":-10.0,"z":2.24340415000915,"x":-900.8446044921875,"h":122.48832702636719,"y":-982.3162231445313},"enter":{"z":2.24340415000915,"h":122.48832702636719,"x":-900.8446044921875,"y":-982.3162231445313}}', 1, 1, 3, NULL),
	(4, 'jamestown st1', 'Jamestown St 1', '{"cam":{"h":268.80029296875,"yaw":-10.0,"x":512.0733032226563,"z":28.91946792602539,"y":-1790.68115234375},"enter":{"h":268.80029296875,"x":512.0733032226563,"z":28.91946792602539,"y":-1790.68115234375}}', 0, 6, 3, NULL);

-- Dumping structure for table s1_origenv2qb.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.house_plants: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.instagram_account: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.instagram_followers: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.instagram_posts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table s1_origenv2qb.instagram_stories: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.insta_stories: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.kloud_delivery
CREATE TABLE IF NOT EXISTS `kloud_delivery` (
  `job` varchar(55) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.kloud_delivery: ~0 rows (approximately)
INSERT INTO `kloud_delivery` (`job`, `stock`) VALUES
	('burgershot', 8);

-- Dumping structure for table s1_origenv2qb.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.lapraces: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.management_funds: ~14 rows (approximately)
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 6653, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang'),
	(13, 'teapot', 121623, 'boss'),
	(14, 'burgershot', 1010, 'boss');

-- Dumping structure for table s1_origenv2qb.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_config
CREATE TABLE IF NOT EXISTS `mdt_config` (
  `citizenid` varchar(10) NOT NULL,
  `theme` int(11) NOT NULL,
  `sidebar` int(11) NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_config: ~2 rows (approximately)
INSERT INTO `mdt_config` (`citizenid`, `theme`, `sidebar`) VALUES
	('ZEN90470', 1, 1),
	('NRD24295', 1, 1),
	('PCT54046', 1, 1);

-- Dumping structure for table s1_origenv2qb.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_data: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_evidences
CREATE TABLE IF NOT EXISTS `mdt_evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_evidences: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `evidences` text NOT NULL,
  `vehicles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`vehicles`)),
  `criminals` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_incidents: ~2 rows (approximately)
INSERT INTO `mdt_incidents` (`id`, `title`, `description`, `persons`, `officers`, `evidences`, `vehicles`, `criminals`, `date`, `createdby`) VALUES
	(6, 'Test', '123', '[{"citizenid":"ZEN90470","name":"Origen V2"}]', '[{"citizenid":"ZEN90470","name":"[1] Origen V2"}]', '[]', '[]', '[]', '2024-06-21T22:07:40.353Z', 'ZEN90470'),
	(7, 'ergerg', 'rgrgregr', '[{"name":"Billy Roberts","citizenid":"OVS51065"}]', '[]', '[]', '[]', '[]', '2024-09-22T02:44:28.650Z', 'NRD24295');

-- Dumping structure for table s1_origenv2qb.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_profiles
CREATE TABLE IF NOT EXISTS `mdt_profiles` (
  `citizenid` varchar(10) NOT NULL,
  `notes` text NOT NULL,
  `image` text NOT NULL,
  UNIQUE KEY `citizenid` (`citizenid`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_profiles: ~0 rows (approximately)
INSERT INTO `mdt_profiles` (`citizenid`, `notes`, `image`) VALUES
	('EKJ79332', '', '');

-- Dumping structure for table s1_origenv2qb.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `persons` text NOT NULL,
  `officers` text NOT NULL,
  `vehicles` text NOT NULL,
  `evidences` text NOT NULL,
  `date` text NOT NULL,
  `createdby` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_vehicles
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `plate` varchar(10) NOT NULL,
  `image` text NOT NULL,
  `notes` text NOT NULL,
  UNIQUE KEY `plate` (`plate`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_vehicles: ~0 rows (approximately)
INSERT INTO `mdt_vehicles` (`plate`, `image`, `notes`) VALUES
	('2TN960DW', '', 'Do not pull over');

-- Dumping structure for table s1_origenv2qb.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident` int(11) NOT NULL,
  `citizenid` text NOT NULL,
  `date` text NOT NULL,
  `approved` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.mdt_warrants: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.origen_wallet
CREATE TABLE IF NOT EXISTS `origen_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `picture` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.origen_wallet: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.ox_doorlock: ~91 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(2, 'pdenterence', '{"unlockSound":"door_bolt","coords":{"x":434.74444580078127,"y":-981.9168701171875,"z":30.81530380249023},"lockSound":"door_bolt","groups":{"police":0},"doors":[{"heading":270,"coords":{"x":434.74444580078127,"y":-980.7555541992188,"z":30.81530380249023},"model":-1547307588},{"heading":90,"coords":{"x":434.74444580078127,"y":-983.078125,"z":30.81530380249023},"model":-1547307588}],"maxDistance":2,"state":0}'),
	(3, 'pdenterence2', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":441.1240539550781,"y":-977.60107421875,"z":30.82319259643554},"model":-1406685646,"heading":0,"maxDistance":2}'),
	(4, 'pdenterence1', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":441.12408447265627,"y":-986.2335205078125,"z":30.82319259643554},"model":-96679321,"heading":180,"maxDistance":2}'),
	(6, 'pdsideenterence1', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":[{"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81530380249023},"heading":0,"model":-1547307588},{"coords":{"x":443.061767578125,"y":-998.7462158203125,"z":30.81530380249023},"heading":180,"model":-1547307588}],"state":1,"coords":{"x":441.9004821777344,"y":-998.7462158203125,"z":30.81530380249023},"maxDistance":2}'),
	(12, 'pdsideenterence2', '{"groups":{"police":0},"autolock":5,"doors":[{"coords":{"x":455.88616943359377,"y":-972.2542724609375,"z":30.8153076171875},"heading":0,"model":-1547307588},{"coords":{"x":458.208740234375,"y":-972.2542724609375,"z":30.8153076171875},"heading":180,"model":-1547307588}],"state":1,"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.8153076171875},"maxDistance":2}'),
	(13, 'pdgarage', '{"groups":{"police":0},"lockSound":"metal_locker","doorRate":0.8,"unlockSound":"metal_locker","autolock":5,"doors":false,"state":1,"coords":{"x":431.4118957519531,"y":-1000.771728515625,"z":26.69660949707031},"model":2130672747,"heading":0,"maxDistance":6.5}'),
	(14, 'pdgarage2', '{"doors":false,"model":2130672747,"heading":0,"coords":{"x":452.3005065917969,"y":-1000.771728515625,"z":26.69660949707031},"doorRate":0.9,"autolock":5,"unlockSound":"metal_locker","groups":{"police":0},"state":1,"maxDistance":4,"lockSound":"metal_locker"}'),
	(15, 'pdenterance', '{"autolock":10,"auto":true,"maxDistance":6,"groups":{"police":0},"heading":270,"coords":{"x":410.0257873535156,"y":-1028.3192138671876,"z":29.22019958496093},"model":-1635161509,"doors":false,"state":1}'),
	(16, 'pdent2', '{"autolock":10,"auto":true,"maxDistance":6,"groups":{"police":0},"heading":270,"coords":{"x":410.0257873535156,"y":-1020.15673828125,"z":29.2202205657959},"model":-1868050792,"doors":false,"state":1}'),
	(17, 'ems1', '{"autolock":3,"lockSound":"button_remote","heading":160,"groups":{"ambulance":0},"model":854291622,"doors":false,"coords":{"x":309.13372802734377,"y":-597.75146484375,"z":43.43391036987305},"state":1,"unlockSound":"button_remote","maxDistance":2}'),
	(18, 'ems2', '{"autolock":3,"lockSound":"button_remote","heading":250,"groups":{"ambulance":0},"model":854291622,"doors":false,"coords":{"x":313.4800720214844,"y":-595.4583129882813,"z":43.43391036987305},"state":1,"unlockSound":"button_remote","maxDistance":2}'),
	(19, 'ems3', '{"state":0,"groups":{"ambulance":0},"hideUi":true,"doors":[{"coords":{"x":318.48468017578127,"y":-579.2281494140625,"z":43.43391036987305},"heading":160,"model":-434783486},{"coords":{"x":316.0657043457031,"y":-578.3477172851563,"z":43.43391036987305},"heading":160,"model":-1700911976}],"coords":{"x":317.27520751953127,"y":-578.7879638671875,"z":43.43391036987305},"maxDistance":2}'),
	(20, 'ems5', '{"heading":70,"groups":{"ambulance":0},"model":854291622,"doors":false,"coords":{"x":303.9596252441406,"y":-572.5579223632813,"z":43.43391036987305},"state":1,"maxDistance":2}'),
	(21, 'ems6', '{"heading":340,"groups":{"ambulance":0},"model":854291622,"doors":false,"coords":{"x":307.1181945800781,"y":-569.5689697265625,"z":43.43391036987305},"state":1,"maxDistance":2}'),
	(22, 'ems7', '{"lockSound":"button_remote","state":1,"groups":{"ambulance":0},"doors":[{"coords":{"x":314.4241027832031,"y":-572.2215576171875,"z":43.43391036987305},"heading":340,"model":-1700911976},{"coords":{"x":312.005126953125,"y":-571.3411865234375,"z":43.43391036987305},"heading":340,"model":-434783486}],"coords":{"x":313.214599609375,"y":-571.7813720703125,"z":43.43391036987305},"unlockSound":"button_remote","maxDistance":2}'),
	(23, 'ems7', '{"lockSound":"button_remote","state":1,"groups":{"ambulance":0},"doors":[{"coords":{"x":320.26153564453127,"y":-574.3463134765625,"z":43.43391036987305},"heading":340,"model":-1700911976},{"coords":{"x":317.8425598144531,"y":-573.4658813476563,"z":43.43391036987305},"heading":340,"model":-434783486}],"coords":{"x":319.05206298828127,"y":-573.9061279296875,"z":43.43391036987305},"unlockSound":"button_remote","maxDistance":2}'),
	(24, 'ems9', '{"lockSound":"button_remote","state":1,"groups":{"ambulance":0},"doors":[{"coords":{"x":325.6565246582031,"y":-576.3099365234375,"z":43.43391036987305},"heading":340,"model":-1700911976},{"coords":{"x":323.237548828125,"y":-575.429443359375,"z":43.43391036987305},"heading":340,"model":-434783486}],"coords":{"x":324.447021484375,"y":-575.8696899414063,"z":43.43391036987305},"unlockSound":"button_remote","maxDistance":2}'),
	(25, 'ems10', '{"maxDistance":2,"coords":{"x":304.012451171875,"y":-581.8651123046875,"z":43.43391036987305},"hideUi":true,"groups":{"ambulance":0},"state":0,"doors":[{"coords":{"x":305.22186279296877,"y":-582.3056030273438,"z":43.43391036987305},"heading":340,"model":-1700911976},{"coords":{"x":302.8030700683594,"y":-581.424560546875,"z":43.43391036987305},"heading":340,"model":-434783486}]}'),
	(26, 'ems11', '{"state":1,"groups":{"police":0,"ambulance":0},"hideUi":true,"doors":[{"coords":{"x":324.23602294921877,"y":-589.2261962890625,"z":43.43391036987305},"heading":340,"model":-434783486},{"coords":{"x":326.6549987792969,"y":-590.1066284179688,"z":43.43391036987305},"heading":340,"model":-1700911976}],"coords":{"x":325.44549560546877,"y":-589.6663818359375,"z":43.43391036987305},"maxDistance":2}'),
	(27, 'emspd12wardc', '{"lockSound":"button_remote","state":1,"groups":{"police":0,"ambulance":0},"doors":[{"coords":{"x":349.3137512207031,"y":-586.3259887695313,"z":43.43391036987305},"heading":250,"model":-434783486},{"coords":{"x":348.4333190917969,"y":-588.7449951171875,"z":43.43391036987305},"heading":250,"model":-1700911976}],"coords":{"x":348.87353515625,"y":-587.5355224609375,"z":43.43391036987305},"unlockSound":"button_remote","maxDistance":2}'),
	(28, 'uwumain', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"state":1,"lockSound":"button_remote","coords":{"x":-581.014404296875,"y":-1069.627197265625,"z":22.48974800109863},"doors":[{"coords":{"x":-580.361083984375,"y":-1069.627197265625,"z":22.48974800109863},"model":-69331849,"heading":0},{"coords":{"x":-581.6677856445313,"y":-1069.627197265625,"z":22.48974800109863},"model":526179188,"heading":0}],"unlockSound":"button_remote"}'),
	(29, 'uwukitchenmain', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":-1283712428,"state":1,"lockSound":"button_remote","coords":{"x":-587.3400268554688,"y":-1051.8994140625,"z":22.41300582885742},"doors":false,"unlockSound":"button_remote","heading":90}'),
	(30, 'uwu1', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":-60871655,"state":1,"lockSound":"button_remote","coords":{"x":-590.1828002929688,"y":-1054.14794921875,"z":22.41300582885742},"doors":false,"unlockSound":"button_remote","heading":180}'),
	(31, 'uwu2', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":-60871655,"state":1,"lockSound":"button_remote","coords":{"x":-592.4738159179688,"y":-1056.09130859375,"z":22.41300582885742},"doors":false,"unlockSound":"button_remote","heading":0}'),
	(32, 'uwugarage', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":1099436502,"state":1,"lockSound":"metal_locker","coords":{"x":-600.8886108398438,"y":-1055.1314697265626,"z":22.71302795410156},"doors":false,"unlockSound":"metal_locker","heading":270}'),
	(33, 'uwugarage2', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":522844070,"state":1,"lockSound":"metallic_creak","coords":{"x":-600.9105834960938,"y":-1059.2176513671876,"z":21.72143173217773},"doors":false,"unlockSound":"metallic_creak","heading":270}'),
	(34, 'uwu3', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":2089009131,"state":1,"lockSound":"button_remote","coords":{"x":-594.4122924804688,"y":-1049.7686767578126,"z":22.49712753295898},"doors":false,"unlockSound":"button_remote","heading":90}'),
	(35, 'uwuupperfloor', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":2089009131,"state":1,"lockSound":"button_remote","coords":{"x":-571.7926635742188,"y":-1057.388427734375,"z":26.76796531677246},"doors":false,"unlockSound":"button_remote","heading":0}'),
	(36, 'uwuupperfloor1', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":2089009131,"state":1,"lockSound":"button_remote","coords":{"x":-575.0108642578125,"y":-1062.3807373046876,"z":26.76796531677246},"doors":false,"unlockSound":"button_remote","heading":270}'),
	(37, 'uwuupperfloor2', '{"maxDistance":2,"groups":{"uwu":0},"hideUi":true,"model":2089009131,"state":1,"lockSound":"button_remote","coords":{"x":-575.0128173828125,"y":-1063.7833251953126,"z":26.76796531677246},"doors":false,"unlockSound":"button_remote","heading":90}'),
	(47, 'uwustash', '{"coords":{"x":-591.7698974609375,"y":-1066.9739990234376,"z":22.53749465942382},"unlockSound":"metal_locker","hideUi":true,"groups":{"uwu":0},"doors":false,"lockSound":"metal_locker","state":1,"maxDistance":2,"model":-562476388,"heading":270}'),
	(48, 'bsmaindoor', '{"coords":{"x":-1181.4556884765626,"y":-886.404052734375,"z":14.09526920318603},"unlockSound":"button_remote","hideUi":true,"groups":{"burgershot":0},"doors":[{"coords":{"x":-1180.728515625,"y":-887.4773559570313,"z":14.09526920318603},"heading":124,"model":-1890974902},{"coords":{"x":-1182.182861328125,"y":-885.330810546875,"z":14.09526920318603},"heading":304,"model":1143532813}],"lockSound":"button_remote","state":1,"maxDistance":2}'),
	(49, 'bsbackdoor', '{"coords":{"x":-1197.09912109375,"y":-903.9393920898438,"z":14.03526592254638},"unlockSound":"button_remote","hideUi":true,"groups":{"burgershot":0},"doors":false,"lockSound":"button_remote","state":1,"maxDistance":2,"model":1465287574,"heading":214}'),
	(50, 'bskitchenbackdoor', '{"coords":{"x":-1200.7210693359376,"y":-900.771728515625,"z":13.90556144714355},"unlockSound":"button_remote","hideUi":true,"groups":{"burgershot":0},"doors":false,"lockSound":"button_remote","state":1,"maxDistance":2,"model":2010236044,"heading":214}'),
	(51, 'bskitchenmain', '{"coords":{"x":-1188.0657958984376,"y":-896.6784057617188,"z":13.90556144714355},"unlockSound":"button_remote","hideUi":true,"groups":{"burgershot":0},"doors":false,"lockSound":"button_remote","state":1,"maxDistance":2,"model":2010236044,"heading":304}'),
	(52, 'pdground2', '{"groups":{"police":0},"lockSound":"door_bolt","unlockSound":"door_bolt","autolock":5,"doors":[{"coords":{"x":467.522216796875,"y":-1000.543701171875,"z":26.40548324584961},"heading":0,"model":-288803980},{"coords":{"x":469.9273681640625,"y":-1000.543701171875,"z":26.40548324584961},"heading":180,"model":-288803980}],"state":1,"coords":{"x":468.72479248046877,"y":-1000.543701171875,"z":26.40548324584961},"maxDistance":2}'),
	(53, 'ground1', '{"groups":{"police":0},"lockSound":"door_bolt","unlockSound":"door_bolt","autolock":5,"doors":[{"coords":{"x":471.36785888671877,"y":-1007.7933959960938,"z":26.40548324584961},"heading":270,"model":149284793},{"coords":{"x":471.3758239746094,"y":-1010.1978759765625,"z":26.40548324584961},"heading":90,"model":149284793}],"state":1,"coords":{"x":471.371826171875,"y":-1008.99560546875,"z":26.40548324584961},"maxDistance":2}'),
	(54, 'pdcellsmain', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":476.64471435546877,"y":-1008.2840576171875,"z":26.48005485534668},"model":-53345114,"heading":270,"maxDistance":2}'),
	(55, 'cell1', '{"heading":0,"groups":{"police":0},"unlockSound":"metallic_creak","doors":false,"model":-53345114,"maxDistance":2,"state":1,"coords":{"x":477.91259765625,"y":-1012.1886596679688,"z":26.48005485534668},"lockSound":"metallic_creak"}'),
	(56, 'cell3', '{"heading":0,"groups":{"police":0},"unlockSound":"metallic_creak","doors":false,"model":-53345114,"maxDistance":2,"state":1,"coords":{"x":480.9128112792969,"y":-1012.1886596679688,"z":26.48005485534668},"lockSound":"metallic_creak"}'),
	(57, 'cell4', '{"heading":0,"groups":{"police":0},"unlockSound":"metallic_creak","doors":false,"model":-53345114,"maxDistance":2,"state":1,"coords":{"x":483.9127197265625,"y":-1012.1886596679688,"z":26.48005485534668},"lockSound":"metallic_creak"}'),
	(58, 'cell5', '{"heading":0,"groups":{"police":0},"unlockSound":"metallic_creak","doors":false,"model":-53345114,"maxDistance":2,"state":1,"coords":{"x":486.9131164550781,"y":-1012.1886596679688,"z":26.48005485534668},"lockSound":"metallic_creak"}'),
	(59, 'cellbig', '{"heading":180,"groups":{"police":0},"unlockSound":"metallic_creak","doors":false,"model":-53345114,"maxDistance":2,"state":1,"coords":{"x":484.1764221191406,"y":-1007.734375,"z":26.48005485534668},"lockSound":"metallic_creak"}'),
	(60, 'cellentinner', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":481.5995788574219,"y":-1004.1484375,"z":26.48005485534668},"model":-53345114,"heading":180,"maxDistance":2}'),
	(61, 'pdint2', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":482.67022705078127,"y":-996.33251953125,"z":26.40548324584961},"model":-1406685646,"heading":270,"maxDistance":2}'),
	(62, 'pdob2', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":482.669921875,"y":-992.9031982421875,"z":26.40548324584961},"model":-1406685646,"heading":270,"maxDistance":2}'),
	(63, 'pdint1', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":482.6701354980469,"y":-988.1831665039063,"z":26.40548324584961},"model":-1406685646,"heading":270,"maxDistance":2}'),
	(64, 'pdob1', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":482.66943359375,"y":-984.5908203125,"z":26.40548324584961},"model":-1406685646,"heading":270,"maxDistance":2}'),
	(65, 'pdevidence', '{"groups":{"police":0},"lockSound":"button_remote","unlockSound":"button_remote","autolock":5,"doors":false,"state":1,"coords":{"x":475.4071960449219,"y":-990.0584106445313,"z":26.40548324584961},"model":-692649124,"heading":135,"maxDistance":2}'),
	(67, 'pdpark2', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":464.1568603515625,"y":-975.2672119140625,"z":26.3707046508789},"model":1830360419,"heading":270,"maxDistance":2}'),
	(68, 'pdpark1', '{"groups":{"police":0},"lockSound":"metallic_creak","unlockSound":"metallic_creak","autolock":5,"doors":false,"state":1,"coords":{"x":464.1579284667969,"y":-996.90771484375,"z":26.3707046508789},"model":1830360419,"heading":90,"maxDistance":2}'),
	(70, 'doj', '{"coords":{"x":-545.5143432617188,"y":-203.3874969482422,"z":38.62826919555664},"state":0,"groups":{"lawyer":0},"doors":[{"model":2537604,"coords":{"x":-544.52197265625,"y":-202.8148956298828,"z":38.62826919555664},"heading":30},{"model":2537604,"coords":{"x":-546.5067138671875,"y":-203.96009826660157,"z":38.62826919555664},"heading":210}],"maxDistance":2}'),
	(71, 'lscustomsmain', '{"doorRate":0.7,"model":-1958316735,"state":1,"unlockSound":"button_remote","coords":{"x":871.2015380859375,"y":-2112.940673828125,"z":31.75130844116211},"maxDistance":5,"groups":{"mechanic":0},"doors":false,"lockSound":"button_remote","heading":265}'),
	(72, 'lscustoms2', '{"doorRate":0.7,"model":-1958316735,"state":1,"unlockSound":"button_remote","coords":{"x":908.8870849609375,"y":-2097.85205078125,"z":31.74398803710937},"maxDistance":5,"groups":{"mechanic":0},"doors":false,"lockSound":"button_remote","heading":175}'),
	(73, 'lscustoms3main', '{"doors":false,"heading":175,"unlockSound":"door_bolt","model":-88942360,"lockSound":"door_bolt","state":1,"groups":{"mechanic":0},"coords":{"x":896.8566284179688,"y":-2104.47119140625,"z":35.03548049926758},"maxDistance":2}'),
	(74, 'cardealermain', '{"doors":[{"coords":{"x":110.84381103515625,"y":-151.0354766845703,"z":55.02302551269531},"model":1225835816,"heading":295},{"coords":{"x":111.8766860961914,"y":-153.25048828125,"z":55.03302383422851},"model":1225835816,"heading":115}],"state":1,"maxDistance":2,"coords":{"x":111.36024475097656,"y":-152.14297485351563,"z":55.02802276611328},"lockSound":"button_remote","unlockSound":"button_remote","groups":{"cardealer":0}}'),
	(75, 'cardealerback', '{"doors":false,"state":1,"maxDistance":5,"model":-243440858,"coords":{"x":117.86335754394531,"y":-135.81602478027345,"z":53.83846664428711},"lockSound":"button_remote","unlockSound":"button_remote","heading":160,"groups":{"cardealer":0}}'),
	(76, 'pdmoffice', '{"model":788691675,"state":1,"unlockSound":"door_bolt","autolock":5,"coords":{"x":146.06089782714845,"y":-148.10659790039063,"z":55.01000213623047},"maxDistance":2,"hideUi":true,"groups":{"cardealer":0},"doors":false,"lockSound":"door_bolt","heading":340}'),
	(79, 'pdarmoury', '{"groups":{"police":0},"autolock":5,"doors":[{"coords":{"x":469.44061279296877,"y":-985.0313110351563,"z":30.82319259643554},"heading":270,"model":-288803980},{"coords":{"x":469.44061279296877,"y":-987.4376831054688,"z":30.82319259643554},"heading":90,"model":-288803980}],"state":1,"coords":{"x":469.44061279296877,"y":-986.2344970703125,"z":30.82319259643554},"maxDistance":2}'),
	(80, 'pdroof', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":464.3085632324219,"y":-984.5284423828125,"z":43.771240234375},"model":-692649124,"heading":90,"maxDistance":2}'),
	(81, 'ems_garage2', '{"groups":{"ambulance":0},"doorRate":0.7,"autolock":5,"doors":false,"state":1,"coords":{"x":337.2776794433594,"y":-564.4320068359375,"z":29.77529144287109},"model":-820650556,"heading":160,"maxDistance":4}'),
	(82, 'emsgarage1', '{"doorRate":0.7,"auto":true,"autolock":5,"doors":false,"state":1,"coords":{"x":330.1349182128906,"y":-561.8331298828125,"z":29.77529144287109},"model":-820650556,"heading":160,"maxDistance":4}'),
	(84, 'prisonenterence', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":1845.3358154296876,"y":2585.34765625,"z":46.08550262451172},"model":705715602,"heading":90,"maxDistance":2}'),
	(85, 'prisons1', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":1837.6337890625,"y":2576.99169921875,"z":46.03859710693359},"model":2024969025,"heading":0,"maxDistance":2}'),
	(86, 'prisons2', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":1844.40380859375,"y":2576.9970703125,"z":46.03560256958008},"model":2024969025,"heading":0,"maxDistance":2}'),
	(87, 'prisons3', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":1835.527587890625,"y":2587.440185546875,"z":46.03711700439453},"model":-684929024,"heading":90,"maxDistance":2}'),
	(88, 'prisons4', '{"groups":{"police":0},"autolock":5,"doors":false,"state":1,"coords":{"x":1797.760986328125,"y":2596.56494140625,"z":46.38731002807617},"model":-1156020871,"heading":180,"maxDistance":2}'),
	(89, 'prisons5', '{"auto":true,"heading":90,"doors":false,"maxDistance":7.5,"autolock":15,"coords":{"x":1844.97802734375,"y":2608.4267578125,"z":44.63977813720703},"model":741314661,"groups":{"police":0},"state":1}'),
	(90, 'prisons6', '{"auto":true,"heading":90,"doors":false,"maxDistance":7.5,"autolock":15,"coords":{"x":1818.52294921875,"y":2608.4267578125,"z":44.61100006103515},"model":741314661,"groups":{"police":0},"state":1}'),
	(91, 'prisons7', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":false,"state":1,"coords":{"x":1799.6080322265626,"y":2616.97509765625,"z":44.6032485961914},"model":741314661,"heading":180,"maxDistance":7.5}'),
	(92, 'prisons7', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1808.991943359375,"y":2474.544921875,"z":44.48077011108398},"heading":71,"model":741314661},{"coords":{"x":1813.7490234375,"y":2488.906982421875,"z":44.46368026733398},"heading":252,"model":741314661}],"state":1,"coords":{"x":1811.3704833984376,"y":2481.72607421875,"z":44.47222518920898},"maxDistance":7.5}'),
	(93, 'prisons8', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1762.5419921875,"y":2426.507080078125,"z":44.43787002563476},"heading":206,"model":741314661},{"coords":{"x":1749.1419677734376,"y":2419.81201171875,"z":44.4251708984375},"heading":27,"model":741314661}],"state":1,"coords":{"x":1755.842041015625,"y":2423.15966796875,"z":44.4315185546875},"maxDistance":7.5}'),
	(94, 'prisons9', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1667.6689453125,"y":2407.64794921875,"z":44.42879104614258},"heading":173,"model":741314661},{"coords":{"x":1652.9840087890626,"y":2409.571044921875,"z":44.44308090209961},"heading":353,"model":741314661}],"state":1,"coords":{"x":1660.326416015625,"y":2408.609375,"z":44.43593597412109},"maxDistance":7.5}'),
	(95, 'prisons10', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1550.930419921875,"y":2482.743408203125,"z":44.39528656005859},"heading":298,"model":741314661},{"coords":{"x":1558.22119140625,"y":2469.34912109375,"z":44.39528656005859},"heading":118,"model":741314661}],"state":1,"coords":{"x":1554.5758056640626,"y":2476.04638671875,"z":44.39528656005859},"maxDistance":7.5}'),
	(96, 'prisons11', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1547.7061767578126,"y":2591.2822265625,"z":44.50946807861328},"heading":267,"model":741314661},{"coords":{"x":1546.9833984375,"y":2576.129638671875,"z":44.39032745361328},"heading":87,"model":741314661}],"state":1,"coords":{"x":1547.3447265625,"y":2583.7060546875,"z":44.44989776611328},"maxDistance":7.5}'),
	(97, 'prisons12', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1584.6529541015626,"y":2679.7490234375,"z":44.50947189331055},"heading":234,"model":741314661},{"coords":{"x":1575.719482421875,"y":2667.15185546875,"z":44.50946807861328},"heading":55,"model":741314661}],"state":1,"coords":{"x":1580.186279296875,"y":2673.450439453125,"z":44.50946807861328},"maxDistance":7.5}'),
	(98, 'prisons13', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1662.010986328125,"y":2748.702880859375,"z":44.44668960571289},"heading":207,"model":741314661},{"coords":{"x":1648.4110107421876,"y":2741.66796875,"z":44.44668960571289},"heading":27,"model":741314661}],"state":1,"coords":{"x":1655.2109375,"y":2745.185546875,"z":44.44668960571289},"maxDistance":7.5}'),
	(99, 'prisons14', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1776.7010498046876,"y":2747.14794921875,"z":44.44668960571289},"heading":160,"model":741314661},{"coords":{"x":1762.196044921875,"y":2752.489013671875,"z":44.44668960571289},"heading":340,"model":741314661}],"state":1,"coords":{"x":1769.448486328125,"y":2749.818359375,"z":44.44668960571289},"maxDistance":7.5}'),
	(100, 'prisons15', '{"groups":{"police":0},"auto":true,"autolock":5,"doors":[{"coords":{"x":1835.2850341796876,"y":2689.10400390625,"z":44.44670104980469},"heading":110,"model":741314661},{"coords":{"x":1830.134033203125,"y":2703.4990234375,"z":44.44670104980469},"heading":289,"model":741314661}],"state":1,"coords":{"x":1832.70947265625,"y":2696.301513671875,"z":44.44670104980469},"maxDistance":7.5}'),
	(101, 'bankkk', '{"state":0,"doors":[{"heading":160,"coords":{"x":313.8901672363281,"y":-275.7320861816406,"z":53.16696166992187},"model":122382010},{"heading":340,"coords":{"x":316.36578369140627,"y":-276.6327209472656,"z":53.16696548461914},"model":1451558188}],"doorRate":11,"coords":{"x":315.12799072265627,"y":-276.1824035644531,"z":53.16696166992187},"maxDistance":2,"hideUi":true}'),
	(102, 'EMSPILLBOXMAIN', '{"coords":{"x":299.62933349609377,"y":-584.8292846679688,"z":42.28400802612305},"doorRate":11,"hideUi":true,"maxDistance":2,"doors":[{"heading":250,"model":-487908756,"coords":{"x":299.22784423828127,"y":-585.9323120117188,"z":42.28400802612305}},{"heading":250,"model":661758796,"coords":{"x":300.0307922363281,"y":-583.7262573242188,"z":42.28400802612305}}],"state":0}'),
	(103, 'legionbank', '{"state":0,"hideUi":true,"doors":[{"model":122382010,"heading":160,"coords":{"x":149.5612030029297,"y":-1037.3663330078126,"z":28.37025070190429}},{"model":1451558188,"heading":340,"coords":{"x":152.0364990234375,"y":-1038.267822265625,"z":28.37025260925293}}],"maxDistance":2,"coords":{"x":150.79885864257813,"y":-1037.817138671875,"z":28.37025070190429},"doorRate":11}'),
	(104, 'bankkkkk2', '{"state":0,"hideUi":true,"doors":[{"model":122382010,"heading":207,"coords":{"x":-1215.333740234375,"y":-328.666259765625,"z":36.78320693969726}},{"model":1451558188,"heading":27,"coords":{"x":-1212.98681640625,"y":-327.47003173828127,"z":36.78321075439453}}],"maxDistance":2,"coords":{"x":-1214.1602783203126,"y":-328.0681457519531,"z":36.78321075439453},"doorRate":11}'),
	(105, 'bankjod1', '{"state":0,"hideUi":true,"doors":[{"model":122382010,"heading":161,"coords":{"x":-351.325927734375,"y":-46.5489387512207,"z":48.03874969482422}},{"model":1451558188,"heading":341,"coords":{"x":-348.8350524902344,"y":-47.40649795532226,"z":48.03875350952148}}],"maxDistance":2,"coords":{"x":-350.08050537109377,"y":-46.97771835327148,"z":48.03874969482422},"doorRate":11}'),
	(106, 'bankjod2', '{"state":0,"hideUi":true,"doors":[{"model":122382010,"heading":268,"coords":{"x":-2965.671142578125,"y":481.60565185546877,"z":14.69926261901855}},{"model":1451558188,"heading":88,"coords":{"x":-2965.564697265625,"y":484.23785400390627,"z":14.69926452636718}}],"maxDistance":2,"coords":{"x":-2965.617919921875,"y":482.9217529296875,"z":14.69926357269287},"doorRate":11}'),
	(107, 'vec3(488.894806, -1017.211975, 27.149349)', '{"autolock":10,"auto":true,"maxDistance":6,"groups":{"police":0},"heading":90,"coords":{"x":488.8948059082031,"y":-1017.2119750976563,"z":27.14934921264648},"model":-1603817716,"doors":false,"doorRate":0.7,"state":1}'),
	(109, 'pdbackdoor2', '{"autolock":5,"maxDistance":2,"groups":{"police":0},"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381614685058},"doors":[{"model":-692649124,"heading":180,"coords":{"x":469.7742614746094,"y":-1014.406005859375,"z":26.48381614685058}},{"model":-692649124,"heading":0,"coords":{"x":467.3686218261719,"y":-1014.406005859375,"z":26.48381614685058}}],"state":1}'),
	(110, 'newplayer', '{"coords":{"x":-1002.146728515625,"y":-478.064208984375,"z":50.1166763305664},"maxDistance":2,"doors":false,"heading":299,"autolock":1,"state":1,"model":-2030220382,"hideUi":true}'),
	(111, 'pentrence', '{"state":1,"groups":{"police":0},"model":-190780785,"coords":{"x":459.5504150390625,"y":-1014.64599609375,"z":29.10956954956054},"autolock":5,"doorRate":1,"doors":false,"maxDistance":5,"heading":270,"auto":true}'),
	(112, 'garagedoor', '{"state":1,"groups":{"police":0},"model":-190780785,"coords":{"x":459.5504150390625,"y":-1019.698974609375,"z":29.0887393951416},"autolock":5,"doorRate":1,"doors":false,"maxDistance":5,"heading":270,"auto":true}'),
	(114, 'truck logistics', '{"auto":true,"model":-190780785,"doors":false,"coords":{"x":1204.5550537109376,"y":-3110.385986328125,"z":6.55783081054687},"autolock":5,"heading":180,"state":0,"doorRate":1,"maxDistance":2,"groups":{"trucker":0}}');

-- Dumping structure for table s1_origenv2qb.pa_vehicleshop_showroom_vehicles
CREATE TABLE IF NOT EXISTS `pa_vehicleshop_showroom_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealershipId` int(11) DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.pa_vehicleshop_showroom_vehicles: ~0 rows (approximately)
INSERT INTO `pa_vehicleshop_showroom_vehicles` (`id`, `dealershipId`, `data`) VALUES
	(3, 1, '[{"coords":{"x":-50.66999816894531,"y":-1116.43994140625,"z":25.96999931335449,"w":2.25999999046325},"vehicleModel":"asbo","spotId":1,"vehicle":777987},{"coords":{"x":-53.56000137329101,"y":-1116.8399658203126,"z":25.79000091552734,"w":3.35999989509582},"vehicleModel":"tenf2","spotId":2,"vehicle":9831426},{"coords":{"x":-56.29999923706055,"y":-1116.969970703125,"z":25.65999984741211,"w":1.12999999523162},"vehicleModel":"jubilee","spotId":3,"vehicle":9831682},{"coords":{"x":-59.18000030517578,"y":-1116.8900146484376,"z":26.17000007629394,"w":1.44000005722045},"vehicleModel":"sultanrs","spotId":4,"vehicle":9831938},{"coords":{"x":-61.83000183105469,"y":-1117.06005859375,"z":25.84000015258789,"w":2.23000001907348},"vehicleModel":"chino","spotId":5,"vehicle":9832194}]');

-- Dumping structure for table s1_origenv2qb.pa_vehicleshop_stocks
CREATE TABLE IF NOT EXISTS `pa_vehicleshop_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.pa_vehicleshop_stocks: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_accounts
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.phone_accounts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_alertjobs
CREATE TABLE IF NOT EXISTS `phone_alertjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `alerts` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.phone_alertjobs: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_chatrooms: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_chatroom_messages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.phone_chats: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_invoices: ~2 rows (approximately)
INSERT INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`, `sendercitizenid`, `time`) VALUES
	(44, 'IIE26687', 20000, 'uwu', 'Shawn', 'GLD40591', NULL);

-- Dumping structure for table s1_origenv2qb.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_messages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_note: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.phone_notifies: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` mediumtext NOT NULL,
  `charinfo` mediumtext DEFAULT NULL,
  `job` mediumtext NOT NULL,
  `gang` mediumtext DEFAULT NULL,
  `position` mediumtext NOT NULL,
  `metadata` mediumtext NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `playtime` int(11) DEFAULT 0,
  `apps` mediumtext DEFAULT NULL,
  `widget` mediumtext DEFAULT NULL,
  `bt` mediumtext DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` mediumtext DEFAULT NULL,
  `crafting_level` tinyint(4) NOT NULL DEFAULT 1,
  `crafting_xp` smallint(6) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `lvlpro` int(11) NOT NULL DEFAULT 0,
  `skills` longtext DEFAULT NULL,
  `frkn_fuelstation_control` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  `twitteraccount` varchar(50) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `calls` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `darkchatuser` longtext DEFAULT NULL,
  `mailaccount` varchar(50) DEFAULT NULL,
  `iban` varchar(50) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `priority` longtext DEFAULT NULL,
  `hackerMenu` longtext NOT NULL DEFAULT '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}',
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=209927 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.players: ~11 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `playtime`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `crafting_level`, `crafting_xp`, `level`, `lvlpro`, `skills`, `frkn_fuelstation_control`, `phone_number`, `twitteraccount`, `settings`, `calls`, `notes`, `photos`, `darkchatuser`, `mailaccount`, `iban`, `phone`, `tattoos`, `priority`, `hackerMenu`) VALUES
	(208823, 'CYZ72802', 1, 'license:03c26d5aa603539ef76d771fe1cfd75041bbae24', 'Danny ', '{"bank":4516,"crypto":0,"cash":987163}', '{"nationality":"White","backstory":"placeholder backstory","lastname":"Stoner","gender":0,"phone":"1137887927","firstname":"Danny","account":"US01QBCore3277980486","birthdate":"1998-05-05","cid":"1"}', '{"type":"mechanic","grade":{"name":"Manager","level":4},"isboss":true,"onduty":false,"label":"LS Customs","payment":150,"name":"mechanic"}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false,"name":"none"}', '{"x":1725.9296875,"y":1499.7890625,"z":84.783203125}', '{"armor":0,"hunger":100,"licences":{"business":false,"weapon":false,"driver":true},"dealerrep":0,"jailitems":[],"phone":[],"walletid":"QB-65466994","callsign":"NO CALLSIGN","isdead":false,"fingerprint":"Nj393G00MgL4744","ishandcuffed":false,"status":[],"criminalrecord":{"hasRecord":false},"stress":0,"tracker":false,"attachmentcraftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":36299010},"bloodtype":"A-","jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"injail":0,"craftingrep":0,"fitbit":[],"inside":{"apartment":[]},"crypto":{"shung":0,"gne":0,"lme":0,"xcoin":0},"inlaststand":false,"thirst":100}', '[{"name":"phone","slot":1,"created":1727061764,"type":"item","info":{"quality":100},"amount":1},{"name":"idcard","slot":2,"created":1727061764,"type":"item","info":{"cref":"CYZ72802","sex":"M","pref":"UNKNOWN","dob":"1998-05-05","exp":"2028","lastName":"STONER","class":"C","firstName":"DANNY","quality":100},"amount":1},{"name":"weapon_katanas","slot":3,"created":1727063930,"type":"weapon","info":{"ammo":0,"serie":"74gSo1LO243IXAv","quality":100},"amount":1},{"name":"lockpick","slot":4,"created":1727064096,"type":"item","info":{"quality":100},"amount":4},{"name":"recyclablematerial","slot":5,"created":1727549632,"type":"item","info":{"quality":100},"amount":6},{"name":"bottle","slot":6,"created":1727550768,"type":"item","info":{"quality":100},"amount":9},{"name":"rubber","slot":7,"created":1727550780,"type":"item","info":{"quality":100},"amount":9},{"name":"sandwich","slot":8,"created":1727550795,"type":"item","info":{"quality":100},"amount":3},{"name":"can","slot":9,"created":1727550835,"type":"item","info":{"quality":100},"amount":4},{"name":"water_bottle","slot":10,"created":1727551274,"type":"item","info":{"quality":100},"amount":5},{"name":"package","slot":21,"created":1728268949,"type":"item","info":{"quality":100},"amount":1},{"name":"oxy","slot":22,"created":1728269862,"type":"item","info":{"quality":100},"amount":12},{"name":"package","slot":17,"created":1728268932,"type":"item","info":{"quality":100},"amount":1},{"name":"package","slot":18,"created":1728268940,"type":"item","info":{"quality":100},"amount":1},{"name":"package","slot":19,"created":1728268945,"type":"item","info":{"quality":100},"amount":1},{"name":"package","slot":20,"created":1728268947,"type":"item","info":{"quality":100},"amount":1}]', '2024-10-07 03:28:14', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(209370, 'DIE20179', 1, 'license:d8682a771d89d77d4734764de5337fa51cf23d70', 'kristenstorie1992', '{"bank":5080,"cash":500,"crypto":0}', '{"cid":"1","birthdate":"2005-05-05","account":"US06QBCore5415607885","lastname":"mabut","gender":1,"phone":"9446253698","backstory":"placeholder backstory","nationality":"canadian","firstname":"hesin"}', '{"payment":10,"onduty":true,"isboss":false,"type":"none","label":"Civilian","grade":{"level":0,"name":"Freelancer"},"name":"unemployed"}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false,"name":"none"}', '{"x":290.20220947265627,"y":-582.2241821289063,"z":42.86083984375}', '{"walletid":"QB-20134938","inside":{"apartment":[]},"licences":{"driver":true,"business":false,"weapon":false},"fitbit":[],"hunger":87.39999999999782,"fingerprint":"gm070K15Lbg9397","thirst":88.59999999999946,"status":[],"armor":0,"crypto":{"gne":0,"lme":0,"shung":0,"xcoin":0},"attachmentcraftingrep":0,"jobrep":{"tow":0,"taxi":0,"trucker":0,"hotdog":0},"tracker":false,"craftingrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":48570695},"inlaststand":false,"injail":0,"callsign":"NO CALLSIGN","stress":0,"jailitems":[],"ishandcuffed":false,"dealerrep":0,"phone":[],"isdead":false,"criminalrecord":{"hasRecord":false},"bloodtype":"AB-"}', '[{"amount":1,"name":"phone","type":"item","created":1727534860,"info":{"quality":100},"slot":1},{"amount":1,"name":"idcard","type":"item","created":1727534860,"info":{"exp":"2028","dob":"2005-05-05","firstName":"HESIN","lastName":"MABUT","class":"C","cref":"DIE20179","pref":"UNKNOWN","quality":100,"sex":"M"},"slot":2}]', '2024-09-28 16:46:28', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208230, 'EKJ79332', 1, 'license:ef7b10dcab4ed3ea63824ae253fd77ea61526754', 'Ukraine', '{"crypto":0,"bank":659804,"cash":188934}', '{"birthdate":"2005-05-05","cid":"1","backstory":"placeholder backstory","phone":"7314802134","account":"US02QBCore5905306990","lastname":"jenskin","firstname":"Leeeroy","gender":0,"nationality":"niger"}', '{"isboss":false,"name":"unemployed","onduty":true,"payment":10,"label":"Civilian","type":"none","grade":{"level":0,"name":"Freelancer"}}', '{"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":618.3428344726563,"y":263.77581787109377,"z":102.4417724609375}', '{"dealerrep":0,"craftingrep":0,"hunger":87.39999999999782,"status":[],"fitbit":[],"stress":0,"armor":0,"inside":{"apartment":[]},"phone":[],"crypto":{"xcoin":0,"gne":0,"lme":0,"shung":0},"inlaststand":false,"criminalrecord":{"hasRecord":true,"date":{"min":15,"sec":14,"day":28,"month":9,"year":2024,"isdst":false,"wday":7,"yday":272,"hour":3}},"thirst":88.59999999999946,"licences":{"weapon":false,"business":false,"driver":true},"attachmentcraftingrep":0,"jobrep":{"trucker":0,"taxi":0,"hotdog":0,"tow":0},"injail":0,"tracker":true,"bloodtype":"O+","isdead":false,"ishandcuffed":false,"fingerprint":"we116t42PVd1031","jailitems":[],"callsign":"NO CALLSIGN","walletid":"QB-44815958","phonedata":{"SerialNumber":18817543,"InstalledApps":[]}}', '[{"amount":2,"created":1726973864,"slot":1,"type":"item","info":{"quality":100},"name":"trojan_usb"},{"amount":1,"created":1727641019,"slot":2,"type":"item","info":{"quality":100},"name":"electronickit"},{"amount":1,"created":1727632366,"slot":3,"type":"weapon","info":{"serie":"91zrj2cW194jrUq","ammo":20,"quality":99.70000000000005},"name":"weapon_smg_mk2"},{"amount":20,"created":1727493389,"slot":4,"type":"item","info":{"quality":100},"name":"sandwich"},{"amount":1,"created":1727546326,"slot":5,"type":"weapon","info":{"serie":"83sup5av589vUcQ","ammo":0,"quality":100},"name":"weapon_bat"},{"amount":9,"created":1727632356,"slot":6,"type":"item","info":{"quality":100},"name":"smg_ammo"},{"amount":1,"created":1727546326,"slot":7,"type":"weapon","info":{"serie":"79wvB7Ln055tRLT","quality":100},"name":"weapon_knife"},{"amount":10,"created":1727560073,"slot":8,"type":"item","info":{"quality":100},"name":"tosti"},{"amount":10,"created":1727560073,"slot":9,"type":"item","info":{"quality":100},"name":"twerks_candy"},{"amount":1,"created":1727640170,"slot":10,"type":"weapon","info":{"serie":"47imv7Vs895vzpd","quality":100},"name":"weapon_vintagepistol"},{"amount":1,"created":1727639806,"slot":13,"type":"item","info":{"quality":100},"name":"drill"},{"amount":1,"created":1727544594,"slot":14,"type":"weapon","info":{"serie":"60Xvo0lP865gSad","ammo":39,"quality":89.95000000000155},"name":"weapon_pistol_mk2"},{"amount":1,"created":1727630115,"slot":15,"type":"item","info":{"quality":100},"name":"phone"},{"amount":1,"created":1727544584,"slot":16,"type":"item","info":{"quality":100},"name":"pistol_ammo"},{"amount":2,"created":1727544987,"slot":17,"type":"item","info":{"quality":100},"name":"repairkit"},{"amount":9,"created":1727632447,"slot":18,"type":"item","info":{"quality":100},"name":"rifle_ammo"},{"amount":19,"created":1727544735,"slot":21,"type":"item","info":{"quality":100},"name":"advancedlockpick"},{"amount":9,"created":1727632374,"slot":22,"type":"item","info":{"quality":100},"name":"water_bottle"},{"amount":1,"created":1727546443,"slot":23,"type":"item","info":{"gasamount":50,"quality":100},"name":"jerrycan"},{"amount":1,"created":1727632437,"slot":24,"type":"weapon","info":{"serie":"63ZbJ1Tr780UNba","ammo":6,"quality":98.0500000000003},"name":"weapon_assaultrifle"},{"amount":4,"created":1727639858,"slot":26,"type":"item","info":{"worth":4286,"quality":100},"name":"markedbills"},{"amount":1,"created":1727546326,"slot":27,"type":"weapon","info":{"serie":"98oIJ8bD230HLeA","ammo":0,"quality":100},"name":"weapon_hatchet"},{"amount":1,"created":1727632252,"slot":28,"type":"weapon","info":{"serie":"09fkU9tj487gwfG","ammo":0,"quality":100},"name":"weapon_sledgeham"},{"amount":38,"created":1727638886,"slot":29,"type":"item","info":{"quality":100},"name":"iron"},{"amount":1,"created":1727630678,"slot":30,"type":"item","info":{"quality":100},"name":"shovel"}]', '2024-10-02 23:53:34', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208226, 'GLD40591', 1, 'license:7264c96d4b26baba17b314ab013333d50f3916ba', 'ItsMaserati', '{"crypto":0,"cash":155.0,"bank":118779.0}', '{"birthdate":"1996-04-23","account":"US08QBCore1869840548","nationality":"USA","lastname":"Gauci","cid":"1","gender":0,"backstory":"placeholder backstory","firstname":"Shawn","phone":"9904103757"}', '{"name":"ambulance","grade":{"name":"Chief","level":4},"onduty":true,"isboss":true,"type":"ems","label":"EMS","payment":150}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":-362.28131103515627,"y":-134.84835815429688,"z":38.6820068359375}', '{"inlaststand":false,"walletid":"QB-94987187","tracker":false,"status":[],"inside":{"apartment":[]},"ishandcuffed":false,"hunger":100,"licences":{"business":false,"driver":true,"weapon":false},"stress":0,"isdead":false,"crypto":{"xcoin":0,"gne":0,"lme":0,"shung":0},"dealerrep":0,"bloodtype":"O+","injail":0,"criminalrecord":{"hasRecord":false},"thirst":100,"armor":0,"attachmentcraftingrep":0,"fingerprint":"AH654G29pFa7589","callsign":"NO CALLSIGN","phonedata":{"InstalledApps":[],"SerialNumber":97146345},"jailitems":[],"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"fitbit":[],"craftingrep":0,"phone":[]}', '[{"name":"tirerepairkit","amount":2,"slot":1,"created":1727546438,"type":"item","info":{"quality":100}},{"name":"lockpick","amount":4,"slot":2,"created":1726970913,"type":"item","info":{"quality":100}},{"name":"handcuffs","amount":5,"slot":3,"created":1727028599,"type":"item","info":{"quality":100}},{"name":"weapon_m4","amount":1,"slot":4,"created":1727041166,"type":"weapon","info":{"serie":"08Wxv5Tn941XpRS","quality":100,"ammo":46}},{"name":"weapon_glock","amount":1,"slot":5,"created":1726975506,"type":"weapon","info":{"serie":"93Glh1nX242IrIk","quality":100,"ammo":0}},{"name":"mechanic_tools","amount":1,"slot":6,"created":1727635760,"type":"item","info":{"quality":100}},{"name":"body_cam","amount":1,"slot":7,"created":1727546343,"type":"item","info":{"quality":100}},{"name":"firstaid","amount":6,"slot":8,"created":1727491950,"type":"item","info":{"quality":100}},{"name":"toolbox","amount":1,"slot":9,"created":1727635772,"type":"item","info":{"quality":100}},{"name":"sandwich","amount":1,"slot":10,"created":1727636889,"type":"item","info":{"quality":100}},{"name":"tablet","amount":1,"slot":12,"created":1726980809,"type":"item","info":{"quality":100}},{"name":"radio","amount":1,"slot":14,"created":1726975485,"type":"item","info":{"quality":100}},{"name":"laptop","amount":2,"slot":15,"created":1727494290,"type":"item","info":{"quality":100}},{"name":"cleaningkit","amount":2,"slot":16,"created":1726979635,"type":"item","info":{"quality":100}},{"name":"weapon_knife","amount":1,"slot":17,"created":1726973424,"type":"weapon","info":{"serie":"79hzN2nC992Cdgq","quality":100,"ammo":0}},{"name":"weapon_heavypistol","amount":1,"slot":19,"created":1726973355,"type":"weapon","info":{"serie":"10gFZ5jp607rKnB","quality":100,"ammo":0}},{"name":"screwdriverset","amount":5,"slot":25,"created":1726979635,"type":"item","info":{"quality":100}},{"name":"advancedrepairkit","amount":5,"slot":26,"created":1726979635,"type":"item","info":{"quality":100}},{"name":"whiskey","amount":1,"slot":27,"created":1726976926,"type":"item","info":{"quality":100}},{"name":"phone","amount":1,"slot":28,"created":1727142058,"type":"item","info":{"quality":100}},{"name":"repairkit","amount":7,"slot":29,"created":1726979635,"type":"item","info":{"quality":100}},{"name":"weapon_crowbar","amount":1,"slot":30,"created":1726987910,"type":"weapon","info":{"serie":"04nUF7Ki125oqDd","quality":100,"ammo":0}},{"name":"driver_license","amount":1,"slot":39,"created":1726970651,"type":"item","info":{"type":"Class C Driver License","firstname":"Shawn","birthdate":"1996-04-23","quality":100,"lastname":"Gauci"}},{"name":"id_card","amount":1,"slot":40,"created":1726970654,"type":"item","info":{"gender":0,"firstname":"Shawn","citizenid":"GLD40591","nationality":"USA","birthdate":"1996-04-23","quality":100,"lastname":"Gauci"}}]', '2024-10-22 00:58:57', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":112,"CctvCamera":1726981561,"AnonimTweet":0,"BankHack":0,"SendAllDM":0,"LocationCheck":0,"PhoneCheck":0,"CarLock":0,"LspdActivePersonel":1727141995,"PhonefromName":0}'),
	(208244, 'IIE26687', 1, 'license:b389635bed93356592e1dc2e726f4fc7578223c3', 'Amin Yabut', '{"bank":478230,"cash":72,"crypto":0}', '{"cid":"1","birthdate":"1990-01-01","firstname":"Amin","lastname":"Yabut","nationality":"Canadian","phone":"2262700515","backstory":"placeholder backstory","gender":0,"account":"US02QBCore9921230248"}', '{"payment":75,"onduty":true,"name":"ambulance","type":"ems","label":"EMS","grade":{"level":1,"name":"Paramedic"},"isboss":false}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false,"name":"none"}', '{"x":1700.901123046875,"y":3658.3779296875,"z":34.90771484375}', '{"walletid":"QB-56048811","inside":{"apartment":[]},"licences":{"weapon":false,"business":false,"driver":true},"fitbit":[],"hunger":100,"fingerprint":"nD405u69FfS1301","criminalrecord":{"hasRecord":false},"status":[],"armor":0,"crypto":{"gne":0,"shung":0,"lme":0,"xcoin":0},"bloodtype":"B+","craftingrep":0,"tracker":false,"attachmentcraftingrep":0,"isdead":false,"phone":[],"injail":0,"callsign":"NO CALLSIGN","stress":0,"jailitems":[],"ishandcuffed":false,"dealerrep":0,"inlaststand":false,"thirst":100,"jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":10},"phonedata":{"InstalledApps":[],"SerialNumber":48496569}}', '[{"amount":1,"name":"phone","type":"item","created":1726971922,"info":{"quality":100},"slot":1},{"amount":1,"name":"idcard","type":"item","created":1726971922,"info":{"exp":"2028","dob":"1990-01-01","firstName":"AMIN","lastName":"YABUT","class":"C","cref":"IIE26687","pref":"UNKNOWN","quality":100,"sex":"M"},"slot":2},{"amount":10,"name":"advancedlockpick","type":"item","created":1726974854,"info":{"quality":100},"slot":3},{"amount":1,"name":"weapon_crowbar","type":"weapon","created":1726987910,"info":{"quality":100,"serie":"10AAO9JS987BEBL","ammo":0},"slot":4},{"amount":3,"name":"sandwich","type":"item","created":1727389346,"info":{"quality":100},"slot":5},{"amount":1,"name":"mechanic_tools","type":"item","created":1727528564,"info":{"quality":100},"slot":6},{"amount":1,"name":"casino_vip","type":"item","created":1726982661,"info":{"quality":100},"slot":7},{"amount":5,"name":"tosti","type":"item","created":1727389346,"info":{"quality":100},"slot":8},{"amount":4,"name":"rubber","type":"item","created":1727025428,"info":{"quality":100},"slot":9},{"amount":6,"name":"water_bottle","type":"item","created":1727389346,"info":{"quality":100},"slot":10},{"amount":1,"name":"casino_member","type":"item","created":1726982664,"info":{"quality":100},"slot":11},{"amount":1,"name":"driver_license","type":"item","created":1726978288,"info":{"type":"Class C Driver License","birthdate":"1990-01-01","firstname":"Amin","quality":100,"lastname":"Yabut"},"slot":12},{"amount":4,"name":"advancedrepairkit","type":"item","created":1726979621,"info":{"quality":100},"slot":13},{"amount":1,"name":"weapon_petrolcan","type":"weapon","created":1726983572,"info":{"serie":"85TZa2Vx072pimS","quality":100},"slot":15},{"amount":9,"name":"weed_skunk_seed","type":"item","created":1727394444,"info":{"quality":100},"slot":16},{"amount":1,"name":"weapon_sledgeham","type":"weapon","created":1726988005,"info":{"serie":"14myS2iu883KnRs","quality":100},"slot":17},{"amount":1,"name":"radio","type":"item","created":1726975622,"info":{"quality":100},"slot":18},{"amount":1,"name":"guide","type":"item","created":1726974825,"info":{"quality":100},"slot":19},{"amount":10,"name":"weapon_handcuffs","type":"weapon","created":1726975125,"info":{"serie":"76VZJ0LS352JdrB","quality":100},"slot":20},{"amount":8,"name":"weed_nutrition","type":"item","created":1727394695,"info":{"quality":100},"slot":21},{"amount":25,"name":"empty_weed_bag","type":"item","created":1727394792,"info":{"quality":100},"slot":22},{"amount":1,"name":"toolbox","type":"item","created":1727528568,"info":{"quality":100},"slot":23},{"amount":1,"name":"ducttape","type":"item","created":1727528570,"info":{"quality":100},"slot":24},{"amount":1,"name":"paintcan","type":"item","created":1727528571,"info":{"quality":100},"slot":25},{"amount":1,"name":"tint_supplies","type":"item","created":1727528573,"info":{"quality":100},"slot":26},{"amount":1,"name":"underglow_controller","type":"item","created":1727528575,"info":{"quality":100},"slot":27},{"amount":1,"name":"cleaningkit","type":"item","created":1727528576,"info":{"quality":100},"slot":28},{"amount":1,"name":"sparetire","type":"item","created":1727528578,"info":{"quality":100},"slot":29},{"amount":1,"name":"axleparts","type":"item","created":1727528579,"info":{"quality":100},"slot":30},{"amount":1,"name":"carbattery","type":"item","created":1727528584,"info":{"quality":100},"slot":31},{"amount":1,"name":"sparkplugs","type":"item","created":1727528586,"info":{"quality":100},"slot":32},{"amount":1,"name":"newoil","type":"item","created":1727528588,"info":{"quality":100},"slot":33}]', '2024-09-29 18:17:29', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208253, 'NRD24295', 1, 'license:c3b207200ddf36a09a6d430a8ccd119c71350078', 'lowhood', '{"crypto":0,"cash":150500,"bank":97904860}', '{"gender":0,"phone":"2925827900","lastname":"bob","account":"US08QBCore3244457860","backstory":"placeholder backstory","nationality":"american","birthdate":"1998-05-05","cid":"1","firstname":"billy"}', '{"grade":{"level":0,"name":"Driver"},"label":"Trucker","name":"trucker","payment":50,"isboss":false,"onduty":true,"type":"none"}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":725.063720703125,"y":-1010.7164916992188,"z":29.24609375}', '{"jobrep":{"taxi":0,"trucker":0,"tow":0,"hotdog":0},"jailitems":[],"dealerrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":30769709},"tracker":false,"hunger":78.99999999999636,"status":[],"inside":{"apartment":[]},"licences":{"driver":true,"weapon":false,"business":false},"injail":0,"attachmentcraftingrep":0,"walletid":"QB-40593357","thirst":80.99999999999909,"phone":[],"criminalrecord":{"hasRecord":false},"bloodtype":"AB+","armor":0,"isdead":false,"crypto":{"gne":0,"shung":0,"lme":0,"xcoin":0},"callsign":"NO CALLSIGN","craftingrep":0,"fitbit":[],"stress":0,"fingerprint":"fx540y18yLP8312","inlaststand":false,"ishandcuffed":false}', '[{"name":"phone","info":{"quality":100},"created":1726972329,"amount":1,"type":"item","slot":1},{"name":"weapon_stungun","info":{"quality":100,"serie":"93ZAr0OL603Rjsq","ammo":-1},"created":1726975514,"amount":1,"type":"weapon","slot":2},{"name":"weapon_glock","info":{"quality":100,"serie":"59Yui6MV152VmEo","ammo":0},"created":1726975514,"amount":1,"type":"weapon","slot":3},{"name":"weapon_radargun","info":{"quality":100,"serie":"28KhX8sH923qhai","ammo":0},"created":1726975018,"amount":1,"type":"weapon","slot":4},{"name":"radio","info":{"quality":100},"created":1726975514,"amount":1,"type":"item","slot":5},{"name":"handcuffs","info":{"quality":100},"created":1726975054,"amount":1,"type":"item","slot":6},{"name":"pistol_ammo","info":{"quality":100},"created":1726976056,"amount":2,"type":"item","slot":7},{"name":"sandwich","info":{"quality":100},"created":1726976678,"amount":3,"type":"item","slot":8},{"name":"body_cam","info":{"quality":100},"created":1726975514,"amount":1,"type":"item","slot":9},{"name":"ifaks","info":{"quality":100},"created":1726975514,"amount":1,"type":"item","slot":10},{"name":"water_bottle","info":{"quality":100},"created":1726976678,"amount":1,"type":"item","slot":11},{"name":"weapon_pistolxm3","info":{"quality":100,"serie":"93NyY4um411pdog","ammo":0},"created":1726975032,"amount":1,"type":"weapon","slot":12},{"name":"idcard","info":{"pref":"UNKNOWN","firstName":"BILLY","lastName":"BOB","class":"C","dob":"1998-05-05","sex":"M","quality":100,"exp":"2028","cref":"NRD24295"},"created":1726972329,"amount":1,"type":"item","slot":13},{"name":"tunerlaptop","info":{"quality":100},"created":1726975037,"amount":1,"type":"item","slot":14}]', '2024-09-22 22:40:43', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208238, 'OVS51065', 1, 'license:7073fcdaab9ac3f767005aeae610d27a157816dd', 'Shadows', '{"crypto":0,"bank":959654.0,"cash":861301}', '{"birthdate":"1996-03-20","cid":"1","backstory":"placeholder backstory","phone":"6001148124","nationality":"US","lastname":"Roberts","account":"US09QBCore5757806528","firstname":"Billy","gender":0}', '{"isboss":false,"name":"mechanic","onduty":false,"payment":100,"label":"LS Customs","type":"mechanic","grade":{"level":2,"name":"Experienced"}}', '{"name":"none","label":"No Gang Affiliaton","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-344.0439453125,"y":-765.7055053710938,"z":33.964111328125}', '{"dealerrep":0,"craftingrep":0,"hunger":66.39999999999418,"status":[],"fitbit":[],"stress":0,"armor":0,"inside":{"apartment":[]},"phonedata":{"SerialNumber":60219935,"InstalledApps":[]},"crypto":{"xcoin":0,"gne":0,"lme":0,"shung":0},"inlaststand":false,"criminalrecord":{"hasRecord":false},"thirst":69.59999999999855,"licences":{"weapon":false,"business":false,"driver":true},"jobrep":{"trucker":0,"taxi":0,"hotdog":8,"tow":0},"attachmentcraftingrep":0,"injail":0,"tracker":false,"bloodtype":"AB+","isdead":false,"ishandcuffed":false,"fingerprint":"Sx975f40Fkd7159","phone":[],"jailitems":[],"callsign":"NO CALLSIGN","walletid":"QB-88015151"}', '[{"amount":1,"created":1726971372,"slot":1,"type":"item","info":{"quality":100},"name":"phone"},{"amount":1,"created":1727389376,"slot":2,"type":"item","info":{"quality":100},"name":"miningdrill"},{"amount":1,"created":1726973458,"slot":3,"type":"weapon","info":{"serie":"31Pew4cQ883Nzdx","ammo":-1,"quality":100},"name":"weapon_revolver"},{"amount":1,"created":1726975528,"slot":4,"type":"item","info":{"quality":100},"name":"radio"},{"amount":1,"created":1726973795,"slot":5,"type":"item","info":{"quality":100},"name":"cctv_tablet"},{"amount":1,"created":1727389425,"slot":6,"type":"item","info":{"quality":100},"name":"goldpan"},{"amount":5,"created":1727391240,"slot":7,"type":"item","info":{"quality":100},"name":"advancedlockpick"},{"amount":5,"created":1728249788,"slot":8,"type":"item","info":{"quality":100},"name":"noscan"},{"amount":2,"created":1727491946,"slot":10,"type":"item","info":{"quality":100},"name":"firstaid"},{"amount":1,"created":1727493872,"slot":11,"type":"item","info":{"quality":100},"name":"laptop"},{"amount":1,"created":1727493880,"slot":12,"type":"item","info":{"quality":100},"name":"tunerlaptop"},{"amount":1,"created":1727494150,"slot":13,"type":"item","info":{"quality":100},"name":"samsungphone"},{"amount":11,"created":1726975528,"slot":14,"type":"item","info":{"quality":100},"name":"bandage"},{"amount":9,"created":1727044158,"slot":15,"type":"item","info":{"quality":100},"name":"kurkakola"},{"amount":12,"created":1726976680,"slot":17,"type":"item","info":{"quality":100},"name":"sandwich"},{"amount":1,"created":1726973819,"slot":18,"type":"item","info":{"quality":100},"name":"tablet"},{"amount":13,"created":1726976680,"slot":20,"type":"item","info":{"quality":100},"name":"water_bottle"},{"amount":10,"created":1726987928,"slot":21,"type":"item","info":{"quality":100},"name":"handcuffs"},{"amount":1,"created":1726979628,"slot":22,"type":"item","info":{"quality":100},"name":"screwdriverset"},{"amount":4,"created":1726975528,"slot":23,"type":"item","info":{"quality":100},"name":"armor"},{"amount":11,"created":1726983007,"slot":24,"type":"item","info":{"quality":100},"name":"oxy"},{"amount":96,"created":1727390258,"slot":25,"type":"item","info":{"quality":100},"name":"drillbit"},{"amount":1,"created":1726971372,"slot":26,"type":"item","info":{"class":"C","lastName":"ROBERTS","sex":"M","dob":"1996-03-20","firstName":"BILLY","quality":100,"cref":"OVS51065","pref":"UNKNOWN","exp":"2028"},"name":"idcard"},{"amount":1,"created":1726978545,"slot":27,"type":"item","info":{"firstname":"Billy","lastname":"Roberts","type":"Class C Driver License","birthdate":"1996-03-20","quality":100},"name":"driver_license"},{"amount":9,"created":1727640187,"slot":28,"type":"item","info":{"quality":100},"name":"snikkel_candy"},{"amount":1,"created":1727392982,"slot":29,"type":"item","info":{"quality":100},"name":"diamond_necklace"}]', '2024-10-06 21:34:34', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"PhoneCheck":0,"LocationCheck":0,"xp":112,"LspdActivePersonel":1726974137,"AnonimTweet":0,"BankHack":0,"CarLock":0,"SendAllDM":0,"CctvCamera":1726974640,"PhonefromName":0}'),
	(208628, 'PCT54046', 1, 'license:0eef461066531657ab21a16f2c1132c0966f7b3d', 'Tr1pppy', '{"crypto":1000000,"cash":265674,"bank":1001060}', '{"birthdate":"1986-01-23","account":"US02QBCore2357536341","nationality":"white","lastname":"Stoner","cid":"1","gender":0,"backstory":"placeholder backstory","firstname":"Ryan","phone":"7376611664"}', '{"name":"police","type":"leo","onduty":true,"isboss":true,"grade":{"name":"Chief","level":4},"label":"Law Enforcement","payment":150}', '{"isboss":false,"name":"none","label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":-373.5428466796875,"y":-110.4131851196289,"z":38.6820068359375}', '{"inlaststand":false,"walletid":"QB-36066104","injail":0,"callsign":"NO CALLSIGN","inside":{"apartment":[]},"status":[],"isdead":false,"licences":{"business":false,"driver":true,"weapon":false},"stress":0,"hunger":32.79999999998834,"ishandcuffed":false,"craftingrep":0,"bloodtype":"AB+","dealerrep":0,"criminalrecord":{"hasRecord":false},"thirst":39.19999999999707,"fingerprint":"uL307Y45uUY0662","attachmentcraftingrep":0,"armor":0,"crypto":{"xcoin":0,"gne":0,"lme":0,"shung":0},"phonedata":{"SerialNumber":23521893,"InstalledApps":[]},"jailitems":[],"jobrep":{"taxi":0,"tow":0,"hotdog":0,"trucker":0},"fitbit":[],"tracker":false,"phone":[]}', '[{"name":"weapon_glock","amount":1,"slot":1,"created":1728372464,"type":"weapon","info":{"serie":"91TwO4mO329PbPT","quality":100,"ammo":61}},{"name":"weapon_flashlight","amount":1,"slot":2,"created":1728372411,"type":"weapon","info":{"quality":100,"serie":"32MvZ1Vt941vQsO"}},{"name":"radio","amount":1,"slot":3,"created":1727130408,"type":"item","info":{"quality":100}},{"name":"ifaks","amount":6,"slot":4,"created":1727130408,"type":"item","info":{"quality":100}},{"name":"handcuffs","amount":1,"slot":5,"created":1727130499,"type":"item","info":{"quality":100}},{"name":"rifle_ammo","amount":14,"slot":6,"created":1728372487,"type":"item","info":{"quality":100}},{"name":"bandage","amount":4,"slot":7,"created":1728372438,"type":"item","info":{"quality":100}},{"name":"body_cam","amount":1,"slot":8,"created":1727131716,"type":"item","info":{"quality":100}},{"name":"idcard","amount":1,"slot":9,"created":1727038260,"type":"item","info":{"sex":"M","lastName":"STONER","cref":"PCT54046","dob":"1986-01-23","pref":"UNKNOWN","class":"C","exp":"2028","quality":100,"firstName":"RYAN"}},{"name":"weapon_nightstick","amount":1,"slot":10,"created":1728372411,"type":"weapon","info":{"quality":100,"serie":"47tzp1zP545Hykw"}},{"name":"phone","amount":1,"slot":15,"created":1727038260,"type":"item","info":{"quality":100}}]', '2024-10-24 10:49:35', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208651, 'QSX71219', 1, 'license:55ac1a3cff50981a444d4f1e37c6abee65d024c3', 'Cire Notrevo', '{"crypto":0,"cash":500,"bank":5040}', '{"gender":1,"phone":"3375163168","lastname":"Devil","account":"US01QBCore8364447488","backstory":"placeholder backstory","nationality":"Demon","birthdate":"1969-04-04","firstname":"Sarah","cid":"1"}', '{"grade":{"level":0,"name":"Freelancer"},"label":"Civilian","payment":10,"onduty":true,"isboss":false,"name":"unemployed","type":"none"}', '{"grade":{"level":0,"name":"none"},"isboss":false,"label":"No Gang Affiliaton","name":"none"}', '{"x":-428.1494445800781,"y":-993.8241577148438,"z":37.148681640625}', '{"jobrep":{"taxi":0,"hotdog":0,"tow":0,"trucker":0},"injail":0,"dealerrep":0,"phonedata":{"SerialNumber":81508323,"InstalledApps":[]},"tracker":false,"craftingrep":0,"status":[],"crypto":{"gne":0,"xcoin":0,"lme":0,"shung":0},"licences":{"driver":true,"weapon":false,"business":false},"inside":{"apartment":[]},"attachmentcraftingrep":0,"walletid":"QB-63165362","thirst":73.39999999999873,"phone":[],"criminalrecord":{"hasRecord":false},"bloodtype":"O-","armor":0,"isdead":true,"stress":0,"fingerprint":"QJ341n72Cpc3461","callsign":"NO CALLSIGN","fitbit":[],"ishandcuffed":false,"jailitems":[],"inlaststand":false,"hunger":70.5999999999949}', '[{"name":"phone","info":{"quality":100},"created":1727041226,"amount":1,"type":"item","slot":1},{"name":"idcard","info":{"pref":"UNKNOWN","firstName":"SARAH","cref":"QSX71219","class":"C","dob":"1969-04-04","sex":"M","quality":100,"exp":"2028","lastName":"DEVIL"},"created":1727041226,"amount":1,"type":"item","slot":2}]', '2024-09-22 22:22:08', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208529, 'VEW72732', 1, 'license:bee8dfaeb88755a2702467d968b729360f9f7b2a', 'mattherbz287', '{"bank":5710,"cash":500,"crypto":0}', '{"gender":0,"birthdate":"1990-05-05","account":"US02QBCore1418708945","lastname":"longcocker","nationality":"indian","phone":"3977747569","backstory":"placeholder backstory","firstname":"johnnyy","cid":"1"}', '{"payment":125,"onduty":true,"isboss":false,"type":"leo","label":"Law Enforcement","grade":{"level":3,"name":"Lieutenant"},"name":"police"}', '{"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","name":"none","isboss":false}', '{"x":404.4791259765625,"y":-981.2703247070313,"z":29.2967529296875}', '{"walletid":"QB-32334025","inside":{"apartment":[]},"licences":{"driver":true,"business":false,"weapon":false},"fitbit":[],"hunger":83.19999999999709,"phonedata":{"InstalledApps":[],"SerialNumber":50107423},"criminalrecord":{"hasRecord":false},"status":[],"armor":0,"crypto":{"gne":0,"lme":0,"shung":0,"xcoin":0},"attachmentcraftingrep":0,"jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":0},"bloodtype":"A-","tracker":false,"thirst":84.79999999999927,"phone":[],"injail":0,"callsign":"NO CALLSIGN","isdead":false,"jailitems":[],"ishandcuffed":false,"dealerrep":0,"inlaststand":true,"stress":0,"craftingrep":0,"fingerprint":"ci833e68aOz3426"}', '[{"amount":1,"name":"phone","type":"item","created":1727027384,"info":{"quality":100},"slot":1},{"amount":1,"name":"idcard","type":"item","created":1727027384,"info":{"exp":"2028","dob":"1990-05-05","firstName":"JOHNNYY","lastName":"LONGCOCKER","class":"C","cref":"VEW72732","pref":"UNKNOWN","quality":100,"sex":"M"},"slot":2}]', '2024-09-28 17:46:16', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}'),
	(208687, 'VNZ37743', 2, 'license:55ac1a3cff50981a444d4f1e37c6abee65d024c3', 'Cire Notrevo', '{"crypto":0,"cash":6554965,"bank":5080}', '{"gender":0,"phone":"5773394718","lastname":"Head","account":"US05QBCore5248609397","backstory":"placeholder backstory","nationality":"YO DADDY","firstname":"Richard","cid":"2","birthdate":"1969-01-01"}', '{"type":"none","label":"Civilian","onduty":true,"name":"unemployed","isboss":false,"payment":10,"grade":{"name":"Freelancer","level":0}}', '{"name":"none","isboss":false,"label":"No Gang Affiliaton","grade":{"name":"none","level":0}}', '{"x":-450.989013671875,"y":-730.0087890625,"z":37.7890625}', '{"jobrep":{"taxi":0,"trucker":0,"tow":0,"hotdog":0},"injail":0,"dealerrep":0,"phonedata":{"SerialNumber":44936779,"InstalledApps":[]},"tracker":false,"craftingrep":0,"status":[],"hunger":74.79999999999564,"licences":{"weapon":false,"business":false,"driver":true},"stress":0,"attachmentcraftingrep":0,"walletid":"QB-25101239","thirst":77.19999999999891,"phone":[],"criminalrecord":{"hasRecord":false},"bloodtype":"A-","armor":0,"isdead":false,"crypto":{"gne":0,"shung":0,"lme":0,"xcoin":0},"jailitems":[],"ishandcuffed":false,"fitbit":[],"callsign":"NO CALLSIGN","fingerprint":"MQ054T78hUi5175","inlaststand":true,"inside":{"apartment":[]}}', '[{"name":"phone","info":{"quality":100},"created":1727043900,"amount":1,"type":"item","slot":1},{"name":"idcard","info":{"pref":"UNKNOWN","firstName":"RICHARD","cref":"VNZ37743","class":"C","dob":"1969-01-01","sex":"M","quality":100,"exp":"2028","lastName":"HEAD"},"created":1727043900,"amount":1,"type":"item","slot":2},{"name":"advancedlockpick","info":{"quality":100},"created":1727045144,"amount":18,"type":"item","slot":3}]', '2024-09-22 23:37:23', 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{"xp":100,"LspdActivePersonel":0,"PhoneCheck":0,"PhonefromName":0,"CctvCamera":0,"AnonimTweet":0,"CarLock":0,"LocationCheck":0,"BankHack":0,"SendAllDM":0}');

-- Dumping structure for table s1_origenv2qb.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.playerskins: ~10 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(55, 'ZEN90470', '1885233650', '{"beard":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":13},"chimp_bone_width":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"cheek_1":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"ageing":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"pants":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":144},"torso2":{"defaultTexture":0,"texture":3,"defaultItem":0,"item":414},"chimp_hole":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"facemix":{"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0,"skinMix":0},"t-shirt":{"defaultTexture":0,"texture":0,"defaultItem":1,"item":229},"decals":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"face2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"neck_thikness":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"arms":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":1},"eye_opening":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"face":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"shoes":{"defaultTexture":0,"texture":3,"defaultItem":1,"item":107},"chimp_bone_lenght":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"lips_thickness":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_0":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"jaw_bone_back_lenght":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"makeup":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"moles":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"ear":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":9},"mask":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"bracelet":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"eyebrown_high":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"eye_color":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":-1},"lipstick":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"cheek_3":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"bag":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_5":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_4":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_3":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"nose_1":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"chimp_bone_lowering":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"vest":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"eyebrown_forward":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"accessory":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":12},"hair":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":12},"watch":{"defaultTexture":0,"texture":0,"defaultItem":-1,"item":14},"jaw_bone_width":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"hat":{"defaultTexture":0,"texture":4,"defaultItem":-1,"item":106},"blush":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":-1},"cheek_2":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"glass":{"defaultTexture":0,"texture":0,"defaultItem":0,"item":0},"eyebrows":{"defaultTexture":1,"texture":1,"defaultItem":-1,"item":30}}', 1),
	(57, 'EKJ79332', '797459875', '{"eyebrown_high":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"shapeMix":0,"defaultShapeMix":0.0},"pants":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"hat":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"beard":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"moles":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"eye_opening":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bag":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"ear":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"nose_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_back_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"vest":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"face2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"arms":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"glass":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"hair":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"watch":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lenght":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eye_color":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"decals":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"face":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"blush":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"shoes":{"texture":0,"item":1,"defaultTexture":0,"defaultItem":1},"chimp_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"nose_5":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"makeup":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"cheek_3":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"nose_0":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"ageing":{"texture":0,"item":-1,"defaultTexture":0,"defaultItem":-1},"neck_thikness":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"texture":1,"item":-1,"defaultTexture":1,"defaultItem":-1},"accessory":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"mask":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0},"torso2":{"texture":0,"item":0,"defaultTexture":0,"defaultItem":0}}', 1),
	(58, 'OVS51065', '-1275859404', '{"face":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"moles":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"blush":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"accessory":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"mask":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"shoes":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":1},"beard":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"nose_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"ear":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":-1},"nose_4":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lipstick":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"nose_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"face2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_color":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":-1},"cheek_1":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"neck_thikness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrown_forward":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_0":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"makeup":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"chimp_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_bone_lowering":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bag":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"nose_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hat":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"eyebrown_high":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"glass":{"texture":0,"defaultTexture":0,"item":1,"defaultItem":0},"decals":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"lips_thickness":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"torso2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eye_opening":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"cheek_2":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"cheek_3":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"hair":{"texture":1,"defaultTexture":0,"item":0,"defaultItem":0},"chimp_hole":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"eyebrows":{"texture":1,"defaultTexture":1,"item":-1,"defaultItem":-1},"pants":{"texture":1,"defaultTexture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"watch":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":-1},"jaw_bone_width":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"bracelet":{"texture":0,"defaultTexture":0,"item":-1,"defaultItem":-1},"nose_5":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"ageing":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":-1},"t-shirt":{"texture":0,"defaultTexture":0,"item":2,"defaultItem":1},"arms":{"texture":0,"defaultTexture":0,"item":0,"defaultItem":0},"vest":{"texture":2,"defaultTexture":0,"item":1,"defaultItem":0},"facemix":{"skinMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0}}', 1),
	(60, 'NRD24295', '2141384740', '{"torso2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hat":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"bracelet":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"beard":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"facemix":{"skinMix":0,"defaultSkinMix":0.0,"shapeMix":0,"defaultShapeMix":0.0},"mask":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"shoes":{"texture":0,"defaultItem":1,"item":1,"defaultTexture":0},"nose_4":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"lips_thickness":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"ear":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"glass":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"blush":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"chimp_bone_lenght":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"makeup":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"accessory":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"lipstick":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"nose_2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"face":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"arms":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"vest":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_3":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"t-shirt":{"texture":0,"defaultItem":1,"item":1,"defaultTexture":0},"neck_thikness":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_hole":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrown_high":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"cheek_1":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eye_opening":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_lowering":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"pants":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"jaw_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"watch":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"moles":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"nose_5":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"decals":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"nose_0":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"eye_color":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"cheek_3":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"ageing":{"texture":0,"defaultItem":-1,"item":-1,"defaultTexture":0},"eyebrows":{"texture":1,"defaultItem":-1,"item":-1,"defaultTexture":1},"bag":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"hair":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0},"face2":{"texture":0,"defaultItem":0,"item":0,"defaultTexture":0}}', 1),
	(64, 'VNZ37743', '-1222037748', '{"face":{"defaultTexture":0,"defaultItem":0,"item":4,"texture":4},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"hair":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"skinMix":0.67,"defaultShapeMix":0.0,"defaultSkinMix":0.0,"shapeMix":0.49},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"watch":{"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"moles":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"glass":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":1,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"ear":{"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1}}', 1),
	(65, 'CYZ72802', '1885233650', '{"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hair":{"defaultTexture":0,"defaultItem":0,"item":34,"texture":2},"moles":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":21,"texture":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"defaultShapeMix":0.0,"skinMix":0,"defaultSkinMix":0.0,"shapeMix":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":50,"texture":1},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":11,"texture":1},"pants":{"defaultTexture":0,"defaultItem":0,"item":7,"texture":0},"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":2,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":12,"texture":1},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":20,"texture":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":153,"texture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"watch":{"defaultTexture":0,"defaultItem":-1,"item":6,"texture":1},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":103,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":58,"texture":1},"torso2":{"defaultTexture":0,"defaultItem":0,"item":632,"texture":0},"glass":{"defaultTexture":0,"defaultItem":0,"item":52,"texture":1},"arms":{"defaultTexture":0,"defaultItem":0,"item":36,"texture":0}}', 1),
	(66, 'DIE20179', '1146800212', '{"arms":{"item":1,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"accessory":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"beard":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"pants":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"torso2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eye_opening":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lipstick":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"bracelet":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"neck_thikness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_4":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"blush":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"nose_5":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrows":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"cheek_1":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"hair":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"watch":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"chimp_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"vest":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"hat":{"item":0,"defaultTexture":0,"defaultItem":-1,"texture":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"t-shirt":{"item":1,"defaultTexture":0,"defaultItem":1,"texture":0},"eye_color":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"chimp_hole":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"glass":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"ear":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"eyebrown_high":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"lips_thickness":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"face":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"cheek_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"facemix":{"defaultShapeMix":0.0,"defaultSkinMix":0.0,"skinMix":0.32,"shapeMix":0.24},"cheek_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"makeup":{"item":-1,"defaultTexture":1,"defaultItem":-1,"texture":1},"nose_3":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_2":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"nose_0":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"mask":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"moles":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"bag":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"decals":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"item":0,"defaultTexture":0,"defaultItem":0,"texture":0},"ageing":{"item":-1,"defaultTexture":0,"defaultItem":-1,"texture":0},"shoes":{"item":1,"defaultTexture":0,"defaultItem":1,"texture":0}}', 1),
	(70, 'VEW72732', '-1868718465', '{"pants":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eye_color":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"decals":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bag":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_0":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eye_opening":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"lipstick":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"facemix":{"shapeMix":0,"defaultShapeMix":0.0,"skinMix":0,"defaultSkinMix":0.0},"glass":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"watch":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"ageing":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"nose_5":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"arms":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"beard":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"lips_thickness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"jaw_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"vest":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"ear":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"face2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"t-shirt":{"defaultTexture":0,"item":1,"defaultItem":1,"texture":0},"blush":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"nose_4":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"bracelet":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"moles":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"torso2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_bone_width":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"shoes":{"defaultTexture":0,"item":1,"defaultItem":1,"texture":0},"face":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"accessory":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"neck_thikness":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"chimp_hole":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"hair":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"nose_3":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"makeup":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"nose_1":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"eyebrows":{"defaultTexture":1,"item":-1,"defaultItem":-1,"texture":1},"hat":{"defaultTexture":0,"item":-1,"defaultItem":-1,"texture":0},"mask":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0},"cheek_2":{"defaultTexture":0,"item":0,"defaultItem":0,"texture":0}}', 1),
	(73, 'IIE26687', '1888624839', '{"arms":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"texture":1,"item":-1},"ear":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"blush":{"defaultTexture":1,"defaultItem":-1,"texture":1,"item":-1},"makeup":{"defaultTexture":1,"defaultItem":-1,"texture":1,"item":-1},"nose_2":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"texture":0,"item":1},"cheek_3":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"beard":{"defaultTexture":1,"defaultItem":-1,"texture":1,"item":-1},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"shoes":{"defaultTexture":0,"defaultItem":1,"texture":0,"item":1},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"decals":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"bag":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"vest":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"torso2":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"facemix":{"shapeMix":0,"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0},"ageing":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"bracelet":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"cheek_2":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"hair":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"accessory":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"mask":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"face2":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"face":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":3},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"hat":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"texture":1,"item":-1},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"moles":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"pants":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"watch":{"defaultTexture":0,"defaultItem":-1,"texture":0,"item":-1},"glass":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"texture":0,"item":0}}', 1),
	(74, 'GLD40591', '1728056212', '{"t-shirt":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":1},"arms":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"facemix":{"defaultShapeMix":0.0,"shapeMix":0,"defaultSkinMix":0.0,"skinMix":0},"chimp_bone_width":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"moles":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"pants":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"hair":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"face2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_5":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_1":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"blush":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"cheek_2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"face":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":0},"ageing":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"makeup":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"nose_4":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"neck_thikness":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"accessory":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bag":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"lipstick":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"hat":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"watch":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"lips_thickness":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"bracelet":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"mask":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"torso2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_0":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"ear":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"decals":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"shoes":{"item":1,"defaultTexture":0,"texture":0,"defaultItem":1},"nose_2":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_3":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eye_color":{"item":-1,"defaultTexture":0,"texture":0,"defaultItem":-1},"vest":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eye_opening":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"jaw_bone_back_lenght":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"cheek_3":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"glass":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrown_high":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"nose_1":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_hole":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0,"defaultTexture":0,"texture":0,"defaultItem":0},"eyebrows":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1},"beard":{"item":-1,"defaultTexture":1,"texture":1,"defaultItem":-1}}', 1),
	(77, 'PCT54046', '1885233650', '{"decals":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"lipstick":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"arms":{"defaultTexture":0,"texture":0,"item":1,"defaultItem":0},"vest":{"defaultTexture":0,"texture":1,"item":71,"defaultItem":0},"eyebrows":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"eyebrown_high":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"chimp_hole":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"chimp_bone_lowering":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_4":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_0":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"beard":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"nose_5":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_color":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"moles":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"jaw_bone_width":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"hat":{"defaultTexture":0,"texture":3,"item":21,"defaultItem":-1},"glass":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"torso2":{"defaultTexture":0,"texture":18,"item":511,"defaultItem":0},"mask":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eye_opening":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"nose_1":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"blush":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"nose_2":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"eyebrown_forward":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"facemix":{"shapeMix":0,"defaultShapeMix":0.0,"defaultSkinMix":0.0,"skinMix":0},"cheek_2":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"pants":{"defaultTexture":0,"texture":0,"item":10,"defaultItem":0},"makeup":{"defaultTexture":1,"texture":1,"item":-1,"defaultItem":-1},"watch":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"lips_thickness":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"face":{"defaultTexture":0,"texture":0,"item":3,"defaultItem":0},"shoes":{"defaultTexture":0,"texture":0,"item":10,"defaultItem":1},"chimp_bone_lenght":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"cheek_3":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"face2":{"defaultTexture":0,"texture":0,"item":3,"defaultItem":0},"bracelet":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"ageing":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"nose_3":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"ear":{"defaultTexture":0,"texture":0,"item":-1,"defaultItem":-1},"hair":{"defaultTexture":0,"texture":0,"item":2,"defaultItem":0},"neck_thikness":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"cheek_1":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"chimp_bone_width":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"bag":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"accessory":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"jaw_bone_back_lenght":{"defaultTexture":0,"texture":0,"item":0,"defaultItem":0},"t-shirt":{"defaultTexture":0,"texture":0,"item":15,"defaultItem":1}}', 1);

-- Dumping structure for table s1_origenv2qb.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.player_contacts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.player_gallery: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.player_garages
CREATE TABLE IF NOT EXISTS `player_garages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `garage` varchar(50) NOT NULL,
  `garage_type` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` varchar(50) DEFAULT '{}',
  `permissions` varchar(50) DEFAULT '{}',
  `time_of_purchase` varchar(50) DEFAULT NULL,
  `slots` int(11) unsigned zerofill DEFAULT NULL,
  `tier` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `garage` (`garage`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.player_garages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.player_houses: ~0 rows (approximately)
INSERT INTO `player_houses` (`id`, `house`, `identifier`, `citizenid`, `keyholders`, `decorations`, `stash`, `outfit`, `logout`) VALUES
	(1, 'south rockford dr1', 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', '["ZEN90470"]', NULL, NULL, NULL, NULL);

-- Dumping structure for table s1_origenv2qb.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.player_jobs: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.player_mails: ~22 rows (approximately)
INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(53, 'ZEN90470', 'Jonathan Sanders', 'New Crypto Miner', 'Congrats on the crypto miner. Want some info? The default GTX 480 is very slow, I reccomend to install a newer and more powerfull graphics card for faster mining speeds. This industry can be very lucriticve and volatile. Good luck, Johnny', 0, 118991, '2024-06-21 01:42:03', NULL),
	(54, 'ZEN90470', 'Jonathan Sanders', 'New Graphics Card', 'Congrats on the new graphics card. Make the most out of it, it is one profitable side hustle or buisness. Congrats, Johnny', 0, 203912, '2024-06-21 01:43:20', NULL),
	(55, 'ZEN90470', 'Turner’s Auto Wrecking', 'Vehicle List', 'You Can Only Demolish A Number Of Vehicles.<br />You Can Keep Everything You Demolish For Yourself As Long As You Dont Bother Me.<br /><br /><strong>Vehicle List:</strong><br />Ocelot Jackal<br />Dundreary Stretch<br />Grotti Turismo R<br />Übermacht Zion<br />Albany Washington<br />Vapid Dominator<br />Declasse Asea<br />Lampadati Felon<br />Cheval Picador<br />Albany Cavalcade II<br />Declasse Rhapsody<br />Karin Sultan<br />Maxwell Asbo<br />Albany Virgo<br />Vapid Blade<br />Declasse Sabre GT Turbo<br />Dewbauchee Exemplar<br />Bravado Buffalo S<br />Vapid Bobcat XL Open<br />Bravado Gauntlet<br />Obey 9F<br />Bravado Buffalo<br />Dinka Blista Compact<br />Dundreary Landstalker<br />Pfister Comet<br />Übermacht Oracle<br />Vapid Sandking SWB<br />Bravado Banshee<br />Nagasaki Carbon RS<br />Albany Alpha<br />', 0, 248117, '2024-06-21 20:38:16', '[]'),
	(56, 'ZEN90470', 'The Boss', 'New Target', 'So you are intrested in making some money? good... go get yourself a Gun and make it happen... sending you the location now.', 0, 721550, '2024-06-21 21:23:49', NULL),
	(57, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Billy Roberts<br />Phone Number: <strong>6001148124</strong><br><br>Kind regards,<br>Township Los Santos', 0, 597197, '2024-09-22 04:00:19', '[]'),
	(58, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Billy Roberts<br />Phone Number: <strong>6001148124</strong><br><br>Kind regards,<br>Township Los Santos', 0, 484929, '2024-09-22 04:00:19', '[]'),
	(59, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Billy Roberts<br />Phone Number: <strong>6001148124</strong><br><br>Kind regards,<br>Township Los Santos', 0, 233263, '2024-09-22 04:00:19', '[]'),
	(60, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Amin Yabut<br />Phone Number: <strong>2262700515</strong><br><br>Kind regards,<br>Township Los Santos', 0, 528951, '2024-09-22 04:00:29', '[]'),
	(61, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Amin Yabut<br />Phone Number: <strong>2262700515</strong><br><br>Kind regards,<br>Township Los Santos', 0, 454703, '2024-09-22 04:00:29', '[]'),
	(62, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Amin Yabut<br />Phone Number: <strong>2262700515</strong><br><br>Kind regards,<br>Township Los Santos', 0, 283208, '2024-09-22 04:00:29', '[]'),
	(63, 'GLD40591', 'Billing Department', 'Invoice Declined', 'Invoice Has Been Declined From Leeeroy jenskin In The Amount Of $20000', 0, 634449, '2024-09-23 02:44:56', NULL),
	(64, 'GLD40591', 'Billing Department', 'Invoice Declined', 'Invoice Has Been Declined From Leeeroy jenskin In The Amount Of $5000', 0, 346812, '2024-09-23 02:44:57', NULL),
	(65, 'GLD40591', NULL, NULL, NULL, 0, 689477, '2024-09-23 02:45:19', NULL),
	(66, 'GLD40591', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Amin Yabut In The Amount Of $20000', 0, 670048, '2024-09-23 02:45:19', NULL),
	(67, 'IIE26687', 'Jonathan Sanders', 'New Crypto Miner', 'Congrats on the crypto miner. Want some info? The default GTX 480 is very slow, I reccomend to install a newer and more powerfull graphics card for faster mining speeds. This industry can be very lucriticve and volatile. Good luck, Johnny', 0, 319144, '2024-09-28 13:15:10', NULL),
	(68, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 264248, '2024-09-28 21:16:09', '[]'),
	(69, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 861164, '2024-09-28 21:16:09', '[]'),
	(70, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 877058, '2024-09-28 21:16:09', '[]'),
	(71, 'EKJ79332', 'Turner’s Auto Wrecking', 'Vehicle List', 'You Can Only Demolish A Number Of Vehicles.<br />You Can Keep Everything You Demolish For Yourself As Long As You Dont Bother Me.<br /><br /><strong>Vehicle List:</strong><br />Vapid Stanier<br />Grotti Turismo R<br />Albany Washington<br />Bravado Banshee<br />Bollokan Prairie<br />Gallivanter Baller<br />Benefactor Panto<br />Dinka Akuma<br />Benefactor Feltzer<br />Übermacht Zion<br />Obey 9F Cabrio<br />Enus Cognoscenti<br />Ocelot Jackal<br />Übermacht Oracle XS<br />Bravado Buffalo S<br />Dundreary Stretch<br />Vapid Sandking XL<br />Dinka Blista<br />Declasse Asea<br />Pfister Comet<br />Vapid Bobcat XL Open<br />Benefactor Schwartzer<br />Gallivanter Baller II<br />Ratloader2 Ratloader<br />Imponte Ruiner<br />Pegassi Bati 801<br />Benefactor Serrano<br />Albany Cavalcade<br />Übermacht Oracle<br />', 0, 407203, '2024-09-29 19:35:06', '[]'),
	(72, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 323812, '2024-09-29 20:30:11', '[]'),
	(73, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 878023, '2024-09-29 20:30:11', '[]'),
	(74, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Leeeroy jenskin<br />Phone Number: <strong>7314802134</strong><br><br>Kind regards,<br>Township Los Santos', 0, 392230, '2024-09-29 20:30:11', '[]');

-- Dumping structure for table s1_origenv2qb.player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.player_notes: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.player_outfits: ~4 rows (approximately)
INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
	(3, 'OVS51065', 'Billy', '-1275859404', '{"hair":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":1},"face2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eye_color":{"defaultItem":-1,"defaultTexture":0,"item":1,"texture":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"watch":{"defaultItem":-1,"defaultTexture":0,"item":0,"texture":0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"beard":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"arms":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"accessory":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"torso2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"lipstick":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"pants":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":1},"bag":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"facemix":{"defaultSkinMix":0.0,"defaultShapeMix":0.0,"skinMix":0,"shapeMix":0},"glass":{"defaultItem":0,"defaultTexture":0,"item":1,"texture":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"face":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"decals":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"ageing":{"defaultItem":-1,"defaultTexture":0,"item":0,"texture":0},"mask":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"vest":{"defaultItem":0,"defaultTexture":0,"item":1,"texture":2},"t-shirt":{"defaultItem":1,"defaultTexture":0,"item":2,"texture":0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"hat":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"bracelet":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"blush":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"makeup":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"ear":{"defaultItem":-1,"defaultTexture":0,"item":0,"texture":0},"moles":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"shoes":{"defaultItem":1,"defaultTexture":0,"item":1,"texture":0}}', 'outfit-5-6898'),
	(4, 'VEW72732', '', '2114544056', '{"eye_color":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"pants":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"arms":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"facemix":{"defaultShapeMix":0.0,"shapeMix":0,"defaultSkinMix":0.0,"skinMix":0},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"face2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"beard":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"hair":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"t-shirt":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0}}', 'outfit-6-1467'),
	(5, 'PCT54046', 'afds', '1885233650', '{"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hair":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0,"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0},"t-shirt":{"item":10,"texture":0,"defaultTexture":0,"defaultItem":1},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"makeup":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"arms":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"beard":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"eye_color":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"shoes":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":1},"watch":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face2":{"item":1,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":2,"texture":0,"defaultTexture":0,"defaultItem":0},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0}}', 'outfit-6-5009'),
	(6, 'CYZ72802', 'Fitone', '1885233650', '{"bracelet":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"eye_color":{"item":20,"texture":0,"defaultTexture":0,"defaultItem":-1},"hair":{"item":34,"texture":2,"defaultTexture":0,"defaultItem":0},"facemix":{"shapeMix":0,"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0},"t-shirt":{"item":103,"texture":0,"defaultTexture":0,"defaultItem":1},"eye_opening":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"pants":{"item":7,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrows":{"item":12,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_5":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"makeup":{"item":58,"texture":1,"defaultTexture":1,"defaultItem":-1},"nose_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"glass":{"item":52,"texture":1,"defaultTexture":0,"defaultItem":0},"eyebrown_forward":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"lips_thickness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_hole":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"arms":{"item":36,"texture":0,"defaultTexture":0,"defaultItem":0},"torso2":{"item":632,"texture":0,"defaultTexture":0,"defaultItem":0},"eyebrown_high":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_0":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"hat":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"beard":{"item":11,"texture":1,"defaultTexture":1,"defaultItem":-1},"lipstick":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"jaw_bone_back_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_2":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"cheek_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ageing":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"shoes":{"item":153,"texture":0,"defaultTexture":0,"defaultItem":1},"chimp_bone_lenght":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"bag":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"watch":{"item":6,"texture":1,"defaultTexture":0,"defaultItem":-1},"mask":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"jaw_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"decals":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face2":{"item":2,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"moles":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"cheek_3":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_1":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"accessory":{"item":50,"texture":1,"defaultTexture":0,"defaultItem":0},"chimp_bone_lowering":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"face":{"item":21,"texture":0,"defaultTexture":0,"defaultItem":0},"blush":{"item":-1,"texture":1,"defaultTexture":1,"defaultItem":-1},"vest":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"ear":{"item":-1,"texture":0,"defaultTexture":0,"defaultItem":-1},"neck_thikness":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"nose_4":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0},"chimp_bone_width":{"item":0,"texture":0,"defaultTexture":0,"defaultItem":0}}', 'outfit-4-2434'),
	(7, 'PCT54046', 'True Ci', '1885233650', '{"facemix":{"defaultSkinMix":0.0,"shapeMix":0,"defaultShapeMix":0.0,"skinMix":0},"nose_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"makeup":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"decals":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"blush":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"eyebrown_high":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"beard":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"jaw_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"vest":{"defaultItem":0,"texture":2,"item":75,"defaultTexture":0},"pants":{"defaultItem":0,"texture":0,"item":10,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"shoes":{"defaultItem":1,"texture":0,"item":10,"defaultTexture":0},"nose_0":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":1,"item":31,"defaultTexture":0},"face":{"defaultItem":0,"texture":0,"item":3,"defaultTexture":0},"cheek_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ear":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"nose_5":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"bag":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"arms":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"accessory":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"neck_thikness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"t-shirt":{"defaultItem":1,"texture":0,"item":15,"defaultTexture":0},"mask":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"watch":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"nose_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"glass":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"face2":{"defaultItem":0,"texture":0,"item":3,"defaultTexture":0},"nose_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eye_color":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hair":{"defaultItem":0,"texture":0,"item":2,"defaultTexture":0},"bracelet":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"lipstick":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"eye_opening":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"moles":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"cheek_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ageing":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"torso2":{"defaultItem":0,"texture":5,"item":511,"defaultTexture":0}}', 'outfit-10-5979');

-- Dumping structure for table s1_origenv2qb.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `damage` longtext DEFAULT NULL,
  `mods` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT 'pillboxgarage',
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `globals` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `vin_scratch` int(11) DEFAULT 0,
  `timestamp` varchar(500) DEFAULT '0',
  `datefinish` date NOT NULL DEFAULT '2025-06-01',
  `rentfinish` date NOT NULL DEFAULT '2025-06-01',
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `logs` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_playervehicles_plate` (`plate`) USING BTREE,
  KEY `plate` (`plate`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE,
  KEY `license` (`license`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.player_vehicles: ~21 rows (approximately)
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `damage`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `globals`, `vin_scratch`, `timestamp`, `datefinish`, `rentfinish`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `logs`) VALUES
	(39, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'KYE11753', 't20', '1663218586', NULL, '{"tyreSmokeColor":[255,255,255],"model":1663218586,"modVanityPlate":-1,"modPlateHolder":-1,"modTank":-1,"bodyHealth":1000.0592475178704,"modFrontBumper":-1,"modKit21":-1,"modStruts":-1,"modRightFender":-1,"interiorColor":0,"modFrame":-1,"modBackWheels":-1,"modSeats":-1,"engineHealth":1000.0592475178704,"modShifterLeavers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"46TFK463","modTrimA":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"tankHealth":1000.0592475178704,"modAPlate":-1,"modBrakes":-1,"pearlescentColor":3,"modTurbo":false,"modExhaust":-1,"modKit17":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modTransmission":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"extras":[],"modCustomTiresF":false,"modOrnaments":-1,"modSmokeEnabled":false,"dirtLevel":0.0,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"liveryRoof":-1,"modRearBumper":-1,"modKit19":-1,"color1":7,"windowTint":-1,"modEngine":-1,"color2":7,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"wheelColor":0,"modSteeringWheel":-1,"fuelLevel":44.48238114455976,"modSideSkirt":-1,"oilLevel":4.76596940834568,"modCustomTiresR":false,"wheels":7,"modHorns":-1,"modXenon":false,"neonColor":[255,255,255],"modDoorSpeaker":-1,"xenonColor":255,"wheelSize":0.0,"modArmor":-1,"modSuspension":-1,"modSpeakers":-1,"modSpoilers":-1,"modDashboard":-1,"wheelWidth":0.0,"modKit49":-1,"modAirFilter":-1,"modRoof":-1,"modDial":-1,"modHood":-1,"modWindows":-1,"modKit47":-1,"modTrunk":-1,"modLivery":-1,"modTrimB":-1,"dashboardColor":0,"plateIndex":0,"modFender":-1,"modEngineBlock":-1,"modHydrolic":-1,"modAerials":-1,"modGrille":-1}', '46TFK463', NULL, 'ApartmentsGarage', 44, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"type":"Stored","garage":"Alta Apartments","time":"2024-06-20-21:34"}]'),
	(40, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 'sultan2', '872704284', NULL, '{"modNitrous":-1,"modVanityPlate":-1,"wheelColor":156,"modFrame":-1,"modEngine":-1,"modTrunk":-1,"modTurbo":false,"wheelWidth":0.0,"modRoof":-1,"modXenon":false,"dirtLevel":0,"bodyHealth":1000,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"plate":"45RQM994","modTank":-1,"oilLevel":5,"extras":[],"color1":50,"modWindows":-1,"neonColor":[255,255,255],"modRearBumper":-1,"modTrimA":-1,"modSideSkirt":-1,"paintType2":0,"color2":50,"xenonColor":255,"engineHealth":1000,"modOrnaments":-1,"wheels":5,"modStruts":-1,"modTrimB":-1,"modGrille":-1,"modArmor":-1,"modCustomTiresF":false,"modSuspension":-1,"modSubwoofer":-1,"modDial":-1,"tyres":[],"modSeats":-1,"modFender":-1,"windows":[4,5],"modExhaust":-1,"wheelSize":0.0,"modFrontWheels":-1,"modBrakes":-1,"modRoofLivery":-1,"modDoorSpeaker":-1,"modSpoilers":-1,"fuelLevel":50,"doors":[],"modLightbar":-1,"bulletProofTyres":true,"modBackWheels":-1,"modRightFender":-1,"modDashboard":-1,"modHorns":-1,"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"modTransmission":-1,"driftTyres":false,"tankHealth":1000,"model":872704284,"modFrontBumper":-1,"modShifterLeavers":-1,"modSpeakers":-1,"plateIndex":0,"modAerials":-1,"paintType1":0,"modAirFilter":-1,"interiorColor":3,"dashboardColor":160,"modLivery":-1,"modHydrolic":-1,"modCustomTiresR":false,"pearlescentColor":57,"modDoorR":-1,"modEngineBlock":-1,"modHydraulics":false,"windowTint":-1,"modHood":-1,"modSmokeEnabled":false,"modAPlate":-1}', '45RQM994', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(41, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 'sultan', '970598228', NULL, '{"modRearBumper":-1,"modKit47":-1,"modTank":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"modFrontBumper":-1,"modTrunk":-1,"wheelSize":1.0,"modCustomTiresR":false,"modArmor":-1,"wheelWidth":1.0,"wheelColor":156,"fuelLevel":34.1561140931441,"modSmokeEnabled":false,"modWindows":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSteeringWheel":-1,"oilLevel":4.76596940834568,"modStruts":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"model":970598228,"windowTint":-1,"modOrnaments":-1,"modRoof":-1,"modTrimA":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color2":1,"modShifterLeavers":-1,"wheels":0,"modDial":-1,"dirtLevel":0.0,"modHorns":-1,"tankHealth":1000.0592475178704,"modFender":-1,"modTrimB":-1,"modSuspension":-1,"neonColor":[255,255,255],"modKit49":-1,"modCustomTiresF":false,"modVanityPlate":-1,"modSideSkirt":-1,"color1":1,"modArchCover":-1,"modFrame":-1,"modTurbo":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"plate":"68YYI312","modBackWheels":-1,"modSpeakers":-1,"modKit17":-1,"modKit19":-1,"neonEnabled":[false,false,false,false],"pearlescentColor":5,"plateIndex":3,"modLivery":-1,"extras":{"10":false,"12":true},"modAirFilter":-1,"modGrille":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHydrolic":-1,"modPlateHolder":-1,"liveryRoof":-1,"modBrakes":-1,"engineHealth":1000.0592475178704,"modEngineBlock":-1,"modFrontWheels":-1,"modXenon":false,"modExhaust":-1,"dashboardColor":0,"bodyHealth":1000.0592475178704,"xenonColor":255,"modSpoilers":-1,"modKit21":-1,"interiorColor":0,"modAPlate":-1,"modTransmission":-1,"modAerials":-1,"modEngine":-1,"modDoorSpeaker":-1,"modHood":-1,"modDashboard":-1}', '68YYI312', NULL, 'ApartmentsGarage', 35, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"time":"2024-06-20-22:32","garage":"Alta Apartments","type":"Stored"},{"time":"2024-06-20-22:33","garage":"Alta Apartments","type":"Take Out"},{"time":"2024-06-27-13:16","garage":"Depot Lot","type":"Take Depot"},{"time":"2024-06-27-13:16","garage":"Alta Apartments","type":"Stored"}]'),
	(42, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 't20', '1663218586', NULL, '{"modBrakes":-1,"modKit47":-1,"pearlescentColor":3,"modAerials":-1,"modOrnaments":-1,"modShifterLeavers":-1,"modArmor":-1,"modTransmission":-1,"modBackWheels":-1,"modSteeringWheel":-1,"modHorns":-1,"modStruts":-1,"modTrimB":-1,"modSeats":-1,"modAirFilter":-1,"modRoof":-1,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":false,"7":true,"0":true},"bodyHealth":997.6762628136975,"color1":7,"modSmokeEnabled":false,"modKit21":-1,"modDial":-1,"extras":[],"plateIndex":0,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modHydrolic":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":1.0,"tyreSmokeColor":[255,255,255],"engineHealth":1000.0592475178704,"modKit49":-1,"modKit17":-1,"modWindows":-1,"modRearBumper":-1,"modExhaust":-1,"model":1663218586,"modLivery":-1,"wheelWidth":1.0,"modSpeakers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheels":7,"modFrontBumper":-1,"xenonColor":255,"wheelColor":0,"modCustomTiresF":false,"color2":7,"oilLevel":4.76596940834568,"liveryRoof":-1,"modFrontWheels":-1,"modTrimA":-1,"modRightFender":-1,"modKit19":-1,"dirtLevel":0.0,"modHood":-1,"windowTint":-1,"tankHealth":1000.0592475178704,"plate":"60FFV170","modSideSkirt":-1,"modDashboard":-1,"modVanityPlate":-1,"modGrille":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":40.51073997093835,"modSpoilers":-1,"modEngineBlock":-1,"modFrame":-1,"interiorColor":0,"dashboardColor":0,"modFender":-1,"modSuspension":-1,"modEngine":-1,"neonColor":[255,255,255],"modPlateHolder":-1,"modCustomTiresR":false,"modXenon":false}', '60FFV170', NULL, 'ApartmentsGarage', 40, 1000, 998, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"garage":"Alta Apartments","type":"Stored","time":"2024-06-20-22:32"},{"garage":"Alta Apartments","type":"Take Out","time":"2024-06-20-22:33"},{"garage":"Alta Apartments","type":"Stored","time":"2024-06-20-22:33"},{"garage":"Alta Apartments","type":"Take Out","time":"2024-06-20-22:35"},{"garage":"Alta Apartments","type":"Take Out","time":"2024-06-20-22:36"},{"garage":"Alta Apartments","type":"Stored","time":"2024-06-20-22:36"}]'),
	(43, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 'bati', '-114291515', NULL, '{"modBrakes":-1,"modKit47":-1,"pearlescentColor":0,"modAerials":-1,"modOrnaments":-1,"modShifterLeavers":-1,"modArmor":-1,"modTransmission":-1,"modBackWheels":-1,"modSteeringWheel":-1,"modHorns":-1,"modStruts":-1,"modTrimB":-1,"modSeats":-1,"modAirFilter":-1,"modRoof":-1,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"bodyHealth":1000.0592475178704,"color1":27,"modSmokeEnabled":false,"modKit21":-1,"modDial":-1,"extras":[],"plateIndex":0,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modHydrolic":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":1.0,"tyreSmokeColor":[255,255,255],"engineHealth":1000.0592475178704,"modKit49":-1,"modKit17":-1,"modWindows":-1,"modRearBumper":-1,"modExhaust":-1,"model":-114291515,"modLivery":-1,"wheelWidth":1.0,"modSpeakers":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheels":6,"modFrontBumper":-1,"xenonColor":255,"wheelColor":27,"modCustomTiresF":false,"color2":27,"oilLevel":4.76596940834568,"liveryRoof":-1,"modFrontWheels":-1,"modTrimA":-1,"modRightFender":-1,"modKit19":-1,"dirtLevel":0.0,"modHood":-1,"windowTint":-1,"tankHealth":1000.0592475178704,"plate":"62IKT920","modSideSkirt":-1,"modDashboard":-1,"modVanityPlate":-1,"modGrille":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":61.16327407376967,"modSpoilers":-1,"modEngineBlock":-1,"modFrame":-1,"interiorColor":0,"dashboardColor":0,"modFender":-1,"modSuspension":-1,"modEngine":-1,"neonColor":[255,255,255],"modPlateHolder":-1,"modCustomTiresR":false,"modXenon":false}', '62IKT920', NULL, 'ApartmentsGarage', 61, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"garage":"Alta Apartments","type":"Stored","time":"2024-06-20-22:34"},{"garage":"Alta Apartments","type":"Take Out","time":"2024-06-20-22:34"},{"garage":"Alta Apartments","type":"Take Out","time":"2024-06-20-22:36"},{"garage":"Alta Apartments","type":"Stored","time":"2024-06-20-22:37"}]'),
	(45, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 'deluxo', '1483171323', NULL, '{"modSpeakers":-1,"modHorns":-1,"modStruts":-1,"modAPlate":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modRoof":-1,"color2":38,"dirtLevel":4.76596940834568,"modTurbo":false,"modArchCover":-1,"modBackWheels":-1,"modKit19":-1,"modRearBumper":-1,"bodyHealth":1000.0592475178704,"fuelLevel":99.29102934053518,"modTrunk":-1,"wheels":1,"modVanityPlate":-1,"modRightFender":-1,"modShifterLeavers":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"modDashboard":-1,"modDoorSpeaker":-1,"modXenon":false,"modAerials":-1,"modTrimA":-1,"wheelWidth":1.0,"modKit49":-1,"neonColor":[255,255,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":-1,"modFrontWheels":-1,"modSideSkirt":-1,"engineHealth":1000.0592475178704,"modFender":-1,"plate":"ORIGENV2","modWindows":-1,"modFrame":-1,"modExhaust":-1,"interiorColor":19,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modDial":-1,"modTransmission":-1,"model":1483171323,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresF":false,"dashboardColor":156,"tankHealth":1000.0592475178704,"modHydrolic":-1,"modTrimB":-1,"wheelColor":0,"extras":[],"modSuspension":-1,"modOrnaments":-1,"pearlescentColor":24,"modAirFilter":-1,"wheelSize":1.0,"color1":38,"modKit47":-1,"plateIndex":0,"modKit17":-1,"xenonColor":255,"modEngine":-1,"liveryRoof":-1,"modArmor":-1,"modKit21":-1,"modHood":-1,"modSteeringWheel":-1,"modPlateHolder":-1,"oilLevel":6.35462587779425,"modSpoilers":-1,"modGrille":-1,"neonEnabled":[false,false,false,false],"modCustomTiresR":false,"modBrakes":-1,"windowTint":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true}}', 'OrigenV2', NULL, 'motelgarage', 99, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"time":"2024-06-21-02:23","garage":"Alta Apartments","type":"Take Out"},{"time":"2024-06-21-02:23","garage":"Alta Apartments","type":"Stored"},{"time":"2024-06-27-13:35","garage":"Motel Parking","type":"Take Out"},{"time":"2024-06-27-13:35","garage":"Motel Parking","type":"Stored"}]'),
	(46, 'license:407894f5ace9e794698132ea12dd8807b5ae71bc', 'ZEN90470', 'neon', '-1848994066', NULL, '{"modSpeakers":-1,"modHorns":-1,"modStruts":-1,"modAPlate":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modRoof":-1,"color2":0,"dirtLevel":0.0,"modTurbo":false,"modArchCover":-1,"modBackWheels":-1,"modKit19":-1,"modRearBumper":-1,"bodyHealth":1000.0592475178704,"fuelLevel":24.62417527645272,"modTrunk":-1,"wheels":0,"modVanityPlate":-1,"modRightFender":-1,"modShifterLeavers":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"modDashboard":-1,"modDoorSpeaker":-1,"modXenon":false,"modAerials":-1,"modTrimA":-1,"wheelWidth":1.0,"modKit49":-1,"neonColor":[255,255,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":-1,"modFrontWheels":-1,"modSideSkirt":-1,"engineHealth":1000.0592475178704,"modFender":-1,"plate":"86TIV014","modWindows":-1,"modFrame":-1,"modExhaust":-1,"interiorColor":93,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modDial":-1,"modTransmission":-1,"model":-1848994066,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresF":false,"dashboardColor":65,"tankHealth":1000.0592475178704,"modHydrolic":-1,"modTrimB":-1,"wheelColor":0,"extras":[],"modSuspension":-1,"modOrnaments":-1,"pearlescentColor":73,"modAirFilter":-1,"wheelSize":1.0,"color1":64,"modKit47":-1,"plateIndex":0,"modKit17":-1,"xenonColor":255,"modEngine":-1,"liveryRoof":-1,"modArmor":-1,"modKit21":-1,"modHood":-1,"modSteeringWheel":-1,"modPlateHolder":-1,"oilLevel":4.76596940834568,"modSpoilers":-1,"modGrille":-1,"neonEnabled":[false,false,false,false],"modCustomTiresR":false,"modBrakes":-1,"windowTint":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true}}', '86TIV014', NULL, 'motelgarage', 25, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"time":"2024-06-27-13:31","garage":"Motel Parking","type":"Stored"},{"time":"2024-06-27-13:35","garage":"Motel Parking","type":"Take Out"},{"time":"2024-06-27-13:35","garage":"Motel Parking","type":"Stored"}]'),
	(47, 'license:c3b207200ddf36a09a6d430a8ccd119c71350078', 'NRD24295', 'police3', '1912215274', NULL, '{"modExhaust":-1,"modHorns":-1,"modTank":-1,"modSmokeEnabled":false,"headlightColor":255,"modKit19":-1,"dirtLevel":3.9716411736214,"modSuspension":-1,"modFrontWheels":-1,"modPlateHolder":-1,"modStruts":-1,"modTrimB":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modTrimA":-1,"bodyHealth":1000.0592475178704,"modSpeakers":-1,"modKit21":-1,"interiorColor":0,"xenonColor":255,"modAerials":-1,"modSideSkirt":-1,"modShifterLeavers":-1,"pearlescentColor":1,"wheels":0,"plateIndex":4,"color2":0,"modAPlate":-1,"windowTint":-1,"modWindows":-1,"modKit47":-1,"modRightFender":-1,"modDoorSpeaker":-1,"modGrille":-1,"modFrame":-1,"modXenon":false,"modRoof":-1,"fuelLevel":65.13491524739108,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"plate":"49HSA886","doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"neonEnabled":[false,false,false,false],"modArchCover":-1,"modDashboard":-1,"modSteeringWheel":-1,"modRearBumper":-1,"modHydrolic":-1,"modTransmission":-1,"wheelColor":156,"modVanityPlate":-1,"tankHealth":1000.0592475178704,"modBackWheels":-1,"modKit49":-1,"wheelSize":0.0,"liveryRoof":-1,"extras":{"1":true,"12":false},"modLivery":2,"modKit17":-1,"modDial":-1,"modArmor":-1,"modOrnaments":-1,"model":1912215274,"modSeats":-1,"modFrontBumper":-1,"modCustomTiresR":false,"modAirFilter":-1,"oilLevel":4.76596940834568,"modCustomTiresF":false,"neonColor":[255,255,255],"modTrunk":-1,"modBrakes":-1,"dashboardColor":0,"tyreSmokeColor":[255,255,255],"modHood":-1,"engineHealth":1000.0592475178704,"color1":111,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngineBlock":-1,"modEngine":-1,"modTurbo":false,"modSpoilers":-1}', '49HSA886', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(48, 'license:b389635bed93356592e1dc2e726f4fc7578223c3', 'IIE26687', 'cypher', '1755697647', NULL, '{"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"modSteeringWheel":-1,"modBackWheels":-1,"modHood":-1,"wheelSize":1.0,"dirtLevel":9.53193881669137,"modSuspension":-1,"modDashboard":-1,"modEngineBlock":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"modRoof":-1,"modSpoilers":-1,"modAirFilter":-1,"modFrontBumper":-1,"bodyHealth":896.7965770037138,"wheels":7,"liveryRoof":-1,"modWindows":-1,"modTurbo":false,"pearlescentColor":5,"modDoorSpeaker":-1,"modArchCover":-1,"modTransmission":-1,"modGrille":-1,"plate":"2TN960DW","modStruts":-1,"modTank":-1,"modFrame":-1,"modSmokeEnabled":false,"modExhaust":-1,"modKit47":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"windowStatus":{"1":false,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modShifterLeavers":-1,"wheelColor":134,"modKit21":-1,"modRearBumper":-1,"fuelLevel":29.39014468479841,"engineHealth":919.0377675759936,"modKit49":-1,"interiorColor":27,"modTrimA":-1,"modFrontWheels":-1,"modSideSkirt":-1,"modArmor":-1,"modAerials":-1,"modTrunk":-1,"plateIndex":0,"modHorns":-1,"modKit17":-1,"modBrakes":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpeakers":-1,"modDial":-1,"tyreSmokeColor":[255,255,255],"modCustomTiresF":false,"modRightFender":-1,"modVanityPlate":-1,"tankHealth":973.8464157719691,"neonColor":[255,255,255],"modSeats":-1,"oilLevel":6.35462587779425,"color2":36,"model":1755697647,"tireHealth":{"1":998.75,"2":1000.0,"3":1000.0,"0":1000.0},"modOrnaments":-1,"modLivery":-1,"modEngine":-1,"extras":[],"modXenon":false,"modTrimB":-1,"color1":20,"modHydrolic":-1,"dashboardColor":156,"windowTint":-1,"wheelWidth":1.0,"modAPlate":-1,"modCustomTiresR":false}', '2TN960DW', NULL, 'ApartmentsGarage', 29, 919, 897, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 1309778, 0, 0, '[{"time":"2024-09-22-04:47","garage":"Caears 24 Parking","type":"Stored"},{"time":"2024-09-22-04:50","garage":"Caears 24 Parking","type":"Take Out"},{"time":"2024-09-22-19:54","garage":"Depot Lot","type":"Take Depot"},{"time":"2024-09-22-20:12","garage":"Alta Apartments","type":"Stored"}]'),
	(49, 'license:b389635bed93356592e1dc2e726f4fc7578223c3', 'IIE26687', 'caracara2', '-1349095620', NULL, '{"modExhaust":-1,"modHorns":-1,"modTank":-1,"modSmokeEnabled":false,"headlightColor":255,"modKit19":-1,"dirtLevel":2.38298470417284,"modSteeringWheel":-1,"modTurbo":false,"modPlateHolder":-1,"wheelColor":0,"modTrimB":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTrimA":-1,"modDashboard":-1,"modLivery":-1,"modKit21":-1,"interiorColor":0,"xenonColor":255,"modAerials":-1,"modSideSkirt":-1,"tyreSmokeColor":[255,255,255],"pearlescentColor":6,"neonColor":[255,255,255],"oilLevel":4.76596940834568,"color2":134,"modAPlate":-1,"modHydrolic":-1,"modWindows":-1,"modKit47":-1,"modRightFender":-1,"modDoorSpeaker":-1,"dashboardColor":156,"modFrame":-1,"modXenon":false,"modRoof":-1,"fuelLevel":65.13491524739108,"modHood":-1,"modFender":-1,"plate":"89SER497","doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.0,"color1":29,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modFrontWheels":-1,"modArmor":-1,"modEngineBlock":-1,"modStruts":-1,"modCustomTiresF":false,"liveryRoof":-1,"modVanityPlate":-1,"tankHealth":1000.0592475178704,"modBackWheels":-1,"modKit49":-1,"wheelSize":0.0,"modSpoilers":-1,"extras":[],"wheels":3,"modSeats":-1,"modDial":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"model":-1349095620,"modOrnaments":-1,"modFrontBumper":-1,"modCustomTiresR":false,"modAirFilter":-1,"windowTint":-1,"modBrakes":-1,"modRearBumper":-1,"modTrunk":-1,"plateIndex":0,"modTransmission":-1,"modShifterLeavers":-1,"modSpeakers":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1,"modEngine":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modKit17":-1}', 'yabut', NULL, 'motelgarage', 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 228946, 0, 0, '[{"time":"2024-09-22-06:13","type":"Take Out","garage":"Alta Apartments"}]'),
	(50, 'license:03c26d5aa603539ef76d771fe1cfd75041bbae24', 'CYZ72802', 'buffalo2', '736902334', NULL, '{"modSuspension":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"dirtLevel":3.9716411736214,"modOrnaments":-1,"modFrame":-1,"modRearBumper":-1,"modHydrolic":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modShifterLeavers":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"modFrontWheels":-1,"modSeats":-1,"modCustomTiresR":false,"modTrunk":-1,"modSideSkirt":-1,"wheelWidth":0.0,"dashboardColor":0,"modSmokeEnabled":false,"modHorns":-1,"modArchCover":-1,"modDoorSpeaker":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modKit21":-1,"modVanityPlate":-1,"modExhaust":-1,"pearlescentColor":2,"plate":"08SER682","color2":0,"oilLevel":4.76596940834568,"neonColor":[255,255,255],"modAerials":-1,"modEngineBlock":-1,"headlightColor":255,"xenonColor":255,"modSpeakers":-1,"modRightFender":-1,"tankHealth":1000.0592475178704,"windowTint":-1,"modSteeringWheel":-1,"modAirFilter":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modWindows":-1,"modDial":-1,"modRoof":-1,"plateIndex":0,"modTrimA":-1,"modKit49":-1,"modKit47":-1,"modEngine":-1,"modArmor":-1,"modDashboard":-1,"interiorColor":0,"color1":0,"modTrimB":-1,"extras":{"11":false,"12":true},"modFender":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHood":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"modXenon":false,"modTank":-1,"model":736902334,"modFrontBumper":-1,"modBrakes":-1,"modGrille":-1,"liveryRoof":-1,"modPlateHolder":-1,"wheelSize":0.0,"modStruts":-1,"modLivery":-1,"modKit19":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modKit17":-1,"modAPlate":-1}', '08SER682', NULL, 'motelgarage', 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[{"type":"Take Out","garage":"Motel Parking","time":"2024-10-07-03:05"}]'),
	(51, 'license:03c26d5aa603539ef76d771fe1cfd75041bbae24', 'CYZ72802', 'buffalo2', '736902334', NULL, '{"modSuspension":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"dirtLevel":7.14895411251853,"modOrnaments":-1,"modFrame":-1,"modRearBumper":-1,"modHydrolic":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modShifterLeavers":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"modFrontWheels":-1,"modSeats":-1,"modCustomTiresR":false,"modTrunk":-1,"modSideSkirt":-1,"wheelWidth":0.0,"dashboardColor":0,"modSmokeEnabled":false,"modHorns":-1,"modArchCover":-1,"modDoorSpeaker":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modKit21":-1,"modVanityPlate":-1,"modExhaust":-1,"pearlescentColor":38,"plate":"83FCQ075","color2":0,"oilLevel":4.76596940834568,"neonColor":[255,255,255],"modAerials":-1,"modEngineBlock":-1,"headlightColor":255,"xenonColor":255,"modSpeakers":-1,"modRightFender":-1,"tankHealth":1000.0592475178704,"windowTint":-1,"modSteeringWheel":-1,"modAirFilter":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modWindows":-1,"modDial":-1,"modRoof":-1,"plateIndex":0,"modTrimA":-1,"modKit49":-1,"modKit47":-1,"modEngine":-1,"modArmor":-1,"modDashboard":-1,"interiorColor":0,"color1":33,"modTrimB":-1,"extras":{"11":false,"12":true},"modFender":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHood":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"modXenon":false,"modTank":-1,"model":736902334,"modFrontBumper":-1,"modBrakes":-1,"modGrille":-1,"liveryRoof":-1,"modPlateHolder":-1,"wheelSize":0.0,"modStruts":-1,"modLivery":-1,"modKit19":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modKit17":-1,"modAPlate":-1}', '83FCQ075', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(52, 'license:03c26d5aa603539ef76d771fe1cfd75041bbae24', 'CYZ72802', 'buffalo2', '736902334', NULL, '{"modSuspension":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"dirtLevel":7.94328234724281,"modOrnaments":-1,"modFrame":-1,"modRearBumper":-1,"modHydrolic":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modShifterLeavers":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"modFrontWheels":-1,"modSeats":-1,"modCustomTiresR":false,"modTrunk":-1,"modSideSkirt":-1,"wheelWidth":0.0,"dashboardColor":0,"modSmokeEnabled":false,"modHorns":-1,"modArchCover":-1,"modDoorSpeaker":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modKit21":-1,"modVanityPlate":-1,"modExhaust":-1,"pearlescentColor":38,"plate":"49WPL243","color2":0,"oilLevel":4.76596940834568,"neonColor":[255,255,255],"modAerials":-1,"modEngineBlock":-1,"headlightColor":255,"xenonColor":255,"modSpeakers":-1,"modRightFender":-1,"tankHealth":1000.0592475178704,"windowTint":-1,"modSteeringWheel":-1,"modAirFilter":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modWindows":-1,"modDial":-1,"modRoof":-1,"plateIndex":0,"modTrimA":-1,"modKit49":-1,"modKit47":-1,"modEngine":-1,"modArmor":-1,"modDashboard":-1,"interiorColor":0,"color1":36,"modTrimB":-1,"extras":{"11":true,"12":false},"modFender":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHood":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"modXenon":false,"modTank":-1,"model":736902334,"modFrontBumper":-1,"modBrakes":-1,"modGrille":-1,"liveryRoof":-1,"modPlateHolder":-1,"wheelSize":0.0,"modStruts":-1,"modLivery":-1,"modKit19":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modKit17":-1,"modAPlate":-1}', '49WPL243', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(53, 'license:03c26d5aa603539ef76d771fe1cfd75041bbae24', 'CYZ72802', 'buffalo2', '736902334', NULL, '{"modSuspension":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"dirtLevel":4.76596940834568,"modOrnaments":-1,"modFrame":-1,"modRearBumper":-1,"modHydrolic":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modShifterLeavers":-1,"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"modFrontWheels":-1,"modSeats":-1,"modCustomTiresR":false,"modTrunk":-1,"modSideSkirt":-1,"wheelWidth":0.0,"dashboardColor":0,"modSmokeEnabled":false,"modHorns":-1,"modArchCover":-1,"modDoorSpeaker":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modKit21":-1,"modVanityPlate":-1,"modExhaust":-1,"pearlescentColor":53,"plate":"41UZQ038","color2":51,"oilLevel":4.76596940834568,"neonColor":[255,255,255],"modAerials":-1,"modEngineBlock":-1,"headlightColor":255,"xenonColor":255,"modSpeakers":-1,"modRightFender":-1,"tankHealth":1000.0592475178704,"windowTint":-1,"modSteeringWheel":-1,"modAirFilter":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modWindows":-1,"modDial":-1,"modRoof":-1,"plateIndex":0,"modTrimA":-1,"modKit49":-1,"modKit47":-1,"modEngine":-1,"modArmor":-1,"modDashboard":-1,"interiorColor":0,"color1":51,"modTrimB":-1,"extras":{"11":false,"12":false},"modFender":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modHood":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":156,"modXenon":false,"modTank":-1,"model":736902334,"modFrontBumper":-1,"modBrakes":-1,"modGrille":-1,"liveryRoof":-1,"modPlateHolder":-1,"wheelSize":0.0,"modStruts":-1,"modLivery":-1,"modKit19":-1,"modCustomTiresF":false,"engineHealth":1000.0592475178704,"modKit17":-1,"modAPlate":-1}', '2', NULL, 'motelgarage', 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 164566, 0, 0, '[{"type":"Take Out","garage":"Motel Parking","time":"2024-09-23-04:16"},{"type":"Take Depot","garage":"Depot Lot","time":"2024-10-07-02:35"}]'),
	(54, 'license:7073fcdaab9ac3f767005aeae610d27a157816dd', 'OVS51065', 'tribike', '1127861609', NULL, '{"modSpoilers":-1,"modCustomTiresR":false,"plate":"81QUC097","extras":[],"modDashboard":-1,"modGrille":-1,"modEngine":-1,"modShifterLeavers":-1,"modFender":-1,"modKit21":-1,"modAPlate":-1,"neonColor":[255,255,255],"modFrame":-1,"wheelSize":0.0,"oilLevel":0.0,"dirtLevel":8.73761058196709,"modSeats":-1,"modRightFender":-1,"modTurbo":false,"modRoof":-1,"modOrnaments":-1,"liveryRoof":-1,"modKit19":-1,"modKit49":-1,"modStruts":-1,"modDial":-1,"modFrontBumper":-1,"bodyHealth":1000.0592475178704,"neonEnabled":[false,false,false,false],"interiorColor":0,"modBackWheels":-1,"modSideSkirt":-1,"modTrunk":-1,"modEngineBlock":-1,"windowTint":-1,"modHydrolic":-1,"xenonColor":255,"modSpeakers":-1,"color2":132,"modSteeringWheel":-1,"modPlateHolder":-1,"modSmokeEnabled":false,"tankHealth":1000.0592475178704,"headlightColor":255,"modTransmission":-1,"model":1127861609,"pearlescentColor":132,"modFrontWheels":-1,"modAerials":-1,"modHorns":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"engineHealth":1000.0592475178704,"modArmor":-1,"modHood":-1,"plateIndex":4,"fuelLevel":0.0,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"wheelWidth":0.0,"modXenon":false,"modTrimB":-1,"modKit47":-1,"modArchCover":-1,"color1":132,"modVanityPlate":-1,"modSuspension":-1,"dashboardColor":0,"modTrimA":-1,"modAirFilter":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"wheels":6,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modWindows":-1,"modBrakes":-1,"wheelColor":156,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modRearBumper":-1,"modDoorSpeaker":-1,"modExhaust":-1,"modLivery":-1}', 'FUCKU', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(55, 'license:7264c96d4b26baba17b314ab013333d50f3916ba', 'GLD40591', 'tyrus', '2067820283', NULL, '{"extras":[],"modShifterLeavers":-1,"neonColor":[255,255,255],"modBackWheels":-1,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":987.2922973632813,"0":1000.0},"fuelLevel":31.77312938897126,"xenonColor":2,"engineHealth":848.3425546855326,"modEngineBlock":-1,"modTrimB":-1,"wheelSize":0.6279359459877,"modCustomTiresF":false,"oilLevel":4.76596940834568,"modFender":-1,"modRearBumper":-1,"interiorColor":111,"modExhaust":0,"modKit47":-1,"dashboardColor":111,"modGrille":-1,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDoorSpeaker":-1,"modSeats":-1,"modAirFilter":-1,"modWindows":-1,"modKit21":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"modAerials":-1,"plateIndex":1,"modHorns":-1,"modSideSkirt":-1,"modAPlate":-1,"modFrontWheels":200,"modCustomTiresR":false,"model":2067820283,"modLivery":0,"modSpoilers":0,"modKit19":-1,"modFrontBumper":-1,"wheels":12,"modSuspension":2,"modSmokeEnabled":1,"modTransmission":2,"modTrunk":-1,"modKit49":-1,"modPlateHolder":-1,"modTank":-1,"tankHealth":953.9882099038621,"color2":12,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSteeringWheel":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.63999998569488,"neonEnabled":[false,false,false,false],"modKit17":-1,"wheelColor":138,"modVanityPlate":-1,"tyreSmokeColor":[128,128,128],"modXenon":1,"modHood":-1,"liveryRoof":-1,"modArmor":-1,"modRightFender":-1,"modOrnaments":-1,"modDashboard":-1,"modRoof":-1,"color1":12,"modHydrolic":-1,"modBrakes":2,"modStruts":-1,"bodyHealth":874.5553864314339,"windowTint":1,"modFrame":-1,"modSpeakers":-1,"modTrimA":-1,"modEngine":3,"modTurbo":1,"pearlescentColor":2,"dirtLevel":4.76596940834568,"plate":"1ZP178LV"}', '1ZP178LV', NULL, 'ApartmentsGarage', 31, 849, 875, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 676129, 0, 0, '[{"time":"2024-09-28-02:15","garage":"Alta Apartments","type":"Stored"},{"time":"2024-09-28-02:17","garage":"Motel Parking","type":"Take Out"},{"time":"2024-09-28-18:28","garage":"Motel Parking","type":"Stored"},{"time":"2024-09-29-17:57","garage":"Motel Parking","type":"Take Out"},{"time":"2024-09-29-18:20","garage":"Alta Apartments","type":"Stored"},{"time":"2024-09-29-18:21","garage":"Alta Apartments","type":"Take Out"}]'),
	(56, 'license:7073fcdaab9ac3f767005aeae610d27a157816dd', 'OVS51065', 'tenf2', '274946574', NULL, '{"modSpeakers":-1,"plate":"9AO721AY","modArmor":4,"modSpoilers":25,"modDial":-1,"interiorColor":37,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modTrunk":-1,"modSmokeEnabled":1,"tankHealth":1000.0592475178704,"modShifterLeavers":-1,"modRoof":7,"neonColor":[94,255,1],"extras":[],"modHorns":16,"modRearBumper":18,"modWindows":-1,"dirtLevel":13.50357999031278,"wheelWidth":0.61961835622787,"modExhaust":10,"windowTint":1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":50.83700702235401,"modStruts":-1,"modPlateHolder":-1,"modEngine":3,"modAirFilter":-1,"modCustomTiresR":false,"plateIndex":1,"modHood":16,"color1":0,"dashboardColor":156,"modAPlate":-1,"modGrille":1,"modSeats":4,"modTransmission":2,"bodyHealth":999.2649192831461,"engineHealth":1000.0592475178704,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"wheelSize":0.68428915739059,"modRightFender":4,"modKit47":-1,"model":274946574,"modSideSkirt":12,"modFrontBumper":15,"tyreSmokeColor":[254,254,254],"modVanityPlate":15,"modOrnaments":-1,"modAerials":-1,"modTrimB":3,"modKit19":-1,"xenonColor":4,"modSteeringWheel":6,"modFrame":-1,"modHydrolic":-1,"pearlescentColor":53,"modCustomTiresF":false,"modKit17":-1,"modTank":-1,"modKit21":-1,"modLivery":12,"modDoorSpeaker":1,"modFender":3,"modBackWheels":-1,"modDashboard":0,"modSuspension":4,"modTrimA":2,"liveryRoof":-1,"modTurbo":1,"modXenon":1,"modFrontWheels":14,"modArchCover":0,"modEngineBlock":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":6.35462587779425,"modKit49":-1,"wheelColor":0,"neonEnabled":[1,1,1,1],"wheels":12,"modBrakes":2,"color2":0}', '9AO721AY', NULL, 'sapcounsel', 51, 1001, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 800718, 0, 0, '[{"type":"Stored","time":"2024-09-29-20:43","garage":"Motel Parking"},{"type":"Take Out","time":"2024-10-06-21:20","garage":"Motel Parking"},{"type":"Stored","time":"2024-10-06-21:32","garage":"San Andreas Parking"}]'),
	(57, 'license:bee8dfaeb88755a2702467d968b729360f9f7b2a', 'VEW72732', 'zr350', '-1858654120', NULL, '{"modBrakes":-1,"modKit49":-1,"model":-1858654120,"modPlateHolder":-1,"modArchCover":-1,"modRearBumper":-1,"wheelSize":0.0,"modSuspension":-1,"modTank":-1,"engineHealth":1000.0592475178704,"tankHealth":1000.0592475178704,"dashboardColor":156,"pearlescentColor":127,"plateIndex":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHorns":-1,"headlightColor":255,"modKit21":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modTrimB":-1,"color2":0,"modDial":-1,"modEngine":-1,"modFrontBumper":-1,"modAPlate":-1,"modSteeringWheel":-1,"modVanityPlate":-1,"modTransmission":-1,"windowTint":-1,"modCustomTiresF":false,"modWindows":-1,"bodyHealth":1000.0592475178704,"modHydrolic":-1,"modXenon":false,"dirtLevel":7.14895411251853,"modSideSkirt":-1,"extras":[],"modEngineBlock":-1,"modCustomTiresR":false,"color1":71,"liveryRoof":-1,"modDoorSpeaker":-1,"modKit17":-1,"wheels":0,"modSpeakers":-1,"modHood":-1,"modTrimA":-1,"wheelColor":3,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modTurbo":false,"modStruts":-1,"wheelWidth":0.0,"modKit19":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":65.13491524739108,"plate":"89LXJ421","modGrille":-1,"oilLevel":4.76596940834568,"modShifterLeavers":-1,"interiorColor":7,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrame":-1,"modDashboard":-1,"modSeats":-1,"modAirFilter":-1,"modAerials":-1,"modLivery":-1,"modKit47":-1,"modBackWheels":-1,"modTrunk":-1,"neonEnabled":[false,false,false,false],"neonColor":[255,255,255],"modArmor":-1,"modFender":-1,"modSpoilers":-1,"modOrnaments":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modRightFender":-1,"modExhaust":-1,"modRoof":-1,"xenonColor":255}', '89LXJ421', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(58, 'license:ef7b10dcab4ed3ea63824ae253fd77ea61526754', 'EKJ79332', 'ignus', '-1444114309', NULL, '{"extras":[],"modShifterLeavers":-1,"neonColor":[255,255,255],"modBackWheels":-1,"neonEnabled":[false,false,false,false],"tireHealth":{"1":1000.0,"2":1000.0,"3":986.9216918945313,"0":985.7883911132813},"modDashboard":-1,"modStruts":-1,"engineHealth":964.3144769552777,"modEngineBlock":-1,"modTrimB":-1,"wheelSize":1.0,"modCustomTiresF":false,"oilLevel":4.76596940834568,"modFender":-1,"modRearBumper":-1,"interiorColor":17,"modExhaust":-1,"modKit47":-1,"modHydrolic":-1,"modGrille":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":true},"modDoorSpeaker":-1,"modSeats":-1,"modAirFilter":-1,"modWindows":-1,"modKit21":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modAerials":-1,"plateIndex":0,"modHorns":-1,"modSideSkirt":-1,"modAPlate":-1,"modFrontWheels":-1,"modHood":-1,"model":-1444114309,"modLivery":-1,"modSpoilers":-1,"modKit19":-1,"modFrontBumper":-1,"wheels":7,"modSuspension":-1,"modSmokeEnabled":false,"modTransmission":-1,"modTrunk":-1,"modKit49":-1,"wheelColor":158,"modTank":-1,"tankHealth":986.5556675275576,"modDial":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSteeringWheel":-1,"xenonColor":255,"dirtLevel":1.58865646944856,"wheelWidth":1.0,"modPlateHolder":-1,"modCustomTiresR":false,"modVanityPlate":-1,"tyreSmokeColor":[255,255,255],"modXenon":false,"modArmor":-1,"liveryRoof":-1,"modOrnaments":-1,"modSpeakers":-1,"modArchCover":-1,"dashboardColor":156,"modRoof":-1,"color1":59,"color2":88,"modRightFender":-1,"modBrakes":-1,"bodyHealth":926.1867216885122,"fuelLevel":84.19879288077384,"modFrame":-1,"modKit17":-1,"modTrimA":-1,"modEngine":-1,"windowTint":-1,"pearlescentColor":94,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"2ZH577RH"}', '2ZH577RH', NULL, 'ApartmentsGarage', 84, 965, 927, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 287940, 0, 0, '[{"type":"Stored","time":"2024-09-29-18:21","garage":"Alta Apartments"},{"type":"Take Out","time":"2024-09-29-18:21","garage":"Alta Apartments"},{"type":"Take Depot","time":"2024-10-02-23:47","garage":"Depot Lot"}]'),
	(59, 'license:ef7b10dcab4ed3ea63824ae253fd77ea61526754', 'EKJ79332', 'locust', '-941272559', NULL, '{"modBrakes":-1,"interiorColor":14,"model":-941272559,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modRearBumper":-1,"wheelSize":0.0,"modSuspension":-1,"modTank":-1,"engineHealth":1000.0592475178704,"tankHealth":1000.0592475178704,"modDashboard":-1,"pearlescentColor":89,"plateIndex":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHorns":-1,"headlightColor":255,"modKit21":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modTrimB":-1,"color2":88,"modDial":-1,"modEngine":-1,"modFrontBumper":-1,"modAPlate":-1,"modSteeringWheel":-1,"modVanityPlate":-1,"modTransmission":-1,"xenonColor":255,"modCustomTiresF":false,"modSpoilers":-1,"bodyHealth":1000.0592475178704,"modHydrolic":-1,"modXenon":false,"dirtLevel":7.14895411251853,"modSideSkirt":-1,"extras":[],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"color1":88,"fuelLevel":65.13491524739108,"modDoorSpeaker":-1,"modKit17":-1,"wheels":0,"modSpeakers":-1,"liveryRoof":-1,"modOrnaments":-1,"wheelColor":156,"modPlateHolder":-1,"modSmokeEnabled":false,"modTurbo":false,"modFrame":-1,"dashboardColor":88,"modKit19":-1,"modEngineBlock":-1,"modBackWheels":-1,"plate":"29IIF964","modGrille":-1,"modHood":-1,"modWindows":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modKit49":-1,"modSeats":-1,"modAirFilter":-1,"modAerials":-1,"modLivery":-1,"modKit47":-1,"modShifterLeavers":-1,"modTrunk":-1,"neonEnabled":[false,false,false,false],"neonColor":[255,255,255],"modArmor":-1,"modFender":-1,"wheelWidth":0.0,"oilLevel":4.76596940834568,"modStruts":-1,"windowTint":-1,"modExhaust":-1,"modRoof":-1,"modRightFender":-1}', '29IIF964', NULL, 'motelgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 0, 0, 0, '[]'),
	(60, 'license:7264c96d4b26baba17b314ab013333d50f3916ba', 'GLD40591', 'le7b', '-1232836011', NULL, '{"plateIndex":0,"modWindows":-1,"modFrontBumper":-1,"modGrille":-1,"modBackWheels":-1,"modXenon":false,"bodyHealth":1000.0592475178704,"modVanityPlate":-1,"modKit49":-1,"neonColor":[255,255,255],"modRearBumper":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"extras":{"1":false},"modFrontWheels":205,"modPlateHolder":-1,"modAerials":-1,"modEngineBlock":-1,"modTrimB":-1,"modRoof":-1,"modKit17":-1,"dashboardColor":111,"modSpeakers":-1,"modTurbo":1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"modAPlate":-1,"wheelColor":143,"modCustomTiresF":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpoilers":0,"modFender":-1,"color2":5,"modLivery":-1,"interiorColor":111,"modKit21":-1,"headlightColor":255,"color1":191,"xenonColor":255,"modDoorSpeaker":-1,"modSteeringWheel":-1,"modSuspension":2,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"wheelWidth":0.59952026605606,"modTrunk":-1,"windowTint":1,"oilLevel":4.76596940834568,"modHydrolic":-1,"modStruts":-1,"modDial":-1,"modCustomTiresR":false,"fuelLevel":65.13491524739108,"modArchCover":-1,"pearlescentColor":38,"modAirFilter":-1,"modDashboard":-1,"modArmor":-1,"dirtLevel":3.17731293889712,"modSideSkirt":-1,"liveryRoof":-1,"modSmokeEnabled":1,"modExhaust":0,"modTrimA":-1,"plate":"8NT395CD","modTransmission":2,"neonEnabled":[false,false,false,false],"modKit47":-1,"modTank":-1,"modBrakes":2,"modEngine":3,"wheels":12,"tankHealth":1000.0592475178704,"modSeats":-1,"modHood":-1,"modShifterLeavers":-1,"wheelSize":0.74466758966445,"tyreSmokeColor":[254,254,254],"modHorns":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"model":-1232836011,"modFrame":-1,"engineHealth":988.1443239970062,"modOrnaments":-1}', '8NT395CD', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, NULL, 0, '0', '2025-06-01', '2025-06-01', NULL, 85180, 100, 1, '[]');

-- Dumping structure for table s1_origenv2qb.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.player_warns: ~0 rows (approximately)
INSERT INTO `player_warns` (`id`, `senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES
	(1, 'license:7264c96d4b26baba17b314ab013333d50f3916ba', 'license:ef7b10dcab4ed3ea63824ae253fd77ea61526754', 'Your a bitch :)', 'WARN-4507');

-- Dumping structure for table s1_origenv2qb.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  `zone_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`zone_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.properties: ~0 rows (approximately)
INSERT INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`, `zone_data`) VALUES
	(2, NULL, 'Hillcrest Ave', 'Vinewood Hills', 'test house', '[]', '[]', '[]', 1, 1000, 'mlo', NULL, '{"count":1}', '{"z":164.79,"width":5.0,"h":208.17,"x":-1052.42,"length":3.0,"y":728.66}', '{"thickness":5,"points":[{"x":-1049.0283203125,"y":746.734375,"z":166.1234588623047},{"x":-1090.2813720703126,"y":723.0195922851563,"z":158.9939422607422},{"x":-1063.5498046875,"y":693.0140380859375,"z":160.09426879882813},{"x":-1034.5721435546876,"y":704.79248046875,"z":165.01251220703126}]}');

-- Dumping structure for table s1_origenv2qb.punchmachine
CREATE TABLE IF NOT EXISTS `punchmachine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `score` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.punchmachine: ~11 rows (approximately)
INSERT INTO `punchmachine` (`id`, `name`, `score`) VALUES
	(663, 'Origen V2', '640'),
	(664, 'Shawn Gauci', '440'),
	(665, 'Shawn Gauci', '740'),
	(666, 'Billy Roberts', '280'),
	(667, 'Billy Roberts', '420'),
	(668, 'Leeeroy jenskin', '220'),
	(669, 'Leeeroy jenskin', '800'),
	(670, 'Leeeroy jenskin', '860'),
	(671, 'Leeeroy jenskin', '920'),
	(672, 'Leeeroy jenskin', '1000'),
	(673, 'Billy Roberts', '680'),
	(674, 'Billy Roberts', '700');

-- Dumping structure for table s1_origenv2qb.races
CREATE TABLE IF NOT EXISTS `races` (
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `reward` int(11) DEFAULT NULL,
  `date` longtext DEFAULT NULL,
  `maxplayers` int(11) DEFAULT NULL,
  `route` longtext DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `players` longtext DEFAULT NULL,
  `luadate` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.races: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.race_tracks
CREATE TABLE IF NOT EXISTS `race_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.race_tracks: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.randol_cs
CREATE TABLE IF NOT EXISTS `randol_cs` (
  `cid` varchar(100) NOT NULL,
  `tasksleft` int(10) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.randol_cs: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.redeem
CREATE TABLE IF NOT EXISTS `redeem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.redeem: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.sprays: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.stashitems: ~23 rows (approximately)
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(64, 'balcaouwu', '[]'),
	(104, 'boss_ambulance', '[]'),
	(102, 'boss_mechanic', '[]'),
	(94, 'boss_police', '[]'),
	(79, 'DarkWebCrate_1', '[]'),
	(77, 'FishingBox_613', '[]'),
	(69, 'fridge', '[{"slot":1,"label":"Banana","weight":1000,"amount":1,"info":{"quality":100},"created":1718927702,"name":"banana","useable":true,"image":"banana.png","unique":false,"type":"item"},{"slot":2,"label":"Kiwi","weight":1000,"amount":1,"info":{"quality":100},"created":1718927703,"name":"kiwi","useable":true,"image":"kiwi.png","unique":false,"type":"item"},{"slot":3,"label":"Apple","weight":1000,"amount":1,"info":{"quality":100},"created":1718927697,"name":"apple","useable":true,"image":"apple.png","unique":false,"type":"item"},null,null,{"slot":6,"label":"Lemon","weight":1000,"amount":1,"info":{"quality":100},"created":1718927704,"name":"lemon","useable":true,"image":"lemon.png","unique":false,"type":"item"},{"slot":7,"label":"Glass","weight":1000,"amount":1,"info":{"quality":100},"created":1718927700,"name":"drink-glass","useable":true,"image":"drink-glass.png","unique":false,"type":"item"},null,null,null,{"slot":11,"label":"Watermelon","weight":1000,"amount":1,"info":{"quality":100},"created":1718927705,"name":"watermelon","useable":true,"image":"watermelon.png","unique":false,"type":"item"},{"slot":12,"label":"Strawberry Donut","weight":200,"amount":1,"info":{"quality":100},"created":1718927715,"name":"limeysdonut","useable":true,"image":"limeysdonut2.png","unique":false,"type":"item"}]'),
	(66, 'FrigorificoIngredientes', '[]'),
	(65, 'frigorificouwu', '[]'),
	(68, 'limeyscabinet1', '[]'),
	(98, 'LimeysTray2', '[]'),
	(60, 'mechanicSafe', '[{"unique":false,"slot":1,"amount":3,"name":"iron","image":"iron.png","label":"Iron","weight":100,"type":"item","info":{"quality":100},"useable":false},{"unique":false,"slot":2,"amount":3,"name":"rubber","image":"rubber.png","label":"Rubber","weight":100,"type":"item","info":{"quality":100},"useable":false},{"unique":false,"slot":3,"amount":10,"name":"plastic","image":"plastic.png","label":"Plastic","weight":100,"type":"item","info":{"quality":100},"useable":false},{"unique":false,"slot":4,"amount":42,"name":"steel","image":"steel.png","label":"Steel","weight":100,"type":"item","info":{"quality":100},"useable":false}]'),
	(92, 'policestash_GLD40591', '[]'),
	(105, 'policestash_IIE26687', '[]'),
	(93, 'policestash_OVS51065', '[]'),
	(95, 'policestash_PCT54046', '[]'),
	(84, 'policestash_ZEN90470', '[]'),
	(58, 'storge', '[]'),
	(88, 'storge2', '[]'),
	(63, 'TabuleiroUwU1', '[]'),
	(72, 'Teapot Counter', '[{"amount":30,"image":"ltstrawberry.png","name":"ltstrawberry","type":"item","label":"Strawberries","weight":10,"unique":false,"slot":1,"info":{"quality":100},"useable":false},{"amount":30,"image":"ltraspberry.png","name":"ltraspberry","type":"item","label":"Raspberries","weight":10,"unique":false,"slot":2,"info":{"quality":100},"useable":false}]'),
	(73, 'Teapot Stash', '[]'),
	(87, 'tray3', '[]'),
	(56, 'tray4', '[]');

-- Dumping structure for table s1_origenv2qb.tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.tinder_likes: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.tinder_messages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.trucker_available_contracts
CREATE TABLE IF NOT EXISTS `trucker_available_contracts` (
  `contract_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_type` bit(1) NOT NULL DEFAULT b'0',
  `contract_name` varchar(50) NOT NULL DEFAULT '',
  `coords_index` smallint(6) unsigned NOT NULL DEFAULT 0,
  `price_per_km` int(10) unsigned NOT NULL DEFAULT 0,
  `cargo_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` bit(1) NOT NULL DEFAULT b'0',
  `valuable` bit(1) NOT NULL DEFAULT b'0',
  `fast` bit(1) NOT NULL DEFAULT b'0',
  `truck` varchar(50) DEFAULT NULL,
  `trailer` varchar(50) NOT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.trucker_available_contracts: ~60 rows (approximately)
INSERT INTO `trucker_available_contracts` (`contract_id`, `contract_type`, `contract_name`, `coords_index`, `price_per_km`, `cargo_type`, `fragile`, `valuable`, `fast`, `truck`, `trailer`) VALUES
	(71591, b'0', 'Transport of fireworks', 194, 1717, 1, b'1', b'0', b'0', 'actros', 'trailers4'),
	(71592, b'1', 'Transport of construction materials', 43, 2280, 0, b'0', b'0', b'0', NULL, 'trailers'),
	(71593, b'0', 'Transport of used packaging', 134, 1900, 0, b'0', b'0', b'0', 'actros', 'trailers3'),
	(71594, b'1', 'Transport of materials for shows', 180, 1907, 0, b'0', b'1', b'1', NULL, 'tvtrailer'),
	(71595, b'0', 'Bean transport', 194, 1411, 0, b'0', b'0', b'0', 'daf', 'trailers2'),
	(71596, b'1', 'Rubber transport', 186, 1706, 0, b'0', b'0', b'0', NULL, 'trailers'),
	(71597, b'0', 'Lemonade transport', 58, 1874, 0, b'0', b'0', b'1', 'daf', 'trailers2'),
	(71598, b'1', 'Appliance transportation', 187, 1968, 0, b'1', b'0', b'0', NULL, 'trailers'),
	(71599, b'0', 'Naval articles trailer', 122, 1681, 0, b'0', b'0', b'1', 'vnl780', 'trailers4'),
	(71600, b'1', 'Transport of fireworks', 24, 2033, 1, b'1', b'0', b'0', NULL, 'trailers4'),
	(71601, b'0', 'Ceramic transport', 134, 1505, 0, b'1', b'0', b'0', 'vnl780', 'trailers3'),
	(71602, b'1', 'Potassium hydroxide', 92, 1871, 6, b'0', b'0', b'0', NULL, 'liquide1'),
	(71603, b'0', 'Rail transport', 65, 1412, 0, b'0', b'0', b'0', 'actros', 'trailers3'),
	(71604, b'1', 'Potassium hydroxide', 22, 2302, 6, b'0', b'0', b'0', NULL, 'liquide1'),
	(71605, b'0', 'Transport of event materials', 184, 1424, 0, b'1', b'1', b'0', 'vnl780', 'tvtrailer'),
	(71606, b'1', 'Helicopter Transport', 138, 2381, 0, b'1', b'1', b'0', NULL, 'heli1'),
	(71607, b'0', 'Bottled water transport', 156, 1661, 0, b'0', b'0', b'0', 'daf', 'trailers2'),
	(71608, b'1', 'Transport of construction materials', 184, 2160, 0, b'0', b'0', b'0', NULL, 'trailers'),
	(71609, b'0', 'Potato transport', 159, 1463, 0, b'0', b'0', b'0', 'vnl780', 'trailers2'),
	(71610, b'1', 'Poison', 89, 1789, 5, b'0', b'0', b'0', NULL, 'liquide1'),
	(71611, b'0', 'Transport of jewels', 28, 1769, 0, b'1', b'1', b'0', 'actros', 'docktrailer'),
	(71612, b'1', 'Transport of exotic materials', 186, 2123, 0, b'1', b'1', b'1', NULL, 'docktrailer'),
	(71613, b'0', 'Refined timber transport', 4, 1742, 0, b'0', b'0', b'0', 'vnl780', 'docktrailer'),
	(71614, b'1', 'Army Corrosive Materials Tank', 62, 1844, 6, b'0', b'1', b'0', NULL, 'armytanker'),
	(71615, b'0', 'Clothing transport', 98, 1946, 0, b'0', b'0', b'0', 'actros', 'docktrailer'),
	(71616, b'1', 'Car trailer empty', 48, 2142, 0, b'0', b'0', b'0', NULL, 'tr2'),
	(71617, b'0', 'Transport of used packaging', 56, 1767, 0, b'0', b'0', b'0', 'vnl780', 'trailers3'),
	(71618, b'1', 'Appliance transport', 28, 1889, 0, b'0', b'0', b'0', NULL, 'docktrailer'),
	(71619, b'0', 'Brick transport', 137, 1769, 0, b'0', b'0', b'0', 'daf', 'docktrailer'),
	(71620, b'1', 'Transport of vaccines', 37, 1859, 0, b'1', b'0', b'0', NULL, 'trailers'),
	(71621, b'0', 'Transport of fireworks', 10, 1933, 1, b'1', b'0', b'0', 'vnl780', 'trailers4'),
	(71622, b'1', 'Poison', 12, 2060, 5, b'0', b'0', b'1', NULL, 'liquide1'),
	(71623, b'0', 'Transport of fireworks', 174, 1936, 1, b'1', b'0', b'0', 'vnl780', 'trailers4'),
	(71624, b'1', 'Transport of fireworks', 22, 2317, 1, b'1', b'0', b'0', NULL, 'trailers4'),
	(71625, b'0', 'Common fuel tank', 169, 1960, 3, b'0', b'0', b'0', 'actros', 'tanker2'),
	(71626, b'1', 'Army Corrosive Materials Tank', 23, 2374, 6, b'0', b'1', b'0', NULL, 'armytanker'),
	(71627, b'0', 'Glass transport', 76, 1995, 0, b'1', b'0', b'0', 'daf', 'docktrailer'),
	(71628, b'1', 'Heavy machinery transport', 16, 2188, 0, b'1', b'1', b'0', NULL, 'armytrailer2'),
	(71629, b'0', 'Potato transport', 63, 1795, 0, b'0', b'0', b'0', 'vnl780', 'trailers2'),
	(71630, b'1', 'Tunneling machine transport', 23, 2174, 0, b'1', b'1', b'0', NULL, 'armytrailer2'),
	(71631, b'0', 'Scrap transport', 20, 1624, 0, b'0', b'0', b'1', 'vnl780', 'trailers3'),
	(71632, b'1', 'Army toxic gas tank', 73, 1961, 5, b'0', b'0', b'0', NULL, 'armytanker'),
	(71633, b'0', 'Common fuel tank', 19, 1421, 3, b'0', b'0', b'0', 'actros', 'tanker2'),
	(71634, b'1', 'Transport of fireworks', 173, 2368, 1, b'1', b'0', b'0', NULL, 'trailers4'),
	(71635, b'0', 'Tunneling machine transport', 38, 1999, 0, b'1', b'1', b'0', 'man', 'armytrailer2'),
	(71636, b'1', 'Car trailer empty', 89, 1996, 0, b'0', b'0', b'0', NULL, 'tr2'),
	(71637, b'0', 'Common fuel tank', 96, 1517, 3, b'0', b'0', b'0', 'man', 'tanker2'),
	(71638, b'1', 'Milk transport', 172, 1748, 0, b'0', b'0', b'0', NULL, 'trailers2'),
	(71639, b'0', 'Army toxic gas tank', 179, 1841, 5, b'0', b'0', b'1', 'man', 'armytanker'),
	(71640, b'1', 'Transport of cleaning supplies', 173, 1698, 0, b'0', b'0', b'0', NULL, 'docktrailer'),
	(71641, b'0', 'Army secret materials', 98, 1773, 0, b'0', b'1', b'0', 'vnl780', 'armytanker'),
	(71642, b'1', 'Potassium chloride', 15, 2189, 5, b'0', b'0', b'1', NULL, 'liquide1'),
	(71643, b'0', 'Tile transport', 98, 1966, 0, b'0', b'0', b'0', 'man', 'trailers3'),
	(71644, b'1', 'Transport of used packaging', 84, 2011, 0, b'0', b'0', b'0', NULL, 'trailers3'),
	(71645, b'0', 'Log transportation', 68, 1706, 0, b'0', b'0', b'0', 'vnl780', 'trailerlogs'),
	(71646, b'1', 'Transport of used packaging', 11, 2308, 0, b'0', b'0', b'0', NULL, 'trailers3'),
	(71647, b'0', 'Army water supply', 20, 1562, 0, b'0', b'0', b'0', 'daf', 'armytanker'),
	(71648, b'1', 'Frozen meat transport', 7, 1907, 0, b'0', b'0', b'0', NULL, 'trailers2'),
	(71649, b'0', 'Dynamite transport', 160, 1761, 1, b'1', b'0', b'0', 'vnl780', 'trailers4'),
	(71650, b'0', 'Stone transport', 195, 1873, 0, b'0', b'0', b'1', 'vnl780', 'docktrailer');

-- Dumping structure for table s1_origenv2qb.trucker_drivers
CREATE TABLE IF NOT EXISTS `trucker_drivers` (
  `driver_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `product_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `distance` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `valuable` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fast` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `price_per_km` int(10) unsigned NOT NULL DEFAULT 0,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`driver_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1354 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.trucker_drivers: ~23 rows (approximately)
INSERT INTO `trucker_drivers` (`driver_id`, `user_id`, `name`, `product_type`, `distance`, `valuable`, `fragile`, `fast`, `price`, `price_per_km`, `img`) VALUES
	(377, 'NRD24295', 'Berenice Holanda', 3, 0, 2, 3, 2, 15422, 816, 'https://bootdey.com/img/Content/avatar/avatar3.png'),
	(380, 'NRD24295', 'Tamara Tran', 1, 5, 0, 1, 6, 17191, 898, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(381, 'GLD40591', 'Bauer Gay', 3, 4, 2, 5, 3, 19432, 1090, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(1334, NULL, 'Lucas Silva', 2, 0, 2, 2, 1, 14564, 736, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(1335, NULL, 'Sheppard Navarro', 4, 5, 3, 0, 0, 16269, 829, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(1336, NULL, 'Drake Boyd', 3, 0, 2, 3, 3, 16819, 832, 'https://bootdey.com/img/Content/avatar/avatar1.png'),
	(1337, NULL, 'Alba Warren', 3, 2, 1, 1, 1, 15019, 812, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(1338, NULL, 'Maricela Long', 6, 5, 0, 1, 4, 18409, 911, 'https://bootdey.com/img/Content/avatar/avatar1.png'),
	(1339, NULL, 'Hurst Roy', 4, 5, 1, 0, 5, 17600, 945, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(1340, NULL, 'Bridgett Wright', 2, 4, 5, 0, 2, 16792, 889, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(1341, NULL, 'Angie Gonzales', 5, 2, 4, 3, 2, 19120, 1055, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(1342, NULL, 'Janelle Tyson', 6, 1, 3, 2, 0, 16795, 875, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(1343, NULL, 'Billie Schultz', 3, 5, 1, 4, 0, 18079, 835, 'https://bootdey.com/img/Content/avatar/avatar2.png'),
	(1344, NULL, 'Giles Fletcher', 3, 0, 2, 1, 0, 13781, 690, 'https://bootdey.com/img/Content/avatar/avatar2.png'),
	(1345, NULL, 'Benita Bright', 0, 3, 0, 4, 4, 15912, 820, 'https://bootdey.com/img/Content/avatar/avatar6.png'),
	(1346, NULL, 'Kelli Salinas', 2, 1, 6, 1, 1, 16551, 853, 'https://bootdey.com/img/Content/avatar/avatar4.png'),
	(1347, NULL, 'Maitê Lage', 6, 2, 3, 1, 2, 18324, 860, 'https://bootdey.com/img/Content/avatar/avatar3.png'),
	(1348, NULL, 'Madge Boyle', 4, 0, 1, 2, 1, 14622, 739, 'https://bootdey.com/img/Content/avatar/avatar8.png'),
	(1349, NULL, 'Church Golden', 0, 3, 6, 1, 3, 17327, 929, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(1350, NULL, 'Pat Stewart', 3, 6, 1, 4, 0, 17129, 877, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(1351, NULL, 'Blackwell Horne', 0, 5, 1, 6, 1, 16545, 952, 'https://bootdey.com/img/Content/avatar/avatar5.png'),
	(1352, NULL, 'Ochoa Hayden', 2, 1, 0, 4, 1, 14923, 778, 'https://bootdey.com/img/Content/avatar/avatar1.png'),
	(1353, NULL, 'Melissa Cunha', 3, 0, 3, 5, 4, 17859, 963, 'https://bootdey.com/img/Content/avatar/avatar3.png');

-- Dumping structure for table s1_origenv2qb.trucker_loans
CREATE TABLE IF NOT EXISTS `trucker_loans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `loan` int(10) unsigned NOT NULL DEFAULT 0,
  `remaining_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `day_cost` int(10) unsigned NOT NULL DEFAULT 0,
  `taxes_on_day` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.trucker_loans: ~1 rows (approximately)

-- Dumping structure for table s1_origenv2qb.trucker_trucks
CREATE TABLE IF NOT EXISTS `trucker_trucks` (
  `truck_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `truck_name` varchar(50) NOT NULL,
  `driver` int(10) unsigned DEFAULT NULL,
  `body` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `engine` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `transmission` smallint(5) unsigned NOT NULL DEFAULT 1000,
  `wheels` smallint(5) unsigned NOT NULL DEFAULT 1000,
  PRIMARY KEY (`truck_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.trucker_trucks: ~5 rows (approximately)
INSERT INTO `trucker_trucks` (`truck_id`, `user_id`, `truck_name`, `driver`, `body`, `engine`, `transmission`, `wheels`) VALUES
	(3, 'NRD24295', 'w900', 0, 1000, 1000, 1000, 1000),
	(4, 'NRD24295', 'man', 377, 1000, 1000, 1000, 1000),
	(5, 'NRD24295', 't680', 380, 1000, 1000, 1000, 1000),
	(6, 'GLD40591', 'w900', 381, 924, 1000, 962, 904),
	(7, 'EKJ79332', 'w900', 0, 1000, 1000, 1000, 911);

-- Dumping structure for table s1_origenv2qb.trucker_users
CREATE TABLE IF NOT EXISTS `trucker_users` (
  `user_id` varchar(50) NOT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `total_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `finished_deliveries` int(10) unsigned NOT NULL DEFAULT 0,
  `exp` int(10) unsigned NOT NULL DEFAULT 0,
  `traveled_distance` double unsigned NOT NULL DEFAULT 0,
  `skill_points` int(10) unsigned NOT NULL DEFAULT 0,
  `product_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `distance` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `valuable` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fragile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `fast` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `loan_notify` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.trucker_users: ~3 rows (approximately)
INSERT INTO `trucker_users` (`user_id`, `money`, `total_earned`, `finished_deliveries`, `exp`, `traveled_distance`, `skill_points`, `product_type`, `distance`, `valuable`, `fragile`, `fast`, `loan_notify`) VALUES
	('EKJ79332', 96205, 16205, 2, 161, 8.900000000000546, 0, 0, 0, 0, 0, 0, b'0'),
	('GLD40591', 179862, 22798, 3, 227, 9.619999999998981, 0, 0, 0, 0, 0, 0, b'0'),
	('NRD24295', 554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, b'0');

-- Dumping structure for table s1_origenv2qb.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table s1_origenv2qb.trunkitems: ~2 rows (approximately)
INSERT INTO `trunkitems` (`id`, `plate`, `items`) VALUES
	(1, '1ZP178LV', '[]'),
	(11, '8NT395CD', '[]');

-- Dumping structure for table s1_origenv2qb.twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.twitter_account: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.twitter_hashtags: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.twitter_mentions: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.twitter_tweets: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.tw_electrician
CREATE TABLE IF NOT EXISTS `tw_electrician` (
  `identifier` char(50) DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.tw_electrician: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.vehicle_trackers
CREATE TABLE IF NOT EXISTS `vehicle_trackers` (
  `serialNumber` varchar(11) NOT NULL,
  `vehiclePlate` varchar(11) NOT NULL,
  `startedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `serialNumber` (`serialNumber`),
  KEY `vehiclePlate` (`vehiclePlate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Dumping data for table s1_origenv2qb.vehicle_trackers: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_accounts: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_chats: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_groups
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_groups: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_groups_messages
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_groups_messages: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_groups_users
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_groups_users: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.whatsapp_stories
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.whatsapp_stories: ~0 rows (approximately)

-- Dumping structure for table s1_origenv2qb.yellowpages_posts
CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table s1_origenv2qb.yellowpages_posts: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
