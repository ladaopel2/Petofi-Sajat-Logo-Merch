-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2026 at 02:07 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminisztrator`
--

CREATE TABLE `adminisztrator` (
  `AdminID` int NOT NULL,
  `AdminVezeteknev` varchar(100) NOT NULL,
  `AdminKeresztnev` varchar(100) NOT NULL,
  `AdminEmail` varchar(200) NOT NULL,
  `AdminJelszo` longtext NOT NULL,
  `AdminLetrehozasiDatuma` date NOT NULL,
  `UtolsoBejelentkezes` date DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `egyeditermek`
--

CREATE TABLE `egyeditermek` (
  `EgyediID` int NOT NULL,
  `EgyediTermekNeve` varchar(300) NOT NULL,
  `EgyediTermekLeiras` text NOT NULL,
  `EgyediTermekParameterek` text NOT NULL,
  `EgyediTermekAr` decimal(12,0) NOT NULL,
  `EgyediLetrehozasiDatum` date NOT NULL,
  `EgyediCikkszam` varchar(100) NOT NULL,
  `EgyediKategoria` varchar(20) NOT NULL,
  `EgyediKeszletmennyiseg` int NOT NULL,
  `EgyediTermekkep` blob NOT NULL,
  `EgyediTermektomeg` decimal(10,2) NOT NULL,
  `EgyediKepfeltoltes` blob NOT NULL,
  `EgyediTermekMerete` varchar(5) DEFAULT NULL,
  `EgyediTermekSzine` varchar(50) DEFAULT NULL,
  `KosarID` int NOT NULL,
  `AdminID` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `felhasznaloifiok`
--

CREATE TABLE `felhasznaloifiok` (
  `FiokID` int NOT NULL,
  `FelhasznaloVezeteknev` varchar(100) NOT NULL,
  `FelhasznaloKeresztnev` varchar(100) NOT NULL,
  `FelhasznaloEmail` varchar(200) NOT NULL,
  `Jelszo` longtext NOT NULL,
  `RegisztracioDatuma` date NOT NULL,
  `EmailMegerositve` tinyint(1) NOT NULL,
  `UtolsoBejelentkezes` date DEFAULT NULL,
  `VasarloID` int NOT NULL,
  `AdminID` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `kosar`
--

CREATE TABLE `kosar` (
  `KosarID` int NOT NULL,
  `KosarTermekNeve` varchar(300) NOT NULL,
  `KosarMennyiseg` int NOT NULL,
  `KosarVegosszeg` decimal(12,0) NOT NULL,
  `KosarLetrehozasiDatum` date NOT NULL,
  `VasarloID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kuponkod`
--

CREATE TABLE `kuponkod` (
  `KuponID` int NOT NULL,
  `Kuponkod` varchar(20) NOT NULL,
  `KedvezmenyTipusa` varchar(30) NOT NULL,
  `KedvezmenyErteke` decimal(10,2) NOT NULL,
  `ErvenyessegKezdete` date NOT NULL,
  `ErvenyessegVege` date NOT NULL,
  `MinimalisKosarertek` decimal(12,0) DEFAULT NULL,
  `FelhasználókéntiLimit` int NOT NULL,
  `KuponAktiv` tinyint(1) NOT NULL,
  `KuponkódLeírás` text NOT NULL,
  `KuponkódLétrehozásiDátuma` date NOT NULL,
  `AdminID` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `rendeles`
--

CREATE TABLE `rendeles` (
  `RendelesID` int NOT NULL,
  `RendelesDatuma` date NOT NULL,
  `FizetesiAllapot` varchar(20) NOT NULL,
  `Megjegyzes` text,
  `VasarloID` int NOT NULL,
  `AdminID` int NOT NULL,
  `KuponID` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `rendelestetel`
--

CREATE TABLE `rendelestetel` (
  `RendelesID` int NOT NULL,
  `TermekID` int NOT NULL,
  `RendelesStatusza` varchar(20) NOT NULL,
  `RendelesReszosszeg` decimal(12,0) NOT NULL,
  `SzallitasiKoltseg` decimal(12,0) NOT NULL,
  `Mennyiseg` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `termek`
--

CREATE TABLE `termek` (
  `TermekID` int NOT NULL,
  `TermekNeve` varchar(300) NOT NULL,
  `TermekLeiras` text NOT NULL,
  `TermekParameterek` text NOT NULL,
  `TermekAr` decimal(12,0) NOT NULL,
  `LetrehozasiDatum` date NOT NULL,
  `Cikkszam` varchar(100) NOT NULL,
  `Kategoria` varchar(20) NOT NULL,
  `Keszletmennyiseg` int NOT NULL,
  `Termekkep` blob NOT NULL,
  `Termektomeg` decimal(10,2) NOT NULL,
  `TermekMerete` varchar(5) DEFAULT NULL,
  `TermekSzine` varchar(50) DEFAULT NULL,
  `AdminID` int NOT NULL,
  `KosarID` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `vasarlo`
--

CREATE TABLE `vasarlo` (
  `VasarloID` int NOT NULL,
  `Vezeteknev` varchar(100) NOT NULL,
  `Keresztnev` varchar(100) NOT NULL,
  `EmailCim` varchar(200) NOT NULL,
  `Cegnev` varchar(255) DEFAULT NULL,
  `Adoszam` varchar(20) NOT NULL,
  `Orszag` varchar(30) NOT NULL,
  `SzamlazasiIranyitoszam` int NOT NULL,
  `SzamlazasiTelepules` varchar(60) NOT NULL,
  `SzamlazasiLakcim` varchar(200) NOT NULL,
  `SzallitasiIranyitoszam` int NOT NULL,
  `SzallitasiTelepules` varchar(60) NOT NULL,
  `SzallitasiLakcim` varchar(200) NOT NULL,
  `VasarloAktiv` tinyint(1) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `vasarlotelefonszam`
--

CREATE TABLE `vasarlotelefonszam` (
  `VasarloID` int NOT NULL,
  `Telefonszam` varchar(25) NOT NULL
) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminisztrator`
--
ALTER TABLE `adminisztrator`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `AdminEmail` (`AdminEmail`);

