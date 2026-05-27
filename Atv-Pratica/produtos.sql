-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Maio-2026 às 22:49
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Enlatados'),
(2, 'Laticínios'),
(3, 'Açougue'),
(4, 'Limpeza'),
(5, 'molhos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `datacad` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtde`, `datacad`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Acém Peça', '39.99', 50, '2026-05-13', b'1', 3, 'Sem gordura', ''),
(2, 'Milho', '2.37', 10, '2026-10-01', b'0', 1, '', ''),
(5, 'Patinho', '49.99', 30, '2026-07-23', b'1', 1, 'com gordura', 'friboi'),
(6, 'Alcatra', '35.99', 20, '2026-08-30', b'1', 3, 'com gordura', 'friboi'),
(7, 'Contra filé', '29.99', 33, '2026-07-29', b'1', 3, 'com gordura', 'friboi'),
(8, 'Detergente', '3.99', 50, '2027-05-12', b'1', 4, 'Não contaminado', 'Ypê'),
(9, 'Molho Tomate', '2.49', 73, '2026-12-27', b'1', 5, '100% Tomate', 'Fugini'),
(10, 'Ervilha', '5.99', 80, '2026-09-11', b'1', 1, '170g', 'Quero'),
(11, 'Sabão em pó', '13.29', 40, '2027-08-17', b'1', 4, 'Use em roupa', 'OMO'),
(12, 'Leite', '4.59', 60, '2027-01-11', b'1', 2, '1 Litro', 'Parmalat'),
(13, 'Leite', '3.99', 50, '2027-01-11', b'1', 2, '1 Litro', 'Italac'),
(14, 'Leite Condensado', '6.49', 30, '2027-03-15', b'1', 2, 'Desnatado', 'Moça'),
(15, 'Queijo', '13.49', 20, '2027-04-20', b'1', 2, '', 'Fusqueijão'),
(16, 'Requeijão', '7.49', 40, '0000-00-00', b'1', 2, 'Cremoso', 'Vigor');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
