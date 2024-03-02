-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Mar 2024 pada 03.33
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `albumid` int(11) NOT NULL,
  `namaalbum` varchar(225) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggaldibuat` date NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggaldibuat`, `userid`) VALUES
(2, 'kenangan 11', 'album kenangan 11', '2024-02-17', 4),
(3, 'kenangan 2', 'album kenangan 2', '2024-02-17', 4),
(4, 'ML', 'Hero', '2024-02-24', 5),
(5, 'EPEP', 'Karakter', '2024-02-24', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `fotoid` int(11) NOT NULL,
  `judulfoto` varchar(225) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggah` date NOT NULL,
  `lokasifile` varchar(225) NOT NULL,
  `albumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `albumid`, `userid`) VALUES
(3, 'Foto 02', 'Foto 22', '2024-02-24', '39139386_pesona lampung.png', 3, 4),
(4, 'Foto 03', 'Foto 33', '2024-02-24', '251088407_large-goodnewsfromindonesia-gnfi-monumenadipura-bandar-lampung-2019-52edccb049b450f29baa2f6.jpg', 2, 4),
(5, 'Foto1', 'Foto01', '2024-02-24', '1578094880_hayabusa.jpg', 4, 5),
(6, 'Foto2', 'Foto02', '2024-02-24', '910997229_alok.jpg', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentarid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(2, 3, 4, 'bagus', '2024-02-24'),
(3, 4, 4, 'bagus', '2024-02-24'),
(4, 5, 5, 'Keren', '2024-02-24'),
(5, 6, 5, 'keren', '2024-02-24'),
(6, 3, 4, 'keren', '2024-03-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `likeid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tanggallike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(1, 3, 4, '2024-02-24'),
(2, 4, 4, '2024-02-24'),
(3, 3, 5, '2024-02-24'),
(4, 4, 5, '2024-02-24'),
(5, 5, 5, '2024-02-24'),
(6, 6, 5, '2024-02-24'),
(7, 5, 4, '2024-02-24'),
(8, 6, 4, '2024-02-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `namalengkap` varchar(225) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(4, 'Sura', '1234', 'sura@gmail.com', 'Asura', 'Kedaton'),
(5, 'figo', '12345', 'figo@gmail.com', 'mfigodarmawan', 'kedaton');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotoid`),
  ADD KEY `albumid` (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentarid`),
  ADD KEY `FotoID` (`fotoid`),
  ADD KEY `UserID` (`userid`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`likeid`),
  ADD KEY `FotoID` (`fotoid`),
  ADD KEY `UserID` (`userid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `fotoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `likeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `komentarfoto_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`FotoID`) REFERENCES `foto` (`FotoID`),
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
