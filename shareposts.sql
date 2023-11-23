-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 23 nov. 2023 à 08:26
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shareposts`
--

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `user_id`, `body`, `created_at`) VALUES
(3, 'POST 1', 4, 'Mon permier Post', '2023-05-31 04:45:35'),
(4, 'Le premier post de John', 5, 'Saluuut!', '2023-05-31 04:46:44'),
(5, 'titre', 7, 'test test', '2023-11-17 10:49:53'),
(6, 'Je modifie ce post', 7, 'Je modifie ce post', '2023-11-22 10:44:04');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(5, 'John Doe', 'b@b.com', '$2y$10$LdRwzQnDClg4iYzcMCCPY.eTw8TQizBaGaOvrU1Oq7AaqZsVxJbt6', '2023-05-31 04:46:09'),
(4, 'Matthieu Barda', 'a@a.com', '$2y$10$a7/QnZwr7tgDH1s1UYivZ.aJ1PCbdQ9G9Mx3UudtAfRmqastf0b2a', '2023-05-31 04:45:07'),
(6, 'Garcia', 'philippe3.garcia@laposte.net', '$2y$10$XSMx.GnAiWMW8gvyVyUMuOSdSvLpFmPK7bo4ZEd1sMaur7cbvExlK', '2023-11-17 08:41:10'),
(7, 'Philippe', 'test@test.com', '$2y$10$wxFeuE9XZjVfMV5vgZgDKOMNNND7zc0QQLjfeY8ZXbluVI8BulBqa', '2023-11-17 10:47:33'),
(8, 'lala', 'c@c.com', '$2y$10$yk0/jNd7dy61qGIB.1v4A.dVZ8wEm8JM.nkcgWKkpzSfldZmI7uE.', '2023-11-20 10:51:09'),
(9, 'o', 'd@d.com', '$2y$10$jQCzsySjXB2RaQ7HMDCHbeiFZiOE6DIq3O5xbj7K2542HmnbMfj9u', '2023-11-20 10:53:27'),
(10, 't', 't@t.com', '$2y$10$BoWRlIYll8HObzwFuXF6uuyQpDAyxp7ybDUFdvJw6q6B04OklLjwK', '2023-11-22 09:16:43');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
