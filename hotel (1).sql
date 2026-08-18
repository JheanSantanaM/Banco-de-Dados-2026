-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Ago-2026 às 19:11
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Jhean Miranda', 'jheansantana1201@gmail.com', '478.864.578-54'),
(2, 'Flavio Gustavo', 'flaviogustavo@gmail.com', '564.880.086-76'),
(3, 'Pietro Carvalho', 'pietrocarvalho@gmail.com', '458.056.458-44'),
(4, 'Marcos Paulo', 'Marcospaulo@gmail.com', '533.786.568-34'),
(5, 'Rafael Teixeira', 'rafaelteixeira@gmail.com', '453.766.786-74');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(1, '2026-07-22', NULL, '12:54:03', NULL, '54.50', 1, 12),
(2, '2026-07-22', NULL, '13:00:07', NULL, '57.00', 2, 13),
(3, '2026-07-30', '2026-08-12', '15:20:43', '18:00:00', '48.50', 3, 14),
(4, '2026-08-01', '2026-08-09', '17:08:45', '19:35:10', '53.50', 4, 16),
(5, '2026-07-31', NULL, '19:30:07', NULL, '39.50', 5, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`, `status`) VALUES
(10, '11', '1°andar', 'Casal', 0),
(11, '12', '1°andar', 'Familia - 4 camas', 0),
(12, '13', '1°andar', 'Casal', 1),
(13, '14', '1°andar', 'Casal', 0),
(14, '21', '2°andar', 'Familia - 3 camas', 0),
(15, '22', '2°andar', 'Familia - 4 camas', 0),
(16, '23', '2°andar', 'Casal', 0),
(17, '24', '2°andar', 'Familia - 3 camas', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(1, 'Sprite lata 350ml', 0, '12.00', 'Bebida'),
(2, 'Coca cola lata 350ml', 0, '15.00', 'Bebida'),
(3, 'Salgadinho Fandangus 250g', 0, '8.00', 'Comida'),
(4, 'Strogonoff', 0, '20.00', 'Comida'),
(5, 'Salgadinho Doritos 200g', 0, '10.00', 'Comida'),
(6, 'Pepsi lata 350ml', 0, '11.50', 'Bebida'),
(7, 'Picanha', 0, '54.00', 'Comida');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`, `total`) VALUES
(1, 2, '2026-07-22', '19:40:39', NULL),
(1, 3, '2026-07-22', '20:05:20', NULL),
(1, 6, '2026-07-24', '12:30:45', NULL),
(1, 4, '2026-07-24', '12:35:12', NULL),
(2, 1, '2026-07-22', '21:03:30', NULL),
(2, 5, '2026-07-22', '21:30:32', NULL),
(2, 4, '2026-07-24', '12:20:13', NULL),
(2, 2, '2026-07-24', '12:23:40', NULL),
(3, 2, '2026-07-31', '09:43:00', NULL),
(3, 1, '2026-07-31', '18:32:28', NULL),
(3, 5, '2026-08-01', '16:35:39', NULL),
(3, 6, '2026-08-02', '12:29:17', NULL),
(4, 4, '2026-08-02', '13:27:40', NULL),
(4, 1, '2026-08-02', '13:30:45', NULL),
(4, 5, '2026-08-09', '22:08:34', NULL),
(4, 6, '2026-08-02', '22:10:35', NULL),
(5, 3, '2026-08-01', '14:45:43', NULL),
(5, 6, '2026-08-01', '14:46:09', NULL),
(5, 4, '2026-08-02', '11:30:22', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices para tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices para tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Limitadores para a tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
