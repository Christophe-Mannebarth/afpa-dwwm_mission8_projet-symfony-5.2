-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 19 avr. 2021 à 08:32
-- Version du serveur :  8.0.22
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mission8`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

DROP TABLE IF EXISTS `annonces`;
CREATE TABLE IF NOT EXISTS `annonces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `categories_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB988C6F67B3B43D` (`users_id`),
  KEY `IDX_CB988C6FA21214B7` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`id`, `users_id`, `categories_id`, `title`, `slug`, `content`, `created_at`, `active`) VALUES
(1, 1, 3, 'Trottinette à réaction', 'trottinette-a-reaction', 'Superbe trottinette de l\'espace!!\r\nJe vends cette pure beauté pour cause de déménagement dans le Sahara.\r\nJ\'accepte en échange: chameau, dromadaire ou autre bestiole à bosse.\r\nPrix à débattre selon votre taille et votre corpulence, si vous etes petit et frele ça va être très cher!!\r\nJe suis joignable depuis l\'asile des \"petites chèvres du Cantal\"...endroit où il n\'y a pas de chèvres mais qu\'est ce qu\'il y a comme dingos!!', '2021-04-10 11:38:10', 1),
(2, 1, 4, 'Canapé Louis croix vé bâton', 'canape-louis-croix-ve-baton', 'Vends ce magnifique canapé bleu de l\'époque du temps jadis, naguère, oulala ça fait un bail!...\r\nCe canapé appartenait à un certain Louis, on peut apercevoir ce splendide meuble sur la photo, si si cherchez bien je vous assure!!\r\nVous pouvez me contacter uniquement le jour, la nuit je ment, je prends des trains à travers la plaine...', '2021-04-11 18:08:42', 1),
(3, 2, 2, 'Sculpture bio', 'sculpture-bio', 'Je vends cette splendide sculpture biodégradable pour des raisons de santé mentale.\r\nVous pouvez me joindre sur la 548eme branche du 897eme arbre de la zone Nord du parc animalier de Sigean.\r\nBien cordialement, zogotounga oungawa oungawa ', '2021-04-12 11:03:07', 1),
(4, 2, 1, 'Courses poursuites', 'courses-poursuites', 'Affaire à saisir!! Magnifique caddie de compétition, qui vous permettra d\'améliorer grandement votre vitesse d\'achat (à défaut de votre pouvoir...)\r\nPour 5 achetés, la maison vous offre une roulette de secours!!', '2021-04-12 11:08:50', 1),
(5, 1, 4, 'Environnement de travail', 'environnement-de-travail', 'Bonjour, je me sépare avec tristesse de ce fabuleux environnement de travail pour développeur averti!\r\nVous pourrez le déployer où bon vous semble, sa légèreté en faisant un outil portable des plus précieux.\r\nMerci de laisser un message à ma secrétaire qui se fera un plaisir de l\'oublier.', '2021-04-13 11:14:09', 1),
(6, 1, 1, 'Brouette à moteur', 'brouette-a-moteur', '<p>Jolie brouette &agrave; moteur, jamais servie, c&#39;est une affaire!!<br />\r\nIdeale pour promener les gosses</p>', '2021-04-14 15:51:50', 1);

-- --------------------------------------------------------

--
-- Structure de la table `annonces_users`
--

DROP TABLE IF EXISTS `annonces_users`;
CREATE TABLE IF NOT EXISTS `annonces_users` (
  `annonces_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`annonces_id`,`users_id`),
  KEY `IDX_F60119834C2885D7` (`annonces_id`),
  KEY `IDX_F601198367B3B43D` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonces_users`
--

INSERT INTO `annonces_users` (`annonces_id`, `users_id`) VALUES
(1, 1),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3AF34668727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `color`) VALUES
(1, NULL, 'Véhicules', 'vehicules', 'blue'),
(2, NULL, 'Maison', 'maison', 'red'),
(3, 1, '2 roues', '2-roues', 'yellow'),
(4, 2, 'Mobilier', 'mobilier', 'green');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `annonces_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `rgpd` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962A4C2885D7` (`annonces_id`),
  KEY `IDX_5F9E962A727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `annonces_id`, `parent_id`, `content`, `active`, `email`, `nickname`, `created_at`, `rgpd`) VALUES
(1, 2, NULL, '<p>Bonjour,</p>\r\n\r\n<p>Est-ce que ce fameux Louis mentionn&eacute; dans votre annonce serait un cousin &eacute;loign&eacute; de mon oncle Maurice qui habite &agrave; Lille?</p>\r\n\r\n<p>Merci</p>', 1, 'tetedeuf@gmail.com', 'caliméro56', '2021-04-14 04:37:50', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210407065811', '2021-04-07 09:03:03', 1197),
('DoctrineMigrations\\Version20210407093251', '2021-04-07 11:34:05', 512),
('DoctrineMigrations\\Version20210407143518', '2021-04-07 16:35:48', 2005),
('DoctrineMigrations\\Version20210407211039', '2021-04-07 23:11:31', 3064),
('DoctrineMigrations\\Version20210407215449', '2021-04-07 23:55:35', 4095),
('DoctrineMigrations\\Version20210412110144', '2021-04-12 11:02:20', 2827),
('DoctrineMigrations\\Version20210413064239', '2021-04-13 08:43:43', 2658),
('DoctrineMigrations\\Version20210413074301', '2021-04-13 09:43:21', 4139),
('DoctrineMigrations\\Version20210414004826', '2021-04-14 02:48:57', 8467),
('DoctrineMigrations\\Version20210414042043', '2021-04-14 06:21:04', 839);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `annonces_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E01FBE6A4C2885D7` (`annonces_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `annonces_id`, `name`) VALUES
(1, 1, 'trottinette.jpg'),
(2, 2, 'canape.jpg'),
(3, 3, 'banane.jpg'),
(4, 4, 'caddie.jpg'),
(5, 5, 'bar.jpg'),
(6, 6, 'brouette.jpg'),
(7, 5, 'transat.jpg'),
(8, 1, 'trottinette2.jpg'),
(9, 4, 'caddie2.jpg'),
(10, 2, 'canape2.jpg'),
(11, 6, 'brouette2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `is_verified`, `name`, `firstname`) VALUES
(1, 'contact@demo.fr', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dHk2RVlRUkVXVFJJek5RcA$rI2/ZOk1vAfsTk3f1WuqHP6/jrd6IdWOqZYpFnyzeLg', 1, 'Mann', 'Chris'),
(2, 'toto@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$aXgzWnk1d24xVUdQR1VqUQ$SxiY07ICQZpkUT0IZNxHRNqOfzu32QtuO1PquzIBzBc', 1, 'Lateta', 'Toto');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces` ADD FULLTEXT KEY `IDX_CB988C6F2B36786BFEC530A9` (`title`,`content`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `FK_CB988C6F67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_CB988C6FA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `annonces_users`
--
ALTER TABLE `annonces_users`
  ADD CONSTRAINT `FK_F60119834C2885D7` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F601198367B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK_3AF34668727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A4C2885D7` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`),
  ADD CONSTRAINT `FK_5F9E962A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_E01FBE6A4C2885D7` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
