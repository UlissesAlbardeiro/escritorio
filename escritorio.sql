-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 20/05/2024 às 13:31
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escritorio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivos`
--

CREATE TABLE `arquivos` (
  `id` int(11) NOT NULL,
  `numero` varchar(30) DEFAULT NULL,
  `nome` varchar(35) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `setor` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `arquivo` varchar(150) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `id_reg` int(11) NOT NULL,
  `data_cad` date NOT NULL,
  `vencimento` date NOT NULL,
  `usuario_cad` int(11) NOT NULL,
  `usuario_editou` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `arquivos`
--

INSERT INTO `arquivos` (`id`, `numero`, `nome`, `descricao`, `setor`, `categoria`, `grupo`, `fornecedor`, `cliente`, `funcionario`, `arquivo`, `tipo`, `id_reg`, `data_cad`, `vencimento`, `usuario_cad`, `usuario_editou`) VALUES
(2, '12345', 'Pagamento Compra X', '<div><b><i>Pagamento Feito para Empresa CD, em anexo o comprovante que foi pago na data ......</i></b></div><div><br></div><div>Pagamento Feito para Empresa CD, em anexo o comprovante que foi pago na data ......</div><div>Pagamento Feito para Empresa CD, em anexo o comprovante que foi pago na data ......</div><div>Pagamento Feito para Empresa CD, em anexo o comprovante que foi pago na data ......</div>', 2, 3, 0, 2, 0, 0, '25-10-2021-15-33-14-pdfteste.pdf', NULL, 0, '2021-10-25', '0000-00-00', 7, 0),
(3, '', 'Nota Fiscal Y', ' ', 2, 2, 0, 0, 0, 0, '25-10-2021-15-39-30-pdfteste.zip', NULL, 0, '2021-10-25', '0000-00-00', 7, 7),
(4, '', 'Nota XX', ' ', 2, 2, 2, 2, 0, 0, '25-10-2021-18-16-42-conta3.jpg', NULL, 0, '2021-10-25', '2021-10-17', 7, 7),
(6, '1545', 'Arquivo Teste', ' ', 2, 2, 2, 0, 2, 0, '25-10-2021-19-38-04-pdfteste.zip', NULL, 0, '2021-10-25', '0000-00-00', 7, 7),
(8, '', 'Ficha da Talita', ' ', 3, 4, 0, 0, 1, 0, '25-10-2021-20-05-36-pdfteste.pdf', NULL, 0, '2021-10-25', '0000-00-00', 1, 0),
(9, '', 'Documentos de Admissão', ' ', 4, 6, 0, 0, 0, 2, '25-10-2021-20-07-12-pdfteste.zip', NULL, 0, '2021-10-25', '0000-00-00', 1, 0),
(10, '', 'Planilha Pagamentos', ' ', 5, 0, 0, 0, 0, 0, '25-10-2021-20-21-30-teste.xlsx', NULL, 0, '2021-10-25', '0000-00-00', 1, 0),
(12, '84545', 'XML Teste', ' ', 6, 0, 0, 0, 0, 0, '25-10-2021-20-26-17-teste.xml', NULL, 0, '2021-10-25', '0000-00-00', 1, 0),
(15, NULL, 'Nota Fiscal Compra', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-19-36-pdfteste.pdf', NULL, 0, '2021-10-26', '0000-00-00', 1, 0),
(17, NULL, 'Arquivo Conta', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-27-04-pdfteste.pdf', 'Conta à Pagar', 46, '2021-10-26', '0000-00-00', 1, 0),
(18, NULL, 'Arquivo teste', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-29-28-pdfteste.zip', 'Conta à Pagar', 46, '2021-10-26', '0000-00-00', 1, 0),
(19, NULL, 'Arquivo teste 2', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-30-04-teste.xlsx', 'Conta à Pagar', 46, '2021-10-26', '0000-00-00', 1, 0),
(20, NULL, 'Arquivo', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-30-15-teste.xml', 'Conta à Pagar', 46, '2021-10-26', '0000-00-00', 1, 0),
(22, NULL, 'Arquivo Teste', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-09-49-09-arquivoteste.docx', 'Conta à Pagar', 46, '2021-10-26', '0000-00-00', 1, 0),
(24, NULL, 'Nota Fiscal Compra', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-10-52-09-pdfteste.pdf', 'Conta à Pagar', 47, '2021-10-26', '0000-00-00', 1, 0),
(26, NULL, 'Nota Fiscal', NULL, 1, 1, 0, 0, 2, 0, '26-10-2021-11-00-15-pdfteste.pdf', 'Conta à Receber', 9, '2021-10-26', '0000-00-00', 1, 0),
(28, NULL, 'Conta', NULL, 1, 1, 0, 0, 0, 0, '26-10-2021-11-01-18-conta3.jpg', 'Conta à Receber', 8, '2021-10-26', '0000-00-00', 1, 0),
(29, '1234565', 'Documentação Funcionário', '<div align=\"center\"><i><b>adsafsafdasf</b></i></div>', 4, 6, 0, 0, 0, 2, '26-10-2021-11-14-12-arquivoteste.docx', NULL, 0, '2021-10-26', '0000-00-00', 1, 0),
(30, NULL, 'Nota Compra', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-11-19-29-teste.xml', 'Conta à Pagar', 47, '2021-10-26', '0000-00-00', 1, 0),
(32, '', 'Contrato Trabalhista', ' ', 4, 6, 0, 0, 0, 6, '26-10-2021-12-29-40-arquivoteste.docx', 'Funcionário', 6, '2021-10-26', '0000-00-00', 1, 1),
(34, '', 'Comprovante de Endereço', ' ', 4, 0, 0, 0, 0, 5, '26-10-2021-12-30-14-conta3.jpg', 'Funcionário', 5, '2021-10-26', '0000-00-00', 1, 1),
(35, '', 'Teste', ' ', 4, 0, 0, 0, 2, 0, '26-10-2021-12-36-02-arquivoteste.docx', 'Cliente', 2, '2021-10-26', '0000-00-00', 1, 1),
(36, '1841545', 'Teste', ' ', 6, 0, 0, 0, 0, 0, '26-10-2021-12-46-16-teste.xml', NULL, 0, '2021-10-26', '0000-00-00', 1, 0),
(37, '5878448', 'Nota', ' ', 2, 2, 2, 1, 0, 0, '26-10-2021-12-46-34-pdfteste.pdf', NULL, 0, '2021-10-26', '0000-00-00', 1, 0),
(38, NULL, 'Comprovante de Endereço', NULL, 1, 1, 0, 2, 0, 0, '26-10-2021-12-51-18-conta3.jpg', 'Fornecedor', 2, '2021-10-26', '0000-00-00', 1, 0),
(40, NULL, 'aaa', NULL, 1, 1, 0, 1, 0, 0, '26-10-2021-12-52-34-teste.xml', 'Fornecedor', 1, '2021-10-26', '0000-00-00', 1, 0),
(41, NULL, 'fdgdfgd', NULL, 1, 1, 0, 0, 0, 5, '27-10-2021-17-46-40-profile.jpg', 'Funcionário', 5, '2021-10-27', '0000-00-00', 1, 0),
(42, '015451', 'Arquivo X', '<div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div><div><i><b>fdsfdsfsf</b></i></div><div><i><b>sdfsdfsdf</b></i></div><div><i><b>fdsfsfafasfasfafasdfa<br></b></i></div><div><br><div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div><div><i><b>fdsfdsfsf</b></i></div><div><i><b>sdfsdfsdf</b></i></div><i><b>fdsfsfafasfasfafasdfa</b></i><div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div><div><i><b>fdsfdsfsf</b></i></div><div><i><b>sdfsdfsdf</b></i></div><i><b>fdsfsfafasfasfafasdfa</b></i><div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div><div><i><b>fdsfdsfsf</b></i></div><div><i><b>sdfsdfsdf</b></i></div><i><b>fdsfsfafasfasfafasdfa</b></i><div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div><div><i><b>fdsfdsfsf</b></i></div><div><i><b>sdfsdfsdf</b></i></div><i><b>fdsfsfafasfasfafasdfa</b></i><div><i><b>fdsfsafsafasffdsfsafsafasffdsfsafsafasffdsfsafsafasf</b></i></div', 1, 0, 0, 0, 0, 0, 'sem-foto.png', NULL, 0, '2021-10-27', '0000-00-00', 1, 1),
(43, 'fdsafdsaf', 'fdadfasfasfd', '<br><div><i><b>fdsfsfafasfasfafasdfa<br></b></i></div>', 1, 0, 0, 0, 0, 0, 'sem-foto.png', NULL, 0, '2021-10-27', '0000-00-00', 1, 0),
(44, '', 'fdafsafaasdf', 'aaaaaaaaaa', 1, 0, 0, 0, 0, 0, 'sem-foto.png', NULL, 0, '2021-10-27', '0000-00-00', 1, 1),
(45, '012', 'conta mentori', '', 3, 4, 0, 0, 1, 2, 'sem-foto.png', NULL, 0, '2024-01-08', '2024-02-01', 1, 0),
(46, NULL, 'Fff', NULL, 1, 1, 0, 0, 0, 19, '14-01-2024-17-06-53-mensagenssistemaesocialproducaov2-2.pdf', 'Funcionário', 19, '2024-01-14', '0000-00-00', 1, 0),
(47, NULL, 'Fff', NULL, 1, 1, 0, 0, 0, 19, '14-01-2024-17-06-55-mensagenssistemaesocialproducaov2-2.pdf', 'Funcionário', 19, '2024-01-14', '0000-00-00', 1, 0),
(48, '11783441', 'André Gustavo', '', 2, 2, 2, 0, 0, 0, '26-01-2024-14-03-34-Etse-de-envio.pdf', NULL, 0, '2024-01-26', '2024-02-21', 1, 0),
(50, NULL, 'arquivo teste', NULL, 1, 1, 0, 0, 0, 25, '29-01-2024-22-30-17-26-10-2021-12-36-02-arquivoteste.docx', 'Funcionário', 25, '2024-01-29', '0000-00-00', 13, 0),
(51, 'Teste', 'Teste', '<font color=\"#cc6600\"><b>Testando a aplicação</b></font>', 1, 1, 0, 2, 2, 23, '01-02-2024-09-19-08-plantio-de-soja-5.jpg', NULL, 0, '2024-02-01', '2024-02-01', 1, 0),
(52, NULL, 'Uso de EPIs', NULL, 1, 1, 0, 0, 0, 26, '02-02-2024-19-57-39-20180830_093158.jpg', 'Funcionário', 26, '2024-02-02', '0000-00-00', 1, 0),
(53, NULL, 'Uso de EPIs', NULL, 1, 1, 0, 0, 0, 26, '02-02-2024-19-57-46-20180830_093158.jpg', 'Funcionário', 26, '2024-02-02', '0000-00-00', 1, 0),
(54, NULL, 'Uso de EPIs', NULL, 1, 1, 0, 0, 0, 26, '02-02-2024-19-58-06-20180830_093158.jpg', 'Funcionário', 26, '2024-02-02', '0000-00-00', 1, 0),
(55, NULL, 'Uso de EPIs', NULL, 1, 1, 0, 0, 0, 26, '02-02-2024-19-58-11-20180830_093158.jpg', 'Funcionário', 26, '2024-02-02', '0000-00-00', 1, 0),
(56, 'funcionarios', 'luiz', '', 4, 5, 0, 2, 2, 24, '03-02-2024-17-29-45-20190125_095024.jpg', NULL, 0, '2024-02-03', '2024-02-04', 1, 0),
(58, NULL, 'casa em veiculo', NULL, 1, 1, 0, 0, 0, 6, '09-02-2024-15-52-02-IMG_20211013_114439.jpg', 'Funcionário', 6, '2024-02-09', '0000-00-00', 8, 0),
(60, NULL, 'arquiv teste de txt', NULL, 1, 1, 0, 0, 0, 6, '09-02-2024-15-52-42-teste-de-arquivo.txt', 'Funcionário', 6, '2024-02-09', '0000-00-00', 8, 0),
(61, NULL, 'arquivo texte de excel', NULL, 1, 1, 0, 0, 0, 6, '09-02-2024-15-53-30-arquivo-teste-de-excel.xlsx', 'Funcionário', 6, '2024-02-09', '0000-00-00', 8, 0),
(62, NULL, 'fdfsf', NULL, 1, 1, 0, 0, 0, 28, '13-02-2024-17-52-06-eu.jpeg', 'Funcionário', 28, '2024-02-13', '0000-00-00', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(21, 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cat_arquivos`
--

