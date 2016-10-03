-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 03 okt 2016 om 17:22
-- Serverversie: 5.7.14
-- PHP-versie: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videotheek`
--

-- DROP DATABASE `Videotheek`; CREATE SCHEMA `Videotheek` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `Videotheek` ; --------------------------------------------------------

--
-- Tabelstructuur voor tabel `acteur`
--

CREATE TABLE `acteur` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(45) NOT NULL,
  `tussenvoegsel` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `acteurregel`
--

CREATE TABLE `acteurregel` (
  `acteur` int(11) NOT NULL,
  `film` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `naam` varchar(45) NOT NULL,
  `omschrijving` varchar(200) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `acteur` varchar(45) NOT NULL,
  `hoes` varchar(45) NOT NULL,
  `verhuurbaarAantal` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `filmtransport`
--

CREATE TABLE `filmtransport` (
  `orderregel` int(11) NOT NULL,
  `ophaaldatum` date NOT NULL,
  `afleverdatum` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker`
--

CREATE TABLE `gebruiker` (
  `emailadres` varchar(45) NOT NULL,
  `naam` varchar(45) NOT NULL,
  `achternaam` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `woonplaats` varchar(45) NOT NULL,
  `geactiveerd` tinyint(1) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `wachtwoord` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker`
--

INSERT INTO `gebruiker` (`emailadres`, `naam`, `achternaam`, `adres`, `postcode`, `woonplaats`, `geactiveerd`, `rol`, `wachtwoord`) VALUES
('', 'Dreek', 'karle', 'asddas', '3451AB', '123gfas', 0, 'klant', '6a3266684e5d622c63656539f03e5100'),
('a', 'b', 'c', 'd', 'e', 'f', 0, 'klant', 'g'),
('amarubi@yahoo.com', 'Dreek', 'karle', 'asddas', '3451AB', '123gfas', 0, 'klant', '7d654d6c903fe1cbd131bd3111ffd3cd'),
('please@PLEASE.NL', 'PLEASE', 'WERK', 'DIT', 'KEER', 'MENEERPHP', 0, 'klant', '1a6d0adbb3e0d35b545546a562097885'),
('samarubi@yahoo.com', 'Dreek', 'karle', 'asddas', '3451AB', '123gfas', 0, 'klant', '35135be579bda2d3d47ab1f52468defe');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre`
--

CREATE TABLE `genre` (
  `genre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genreregel`
--

CREATE TABLE `genreregel` (
  `genre` varchar(45) NOT NULL,
  `film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klacht`
--

CREATE TABLE `klacht` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `klacht` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(32) CHARACTER SET latin1 NOT NULL,
  `userrole` enum('klant','zaalbeheerder','root','administrator') CHARACTER SET latin1 NOT NULL DEFAULT 'klant',
  `activated` enum('yes','no') CHARACTER SET latin1 NOT NULL DEFAULT 'no',
  `activationdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `userrole`, `activated`, `activationdate`) VALUES
(1, 'poep@mail.nl', 'e8636ea013e682faf61f56ce1cb1ab5c', 'klant', 'yes', '2016-06-19 20:03:46'),
(2, 'jelledorrestein@mail.nl', 'e8636ea013e682faf61f56ce1cb1ab5c', 'klant', 'yes', '2016-06-20 19:08:54'),
(3, 'Henk@mail.nl', 'e8636ea013e682faf61f56ce1cb1ab5c', 'klant', 'yes', '2016-06-20 19:12:45'),
(4, 'sabrina@mail.nl', 'e8636ea013e682faf61f56ce1cb1ab5c', 'zaalbeheerder', 'yes', '2016-06-20 19:14:00'),
(5, 'henkie@mail.nl', '221140448413cb872c490192ec8d1941', 'klant', 'no', '2016-06-20 19:16:17');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `datum` date NOT NULL,
  `betaald` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orderregel`
--

CREATE TABLE `orderregel` (
  `id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `film` varchar(45) NOT NULL,
  `leveren` date DEFAULT NULL,
  `ophalen` date DEFAULT NULL,
  `terug` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rol`
--

CREATE TABLE `rol` (
  `rol` varchar(45) NOT NULL,
  `omschrijving` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rol`
--

INSERT INTO `rol` (`rol`, `omschrijving`) VALUES
('klant', 'klant');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `acteurregel`
--
ALTER TABLE `acteurregel`
  ADD PRIMARY KEY (`acteur`);

--
-- Indexen voor tabel `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `filmtransport`
--
ALTER TABLE `filmtransport`
  ADD PRIMARY KEY (`orderregel`);

--
-- Indexen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD PRIMARY KEY (`emailadres`),
  ADD KEY `fk_gebruiker_rol_idx` (`rol`);

--
-- Indexen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre`);

--
-- Indexen voor tabel `genreregel`
--
ALTER TABLE `genreregel`
  ADD PRIMARY KEY (`genre`),
  ADD KEY `fk_genreregel_film_idx` (`film`);

--
-- Indexen voor tabel `klacht`
--
ALTER TABLE `klacht`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_gebruiker_idx` (`email`);

--
-- Indexen voor tabel `orderregel`
--
ALTER TABLE `orderregel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `acteur`
--
ALTER TABLE `acteur`
  ADD CONSTRAINT `fk_acteur_achteurregel` FOREIGN KEY (`id`) REFERENCES `acteurregel` (`acteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `acteurregel`
--
ALTER TABLE `acteurregel`
  ADD CONSTRAINT `fk_acteurregel_film` FOREIGN KEY (`acteur`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `filmtransport`
--
ALTER TABLE `filmtransport`
  ADD CONSTRAINT `fk_filmTransport_orderregel` FOREIGN KEY (`orderregel`) REFERENCES `orderregel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD CONSTRAINT `fk_gebruiker_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `fk_genre_genreregel` FOREIGN KEY (`genre`) REFERENCES `genreregel` (`genre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `genreregel`
--
ALTER TABLE `genreregel`
  ADD CONSTRAINT `fk_genreregel_film` FOREIGN KEY (`film`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_gebruiker` FOREIGN KEY (`email`) REFERENCES `gebruiker` (`emailadres`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `orderregel`
--
ALTER TABLE `orderregel`
  ADD CONSTRAINT `fk_orderregel_film` FOREIGN KEY (`id`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderregel_order` FOREIGN KEY (`id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
