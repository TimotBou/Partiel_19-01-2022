-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 jan. 2022 à 11:44
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_partiel`
--

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE `salarie` (
  `isSal` int(3) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `age` int(2) NOT NULL,
  `fonction` varchar(30) NOT NULL,
  `service` varchar(30) NOT NULL,
  `grade` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`isSal`, `nom`, `prenom`, `age`, `fonction`, `service`, `grade`) VALUES
(1, 'BOURLETTE', 'Timothe', 19, 'Gestion', 'Informatique', '1');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `idSess` int(3) NOT NULL,
  `date_deb` date NOT NULL,
  `nbre_jours` int(2) NOT NULL,
  `module` varchar(20) NOT NULL,
  `idSal` int(3) NOT NULL,
  `lieuForm` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`idSess`, `date_deb`, `nbre_jours`, `module`, `idSal`, `lieuForm`) VALUES
(801, '2022-02-15', 15, 'Stage Decouverte', 1, 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `login` varchar(20) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`login`, `Password`) VALUES
('Tim_BOU', 'BOU_Tim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD PRIMARY KEY (`isSal`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`idSess`),
  ADD KEY `clef etrangere` (`idSal`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`login`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `clef etrangere` FOREIGN KEY (`idSal`) REFERENCES `salarie` (`isSal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
