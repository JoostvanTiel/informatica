-- ============================================================
-- NIMMASTREAM DATABASE - IMPROVED VERSION for Education
-- MET DROP TABLE IF EXISTS - VEILIGE HERSTART
-- ============================================================
-- WAARSCHUWING: Dit script WIST de bestaande tabellen!
-- Gebruik ALLEEN als je zeker weet dat je de old data niet meer nodig hebt
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@OLD_COLLATION_CONNECTION */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET NAMES utf8mb4 */;

-- ========================================
-- WISSEN: Verwijder alle bestaande tabellen
-- ========================================
DROP TABLE IF EXISTS `beoordelingen`;
DROP TABLE IF EXISTS `kijkgeschiedenis`;
DROP TABLE IF EXISTS `abonnementen`;
DROP TABLE IF EXISTS `profielen`;
DROP TABLE IF EXISTS `afleveringen`;
DROP TABLE IF EXISTS `series`;
DROP TABLE IF EXISTS `gebruikers`;
DROP TABLE IF EXISTS `genres`;
DROP TABLE IF EXISTS `todo`;

-- ========================================
-- DATABASE: `nimmastream_2627`
-- ========================================

-- ========================================
-- TABEL: `gebruikers`
-- ========================================
CREATE TABLE `gebruikers` (
  `id` int NOT NULL,
  `voornaam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tussenvoegsel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `achternaam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `leeftijd` int NOT NULL,
  `regio` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `genres`
-- ========================================
CREATE TABLE `genres` (
  `id` int NOT NULL,
  `naam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `series`
-- ========================================
CREATE TABLE `series` (
  `id` int NOT NULL,
  `titel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
  `genre_id` int NOT NULL,
  `kijkwijzer` enum('AL','6','9','12','16','18') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'AL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `afleveringen`
-- ========================================
CREATE TABLE `afleveringen` (
  `id` int NOT NULL,
  `serie_id` int NOT NULL,
  `seizoen` int NOT NULL,
  `aflevering_nummer` int NOT NULL,
  `titel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duur_minuten` int NOT NULL,
  `uitzend_datum` date NOT NULL,
  UNIQUE KEY `serie_id_seizoen_aflevering` (`serie_id`,`seizoen`,`aflevering_nummer`),
  KEY `idx_afleveringen_serie` (`serie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `profielen`
-- ========================================
CREATE TABLE `profielen` (
  `id` int NOT NULL,
  `gebruiker_id` int NOT NULL,
  `profielnaam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `leeftijd_profiel` int DEFAULT NULL,
  KEY `idx_profielen_gebruiker` (`gebruiker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `abonnementen`
-- ========================================
CREATE TABLE `abonnementen` (
  `id` int NOT NULL,
  `gebruiker_id` int NOT NULL,
  `type` enum('basis','standaard','premium','edu') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('actief','gepauzeerd','beëindigd') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gestart_op` date NOT NULL DEFAULT (curdate()),
  `beëindigd_op` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gebruiker_id` (`gebruiker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `kijkgeschiedenis`
-- ========================================
CREATE TABLE `kijkgeschiedenis` (
  `id` int NOT NULL,
  `profiel_id` int NOT NULL,
  `aflevering_id` int NOT NULL,
  `kijk_moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_kijk_profiel` (`profiel_id`),
  KEY `idx_kijk_aflevering` (`aflevering_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `beoordelingen` - NOW ON AFLEVERING, NOT SERIE!
-- ========================================
CREATE TABLE `beoordelingen` (
  `id` int NOT NULL,
  `profiel_id` int NOT NULL,
  `aflevering_id` int NOT NULL,
  `beoordeling` int NOT NULL CHECK (`beoordeling` >= 1 AND `beoordeling` <= 10),
  `opmerking` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiel_aflevering` (`profiel_id`,`aflevering_id`),
  KEY `idx_beoordelingen_profiel` (`profiel_id`),
  KEY `idx_beoordelingen_aflevering` (`aflevering_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- TABEL: `todo`
-- ========================================
CREATE TABLE `todo` (
  `todo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ========================================
-- DATA: Genres
-- ========================================
INSERT INTO `genres` (`id`, `naam`) VALUES
(1, 'Science Fiction'),
(2, 'Drama'),
(3, 'Comedy'),
(4, 'Fantasy'),
(5, 'Thriller'),
(6, 'Romance'),
(7, 'Teen Drama'),
(8, 'Psychological Thriller'),
(9, 'Adventure'),
(10, 'Reality');

-- ========================================
-- DATA: Series (25 series)
-- ========================================
INSERT INTO `series` (`id`, `titel`, `genre_id`, `kijkwijzer`) VALUES
(1, 'Stranger Things', 1, '12'),
(2, 'The Umbrella Academy', 1, '12'),
(3, 'Shadow and Bone', 4, '12'),
(4, 'The Witcher', 4, '16'),
(5, 'Chilling Adventures of Sabrina', 4, '12'),
(6, 'Heartstopper', 6, '9'),
(7, 'Never Have I Ever', 3, '12'),
(8, 'Outer Banks', 2, '16'),
(9, 'The Summer I Turned Pretty', 6, '12'),
(10, 'Gossip Girl', 2, '16'),
(11, 'Sex Education', 2, '12'),
(12, 'Elite', 7, '16'),
(13, 'Riverdale', 7, '16'),
(14, 'Pretty Little Liars', 7, '16'),
(15, 'You', 8, '16'),
(16, 'All American', 2, '12'),
(17, 'On My Block', 3, '12'),
(18, 'Skins', 2, '16'),
(19, 'The O.C.', 2, '12'),
(20, 'One Tree Hill', 2, '12'),
(21, 'iCarly', 3, '9'),
(22, 'Victorious', 3, '9'),
(23, 'Wednesday', 4, '12'),
(24, 'The Vampire Diaries', 4, '16'),
(25, 'Dawson\'s Creek', 6, '12');

-- ========================================
-- DATA: Gebruikers (met variatie in leeftijd!)
-- BELANGRIJK: diverse leeftijden voor realistieke oefeningen
-- ========================================
INSERT INTO `gebruikers` (`id`, `voornaam`, `tussenvoegsel`, `achternaam`, `leeftijd`, `regio`) VALUES
(1, 'Emma', NULL, 'Jansen', 14, 'NH'),
(2, 'Lukas', NULL, 'Petersen', 25, 'NB'),
(3, 'Sophie', NULL, 'Berg', 17, 'ZH'),
(4, 'Finn', NULL, 'Andersen', 35, 'FR'),
(5, 'Anna', NULL, 'Larsen', 12, 'GR'),
(6, 'Oscar', NULL, 'Sørensen', 45, 'OV'),
(7, 'Isabella', 'van', 'Dijk', 16, 'DE'),
(8, 'Liam', NULL, 'Müller', 28, 'LI'),
(9, 'Olivia', NULL, 'Schmidt', 13, 'ZE'),
(10, 'Noah', NULL, 'Meyer', 52, 'UT'),
(11, 'Ava', NULL, 'Wagner', 18, 'FL'),
(12, 'Elijah', 'van', 'Berg', 31, 'BE'),
(13, 'Mia', NULL, 'Hoffmann', 11, 'GL'),
(14, 'Mason', NULL, 'Becker', 42, 'NH'),
(15, 'Charlotte', NULL, 'Schulz', 19, 'UK'),
(16, 'Amelia', NULL, 'Fischer', 26, 'FR'),
(17, 'Benjamin', NULL, 'Richter', 15, 'ZH'),
(18, 'Harper', NULL, 'König', 38, 'OV'),
(19, 'Alexander', 'van', 'Stein', 22, 'NB'),
(20, 'Evelyn', NULL, 'Wolf', 48, 'DE'),
(21, 'Michael', NULL, 'Adler', 14, 'UT'),
(22, 'Abigail', NULL, 'Neumann', 29, 'FL'),
(23, 'James', NULL, 'Wolff', 17, 'LI'),
(24, 'Elizabeth', NULL, 'Zimmerman', 51, 'BE'),
(25, 'Daniel', NULL, 'Krüger', 13, 'GL');

-- ========================================
-- DATA: Profielen
-- ========================================
INSERT INTO `profielen` (`id`, `gebruiker_id`, `profielnaam`, `leeftijd_profiel`) VALUES
(1, 1, 'Emma', 14),
(2, 1, 'Ouder', 35),
(3, 2, 'Lukas', 25),
(4, 3, 'Sophie', 17),
(5, 4, 'Finn', 35),
(6, 5, 'Anna', 12),
(7, 6, 'Oscar', 45),
(8, 7, 'Isabella', 16),
(9, 8, 'Liam', 28),
(10, 9, 'Olivia', 13);

-- ========================================
-- DATA: Abonnementen
-- ========================================
INSERT INTO `abonnementen` (`id`, `gebruiker_id`, `type`, `status`, `gestart_op`, `beëindigd_op`) VALUES
(1, 1, 'premium', 'actief', '2024-01-15', NULL),
(2, 2, 'standaard', 'actief', '2024-02-20', NULL),
(3, 3, 'basis', 'actief', '2024-03-10', NULL),
(4, 4, 'premium', 'actief', '2024-01-01', NULL),
(5, 5, 'basis', 'gepauzeerd', '2024-04-15', NULL),
(6, 6, 'premium', 'actief', '2023-12-01', NULL),
(7, 7, 'standaard', 'beëindigd', '2024-01-01', '2024-09-30'),
(8, 8, 'premium', 'actief', '2024-02-14', NULL),
(9, 9, 'edu', 'actief', '2024-03-20', NULL),
(10, 10, 'standaard', 'actief', '2024-01-10', NULL);

-- ========================================
-- DATA: Afleveringen (subset voor testing)
-- ========================================
-- Stranger Things (serie 1)
INSERT INTO `afleveringen` (`id`, `serie_id`, `seizoen`, `aflevering_nummer`, `titel`, `duur_minuten`, `uitzend_datum`) VALUES
(1, 1, 1, 1, 'Chapter One: The Vanishing of Will Byers', 50, '2016-07-15'),
(2, 1, 1, 2, 'Chapter Two: The Weirdo on Maple Street', 47, '2016-07-15'),
(3, 1, 1, 3, 'Chapter Three: Holly, Jolly', 47, '2016-07-15'),
(4, 1, 1, 4, 'Chapter Four: The Body', 56, '2016-07-15'),
(5, 1, 1, 5, 'Chapter Five: The Flea and the Acrobat', 50, '2016-07-15'),
(6, 1, 1, 6, 'Chapter Six: The Monster', 48, '2016-07-15'),
(7, 1, 1, 7, 'Chapter Seven: The Bathtub Experiment', 56, '2016-07-15'),
(8, 1, 1, 8, 'Chapter Eight: The Upside Down', 48, '2016-07-15'),
-- The Umbrella Academy (serie 2)
(9, 2, 1, 1, 'We Only See Each Other at Weddings and Funerals', 59, '2019-02-15'),
(10, 2, 1, 2, 'Run Boy Run', 58, '2019-02-15'),
(11, 2, 1, 3, 'Extra Ordinary', 56, '2019-02-15'),
(12, 2, 1, 4, 'Man on the Moon', 57, '2019-02-15'),
(13, 2, 1, 5, 'Number Five', 60, '2019-02-15'),
-- Heartstopper (serie 6)
(14, 6, 1, 1, '1. Meet', 28, '2022-04-22'),
(15, 6, 1, 2, '2. Crush', 32, '2022-04-22'),
(16, 6, 1, 3, '3. Kiss', 30, '2022-04-22'),
(17, 6, 1, 4, '4. Secret', 30, '2022-04-22'),
(18, 6, 1, 5, '5. Friend', 27, '2022-04-22'),
-- iCarly (serie 21) - meer afleveringen voor oefeningen
(19, 21, 1, 1, 'iWant More Viewers', 30, '2007-09-08'),
(20, 21, 1, 2, 'iDream of Dance', 30, '2007-09-15'),
(21, 21, 1, 3, 'iLike Jake', 30, '2007-09-22'),
(22, 21, 1, 4, 'iWanna Stay with Spencer', 30, '2007-09-29'),
(23, 21, 1, 5, 'iNevel', 30, '2007-10-06');

-- ========================================
-- DATA: Kijkgeschiedenis
-- ========================================
INSERT INTO `kijkgeschiedenis` (`id`, `profiel_id`, `aflevering_id`, `kijk_moment`) VALUES
(1, 1, 1, '2024-10-20 19:30:00'),
(2, 1, 2, '2024-10-20 20:30:00'),
(3, 1, 3, '2024-10-21 19:15:00'),
(4, 3, 9, '2024-10-19 21:00:00'),
(5, 3, 10, '2024-10-20 21:00:00'),
(6, 4, 14, '2024-10-18 18:45:00'),
(7, 4, 15, '2024-10-19 18:45:00'),
(8, 6, 19, '2024-10-15 16:30:00'),
(9, 6, 20, '2024-10-16 16:30:00'),
(10, 8, 1, '2024-10-22 20:00:00');

-- ========================================
-- DATA: Beoordelingen (OP AFLEVERINGEN!)
-- BELANGRIJK: enkele profielen hebben NO beoordelingen (voor subquery oefeningen)
-- ========================================
INSERT INTO `beoordelingen` (`id`, `profiel_id`, `aflevering_id`, `beoordeling`, `opmerking`, `datum`) VALUES
(1, 1, 1, 9, 'Geweldig start van de serie!', '2024-10-20 20:45:00'),
(2, 1, 2, 8, 'Erg spannend', '2024-10-20 21:30:00'),
(3, 3, 9, 10, 'Beste episode ooit!', '2024-10-19 21:30:00'),
(4, 3, 10, 9, 'Erg grappig', '2024-10-20 21:30:00'),
(5, 4, 14, 10, 'Gewoon perfect', '2024-10-18 19:30:00'),
(6, 6, 19, 7, 'Leuk maar niet geweldig', '2024-10-15 17:00:00'),
(7, 8, 1, 8, 'Spannend', '2024-10-22 20:30:00');
-- Profiel 9 (Olivia) heeft GEEN beoordelingen - goed voor subqueries!
-- Profiel 10 (en anderen) - geen beoordelingen - goed voor oefeningen

-- ========================================
-- AFLEVERINGEN: Voeg keys toe
-- ========================================
ALTER TABLE `afleveringen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_afleveringen_serie` (`serie_id`);

ALTER TABLE `afleveringen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- ========================================
-- BEOORDELINGEN: Voeg foreign keys toe
-- ========================================
ALTER TABLE `beoordelingen`
  ADD CONSTRAINT `beoordelingen_ibfk_1` FOREIGN KEY (`profiel_id`) REFERENCES `profielen` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `beoordelingen_ibfk_2` FOREIGN KEY (`aflevering_id`) REFERENCES `afleveringen` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- ========================================
-- ANDERE TABELLEN: Keys & Constraints
-- ========================================
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_series_genre` (`genre_id`);

ALTER TABLE `series`
  ADD CONSTRAINT `series_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE RESTRICT;

ALTER TABLE `profielen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_profielen_gebruiker` (`gebruiker_id`),
  ADD CONSTRAINT `profielen_ibfk_1` FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruikers` (`id`) ON DELETE CASCADE;

ALTER TABLE `abonnementen`
  ADD CONSTRAINT `abonnementen_ibfk_1` FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruikers` (`id`) ON DELETE CASCADE;

ALTER TABLE `kijkgeschiedenis`
  ADD CONSTRAINT `kijkgeschiedenis_ibfk_1` FOREIGN KEY (`profiel_id`) REFERENCES `profielen` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kijkgeschiedenis_ibfk_2` FOREIGN KEY (`aflevering_id`) REFERENCES `afleveringen` (`id`) ON DELETE CASCADE;

-- ========================================
-- AUTO_INCREMENT
-- ========================================
ALTER TABLE `afleveringen` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
ALTER TABLE `beoordelingen` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `genres` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `kijkgeschiedenis` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `profielen` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `abonnementen` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `gebruikers` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
ALTER TABLE `series` MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

-- ========================================
-- AFLEVERINGEN FK naar SERIES
-- ========================================
ALTER TABLE `afleveringen`
  ADD CONSTRAINT `afleveringen_ibfk_1` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
