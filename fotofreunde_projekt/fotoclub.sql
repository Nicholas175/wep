-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Dez 2017 um 16:39
-- Server-Version: 10.1.16-MariaDB
-- PHP-Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `ppb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `imageId` varchar(36) NOT NULL,
  `username` varchar(8) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `email` varchar(300) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `admin` boolean NOT NULL,
  `about` varchar(1000),
  `favouriteText` varchar(1000),
  `fav1_Id` varchar(36),
  `fav2_Id` varchar(36),
  `fav3_Id` varchar(36),
  `fav4_Id` varchar(36),
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gallery` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `categoryId` tinyint NOT NULL,
  `title` varchar(80) NOT NULL,
  `imageId` varchar(36) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `id` tinyint NOT NULL,
  `type` tinyint NOT NULL,
  `description` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `categoryId` tinyint NOT NULL,
  `imageId` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `entry` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `id` varchar(36) NOT NULL,
  `articleId` varchar(36) NOT NULL,
  `title` varchar(80) NOT NULL,
  `entry` varchar(400) NOT NULL,
  `author` varchar(80) NOT NULL,
  `email` varchar(320) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `image` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `workshop` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `categoryId` tinyint NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(500) NOT NULL,
  `maxParticipants` tinyint(2) NOT NULL,
  `location` varchar(500) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `imageId` varchar(36) NOT NULL,
  `eventDate` timestamp NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `participant` (
  `id` varchar(36) NOT NULL,
  `workshopId` varchar(36) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(300) NOT NULL,
  `numOfPersons` tinyint(2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`); 

ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT `FK_GalleryUser` FOREIGN KEY (`userId`) REFERENCES `user`(`id`),
  ADD CONSTRAINT `FK_GalleryCategory` FOREIGN KEY (`categoryId`) REFERENCES `category`(`id`);

ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT `FK_WorkshopUser` FOREIGN KEY (`userId`) REFERENCES `user`(`id`),
  ADD CONSTRAINT `FK_WorkshopCategory` FOREIGN KEY (`categoryId`) REFERENCES `category`(`id`);

  ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD CONSTRAINT `FK_WorkshopParticipant` FOREIGN KEY (`workshopId`) REFERENCES `workshop`(`id`);  

--
-- Daten für Tabelle `user`
--
-- pw: 12345 -> $2y$10$IeMpvUuMIrnxFHN.j94tEe.T1rjsTga1yYoyt5JAAXYUwbbjh1km6

INSERT INTO `image`(`id`, `userId`, `filename`, `description`, `created`) VALUES
('2308a57f-7239-11e9-95d5-bc8385109d0e', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0'
, 'aplpha_7.jpeg', 'Bild einer Sony Alpha 7','2018-12-12 10:13:20'),
('2308a583-7239-11e9-95d5-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0'
, 'fiona84-001.jpeg', 'Eine spiralförmige Treppe', '2018-05-12 12:11:31'),
('2308a587-7239-11e9-95d5-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0'
, 'fiona84-002.jpeg', 'Sonnenaufgang am Strand', '2018-01-11 09:31:12'),
('2308a58b-7239-11e9-95d5-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0'
, 'fiona84-003.jpeg', 'Eine Brücke im Nebel', '2018-02-23 09:33:32'),
('2308a58c-7239-11e9-95d5-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0'
, 'fiona84-004.jpeg', 'Wald am See', '2018-02-23 09:33:32'),
('2308a58f-7239-11e9-95d5-bc8385109d0e', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0'
, 'stefan78-001.jpeg', 'Foto eines jungen Mannes mit Kamera', '2018-04-14 12:11:31'),
('2308a590-7239-11e9-95d5-bc8385109d0e', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0'
, 'stefan78-002.jpeg', 'Weiße und rote Blumen', '2018-03-12 09:33:32'),
('67df9eec-7239-11e9-95d5-bc8385109d0e', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0'
, 'stefan78-003.jpeg', 'Foto einer jungen Frau bei Nacht', '2018-03-12 09:31:12'),
('67df9ef4-7239-11e9-95d5-bc8385109d0e', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0'
, 'stefan78-004.jpeg', 'Abendrot in der Stadt', '2018-03-12 09:31:12'),
('67df9ef5-7239-11e9-95d5-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0'
, 'nachtansichten.jpeg', 'Nachtansichten','2019-04-28 11:37:42');


INSERT INTO `user` (`id`, `imageId`, `username`, `firstname`, `lastname`, `email`, `pw`, `admin`, `about`,`favouriteText`, `created`) VALUES
('0bb28278-d28a-11e7-b93f-2c4d544f8fe0', '2308a58f-7239-11e9-95d5-bc8385109d0e', 'stefan78', 'Stefan', 'Stativ', 
'stefan@test.de', '$2y$10$IeMpvUuMIrnxFHN.j94tEe.T1rjsTga1yYoyt5JAAXYUwbbjh1km6', 1
, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. '
, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.'
, '2017-11-26 09:13:20'),
('4f141df7-3c0a-11e8-b046-2c4d544f8fe0', '67df9eec-7239-11e9-95d5-bc8385109d0e', 'fiona84', 'Fiona', 'Filter', 
'fiona@test.de', '$2y$10$IeMpvUuMIrnxFHN.j94tEe.T1rjsTga1yYoyt5JAAXYUwbbjh1km6', 0
, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. '
, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.'
,'2018-01-12 11:11:51');

INSERT INTO `category` (`id`, `type`, `description`, `created`) VALUES
(1, 1, 'Portrait', '2018-04-14 12:11:31'),
(2, 1, 'Natur', '2018-04-14 12:11:31'),
(3, 1, 'Landschaft', '2018-04-14 12:11:31'),
(4, 1, 'Urban', '2018-04-14 12:11:31'),
(5, 2, 'Fototreff', '2018-04-14 12:11:31'),
(6, 2, 'Tipps und Tricks', '2018-04-14 12:11:31'),
(7, 2, 'Testbericht', '2018-04-14 12:11:31'),
(8, 3, 'Fototreff', '2018-04-14 12:11:31'),
(9, 3, 'Bildbearbeitung', '2018-04-14 12:11:31'),
(10, 3, 'Landschaftsfotografie', '2018-04-14 12:11:31'),
(11, 3, 'Portraitfotografie', '2018-04-14 12:11:31');

INSERT INTO `gallery`(`id`, `userId`, `categoryId`, `title`, `imageId`, `created`) VALUES 
('b164bc94-eaf1-11e7-a313-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 1,
 'Ich selbst', '2308a58f-7239-11e9-95d5-bc8385109d0e', '2018-04-14 12:11:31'),
('7519223c-3429-11e8-be39-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 1
, 'Licht', '67df9eec-7239-11e9-95d5-bc8385109d0e', '2018-03-12 09:31:12'), 
('d746f216-eaf1-11e7-a313-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 2
, 'Flowers', '2308a590-7239-11e9-95d5-bc8385109d0e', '2018-03-12 09:33:32'),
('0ccef76b-3da0-11e8-9afe-2c4d544f8fe0', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0', 4,
 'Endlos', '2308a583-7239-11e9-95d5-bc8385109d0e', '2018-05-12 12:11:31'),
('61f52468-3da0-11e8-9afe-2c4d544f8fe0', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0', 3
, 'Morgenrot', '2308a587-7239-11e9-95d5-bc8385109d0e', '2018-01-11 09:31:12'), 
('68f78c36-3da0-11e8-9afe-2c4d544f8fe0', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0', 3
, 'Tiefe Wolken', '2308a58b-7239-11e9-95d5-bc8385109d0e', '2018-02-23 09:33:32');

INSERT INTO `article`(`id`, `userId`, `categoryId`, `imageId`, `title`, `entry`, `created`) VALUES 
('cbdb169f-e0da-11e7-a056-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 7, '2308a57f-7239-11e9-95d5-bc8385109d0e', 'Sony Alpha 7 iii'
    ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. 
    \r\nNullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.
    \r\nFusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.'
    ,'2018-12-12 10:13:20'),
('f94513b4-2eb0-11e8-bff0-bc8385109d0e', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0', 5, '67df9ef5-7239-11e9-95d5-bc8385109d0e', 'Fototreff bei den Nachtansichten'
    ,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. 
    \r\nFusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.'
    ,'2019-04-28 11:37:42');

INSERT INTO `comment` (`id`, `articleId`, `title`, `entry`, `author`, `email`, `created`) VALUES
('4492837b-2db9-11e8-9fc2-bc8385109d0e', 'cbdb169f-e0da-11e7-a056-2c4d544f8fe0', 'Erster Kommentar', 'Hallo,\r\ndas hier ist ein erster Kommentar. Der Artikel ist top',
 'Max', 'test@test.de', '2017-10-14 10:14:28'),
 ('9995daf9-2e9c-11e8-bff0-bc8385109d0e', 'cbdb169f-e0da-11e7-a056-2c4d544f8fe0', 'Zweiter Kommentar', 'Hallo Max,\r\ndeiner Aussage kann ich gar nicht zustimmen!',
 'Fiona', 'fiona@test.de', '2017-10-15 11:32:16');

INSERT INTO `workshop`(`id`, `userId`, `categoryId`, `title`, `description`, `maxParticipants`
 , `location`, `price`, `imageId`, `eventDate`, `created`) VALUES 
('b164bc94-eaf1-11e7-a313-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 8,
 'Fototreff bei den Nachtansichten', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. 
    \r\nNullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.'
, 10, 'Am alten Markt, Bielefeld', 0.00, '67df9eec-7239-11e9-95d5-bc8385109d0e', '2019-08-30 14:00:00', '2019-04-14 12:11:31'),
('7519223c-3429-11e8-be39-2c4d544f8fe0', '0bb28278-d28a-11e7-b93f-2c4d544f8fe0', 9
, 'Freistellen eines Gesichts', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. 
    \r\nNullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.'
, 10, 'Vereinshaus', 30.00, '2308a58f-7239-11e9-95d5-bc8385109d0e', '2019-10-03 08:00:00', '2019-03-12 09:31:12'), 
('d746f216-eaf1-11e7-a313-2c4d544f8fe0', '4f141df7-3c0a-11e8-b046-2c4d544f8fe0', 11
, 'Portraitfotografie mit Model Anna', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. 
    \r\nNullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.'
, 8, 'Vereinshaus', 100.00, '2308a58f-7239-11e9-95d5-bc8385109d0e', '2019-09-15 07:00:00', '2019-03-12 09:31:12');

INSERT INTO `participant`(`id`, `workshopId`, `name`, `email`, `numOfPersons`, `created`) VALUES 
('d714b913-275a-11e8-8097-bc8385109d0e', 'b164bc94-eaf1-11e7-a313-2c4d544f8fe0'
, 'Familie Foto', 'w.foto@test.de', 4, '2018-06-17 12:11:31'),
('c814b913-275a-11e8-8097-bc8385109d0e', 'b164bc94-eaf1-11e7-a313-2c4d544f8fe0'
, 'Willi Weitwinkel', 'willi65@test.de', 2, '2018-06-19 22:21:56'),
('4f93e562-275b-11e8-8097-bc8385109d0e', 'd746f216-eaf1-11e7-a313-2c4d544f8fe0'
, 'Klara Kamera', 'klara1@test.de',2 , '2018-06-12 10:27:13');

-- -------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