CREATE TABLE `cat_arquivos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `setor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cat_arquivos`
--

INSERT INTO `cat_arquivos` (`id`, `nome`, `setor`) VALUES
(9, 'Todas', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `pessoa` varchar(20) NOT NULL,
  `doc` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `data_nasc` date NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `pessoa`, `doc`, `telefone`, `email`, `endereco`, `data_cad`, `data_nasc`, `obs`, `ativo`) VALUES
(5, 'AlbaWeb', 'Jurídica', '00.000.000/0000-00', '(19) 97155-3715', 'contato@albaweb.com', 'Rua Adalto Francisco landigraff, 85, Jd. Santa Clara', '2024-05-08', '0000-00-00', '', 'Sim'),
(6, 'Livraria Semear', 'Jurídica', '00.000.000/000', '(19) 35614-589', 'contato@semearstore.com', 'Rua ', '2024-05-08', '0000-00-00', 'Observações: Verificar documento brlbla', 'Não');

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `logo_rel` varchar(100) DEFAULT NULL,
  `email_adm` varchar(50) NOT NULL,
  `logs` varchar(5) NOT NULL,
  `dias_limpar_logs` int(11) NOT NULL,
  `relatorio_pdf` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`id`, `nome`, `telefone`, `endereco`, `logo`, `favicon`, `logo_rel`, `email_adm`, `logs`, `dias_limpar_logs`, `relatorio_pdf`) VALUES
(7, 'Consult', '(19) 99999-9999', 'Rua Francisco Carlos, 154', 'logo.png', 'favicon.ico', 'logo.jpg', 'contato@consult.com.br', 'Sim', 1, 'pdf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas_banco`
--

