-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 18 nov 2019 om 03:57
-- Serverversie: 10.1.36-MariaDB
-- PHP-versie: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presentie_app`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `presentie`
--

CREATE TABLE `presentie` (
  `id` int(11) NOT NULL,
  `studentid` int(255) NOT NULL,
  `vakid` int(255) NOT NULL,
  `datum` date NOT NULL,
  `periode` int(12) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `presentie`
--

INSERT INTO `presentie` (`id`, `studentid`, `vakid`, `datum`, `periode`, `status`) VALUES
(1, 3, 1, '2019-11-04', 13, 'aanwezig'),
(2, 4, 2, '2019-11-04', 1, 'afwezig');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `studentnummer` int(255) NOT NULL,
  `studentcode` varchar(255) NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `achternaam` varchar(50) NOT NULL,
  `cohort` int(50) NOT NULL,
  `studierichting` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `student`
--

INSERT INTO `student` (`id`, `studentnummer`, `studentcode`, `voornaam`, `achternaam`, `cohort`, `studierichting`) VALUES
(3, 120160313, 'amack2016', 'Andojo', 'Mack', 2016, 'ICT'),
(6, 1020324561, 'jnaarendorp2017', 'Joel', 'Naarendorp', 2017, 'ICT'),
(7, 1032465123, 'klatchmansing2016', 'Kenson', 'Latchmansing', 2016, 'ICT');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vak`
--

CREATE TABLE `vak` (
  `id` int(11) NOT NULL,
  `vaknaam` varchar(255) NOT NULL,
  `vakcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `vak`
--

INSERT INTO `vak` (`id`, `vaknaam`, `vakcode`) VALUES
(1, 'Engels', 'eng'),
(2, 'Wiskunde', 'wis'),
(3, 'SLB', 'slb'),
(4, 'Nederlands', 'ned'),
(5, 'Distributed Application', 'dap');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `presentie`
--
ALTER TABLE `presentie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentid` (`studentid`),
  ADD KEY `vakid` (`vakid`);

--
-- Indexen voor tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `studentnummer` (`studentnummer`),
  ADD UNIQUE KEY `studentcode` (`studentcode`);

--
-- Indexen voor tabel `vak`
--
ALTER TABLE `vak`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `presentie`
--
ALTER TABLE `presentie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `vak`
--
ALTER TABLE `vak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
