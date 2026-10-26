-- ============================================================
-- BULK SETUP: Aanmaken van 15 gebruikers + databases voor leerlingen
-- ============================================================
-- Deze queries creëren:
-- 1. 15 MySQL gebruikers (leerling_001 t/m leerling_015)
-- 2. 15 databases (webshop_001 t/m webshop_015)
-- 3. Correcte privileges per gebruiker
--
-- Instructies:
-- - Kopieer deze queries in phpMyAdmin
-- - Voer ze uit als ROOT of admin gebruiker
-- ============================================================

-- ============================================================
-- GEBRUIKERS AANMAKEN
-- ============================================================

-- Leerling 1
CREATE USER 'leerling_001'@'localhost' IDENTIFIED BY 'webshop_001';
CREATE DATABASE `webshop_001` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_001`.* TO 'leerling_001'@'localhost';

-- Leerling 2
CREATE USER 'leerling_002'@'localhost' IDENTIFIED BY 'webshop_002';
CREATE DATABASE `webshop_002` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_002`.* TO 'leerling_002'@'localhost';

-- Leerling 3
CREATE USER 'leerling_003'@'localhost' IDENTIFIED BY 'webshop_003';
CREATE DATABASE `webshop_003` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_003`.* TO 'leerling_003'@'localhost';

-- Leerling 4
CREATE USER 'leerling_004'@'localhost' IDENTIFIED BY 'webshop_004';
CREATE DATABASE `webshop_004` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_004`.* TO 'leerling_004'@'localhost';

-- Leerling 5
CREATE USER 'leerling_005'@'localhost' IDENTIFIED BY 'webshop_005';
CREATE DATABASE `webshop_005` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_005`.* TO 'leerling_005'@'localhost';

-- Leerling 6
CREATE USER 'leerling_006'@'localhost' IDENTIFIED BY 'webshop_006';
CREATE DATABASE `webshop_006` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_006`.* TO 'leerling_006'@'localhost';

-- Leerling 7
CREATE USER 'leerling_007'@'localhost' IDENTIFIED BY 'webshop_007';
CREATE DATABASE `webshop_007` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_007`.* TO 'leerling_007'@'localhost';

-- Leerling 8
CREATE USER 'leerling_008'@'localhost' IDENTIFIED BY 'webshop_008';
CREATE DATABASE `webshop_008` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_008`.* TO 'leerling_008'@'localhost';

-- Leerling 9
CREATE USER 'leerling_009'@'localhost' IDENTIFIED BY 'webshop_009';
CREATE DATABASE `webshop_009` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_009`.* TO 'leerling_009'@'localhost';

-- Leerling 10
CREATE USER 'leerling_010'@'localhost' IDENTIFIED BY 'webshop_010';
CREATE DATABASE `webshop_010` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_010`.* TO 'leerling_010'@'localhost';

-- Leerling 11
CREATE USER 'leerling_011'@'localhost' IDENTIFIED BY 'webshop_011';
CREATE DATABASE `webshop_011` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_011`.* TO 'leerling_011'@'localhost';

-- Leerling 12
CREATE USER 'leerling_012'@'localhost' IDENTIFIED BY 'webshop_012';
CREATE DATABASE `webshop_012` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_012`.* TO 'leerling_012'@'localhost';

-- Leerling 13
CREATE USER 'leerling_013'@'localhost' IDENTIFIED BY 'webshop_013';
CREATE DATABASE `webshop_013` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_013`.* TO 'leerling_013'@'localhost';

-- Leerling 14
CREATE USER 'leerling_014'@'localhost' IDENTIFIED BY 'webshop_014';
CREATE DATABASE `webshop_014` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_014`.* TO 'leerling_014'@'localhost';

-- Leerling 15
CREATE USER 'leerling_015'@'localhost' IDENTIFIED BY 'webshop_015';
CREATE DATABASE `webshop_015` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `webshop_015`.* TO 'leerling_015'@'localhost';

-- ============================================================
-- FLUSH PRIVILEGES om wijzigingen door te voeren
-- ============================================================
FLUSH PRIVILEGES;

-- ============================================================
-- VERIFI­CATIE (run deze queries om te testen)
-- ============================================================
-- Uncomment deze query om te zien welke users aangemaakt zijn:
-- SELECT user, host FROM mysql.user WHERE user LIKE 'leerling_%' ORDER BY user;

-- Uncomment om databases te zien:
-- SHOW DATABASES LIKE 'webshop_%';

-- ============================================================
-- GEBRUIKERSNAMEN VOOR PHPMYADMIN
-- ============================================================
-- Leerling 001: leerling_001 / webshop_001
-- Leerling 002: leerling_002 / webshop_002
-- Leerling 003: leerling_003 / webshop_003
-- Leerling 004: leerling_004 / webshop_004
-- Leerling 005: leerling_005 / webshop_005
-- Leerling 006: leerling_006 / webshop_006
-- Leerling 007: leerling_007 / webshop_007
-- Leerling 008: leerling_008 / webshop_008
-- Leerling 009: leerling_009 / webshop_009
-- Leerling 010: leerling_010 / webshop_010
-- Leerling 011: leerling_011 / webshop_011
-- Leerling 012: leerling_012 / webshop_012
-- Leerling 013: leerling_013 / webshop_013
-- Leerling 014: leerling_014 / webshop_014
-- Leerling 015: leerling_015 / webshop_015
