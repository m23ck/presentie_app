-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 26 nov 2019 om 23:56
-- Serverversie: 10.4.8-MariaDB
-- PHP-versie: 7.3.11

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
(2, 6, 2, '2019-11-04', 1, 'afwezig');

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
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `presentie`
--
ALTER TABLE `presentie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `presentie`
--
ALTER TABLE `presentie`
  ADD CONSTRAINT `presentie_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `presentie_ibfk_2` FOREIGN KEY (`vakid`) REFERENCES `vak` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