CREATE TABLE `contas_banco` (
  `id` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `banco` varchar(25) NOT NULL,
  `conta` varchar(10) NOT NULL,
  `agencia` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `contas_banco`
--

INSERT INTO `contas_banco` (`id`, `nome`, `banco`, `conta`, `agencia`) VALUES
(1, 'Bradesco', 'Bradesco', '0214-9', '1122-2'),
(2, 'Itaú', 'Itaú', '45668-8', '1123-5');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `pessoa` varchar(20) NOT NULL,
  `doc` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `data_nasc` date NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frequencias`
--

CREATE TABLE `frequencias` (
  `id` int(11) NOT NULL,
  `frequencia` varchar(25) NOT NULL,
  `dias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `frequencias`
--

INSERT INTO `frequencias` (`id`, `frequencia`, `dias`) VALUES
(1, 'Uma Vez', 0),
(2, 'Diária', 1),
(3, 'Semanal', 7),
(4, 'Mensal', 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cargo` int(11) NOT NULL,
  `data_cad` date NOT NULL,
  `data_nasc` date NOT NULL,
  `obs` varchar(1000) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `salario` decimal(8,2) NOT NULL,
  `valor_hora` decimal(8,2) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_saida` time NOT NULL,
  `jornada_horas` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`, `cargo`, `data_cad`, `data_nasc`, `obs`, `foto`, `salario`, `valor_hora`, `hora_entrada`, `hora_saida`, `jornada_horas`) VALUES
(29, 'Ulisses', '377.816.498-85', '(19) 97155-3715', 'ualbardeiro@gmail.com', 'Rua Adalto Francisco landigraff, 85, Jd. Santa Clara', 21, '2024-05-11', '1989-08-14', '', 'sem-perfil.jpg', 4000.00, 85.00, '07:32:00', '17:00:00', '08:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_arquivos`
--

CREATE TABLE `grupo_arquivos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `categoria` int(11) NOT NULL,
  `setor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jornada`
--

CREATE TABLE `jornada` (
  `id` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `data` date NOT NULL,
  `entrada` time NOT NULL,
  `entrada_almoco` time NOT NULL,
  `saida_almoco` time NOT NULL,
  `saida` time NOT NULL,
  `total_horas` time NOT NULL,
  `intervalo` time NOT NULL,
  `hora_extra` time NOT NULL,
  `folga` varchar(5) NOT NULL,
  `feriado` varchar(5) NOT NULL,
  `falta` varchar(5) NOT NULL,
  `data_lanc` date NOT NULL,
  `usuario_lanc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `jornada`
--

INSERT INTO `jornada` (`id`, `funcionario`, `data`, `entrada`, `entrada_almoco`, `saida_almoco`, `saida`, `total_horas`, `intervalo`, `hora_extra`, `folga`, `feriado`, `falta`, `data_lanc`, `usuario_lanc`) VALUES
(2, 1, '2021-10-01', '08:00:00', '12:00:00', '12:55:00', '17:00:00', '08:05:00', '00:55:00', '00:05:00', '', '', '', '2021-10-26', 1),
(4, 1, '2021-10-08', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', '', 'Sim', '2021-10-27', 1),
(5, 1, '2021-10-15', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 'Sim', '', '2021-10-26', 1),
(6, 1, '2021-10-16', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-26', 1),
(7, 1, '2021-10-22', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 'Sim', '', '2021-10-26', 1),
(9, 1, '2021-10-04', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-26', 1),
(10, 1, '2021-10-03', '08:00:00', '12:00:00', '13:10:00', '17:00:00', '07:50:00', '01:10:00', '00:00:00', '', '', '', '2021-10-26', 1),
(11, 1, '2021-10-05', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-26', 1),
(12, 1, '2021-10-07', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', '', 'Sim', '2021-10-26', 1),
(13, 17, '2021-10-01', '08:00:00', '10:00:00', '10:15:00', '17:00:00', '08:45:00', '00:15:00', '00:45:00', '', '', '', '2021-10-26', 1),
(14, 1, '2021-09-04', '08:00:00', '12:01:00', '13:05:00', '17:00:00', '07:56:00', '01:04:00', '00:00:00', '', '', '', '2021-10-26', 1),
(15, 1, '2021-10-02', '08:00:00', '12:00:00', '13:05:00', '17:20:00', '08:15:00', '01:05:00', '00:15:00', '', '', '', '2021-10-26', 1),
(16, 6, '2021-10-20', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 'Sim', '', '2021-10-27', 1),
(17, 1, '2021-11-05', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', '', 'Sim', '2021-10-27', 1),
(18, 1, '2021-09-16', '08:00:00', '12:00:00', '13:00:00', '17:00:00', '08:00:00', '01:00:00', '00:00:00', '', '', '', '2021-10-27', 1),
(19, 1, '2021-10-13', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 'Sim', '', '2021-10-27', 1),
(20, 1, '2021-10-19', '08:00:00', '11:00:00', '12:00:00', '17:00:00', '08:00:00', '01:00:00', '00:00:00', '', '', '', '2021-10-27', 1),
(22, 1, '2021-09-14', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-27', 1),
(23, 1, '2021-09-09', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-27', 1),
(24, 1, '2021-10-11', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-27', 1),
(25, 1, '2021-09-06', '08:00:00', '10:00:00', '11:11:00', '17:00:00', '07:49:00', '01:11:00', '00:00:00', '', '', '', '2021-10-27', 1),
(26, 1, '2021-09-22', '08:00:00', '10:00:00', '11:00:00', '17:00:00', '08:00:00', '01:00:00', '00:00:00', '', '', '', '2021-10-27', 1),
(27, 1, '2021-09-23', '08:00:00', '11:00:00', '12:30:00', '17:00:00', '07:30:00', '01:30:00', '00:00:00', '', '', '', '2021-10-27', 1),
(28, 1, '2021-10-25', '08:00:00', '10:00:00', '10:55:00', '17:00:00', '08:05:00', '00:55:00', '00:05:00', '', '', '', '2021-10-27', 1),
(29, 17, '2021-10-07', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', 'Sim', '', '', '2021-10-27', 1),
(30, 1, '2021-10-28', '08:00:00', '10:00:00', '11:05:00', '17:00:00', '07:55:00', '01:05:00', '00:00:00', '', '', '', '2021-10-27', 1),
(31, 17, '2021-10-12', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 'Sim', '', '2021-10-27', 1),
(32, 19, '2024-01-01', '08:00:00', '12:00:00', '01:00:00', '18:00:00', '21:00:00', '13:00:00', '13:00:00', '', '', '', '2024-01-28', 1),
(33, 19, '2024-01-01', '08:00:00', '12:00:00', '01:00:00', '18:00:00', '21:00:00', '13:00:00', '13:00:00', '', '', '', '2024-01-14', 1),
(34, 19, '2024-01-02', '08:00:00', '23:49:00', '23:50:00', '19:00:00', '10:59:00', '00:01:00', '02:59:00', '', '', '', '2024-01-28', 1),
(35, 19, '2024-02-02', '08:00:00', '11:24:00', '11:50:00', '18:00:00', '09:34:00', '00:26:00', '01:34:00', '', '', '', '2024-02-01', 1),
(36, 3, '2024-02-02', '08:00:00', '08:00:00', '12:00:00', '17:00:00', '05:00:00', '04:00:00', '00:00:00', '', '', '', '2024-02-06', 1),
(38, 23, '2024-02-09', '10:00:00', '12:00:00', '13:00:00', '17:00:00', '06:00:00', '01:00:00', '00:00:00', '', '', '', '2024-02-09', 1),
(39, 26, '2024-02-09', '08:00:00', '12:00:00', '13:00:00', '17:00:00', '08:00:00', '01:00:00', '00:00:00', '', '', '', '2024-02-09', 1),
(40, 1, '2024-02-14', '08:00:00', '10:00:00', '11:10:00', '17:00:00', '07:50:00', '01:10:00', '00:00:00', '', '', '', '2024-02-13', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `tabela` varchar(30) NOT NULL,
  `acao` varchar(35) NOT NULL,
  `usuario` int(11) NOT NULL,
  `id_reg` int(11) NOT NULL,
  `descricao` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id`, `data`, `hora`, `tabela`, `acao`, `usuario`, `id_reg`, `descricao`) VALUES
(1185, '2024-05-20', '08:25:23', 'usuarios', 'login', 1, 0, 'login');

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `movimento` varchar(35) NOT NULL,
  `descricao` varchar(35) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` date NOT NULL,
  `lancamento` varchar(35) NOT NULL,
  `id_mov` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `movimento`, `descricao`, `valor`, `usuario`, `data`, `lancamento`, `id_mov`) VALUES
(1, 'Saída', 'Conta à Pagar', 'Conta DDD - Parcela 3', 83.34, 1, '2021-10-18', 'Cartão de Débito', 36),
(2, 'Saída', 'Conta à Pagar', 'Conta DDD - Parcela 3', 83.34, 1, '2021-10-18', 'Cartão de Débito', 36),
(3, 'Saída', 'Conta à Pagar', '(Resíduo) Conta DDD - Parcela 2', 50.00, 1, '2021-10-18', 'Caixa', 35),
(4, 'Saída', 'Conta à Pagar', '(Resíduo) Conta DDD - Parcela 2', 20.00, 1, '2021-10-18', 'Caixa', 35),
(5, 'Saída', 'Conta à Pagar', '(Resíduo) Conta DDD - Parcela 2', 5.00, 1, '2021-10-18', 'Caixa', 35),
(6, 'Saída', 'Conta à Pagar', '(Resíduo) Conta DDD - Parcela 2', 5.00, 1, '2021-10-18', 'Caixa', 35),
(7, 'Saída', 'Conta à Pagar', 'Conta DDD - Parcela 1', 83.33, 1, '2021-10-18', 'Cartão de Débito', 34),
(8, 'Saída', 'Conta à Pagar', 'Conta', 200.00, 1, '2021-10-18', 'Caixa', 37),
(9, 'Saída', 'Conta à Pagar', '(Resíduo) Conta', 100.00, 1, '2021-10-18', 'Caixa', 38),
(10, 'Saída', 'Conta à Pagar', 'Conta', 105.00, 1, '2021-10-18', 'Caixa', 38),
(11, 'Saída', 'Conta à Pagar', 'Conta DDD - Parcela 2', 3.33, 1, '2021-10-18', 'Caixa', 35),
(12, 'Entrada', 'Conta à Receber', '(Resíduo) Conta - Parcela 1', 50.00, 1, '2021-10-18', 'Caixa', 4),
(13, 'Entrada', 'Conta à Receber', 'Conta - Parcela 2', 200.00, 1, '2021-10-18', 'Caixa', 5),
(14, 'Entrada', 'Conta à Receber', 'Empresa X', 280.00, 1, '2021-10-19', 'Caixa', 7),
(15, 'Saída', 'Conta à Pagar', 'Conta X - Parcela 1', 66.67, 1, '2021-10-19', 'Itaú', 30),
(16, 'Entrada', 'Conta à Receber', 'Conta - Parcela 1', 150.00, 1, '2021-10-19', 'Itaú', 4),
(17, 'Saída', 'Conta à Pagar', 'Aluguél', 1200.00, 1, '2021-10-19', 'Bradesco', 40),
(18, 'Entrada', 'Conta à Receber', 'Empresa X', 160.00, 1, '2021-10-19', 'Caixa', 1),
(19, 'Saída', 'Conta à Pagar', 'Conta - Parcela 1', 33.33, 1, '2021-10-19', 'Caixa', 41),
(20, 'Saída', 'Conta à Pagar', 'Conta - Parcela 1', 33.33, 7, '2021-10-20', 'Caixa', 45),
(21, 'Entrada', 'Conta à Receber', 'aaaa', 500.00, 7, '2021-10-20', 'Itaú', 8),
(22, 'Entrada', 'Conta à Receber', 'Conta - Parcela 3', 200.00, 7, '2021-10-20', 'Caixa', 6),
(23, 'Entrada', 'Conta à Receber', 'Teste', 200.00, 1, '2021-10-27', 'Caixa', 9),
(24, 'Entrada', 'Conta à Receber', 'Talita Santos', 300.00, 1, '2021-10-27', 'Caixa', 12),
(25, 'Saída', 'Conta à Pagar', 'Kamila Silva Santos', 500.00, 1, '2021-10-27', 'Caixa', 49),
(26, 'Saída', 'Conta à Pagar', 'Empresa CD - Parcela 2', 15.00, 1, '2021-11-01', 'Caixa', 52),
(27, 'Saída', 'Conta à Pagar', 'Empresa CD - Parcela 1', 15.00, 1, '2021-10-29', 'Caixa', 51),
(28, 'Saída', 'Conta à Pagar', 'Empresa CD', 230.00, 1, '2021-10-31', 'Caixa', 48),
(29, 'Saída', 'Conta à Pagar', 'Conta - Parcela 3', 33.34, 1, '2021-10-29', 'Caixa', 43),
(30, 'Saída', 'Conta à Pagar', 'Conta - Parcela 1', 33.33, 1, '2021-10-29', 'Caixa', 46),
(31, 'Saída', 'Conta à Pagar', 'Conta X - Parcela 3', 66.66, 1, '2021-10-28', 'Cartão de Débito', 32),
(32, 'Entrada', 'Conta à Receber', 'Empresa X', 800.00, 1, '2021-11-01', 'Caixa', 11),
(33, 'Entrada', 'Conta à Receber', 'Empresa X', 250.00, 1, '2021-10-29', 'Caixa', 13),
(34, 'Saída', 'Conta à Pagar', 'Empresa CD', 500.00, 1, '2021-06-15', 'Caixa', 56),
(35, 'Saída', 'Conta à Pagar', 'Empresa CD', 600.00, 1, '2021-07-15', 'Caixa', 55),
(36, 'Entrada', 'Conta à Receber', 'Empresa X', 850.00, 1, '2021-06-01', 'Caixa', 15),
(37, 'Entrada', 'Conta à Receber', 'Talita Santos', 360.00, 1, '2021-07-01', 'Caixa', 14),
(38, 'Entrada', 'Conta à Receber', 'Empresa X', 200.00, 1, '2021-08-01', 'Caixa', 16),
(39, 'Entrada', 'Conta à Receber', 'Empresa X', 250.00, 1, '2021-11-01', 'Cartão de Débito', 17),
(40, 'Entrada', 'Conta à Receber', 'Empresa Y', 353.00, 1, '2024-01-09', 'Caixa', 20),
(41, 'Saída', 'Conta à Pagar', 'Aluguel', 1500.00, 1, '2024-01-30', 'Caixa', 58),
(42, 'Saída', 'Conta à Pagar', 'Conta - Parcela 1', 33.33, 1, '2024-02-05', 'Caixa', 54);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagar`
--

CREATE TABLE `pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `pessoa` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_venc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_pgto` int(11) NOT NULL,
  `frequencia` int(11) NOT NULL,
  `saida` varchar(50) NOT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `pago` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pagar`
--

INSERT INTO `pagar` (`id`, `descricao`, `pessoa`, `valor`, `data_lanc`, `data_venc`, `data_pgto`, `usuario_lanc`, `usuario_pgto`, `frequencia`, `saida`, `arquivo`, `pago`) VALUES
(2, 'Conta de Luz', 0, 189.99, '2021-10-18', '2021-10-18', '0000-00-00', 0, 0, 0, 'Caixa', 'sem-foto.png', ''),
(8, 'Conta de àgua', 0, 890.50, '2021-10-18', '2021-10-18', '0000-00-00', 1, 0, 0, 'Caixa', '18-10-2021-15-02-46-conta3.jpg', 'Não'),
(10, 'Compra de Cadeiras - Parcela 1', 1, 130.00, '2021-10-18', '2021-10-18', '0000-00-00', 0, 0, 0, 'Caixa', 'sem-foto.png', 'Não'),
(13, 'Conta de Telefone - Parcela 1', 0, 33.33, '2021-10-18', '2021-10-19', '0000-00-00', 0, 0, 0, 'Bradesco', 'sem-foto.png', 'Não'),
(14, 'Conta de Telefone - Parcela 2', 0, 33.33, '2021-10-18', '2021-11-19', '0000-00-00', 0, 0, 0, 'Bradesco', 'sem-foto.png', 'Não'),
(30, 'Conta X - Parcela 1', 2, 66.67, '2021-10-18', '2021-10-18', '2021-10-19', 0, 1, 0, 'Itaú', '18-10-2021-17-31-26-pdfteste.zip', 'Sim'),
(31, 'Conta X - Parcela 2', 2, 66.67, '2021-10-18', '2021-10-19', '0000-00-00', 0, 0, 0, 'Cartão de Débito', '18-10-2021-17-31-26-pdfteste.zip', 'Não'),
(32, 'Conta X - Parcela 3', 2, 66.66, '2021-10-18', '2021-10-20', '2021-10-28', 0, 1, 0, 'Cartão de Débito', '18-10-2021-17-31-26-pdfteste.zip', 'Sim'),
(34, 'Conta DDD - Parcela 1', 1, 83.33, '2021-10-18', '2021-10-18', '2021-10-18', 0, 1, 0, 'Cartão de Débito', 'sem-foto.png', 'Sim'),
(35, 'Conta DDD - Parcela 2', 1, 3.33, '2021-10-18', '2021-11-18', '2021-10-18', 0, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(36, 'Conta DDD - Parcela 3', 1, 83.34, '2021-10-18', '2021-12-18', '2021-10-18', 0, 1, 0, 'Cartão de Débito', 'sem-foto.png', 'Sim'),
(37, 'Conta', 2, 200.00, '2021-10-18', '2021-10-18', '2021-10-18', 1, 1, 1, 'Caixa', 'sem-foto.png', 'Sim'),
(38, 'Conta', 2, 105.00, '2021-10-18', '2021-10-19', '2021-10-18', 1, 1, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(40, 'Aluguél', 1, 1200.00, '2021-10-19', '2021-10-19', '2021-10-19', 1, 1, 30, 'Bradesco', '19-10-2021-11-48-28-pdfteste.pdf', 'Sim'),
(41, 'Conta - Parcela 1', 2, 33.33, '2021-10-19', '2021-10-17', '2021-10-19', 1, 1, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(42, 'Conta - Parcela 2', 2, 33.33, '2021-10-19', '2021-11-17', '0000-00-00', 1, 0, 30, 'Caixa', 'sem-foto.png', 'Não'),
(43, 'Conta - Parcela 3', 2, 33.34, '2021-10-19', '2021-12-17', '2021-10-29', 1, 1, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(44, 'Aluguél', 1, 1200.00, '2021-10-19', '2021-11-19', '0000-00-00', 0, 0, 30, 'Bradesco', '19-10-2021-11-48-28-pdfteste.pdf', 'Não'),
(45, 'Conta - Parcela 1', 2, 33.33, '2021-10-19', '2021-11-17', '2021-10-20', 0, 7, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(46, 'Conta - Parcela 1', 2, 33.33, '2021-10-20', '2021-12-17', '2021-10-29', 0, 1, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(48, 'Empresa CD', 2, 230.00, '2021-10-27', '2021-10-27', '2021-10-31', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(49, 'Kamila Silva Santos', 1, 400.00, '2021-10-27', '2021-10-27', '2021-10-27', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(51, 'Empresa CD - Parcela 1', 2, 15.00, '2021-10-28', '2021-10-28', '2021-10-29', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(52, 'Empresa CD - Parcela 2', 2, 15.00, '2021-10-28', '2021-11-28', '2021-11-01', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(53, 'Conta - Parcela 3', 2, 33.34, '2021-11-01', '2022-01-17', '0000-00-00', 0, 0, 30, 'Caixa', 'sem-foto.png', 'Não'),
(54, 'Conta - Parcela 1', 2, 33.33, '2021-11-01', '2022-01-17', '2024-02-05', 0, 1, 30, 'Caixa', 'sem-foto.png', 'Sim'),
(55, 'Empresa CD', 2, 600.00, '2021-11-01', '2021-11-01', '2021-07-15', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(56, 'Empresa CD', 2, 500.00, '2021-11-01', '2021-11-01', '2021-06-15', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(58, 'Aluguel', 2, 1500.00, '2024-01-09', '2024-01-09', '2024-01-30', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `pessoa` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_venc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_pgto` int(11) NOT NULL,
  `frequencia` int(11) NOT NULL,
  `saida` varchar(50) NOT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `pago` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `receber`
--

INSERT INTO `receber` (`id`, `descricao`, `pessoa`, `valor`, `data_lanc`, `data_venc`, `data_pgto`, `usuario_lanc`, `usuario_pgto`, `frequencia`, `saida`, `arquivo`, `pago`) VALUES
(1, 'Empresa X', 2, 160.00, '2021-10-18', '2021-10-19', '2021-10-19', 1, 1, 0, 'Caixa', '18-10-2021-19-55-56-pdfteste.pdf', 'Sim'),
(4, 'Conta - Parcela 1', 0, 150.00, '2021-10-18', '2021-10-18', '2021-10-19', 1, 1, 0, 'Itaú', 'sem-foto.png', 'Sim'),
(5, 'Conta - Parcela 2', 0, 200.00, '2021-10-18', '2021-11-18', '2021-10-18', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(6, 'Conta - Parcela 3', 0, 200.00, '2021-10-18', '2021-12-18', '2021-10-20', 1, 7, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(7, 'Empresa X', 2, 280.00, '2021-10-19', '2021-10-19', '2021-10-19', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(8, 'aaaa', 0, 500.00, '2021-10-20', '2021-10-20', '2021-10-20', 7, 7, 0, 'Itaú', 'sem-foto.png', 'Sim'),
(9, 'Teste', 2, 200.00, '2021-10-25', '2021-10-26', '2021-10-27', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(10, 'Empresa X', 2, 650.00, '2021-10-27', '2021-10-27', '0000-00-00', 1, 0, 0, 'Caixa', 'sem-foto.png', 'Não'),
(11, 'Empresa X', 2, 800.00, '2021-10-27', '2021-10-27', '2021-11-01', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(12, 'Talita Santos', 1, 300.00, '2021-10-27', '2021-10-27', '2021-10-27', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(13, 'Empresa X', 2, 250.00, '2021-11-01', '2021-11-01', '2021-10-29', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(14, 'Talita Santos', 1, 360.00, '2021-11-01', '2021-11-01', '2021-07-01', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(15, 'Empresa X', 2, 850.00, '2021-11-01', '2021-11-01', '2021-06-01', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(16, 'Empresa X', 2, 200.00, '2021-11-01', '2021-11-01', '2021-08-01', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim'),
(17, 'Empresa X', 2, 250.00, '2021-11-01', '2021-11-01', '2021-11-01', 1, 1, 0, 'Cartão de Débito', 'sem-foto.png', 'Sim'),
(20, 'Empresa Y', 1, 353.00, '2024-01-09', '2024-01-09', '2024-01-09', 1, 1, 0, 'Caixa', 'sem-foto.png', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `setor_arquivos`
--

CREATE TABLE `setor_arquivos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `setor_arquivos`
--

INSERT INTO `setor_arquivos` (`id`, `nome`) VALUES
(15, 'Todos'),
(16, 'Financeiro'),
(17, 'Secretaria'),
(18, 'RH'),
(19, 'Gerencial'),
(20, 'Recepção');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas`
--

CREATE TABLE `tarefas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `hora` time NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `obs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tarefas`
--

INSERT INTO `tarefas` (`id`, `titulo`, `descricao`, `hora`, `data`, `usuario`, `usuario_lanc`, `status`, `obs`) VALUES
(52, 'Regularizar documento da empresa', 'tarefa teste', '21:30:00', '2024-05-11', 17, 1, 'Agendada', 'fazer a remgularizaçãokjahsfdkjahsfjsadhfk'),
(53, 'Regularizar documento da empresa', 'tarefa teste', '01:37:00', '2024-05-11', 17, 1, 'Agendada', 'fazer a remgularizaçãokjahsfdkjahsfjsadhfk'),
(54, 'Regularizar documento da empresa', 'tarefa teste', '09:48:00', '2024-05-11', 17, 1, 'Agendada', 'fazer a remgularizaçãokjahsfdkjahsfjsadhfk'),
(55, 'teste', 'tarefa teste', '02:13:00', '2024-05-11', 1, 1, 'Concluída', 'fghdfgh');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha_crip` varchar(255) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `nivel` varchar(25) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `email`, `senha_crip`, `senha`, `nivel`, `foto`, `id_usu`) VALUES
(1, 'Renato Elci', '000.000.000-00', 'renato@consult.com', '202cb962ac59075b964b07152d234b70', '123', 'Administrador', 'sem-perfil.jpg', 0),
(17, 'Ulisses', '377.816.498-85', 'ualbardeiro@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Gerente', 'sem-perfil.jpg', 29);

-- --------------------------------------------------------

--
-- Estrutura para tabela `valor_parcial`
--

CREATE TABLE `valor_parcial` (
  `id` int(11) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `valor_parcial`
--

INSERT INTO `valor_parcial` (`id`, `id_conta`, `tipo`, `valor`, `data`, `usuario`) VALUES
(1, 35, 'Pagar', 50.00, '2021-10-18', 1),
(3, 35, 'Pagar', 20.00, '2021-10-18', 1),
(4, 35, 'Pagar', 5.00, '2021-10-18', 1),
(5, 35, 'Pagar', 5.00, '2021-10-18', 1),
(6, 38, 'Pagar', 100.00, '2021-10-18', 1),
(7, 4, 'Pagar', 50.00, '2021-10-18', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arquivos`
--
ALTER TABLE `arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cat_arquivos`
--
ALTER TABLE `cat_arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contas_banco`
--
ALTER TABLE `contas_banco`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `frequencias`
--
ALTER TABLE `frequencias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `grupo_arquivos`
--
ALTER TABLE `grupo_arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagar`
--
ALTER TABLE `pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `setor_arquivos`
--
ALTER TABLE `setor_arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tarefas`
--
ALTER TABLE `tarefas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arquivos`
--
ALTER TABLE `arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `cat_arquivos`
--
ALTER TABLE `cat_arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `contas_banco`
--
ALTER TABLE `contas_banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `frequencias`
--
ALTER TABLE `frequencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `grupo_arquivos`
--
ALTER TABLE `grupo_arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `jornada`
--
ALTER TABLE `jornada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1186;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `pagar`
--
ALTER TABLE `pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `setor_arquivos`
--
ALTER TABLE `setor_arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