--
-- Indexes for table `egyeditermek`
--
ALTER TABLE `egyeditermek`
  ADD PRIMARY KEY (`EgyediID`),
  ADD UNIQUE KEY `EgyediCikkszam` (`EgyediCikkszam`),
  ADD KEY `KosarID` (`KosarID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `felhasznaloifiok`
--
ALTER TABLE `felhasznaloifiok`
  ADD PRIMARY KEY (`FiokID`),
  ADD UNIQUE KEY `FelhasznaloEmail` (`FelhasznaloEmail`),
  ADD KEY `VasarloID` (`VasarloID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`KosarID`),
  ADD KEY `VasarloID` (`VasarloID`);

--
-- Indexes for table `kuponkod`
--
ALTER TABLE `kuponkod`
  ADD PRIMARY KEY (`KuponID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`RendelesID`),
  ADD KEY `VasarloID` (`VasarloID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `KuponID` (`KuponID`);

--
-- Indexes for table `rendelestetel`
--
ALTER TABLE `rendelestetel`
  ADD KEY `RendelesID` (`RendelesID`),
  ADD KEY `TermekID` (`TermekID`);

--
-- Indexes for table `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`TermekID`),
  ADD UNIQUE KEY `Cikkszam` (`Cikkszam`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `KosarID` (`KosarID`);

--
-- Indexes for table `vasarlo`
--
ALTER TABLE `vasarlo`
  ADD PRIMARY KEY (`VasarloID`),
  ADD UNIQUE KEY `EmailCim` (`EmailCim`),
  ADD UNIQUE KEY `Adoszam` (`Adoszam`),
  ADD UNIQUE KEY `Cegnev` (`Cegnev`);

--
-- Indexes for table `vasarlotelefonszam`
--
ALTER TABLE `vasarlotelefonszam`
  ADD PRIMARY KEY (`VasarloID`,`Telefonszam`),
  ADD UNIQUE KEY `Telefonszam` (`Telefonszam`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `egyeditermek`
--
ALTER TABLE `egyeditermek`
  ADD CONSTRAINT `egyeditermek_ibfk_1` FOREIGN KEY (`KosarID`) REFERENCES `kosar` (`KosarID`),
  ADD CONSTRAINT `egyeditermek_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `adminisztrator` (`AdminID`);

--
-- Constraints for table `felhasznaloifiok`
--
ALTER TABLE `felhasznaloifiok`
  ADD CONSTRAINT `felhasznaloifiok_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlo` (`VasarloID`),
  ADD CONSTRAINT `felhasznaloifiok_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `adminisztrator` (`AdminID`);

--
-- Constraints for table `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `kosar_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlo` (`VasarloID`);

--
-- Constraints for table `kuponkod`
--
ALTER TABLE `kuponkod`
  ADD CONSTRAINT `kuponkod_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `adminisztrator` (`AdminID`);

--
-- Constraints for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlo` (`VasarloID`),
  ADD CONSTRAINT `rendeles_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `adminisztrator` (`AdminID`),
  ADD CONSTRAINT `rendeles_ibfk_3` FOREIGN KEY (`KuponID`) REFERENCES `kuponkod` (`KuponID`);

--
-- Constraints for table `rendelestetel`
--
ALTER TABLE `rendelestetel`
  ADD CONSTRAINT `rendelestetel_ibfk_1` FOREIGN KEY (`RendelesID`) REFERENCES `rendeles` (`RendelesID`),
  ADD CONSTRAINT `rendelestetel_ibfk_2` FOREIGN KEY (`TermekID`) REFERENCES `termek` (`TermekID`);

--
-- Constraints for table `termek`
--
ALTER TABLE `termek`
  ADD CONSTRAINT `termek_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `adminisztrator` (`AdminID`),
  ADD CONSTRAINT `termek_ibfk_2` FOREIGN KEY (`KosarID`) REFERENCES `kosar` (`KosarID`);

--
-- Constraints for table `vasarlotelefonszam`
--
ALTER TABLE `vasarlotelefonszam`
  ADD CONSTRAINT `vasarlotelefonszam_ibfk_1` FOREIGN KEY (`VasarloID`) REFERENCES `vasarlo` (`VasarloID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
