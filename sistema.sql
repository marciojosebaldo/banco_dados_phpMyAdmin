-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2023 at 09:25 PM
-- Server version: 8.0.32-0ubuntu0.20.04.2
-- PHP Version: 7.3.33-10+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistema`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cliente`
--

CREATE TABLE `Cliente` (
  `id_cliente` int NOT NULL,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Cliente`
--

INSERT INTO `Cliente` (`id_cliente`, `nome_cliente`, `idade`, `cpf`) VALUES
(1, 'Joao da Silva', 28, '19515725054'),
(2, 'Maria de Souza', 43, '28371677030'),
(3, 'Luiz Gonçalves', 62, '92245510097'),
(4, 'Joao dos Santos', 57, '34422933086');

-- --------------------------------------------------------

--
-- Table structure for table `Loja`
--

CREATE TABLE `Loja` (
  `id_loja` int NOT NULL,
  `nome_loja` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Loja`
--

INSERT INTO `Loja` (`id_loja`, `nome_loja`, `endereco`, `cnpj`) VALUES
(1, 'Pato Branco-PR', 'Matriz Pbco', '68258236000166'),
(2, 'Filial CVV', 'Coronel Vivida - PR', '88114198000185'),
(3, 'Filial Slo', 'São Lourenço - SC', '90374921000107');

-- --------------------------------------------------------

--
-- Table structure for table `Produto`
--

CREATE TABLE `Produto` (
  `id_produto` int NOT NULL,
  `nome_produto` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `preco_unitario` double DEFAULT NULL,
  `custo_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Produto`
--

INSERT INTO `Produto` (`id_produto`, `nome_produto`, `marca`, `preco_unitario`, `custo_unitario`) VALUES
(1, 'Notebook', 'Dell', 3700, 2900),
(2, 'Monitor', 'Dell', 980, 650),
(3, 'Kit teclado mouse', 'Longitec', 170, 110),
(4, 'cadeira gamer', 'Flexform', 1130, 780),
(5, 'Pen Drive 32Gb', 'ScanDisk', 25, 15),
(6, 'SSD 240Gb', 'Kingston', 140, 99.9);

-- --------------------------------------------------------

--
-- Table structure for table `Vendas`
--

CREATE TABLE `Vendas` (
  `id_loja` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `qtde_vendida` int DEFAULT NULL,
  `id_vendas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Vendas`
--

INSERT INTO `Vendas` (`id_loja`, `id_cliente`, `id_produto`, `data_venda`, `qtde_vendida`, `id_vendas`) VALUES
(3, 2, 4, '2023-01-03', 1, 2),
(2, 1, 2, '2023-01-02', 2, 3),
(1, 3, 3, '2023-01-03', 10, 4),
(1, 4, 6, '2023-01-04', 12, 5),
(2, 2, 5, '2023-01-04', 25, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `Loja`
--
ALTER TABLE `Loja`
  ADD PRIMARY KEY (`id_loja`);

--
-- Indexes for table `Produto`
--
ALTER TABLE `Produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `Vendas`
--
ALTER TABLE `Vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `fk_loja` (`id_loja`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_produto` (`id_produto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Loja`
--
ALTER TABLE `Loja`
  MODIFY `id_loja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produto`
--
ALTER TABLE `Produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Vendas`
--
ALTER TABLE `Vendas`
  MODIFY `id_vendas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Vendas`
--
ALTER TABLE `Vendas`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_loja` FOREIGN KEY (`id_loja`) REFERENCES `Loja` (`id_loja`),
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
