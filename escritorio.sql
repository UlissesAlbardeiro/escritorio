-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 29/05/2024 às 19:28
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
(1, 'Gerente'),
(3, 'Secretário'),
(4, 'Recepcionista'),
(13, 'Administrador'),
(15, 'Auxiliar administrativo');

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
(1, 'Todas', 1),
(2, 'Notas Fiscais', 2),
(3, 'Comprovantes', 2),
(4, 'Ficha Funcionário', 3),
(5, 'Folha de Ponto', 4),
(6, 'Admissão', 4),
(7, 'Demissão', 4),
(8, 'Contrato', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `tipo_empresa` varchar(50) DEFAULT NULL,
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

INSERT INTO `clientes` (`id`, `codigo`, `tipo_empresa`, `nome`, `pessoa`, `doc`, `telefone`, `email`, `endereco`, `data_cad`, `data_nasc`, `obs`, `ativo`) VALUES
(17, '55dfsd', 'ME', 'Semear Store', 'Jurídica', '55.456.565/9559-95', '(22) 22222-2222', 'contato@semearstore.com', 'Rua Adalto Francisco landigraff, 85, Jd. Santa Clara', '2024-05-27', '0000-00-00', '', 'Sim');

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
(7, 'Consult', '(19) 97155-3715', 'Rua Francisco Carlos, 154', 'logo.png', 'favicon.ico', 'logo.jpg', 'ualbardeiro@gmail.com', 'Sim', 40, 'pdf');

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

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `pessoa`, `doc`, `telefone`, `email`, `endereco`, `data_cad`, `data_nasc`, `obs`, `ativo`) VALUES
(1, 'Kamila Silva Santos', 'Física', '588.454.878-54', '(57) 44444-4444', 'kamila@hotmail.com', 'Rua A, Número 150, Bairro XX - Belo Horizonte - MG', '2021-10-13', '2021-10-13', 'Fornecedor de Materiais de Escritório.', 'Não'),
(2, 'Empresa CD', 'Jurídica', '48.745.874/5454-55', '(84) 55454-5454', 'empresacd@hotmail.com', 'Rua S', '2021-10-13', '0000-00-00', '', 'Sim');

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
(3, 'Pablo Silva', '848.787.878-78', '(00)00000-0000', 'secretario@hotmail.com', 'Rua A, Número 150, Bairro XX - Belo Horizonte - MG', 1, '2024-05-21', '2021-10-13', '', '13-10-2021-11-32-15-img1.png', 1800.00, 0.00, '08:00:00', '17:00:00', '08:00:00'),
(29, 'Ulisses', '377.816.498-85', '(19) 97155-3715', 'secretario@gmail.com', '', 3, '2024-05-23', '2024-05-21', '', 'sem-perfil.jpg', 4000.00, 85.00, '08:00:00', '18:00:00', '10:00:00');

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

--
-- Despejando dados para a tabela `grupo_arquivos`
--

