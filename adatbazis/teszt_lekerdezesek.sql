USE webshop;

-- 1. tábla: adminisztrator

SELECT `AdminID`, `AdminVezeteknev`, `AdminKeresztnev`, `AdminEmail`,
       `AdminLetrehozasiDatuma`, `UtolsoBejelentkezes`
FROM `adminisztrator`;

SELECT DISTINCT `AdminVezeteknev`
FROM `adminisztrator`;

SELECT DISTINCT `AdminKeresztnev`
FROM `adminisztrator`;

SELECT DISTINCT `AdminEmail`
FROM `adminisztrator`;

SELECT DISTINCT `UtolsoBejelentkezes`
FROM `adminisztrator`;

-- 2. tábla: egyeditermek

SELECT `EgyediID`, `EgyediTermekNeve`, `EgyediTermekAr`,
       `EgyediCikkszam`, `EgyediKategoria`, `EgyediKeszletmennyiseg`,
       `EgyediTermektomeg`, `EgyediTermekMerete`, `EgyediTermekSzine`,
       `KosarID`, `AdminID`
FROM `egyeditermek`;

SELECT DISTINCT `EgyediCikkszam`
FROM `egyeditermek`;

SELECT DISTINCT `EgyediKategoria`
FROM `egyeditermek`;

SELECT DISTINCT `EgyediTermekAr`, `EgyediKeszletmennyiseg`, `EgyediTermektomeg`
FROM `egyeditermek`;

SELECT DISTINCT `EgyediTermekMerete`, `EgyediTermekSzine`
FROM `egyeditermek`;

-- 3. tábla: felhasznaloifiok

SELECT `FiokID`, `FelhasznaloVezeteknev`, `FelhasznaloKeresztnev`,
       `FelhasznaloEmail`, `RegisztracioDatuma`, `EmailMegerositve`,
       `UtolsoBejelentkezes`, `VasarloID`, `AdminID`
FROM `felhasznaloifiok`;

SELECT DISTINCT `EmailMegerositve`
FROM `felhasznaloifiok`;

SELECT DISTINCT `FelhasznaloVezeteknev`
FROM `felhasznaloifiok`;

SELECT DISTINCT `FelhasznaloKeresztnev`
FROM `felhasznaloifiok`;

SELECT DISTINCT `FelhasznaloEmail`
FROM `felhasznaloifiok`;

-- 4. tábla: kosar

SELECT `KosarID`, `KosarTermekNeve`, `KosarMennyiseg`,
       `KosarVegosszeg`, `KosarLetrehozasiDatum`, `VasarloID`
FROM `kosar`;

SELECT DISTINCT `KosarMennyiseg`
FROM `kosar`;

SELECT DISTINCT `KosarVegosszeg`
FROM `kosar`;

SELECT DISTINCT `KosarTermekNeve`
FROM `kosar`;

SELECT DISTINCT `VasarloID`
FROM `kosar`;

-- 5. tábla: kuponkod

SELECT `KuponID`, `Kuponkod`, `KedvezmenyTipusa`, `KedvezmenyErteke`,
       `ErvenyessegKezdete`, `ErvenyessegVege`, `MinimalisKosarertek`,
       `FelhasználókéntiLimit`, `KuponAktiv`, `AdminID`
FROM `kuponkod`;

SELECT DISTINCT `KuponAktiv`
FROM `kuponkod`;

SELECT DISTINCT `KedvezmenyTipusa`
FROM `kuponkod`;

SELECT DISTINCT `FelhasználókéntiLimit`
FROM `kuponkod`;

SELECT DISTINCT `MinimalisKosarertek`
FROM `kuponkod`;

-- 6. tábla: rendeles

SELECT `RendelesID`, `RendelesDatuma`, `FizetesiAllapot`, `Megjegyzes`,
       `VasarloID`, `AdminID`, `KuponID`
FROM `rendeles`;

SELECT DISTINCT `FizetesiAllapot`
FROM `rendeles`;

SELECT DISTINCT `RendelesDatuma`
FROM `rendeles`;

SELECT DISTINCT `VasarloID`, `AdminID`, `KuponID`
FROM `rendeles`;

SELECT DISTINCT `Megjegyzes`
FROM `rendeles`;

-- 7. tábla: rendelesitetel

SELECT `RendelesID`, `TermekID`, `RendelesStatusza`, `RendelesReszosszeg`,
       `SzallitasiKoltseg`, `Mennyiseg`
FROM `rendelestetel`;

SELECT DISTINCT `RendelesStatusza`
FROM `rendelestetel`;

SELECT DISTINCT `RendelesReszosszeg`, `SzallitasiKoltseg`
FROM `rendelestetel`;

SELECT DISTINCT `Mennyiseg`
FROM `rendelestetel`;

SELECT DISTINCT `RendelesID`, `TermekID`
FROM `rendelestetel`;

-- 8. tábla: termek

SELECT `TermekID`, `TermekNeve`, `TermekAr`, `LetrehozasiDatum`,
       `Cikkszam`, `Kategoria`, `Keszletmennyiseg`, `Termektomeg`,
       `TermekMerete`, `TermekSzine`, `AdminID`, `KosarID`
FROM `termek`;

SELECT DISTINCT `Kategoria`
FROM `termek`;

SELECT DISTINCT `Cikkszam`
FROM `termek`;

SELECT DISTINCT `TermekAr`, `Keszletmennyiseg`, `Termektomeg`
FROM `termek`;

SELECT DISTINCT `TermekNeve`, `TermekMerete`, `TermekSzine`
FROM `termek`;

-- 9. tábla: vasarlo

SELECT `VasarloID`, `Vezeteknev`, `Keresztnev`, `EmailCim`, `Cegnev`,
       `Adoszam`, `Orszag`, `SzamlazasiIranyitoszam`, `SzamlazasiTelepules`,
       `SzamlazasiLakcim`, `SzallitasiIranyitoszam`, `SzallitasiTelepules`,
       `SzallitasiLakcim`, `VasarloAktiv`
FROM `vasarlo`;

SELECT DISTINCT `VasarloAktiv`
FROM `vasarlo`;

SELECT DISTINCT `Vezeteknev`, `Keresztnev`
FROM `vasarlo`;

SELECT DISTINCT `EmailCim`, `Adoszam`, `Cegnev`
FROM `vasarlo`;

SELECT DISTINCT `SzamlazasiTelepules`, `SzallitasiTelepules`
FROM `vasarlo`;

-- 10. tábla: vasarlotelefonszama

SELECT `VasarloID`, `Telefonszam`
FROM `vasarlotelefonszam`;

SELECT DISTINCT `Telefonszam`
FROM `vasarlotelefonszam`;

SELECT DISTINCT `VasarloID`
FROM `vasarlotelefonszam`;

SELECT DISTINCT `VasarloID`, `Telefonszam`
FROM `vasarlotelefonszam`;

SELECT *
FROM `vasarlotelefonszam`;