INSERT INTO `grupo_arquivos` (`id`, `nome`, `categoria`, `setor`) VALUES
(1, 'Contrato de Locação', 8, 5),
(2, 'Reforma Escritório', 2, 2),
(3, 'Arquivos Prescritos', 1, 1);

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
(1038, '2024-05-20', '18:49:23', 'usuarios', 'login', 1, 0, 'login'),
(1039, '2024-05-20', '18:49:42', 'usuarios', 'edição', 1, 1, 'Ulisses Albardeiro'),
(1040, '2024-05-20', '18:51:05', 'usuarios', 'edição', 1, 1, 'Ulisses Albardeiro'),
(1041, '2024-05-20', '18:51:08', 'usuarios', 'logout', 1, 0, 'logout'),
(1042, '2024-05-20', '18:52:53', 'usuarios', 'login', 1, 0, 'login'),
(1043, '2024-05-20', '18:53:41', 'config', 'edição', 1, 0, 'Dados do Config'),
(1044, '2024-05-20', '18:54:11', 'config', 'edição', 1, 0, 'Dados do Config'),
(1045, '2024-05-20', '18:55:24', 'cargos', 'exclusão', 1, 12, 'Auxiliar de serviços gerais'),
(1046, '2024-05-20', '18:56:12', 'tarefas', 'exclusão', 1, 47, 'teste'),
(1047, '2024-05-20', '18:56:22', 'tarefas', 'exclusão', 1, 46, 'Diversao'),
(1048, '2024-05-20', '18:56:25', 'tarefas', 'exclusão', 1, 45, 'Pedido'),
(1049, '2024-05-20', '18:56:28', 'tarefas', 'exclusão', 1, 44, 'reuniao com func'),
(1050, '2024-05-20', '18:56:31', 'tarefas', 'exclusão', 1, 43, 'teste'),
(1051, '2024-05-20', '18:56:34', 'tarefas', 'exclusão', 1, 40, 'Reunião com o chefe'),
(1052, '2024-05-20', '18:56:36', 'tarefas', 'exclusão', 1, 39, 'Cartorio'),
(1053, '2024-05-20', '18:56:40', 'tarefas', 'exclusão', 1, 38, 'Cartorio'),
(1054, '2024-05-20', '18:56:42', 'tarefas', 'exclusão', 1, 37, 'Lavar carro'),
(1055, '2024-05-20', '18:56:44', 'tarefas', 'exclusão', 1, 36, 'Lavar carro'),
(1056, '2024-05-20', '18:56:47', 'tarefas', 'exclusão', 1, 35, 'Fff'),
(1057, '2024-05-20', '18:56:49', 'tarefas', 'exclusão', 1, 33, 'Tarefa Teste'),
(1058, '2024-05-20', '18:56:52', 'tarefas', 'exclusão', 1, 32, 'tarefa teste'),
(1059, '2024-05-20', '18:56:55', 'tarefas', 'exclusão', 1, 31, 'ddfddsd'),
(1060, '2024-05-20', '18:57:36', 'usuarios', 'logout', 1, 0, 'logout'),
(1061, '2024-05-20', '18:57:40', 'usuarios', 'login', 1, 0, 'login'),
(1062, '2024-05-20', '19:06:53', 'usuarios', 'login', 1, 0, 'login'),
(1063, '2024-05-20', '19:07:41', 'funcionarios', 'exclusão', 1, 1, 'Hugo Freitas'),
(1064, '2024-05-20', '19:07:51', 'funcionarios', 'exclusão', 1, 2, 'Marcelo Freitas'),
(1065, '2024-05-21', '08:47:03', 'usuarios', 'login', 1, 0, 'login'),
(1066, '2024-05-21', '09:02:21', 'clientes', 'edição', 1, 0, 'Empresa X'),
(1067, '2024-05-21', '09:02:22', 'clientes', 'edição', 1, 0, 'Empresa X'),
(1068, '2024-05-21', '09:03:11', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1069, '2024-05-21', '09:03:12', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1070, '2024-05-21', '09:03:14', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1071, '2024-05-21', '09:03:14', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1072, '2024-05-21', '09:03:15', 'clientes', 'edição', 1, 1, 'Talita Santos'),
(1073, '2024-05-21', '09:03:16', 'clientes', 'edição', 1, 1, 'Talita Santos'),
(1074, '2024-05-21', '09:23:45', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1075, '2024-05-21', '09:23:47', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1076, '2024-05-21', '09:27:05', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1077, '2024-05-21', '09:27:18', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1078, '2024-05-21', '09:27:39', 'clientes', 'edição', 1, 2, 'Empresa '),
(1079, '2024-05-21', '09:35:17', 'clientes', 'edição', 1, 2, 'Empresa '),
(1080, '2024-05-21', '09:35:33', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1081, '2024-05-21', '10:29:49', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1082, '2024-05-21', '10:32:03', 'clientes', 'edição', 1, 2, 'Empresa X'),
(1083, '2024-05-21', '10:32:39', 'clientes', 'inserção', 1, 5, 'Ulisses'),
(1084, '2024-05-21', '10:42:00', 'clientes', 'edição', 1, 5, 'Ulisses'),
(1085, '2024-05-21', '10:42:01', 'clientes', 'edição', 1, 5, 'Ulisses'),
(1086, '2024-05-21', '10:42:04', 'clientes', 'exclusão', 1, 5, 'Ulisses'),
(1087, '2024-05-21', '11:03:05', 'tarefas', 'exclusão', 1, 51, 'teste'),
(1088, '2024-05-21', '11:03:08', 'tarefas', 'exclusão', 1, 50, 'teste'),
(1089, '2024-05-21', '11:05:59', 'tarefas', 'exclusão', 1, 49, 'teste'),
(1090, '2024-05-21', '11:45:04', 'funcionarios', 'edição', 1, 3, 'Pablo Silva'),
(1091, '2024-05-21', '12:15:21', 'tarefas', 'edição', 1, 54, 'teste'),
(1092, '2024-05-21', '12:15:23', 'tarefas', 'edição', 1, 53, 'teste'),
(1093, '2024-05-21', '12:15:25', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1094, '2024-05-21', '12:15:30', 'tarefas', 'edição', 1, 54, 'teste'),
(1095, '2024-05-21', '12:15:31', 'tarefas', 'edição', 1, 53, 'teste'),
(1096, '2024-05-21', '12:15:32', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1097, '2024-05-21', '16:23:02', 'tarefas', 'exclusão', 1, 55, 'Regularizar  '),
(1098, '2024-05-21', '16:23:05', 'tarefas', 'exclusão', 1, 54, 'teste'),
(1099, '2024-05-21', '19:22:02', 'funcionarios', 'inserção', 1, 29, 'Ulisses'),
(1100, '2024-05-21', '20:55:15', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1101, '2024-05-21', '20:55:17', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1102, '2024-05-21', '20:55:18', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1103, '2024-05-21', '20:55:18', 'tarefas', 'edição', 1, 52, 'Regularizar documento da empresa'),
(1104, '2024-05-21', '20:55:20', 'tarefas', 'edição', 1, 53, 'teste'),
(1105, '2024-05-21', '20:55:21', 'tarefas', 'edição', 1, 53, 'teste'),
(1106, '2024-05-21', '20:55:21', 'tarefas', 'edição', 1, 53, 'teste'),
(1107, '2024-05-21', '20:55:22', 'tarefas', 'edição', 1, 53, 'teste'),
(1108, '2024-05-21', '20:56:26', 'tarefas', 'inserção', 1, 59, 'teste9'),
(1109, '2024-05-21', '20:56:52', 'tarefas', 'inserção', 1, 60, 'documento da empresa'),
(1110, '2024-05-21', '21:58:04', 'tarefas', 'exclusão', 1, 63, 'Regularizar  45'),
(1111, '2024-05-21', '21:58:07', 'tarefas', 'exclusão', 1, 62, 'teste00'),
(1112, '2024-05-21', '21:58:09', 'tarefas', 'exclusão', 1, 61, 'teste00'),
(1113, '2024-05-21', '21:58:12', 'tarefas', 'exclusão', 1, 58, 'teste'),
(1114, '2024-05-21', '21:58:16', 'tarefas', 'exclusão', 1, 57, 'teste'),
(1115, '2024-05-21', '21:58:22', 'tarefas', 'exclusão', 1, 56, 'teste2'),
(1116, '2024-05-21', '21:58:25', 'tarefas', 'exclusão', 1, 53, 'teste'),
(1117, '2024-05-21', '21:58:29', 'tarefas', 'exclusão', 1, 52, 'Regularizar documento da empresa'),
(1118, '2024-05-21', '21:59:11', 'tarefas', 'inserção', 1, 64, 'teste'),
(1119, '2024-05-21', '22:09:56', 'tarefas', 'inserção', 1, 65, 'teste2'),
(1120, '2024-05-21', '22:29:24', 'tarefas', 'inserção', 1, 66, 'teste9'),
(1121, '2024-05-22', '08:40:07', 'usuarios', 'login', 1, 0, 'login'),
(1122, '2024-05-22', '08:40:30', 'tarefas', 'exclusão', 1, 66, 'teste9'),
(1123, '2024-05-22', '08:40:33', 'tarefas', 'exclusão', 1, 65, 'teste2'),
(1124, '2024-05-22', '08:56:12', 'tarefas', 'inserção', 1, 70, 'Regularizar documento da empresa'),
(1125, '2024-05-22', '09:07:14', 'tarefas', 'inserção', 1, 71, 'teste'),
(1126, '2024-05-22', '09:16:43', 'tarefas', 'inserção', 1, 72, 'Regularizar '),
(1127, '2024-05-22', '09:17:08', 'tarefas', 'inserção', 1, 73, 'kljsdahfgkas'),
(1128, '2024-05-22', '09:17:49', 'tarefas', 'inserção', 1, 74, 'fgasdfgsadf'),
(1129, '2024-05-22', '09:18:38', 'tarefas', 'inserção', 1, 75, 'teste5'),
(1130, '2024-05-22', '09:24:57', 'tarefas', 'exclusão', 1, 75, 'teste5'),
(1131, '2024-05-22', '09:25:00', 'tarefas', 'exclusão', 1, 74, 'fgasdfgsadf'),
(1132, '2024-05-22', '09:25:02', 'tarefas', 'exclusão', 1, 73, 'kljsdahfgkas'),
(1133, '2024-05-22', '09:25:05', 'tarefas', 'exclusão', 1, 72, 'Regularizar '),
(1134, '2024-05-22', '09:25:07', 'tarefas', 'exclusão', 1, 71, 'teste'),
(1135, '2024-05-22', '09:25:10', 'tarefas', 'exclusão', 1, 70, 'Regularizar documento da empresa'),
(1136, '2024-05-22', '09:25:18', 'tarefas', 'inserção', 1, 76, 'Regularizar documento da empresa'),
(1137, '2024-05-22', '09:25:41', 'tarefas', 'exclusão', 1, 76, 'Regularizar documento da empresa'),
(1138, '2024-05-22', '09:25:44', 'tarefas', 'exclusão', 1, 69, 'Regularizar  '),
(1139, '2024-05-22', '09:25:46', 'tarefas', 'exclusão', 1, 68, 'Regularizar  '),
(1140, '2024-05-22', '09:25:49', 'tarefas', 'exclusão', 1, 67, 'Regularizar documento da empresa'),
(1141, '2024-05-22', '09:26:16', 'tarefas', 'inserção', 1, 77, 'teste'),
(1142, '2024-05-22', '09:29:04', 'tarefas', 'inserção', 1, 78, 'teste2'),
(1143, '2024-05-22', '09:32:23', 'tarefas', 'inserção', 1, 79, 'Regularizar documento da empresa'),
(1144, '2024-05-22', '09:33:22', 'tarefas', 'inserção', 1, 80, 'a empresa'),
(1145, '2024-05-22', '09:34:15', 'tarefas', 'inserção', 1, 81, 'Regularizar  8'),
(1146, '2024-05-22', '09:35:03', 'tarefas', 'inserção', 1, 82, 'Regularizar  10'),
(1147, '2024-05-22', '11:10:32', 'tarefas', 'inserção', 1, 83, 'DOCUMENTO'),
(1148, '2024-05-22', '11:16:05', 'tarefas', 'inserção', 1, 84, 'BUSCAR DOCUMENTO'),
(1149, '2024-05-22', '11:16:46', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1150, '2024-05-22', '11:16:47', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1151, '2024-05-22', '11:16:51', 'tarefas', 'exclusão', 1, 83, 'DOCUMENTO'),
(1152, '2024-05-22', '11:19:20', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1153, '2024-05-22', '11:19:21', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1154, '2024-05-22', '11:19:22', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1155, '2024-05-22', '11:19:23', 'tarefas', 'edição', 1, 82, 'Regularizar  10'),
(1156, '2024-05-22', '11:19:24', 'tarefas', 'edição', 1, 81, 'Regularizar  8'),
(1157, '2024-05-22', '11:19:26', 'tarefas', 'edição', 1, 82, 'Regularizar  10'),
(1158, '2024-05-22', '11:19:27', 'tarefas', 'edição', 1, 81, 'Regularizar  8'),
(1159, '2024-05-22', '11:19:27', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENTO'),
(1160, '2024-05-22', '11:23:19', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENT'),
(1161, '2024-05-22', '17:09:35', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1162, '2024-05-22', '17:09:37', 'tarefas', 'edição', 1, 86, 'teste'),
(1163, '2024-05-22', '17:09:39', 'tarefas', 'edição', 1, 86, 'teste'),
(1164, '2024-05-22', '17:09:40', 'tarefas', 'edição', 1, 86, 'teste'),
(1165, '2024-05-22', '17:09:41', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1166, '2024-05-22', '17:09:42', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1167, '2024-05-22', '17:09:43', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1168, '2024-05-22', '17:09:43', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1169, '2024-05-22', '17:09:45', 'tarefas', 'edição', 1, 85, 'Pegar documento'),
(1170, '2024-05-23', '09:36:27', 'tarefas', 'edição', 1, 86, 'teste'),
(1171, '2024-05-23', '11:48:03', 'funcionarios', 'edição', 1, 29, 'Ulisses'),
(1172, '2024-05-23', '11:48:48', 'usuarios', 'logout', 1, 0, 'logout'),
(1173, '2024-05-23', '11:48:57', 'usuarios', 'login', 17, 0, 'login'),
(1174, '2024-05-23', '13:30:32', 'usuarios', 'logout', 17, 0, 'logout'),
(1175, '2024-05-23', '13:30:34', 'usuarios', 'login', 1, 0, 'login'),
(1176, '2024-05-23', '13:32:56', 'tarefas', 'edição', 1, 79, 'Regularizar documento da empresa'),
(1177, '2024-05-23', '13:32:57', 'tarefas', 'edição', 1, 79, 'Regularizar documento da empresa'),
(1178, '2024-05-26', '18:55:29', 'usuarios', 'login', 1, 0, 'login'),
(1179, '2024-05-27', '09:42:15', 'usuarios', 'login', 1, 0, 'login'),
(1180, '2024-05-27', '09:44:00', 'cargos', 'exclusão', 1, 14, 'Auxiliar de Cadastro'),
(1181, '2024-05-27', '09:44:04', 'cargos', 'exclusão', 1, 7, 'RH'),
(1182, '2024-05-27', '09:44:08', 'cargos', 'exclusão', 1, 6, 'Auxiliar Administrativo'),
(1183, '2024-05-27', '09:44:11', 'cargos', 'exclusão', 1, 5, 'Limpeza'),
(1184, '2024-05-27', '09:44:26', 'cargos', 'inserção', 1, 15, 'Auxiliar administrativo'),
(1185, '2024-05-27', '11:17:02', 'tipos_empresas', 'inserção', 1, 1, ''),
(1186, '2024-05-27', '11:22:14', 'tipos_empresas', 'inserção', 1, 2, ''),
(1187, '2024-05-27', '11:22:48', 'tipos_empresas', 'edição', 1, 2, ''),
(1188, '2024-05-27', '11:24:43', 'tipos_empresas', 'edição', 1, 2, ''),
(1189, '2024-05-27', '11:24:49', 'cargos', 'exclusão', 1, 2, ''),
(1190, '2024-05-27', '11:24:59', 'cargos', 'exclusão', 1, 2, ''),
(1191, '2024-05-27', '11:25:38', 'cargos', 'exclusão', 1, 2, 'LTDA'),
(1192, '2024-05-27', '11:25:47', 'cargos', 'exclusão', 1, 2, 'LTDA'),
(1193, '2024-05-27', '11:27:09', 'tipos_empresas', 'inserção', 1, 3, ''),
(1194, '2024-05-27', '11:27:14', 'cargos', 'exclusão', 1, 2, 'LTDA'),
(1195, '2024-05-27', '11:35:17', 'tipos_empresas', 'exclusão', 1, 3, ''),
(1196, '2024-05-27', '11:38:45', 'tipos_empresas', 'edição', 1, 2, ''),
(1197, '2024-05-27', '11:38:54', 'tipos_empresas', 'exclusão', 1, 2, ''),
(1198, '2024-05-27', '11:38:59', 'tipos_empresas', 'inserção', 1, 4, ''),
(1199, '2024-05-27', '11:39:04', 'tipos_empresas', 'inserção', 1, 5, ''),
(1200, '2024-05-27', '12:01:35', 'tipos_empresas', 'inserção', 1, 6, ''),
(1201, '2024-05-27', '12:01:42', 'tipos_empresas', 'exclusão', 1, 6, ''),
(1202, '2024-05-27', '12:42:28', 'clientes', 'exclusão', 1, 1, 'Talita Santos'),
(1203, '2024-05-27', '12:42:32', 'clientes', 'exclusão', 1, 2, 'Empresa X'),
(1204, '2024-05-27', '15:00:43', 'clientes', 'inserção', 1, 6, 'Semear Store'),
(1205, '2024-05-27', '15:05:37', 'clientes', 'exclusão', 1, 6, 'Semear Store'),
(1206, '2024-05-27', '15:06:25', 'clientes', 'inserção', 1, 7, 'Ulisses'),
(1207, '2024-05-27', '15:07:26', 'clientes', 'inserção', 1, 8, 'Semear Store'),
(1208, '2024-05-27', '15:10:11', 'clientes', 'inserção', 1, 9, 'Empresa X'),
(1209, '2024-05-27', '15:15:22', 'clientes', 'inserção', 1, 10, 'Empresa '),
(1210, '2024-05-27', '15:16:26', 'clientes', 'exclusão', 1, 9, 'Empresa X'),
(1211, '2024-05-27', '15:16:29', 'clientes', 'exclusão', 1, 10, 'Empresa '),
(1212, '2024-05-27', '15:16:31', 'clientes', 'exclusão', 1, 8, 'Semear Store'),
(1213, '2024-05-27', '15:16:34', 'clientes', 'exclusão', 1, 7, 'Ulisses'),
(1214, '2024-05-27', '15:17:25', 'clientes', 'inserção', 1, 11, 'Empresa X'),
(1215, '2024-05-27', '15:18:08', 'clientes', 'inserção', 1, 12, 'Ulisses'),
(1216, '2024-05-27', '16:19:41', 'clientes', 'exclusão', 1, 12, 'Ulisses'),
(1217, '2024-05-27', '16:19:44', 'clientes', 'exclusão', 1, 11, 'Empresa X'),
(1218, '2024-05-27', '16:20:03', 'clientes', 'inserção', 1, 13, 'Empresa X'),
(1219, '2024-05-27', '16:35:15', 'clientes', 'edição', 1, 13, 'Empresa X'),
(1220, '2024-05-27', '16:35:36', 'clientes', 'edição', 1, 13, 'Empresa X'),
(1221, '2024-05-27', '16:36:51', 'clientes', 'edição', 1, 13, 'Empresa X'),
(1222, '2024-05-27', '16:37:38', 'clientes', 'inserção', 1, 14, 'Semear Store'),
(1223, '2024-05-27', '16:38:33', 'clientes', 'edição', 1, 14, 'Semear Store'),
(1224, '2024-05-27', '16:40:24', 'clientes', 'edição', 1, 13, 'Ulisses'),
(1225, '2024-05-27', '16:44:49', 'clientes', 'edição', 1, 13, 'Ulisses'),
(1226, '2024-05-27', '16:51:10', 'clientes', 'exclusão', 1, 14, 'Semear Store'),
(1227, '2024-05-27', '16:51:14', 'clientes', 'exclusão', 1, 13, 'Ulisses'),
(1228, '2024-05-27', '16:53:08', 'clientes', 'inserção', 1, 15, 'Empresa X'),
(1229, '2024-05-27', '16:53:27', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1230, '2024-05-27', '16:53:29', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1231, '2024-05-27', '16:53:30', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1232, '2024-05-27', '16:53:34', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1233, '2024-05-27', '17:39:35', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1234, '2024-05-27', '17:39:37', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1235, '2024-05-27', '18:13:42', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1236, '2024-05-27', '18:13:43', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1237, '2024-05-27', '22:28:57', 'usuarios', 'login', 1, 0, 'login'),
(1238, '2024-05-27', '22:30:11', 'clientes', 'edição', 1, 15, 'Empresa X'),
(1239, '2024-05-27', '22:30:42', 'clientes', 'exclusão', 1, 15, 'Empresa X'),
(1240, '2024-05-27', '22:30:57', 'clientes', 'inserção', 1, 16, 'Empresa X'),
(1241, '2024-05-27', '22:45:03', 'clientes', 'edição', 1, 16, 'Empresa X'),
(1242, '2024-05-27', '22:45:08', 'clientes', 'edição', 1, 16, 'Empresa X'),
(1243, '2024-05-27', '22:45:25', 'clientes', 'edição', 1, 16, 'Empresa X'),
(1244, '2024-05-27', '22:49:30', 'clientes', 'inserção', 1, 17, 'Semear Store'),
(1245, '2024-05-27', '22:52:38', 'clientes', 'exclusão', 1, 16, 'Empresa X'),
(1246, '2024-05-27', '22:52:45', 'clientes', 'edição', 1, 17, 'Semear Store'),
(1247, '2024-05-27', '22:52:46', 'clientes', 'edição', 1, 17, 'Semear Store'),
(1248, '2024-05-28', '13:08:14', 'usuarios', 'login', 1, 0, 'login'),
(1249, '2024-05-28', '13:08:47', 'tipos_empresas', 'exclusão', 1, 5, ''),
(1250, '2024-05-28', '13:09:13', 'tipos_empresas', 'inserção', 1, 7, ''),
(1251, '2024-05-28', '20:31:15', 'usuarios', 'login', 1, 0, 'login'),
(1252, '2024-05-29', '10:17:24', 'usuarios', 'logout', 1, 0, 'logout'),
(1253, '2024-05-29', '10:17:28', 'usuarios', 'login', 17, 0, 'login'),
(1254, '2024-05-29', '10:23:36', 'usuarios', 'logout', 17, 0, 'logout'),
(1255, '2024-05-29', '10:23:38', 'usuarios', 'login', 1, 0, 'login'),
(1256, '2024-05-29', '10:29:55', 'tarefas', 'exclusão', 1, 88, 'da empresa'),
(1257, '2024-05-29', '10:29:58', 'tarefas', 'exclusão', 1, 87, 'teste00'),
(1258, '2024-05-29', '10:30:00', 'tarefas', 'exclusão', 1, 86, 'teste'),
(1259, '2024-05-29', '10:30:03', 'tarefas', 'exclusão', 1, 85, 'Pegar documento'),
(1260, '2024-05-29', '10:30:05', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENT'),
(1261, '2024-05-29', '10:30:06', 'tarefas', 'edição', 1, 84, 'BUSCAR DOCUMENT'),
(1262, '2024-05-29', '10:30:08', 'tarefas', 'exclusão', 1, 84, 'BUSCAR DOCUMENT'),
(1263, '2024-05-29', '10:30:11', 'tarefas', 'exclusão', 1, 82, 'Regularizar  10'),
(1264, '2024-05-29', '10:30:13', 'tarefas', 'exclusão', 1, 81, 'Regularizar  8'),
(1265, '2024-05-29', '10:30:16', 'tarefas', 'exclusão', 1, 80, 'a empresa'),
(1266, '2024-05-29', '10:30:18', 'tarefas', 'exclusão', 1, 79, 'Regularizar documento da empresa'),
(1267, '2024-05-29', '10:30:21', 'tarefas', 'exclusão', 1, 78, 'teste2'),
(1268, '2024-05-29', '10:30:28', 'tarefas', 'exclusão', 1, 77, 'teste'),
(1269, '2024-05-29', '10:31:42', 'tarefas', 'inserção', 1, 89, 'CORRIGIR BUG'),
(1270, '2024-05-29', '10:32:28', 'tarefas', 'inserção', 1, 90, 'TESTAR CÓDIGO'),
(1271, '2024-05-29', '10:34:17', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1272, '2024-05-29', '10:35:45', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1273, '2024-05-29', '10:36:53', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1274, '2024-05-29', '10:39:01', 'usuarios', 'login', 1, 0, 'login'),
(1275, '2024-05-29', '10:43:10', 'tarefas', 'inserção', 1, 91, 'CRIAR UM SITE'),
(1276, '2024-05-29', '10:43:16', 'tarefas', 'edição', 1, 91, 'CRIAR UM SITE'),
(1277, '2024-05-29', '10:43:17', 'tarefas', 'edição', 1, 91, 'CRIAR UM SITE'),
(1278, '2024-05-29', '10:43:18', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1279, '2024-05-29', '10:43:18', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1280, '2024-05-29', '10:43:20', 'tarefas', 'edição', 1, 89, 'CORRIGIR BUG'),
(1281, '2024-05-29', '10:43:20', 'tarefas', 'edição', 1, 89, 'CORRIGIR BUG'),
(1282, '2024-05-29', '10:45:37', 'tarefas', 'inserção', 1, 92, 'Visitar cliente'),
(1283, '2024-05-29', '10:45:44', 'tarefas', 'exclusão', 1, 91, 'CRIAR UM SITE'),
(1284, '2024-05-29', '10:45:47', 'tarefas', 'exclusão', 1, 89, 'CORRIGIR BUG'),
(1285, '2024-05-29', '10:46:16', 'tarefas', 'exclusão', 1, 92, 'Visitar cliente'),
(1286, '2024-05-29', '10:46:52', 'tarefas', 'inserção', 1, 93, 'FAZER ORÇAMENTO'),
(1287, '2024-05-29', '10:47:03', 'tarefas', 'edição', 1, 93, 'FAZER ORÇAMENTO'),
(1288, '2024-05-29', '10:47:04', 'tarefas', 'edição', 1, 93, 'FAZER ORÇAMENTO'),
(1289, '2024-05-29', '10:47:05', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1290, '2024-05-29', '10:47:05', 'tarefas', 'edição', 1, 90, 'TESTAR CÓDIGO'),
(1291, '2024-05-29', '10:47:36', 'tarefas', 'inserção', 1, 94, 'teste'),
(1292, '2024-05-29', '11:03:31', 'tarefas', 'exclusão', 1, 94, 'teste'),
(1293, '2024-05-29', '11:03:33', 'tarefas', 'exclusão', 1, 93, 'FAZER ORÇAMENTO'),
(1294, '2024-05-29', '11:03:37', 'tarefas', 'exclusão', 1, 90, 'TESTAR CÓDIGO'),
(1295, '2024-05-29', '11:06:59', 'tarefas', 'inserção', 1, 96, 'teste'),
(1296, '2024-05-29', '12:01:30', 'tarefas', 'exclusão', 1, 96, 'teste'),
(1297, '2024-05-29', '12:01:41', 'tarefas', 'inserção', 1, 97, 'teste'),
(1298, '2024-05-29', '12:07:14', 'tarefas', 'exclusão', 1, 97, 'teste'),
(1299, '2024-05-29', '12:07:19', 'tarefas', 'inserção', 1, 98, 'teste'),
(1300, '2024-05-29', '12:07:27', 'tarefas', 'inserção', 1, 99, 'Regularizar documento da empresa'),
(1301, '2024-05-29', '12:07:43', 'tarefas', 'inserção', 1, 100, 'teste2'),
(1302, '2024-05-29', '12:07:56', 'tarefas', 'inserção', 1, 101, 'teste9'),
(1303, '2024-05-29', '12:08:06', 'tarefas', 'exclusão', 1, 98, 'teste'),
(1304, '2024-05-29', '12:08:09', 'tarefas', 'exclusão', 1, 99, 'Regularizar documento da empresa'),
(1305, '2024-05-29', '12:08:12', 'tarefas', 'exclusão', 1, 100, 'teste2'),
(1306, '2024-05-29', '12:08:26', 'tarefas', 'exclusão', 1, 101, 'teste9'),
(1307, '2024-05-29', '12:08:40', 'tarefas', 'edição', 1, 0, 'teste'),
(1308, '2024-05-29', '12:09:02', 'tarefas', 'edição', 1, 0, 'teste'),
(1309, '2024-05-29', '12:09:10', 'tarefas', 'inserção', 1, 102, 'teste'),
(1310, '2024-05-29', '12:09:48', 'tarefas', 'exclusão', 1, 95, 'TERMINAR SISTEMA'),
(1311, '2024-05-29', '12:09:50', 'tarefas', 'exclusão', 1, 102, 'teste'),
(1312, '2024-05-29', '12:10:21', 'tarefas', 'inserção', 1, 103, 'teste'),
(1313, '2024-05-29', '12:10:37', 'tarefas', 'edição', 1, 0, 'teste2'),
(1314, '2024-05-29', '12:12:03', 'tarefas', 'edição', 1, 0, 'teste'),
(1315, '2024-05-29', '12:14:52', 'tarefas', 'inserção', 1, 104, 'teste'),
(1316, '2024-05-29', '12:17:06', 'tarefas', 'exclusão', 1, 104, 'teste'),
(1317, '2024-05-29', '12:17:14', 'tarefas', 'inserção', 1, 105, 'teste'),
(1318, '2024-05-29', '12:17:30', 'tarefas', 'inserção', 1, 106, 'teste2'),
(1319, '2024-05-29', '12:17:43', 'tarefas', 'inserção', 1, 107, 'teste3'),
(1320, '2024-05-29', '12:18:14', 'tarefas', 'exclusão', 1, 107, 'teste3'),
(1321, '2024-05-29', '12:18:17', 'tarefas', 'exclusão', 1, 106, 'teste2'),
(1322, '2024-05-29', '12:18:24', 'tarefas', 'exclusão', 1, 105, 'teste'),
(1323, '2024-05-29', '12:18:29', 'tarefas', 'exclusão', 1, 103, 'teste'),
(1324, '2024-05-29', '12:19:06', 'tarefas', 'exclusão', 1, 109, 'teste'),
(1325, '2024-05-29', '12:19:08', 'tarefas', 'exclusão', 1, 108, 'teste'),
(1326, '2024-05-29', '12:21:43', 'tarefas', 'exclusão', 1, 113, 'teste2'),
(1327, '2024-05-29', '12:21:45', 'tarefas', 'exclusão', 1, 112, 'teste2'),
(1328, '2024-05-29', '12:21:48', 'tarefas', 'exclusão', 1, 111, 'teste2'),
(1329, '2024-05-29', '12:22:34', 'tarefas', 'exclusão', 1, 124, 'teste2'),
(1330, '2024-05-29', '12:22:36', 'tarefas', 'exclusão', 1, 123, 'teste2'),
(1331, '2024-05-29', '12:22:39', 'tarefas', 'exclusão', 1, 122, 'teste2'),
(1332, '2024-05-29', '12:22:40', 'tarefas', 'exclusão', 1, 121, 'teste2'),
(1333, '2024-05-29', '12:22:43', 'tarefas', 'exclusão', 1, 120, 'teste2'),
(1334, '2024-05-29', '12:22:45', 'tarefas', 'exclusão', 1, 119, 'teste2'),
(1335, '2024-05-29', '12:22:48', 'tarefas', 'exclusão', 1, 118, 'teste2'),
(1336, '2024-05-29', '12:22:52', 'tarefas', 'exclusão', 1, 117, 'teste2'),
(1337, '2024-05-29', '12:22:55', 'tarefas', 'exclusão', 1, 116, 'teste2'),
(1338, '2024-05-29', '12:22:57', 'tarefas', 'exclusão', 1, 115, 'teste2'),
(1339, '2024-05-29', '12:22:59', 'tarefas', 'exclusão', 1, 114, 'teste2'),
(1340, '2024-05-29', '12:23:03', 'tarefas', 'exclusão', 1, 110, 'teste'),
(1341, '2024-05-29', '12:26:36', 'tarefas', 'exclusão', 1, 126, 'teste2'),
(1342, '2024-05-29', '12:26:39', 'tarefas', 'exclusão', 1, 125, 'teste'),
(1343, '2024-05-29', '12:32:47', 'tarefas', 'exclusão', 1, 128, 'teste2'),
(1344, '2024-05-29', '12:32:50', 'tarefas', 'exclusão', 1, 127, 'teste'),
(1345, '2024-05-29', '12:35:28', 'tarefas', 'exclusão', 1, 130, 'teste2'),
(1346, '2024-05-29', '12:35:30', 'tarefas', 'exclusão', 1, 129, 'teste'),
(1347, '2024-05-29', '13:09:32', 'tarefas', 'exclusão', 1, 131, 'teste'),
(1348, '2024-05-29', '13:09:34', 'tarefas', 'exclusão', 1, 132, 'teste2aaaa'),
(1349, '2024-05-29', '13:09:36', 'tarefas', 'exclusão', 1, 133, 'teste2'),
(1350, '2024-05-29', '13:14:17', 'tarefas', 'exclusão', 1, 136, 'Regularizar documento da empresa'),
(1351, '2024-05-29', '13:14:20', 'tarefas', 'exclusão', 1, 135, 'teste2'),
(1352, '2024-05-29', '13:14:22', 'tarefas', 'exclusão', 1, 134, 'teste'),
(1353, '2024-05-29', '13:24:07', 'tarefas', 'exclusão', 1, 138, 'teste2'),
(1354, '2024-05-29', '13:26:30', 'tarefas', 'exclusão', 1, 139, 'teste2'),
(1355, '2024-05-29', '13:27:12', 'tarefas', 'exclusão', 1, 140, 'teste2'),
(1356, '2024-05-29', '13:29:00', 'tarefas', 'exclusão', 1, 141, 'teste2'),
(1357, '2024-05-29', '13:35:08', 'tarefas', 'exclusão', 1, 142, 'teste2'),
(1358, '2024-05-29', '13:37:12', 'tarefas', 'exclusão', 1, 143, 'teste2'),
(1359, '2024-05-29', '13:38:40', 'tarefas', 'exclusão', 1, 144, 'teste'),
(1360, '2024-05-29', '13:43:45', 'tarefas', 'exclusão', 1, 146, 'teste9'),
(1361, '2024-05-29', '13:43:50', 'tarefas', 'exclusão', 1, 145, 'teste2'),
(1362, '2024-05-29', '13:52:39', 'tarefas', 'exclusão', 1, 150, 'TESTAR CÓDIGO'),
(1363, '2024-05-29', '13:52:42', 'tarefas', 'exclusão', 1, 149, 'TESTAR CÓDIGO'),
(1364, '2024-05-29', '13:52:44', 'tarefas', 'exclusão', 1, 148, 'teste9'),
(1365, '2024-05-29', '13:52:47', 'tarefas', 'exclusão', 1, 147, 'teste2'),
(1366, '2024-05-29', '14:00:17', 'tarefas', 'exclusão', 1, 151, 'teste2'),
(1367, '2024-05-29', '14:00:38', 'tarefas', 'inserção', 1, 153, 'teste'),
(1368, '2024-05-29', '14:00:45', 'tarefas', 'inserção', 1, 154, 'teste2'),
(1369, '2024-05-29', '14:05:11', 'tarefas', 'inserção', 1, 155, 'TESTAR CÓDIGO'),
(1370, '2024-05-29', '14:06:16', 'tarefas', 'exclusão', 1, 156, 'teste'),
(1371, '2024-05-29', '14:06:18', 'tarefas', 'exclusão', 1, 155, 'TESTAR CÓDIGO'),
(1372, '2024-05-29', '14:06:20', 'tarefas', 'exclusão', 1, 154, 'teste2'),
(1373, '2024-05-29', '14:06:23', 'tarefas', 'exclusão', 1, 153, 'teste'),
(1374, '2024-05-29', '14:06:25', 'tarefas', 'exclusão', 1, 152, 'teste2');

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
(1, 'Todos'),
(2, 'Financeiro'),
(3, 'Secretaria'),
(4, 'RH'),
(5, 'Gerencial'),
(6, 'Recepção');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas`
--

CREATE TABLE `tarefas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
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
(137, 'teste', 'tarefa teste', '----', '2024-05-29', 17, 1, 'Agendada', ''),
(157, 'teste2', 'documento', '----', '2024-05-29', 17, 1, 'Agendada', ''),
(158, 'TESTAR CÓDIGO', 'documento', '14:50', '2024-05-29', 17, 1, 'Agendada', ''),
(159, 'teste', 'tarefa teste', '----', '2024-05-29', 17, 1, 'Agendada', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_empresas`
--

CREATE TABLE `tipos_empresas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_empresas`
--

INSERT INTO `tipos_empresas` (`id`, `tipo`) VALUES
(1, 'MEI'),
(4, 'LTDA'),
(7, 'ME');

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
(1, 'Ulisses Albardeiro', '000.000.000-00', 'ualbardeiro@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Administrador', '11-10-2021-15-36-45-2.jpg', 0),
(17, 'Ulisses', '377.816.498-85', 'secretario@gmail.com', '202cb962ac59075b964b07152d234b70', '123', 'Secretario', 'sem-perfil.jpg', 29);

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
-- Índices de tabela `tipos_empresas`
--
ALTER TABLE `tipos_empresas`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `cat_arquivos`
--
ALTER TABLE `cat_arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1375;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tarefas`
--
ALTER TABLE `tarefas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT de tabela `tipos_empresas`
--
ALTER TABLE `tipos_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
