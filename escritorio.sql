-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 11/07/2024 às 03:03
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
-- Estrutura para tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `chave` varchar(50) NOT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nome`, `chave`, `grupo`) VALUES
(1, 'Home', 'home', 0),
(2, 'Cargos', 'cargos', 2),
(3, 'Tipos de empresas', 'tipos_empresas', 2),
(5, 'Funcionários', 'funcionarios', 2),
(6, 'Clientes', 'clientes', 2),
(9, 'Tarefas Escritório', 'tarefas_escritorio', 4),
(10, 'Minhas tarefas', 'tarefas', 4),
(11, 'Agenda de Tarefas', 'agenda', 4),
(12, 'Setor Arquivo', 'setor_arquivo', 5),
(13, 'Categoria Arquivos', 'cat_arquivos', 5),
(14, 'Grupo Arquivos', 'grupo_arquivos', 5),
(15, 'Cadastro de Arquivos', 'arquivos', 5),
(16, 'Ver Logs', 'logs', 6),
(18, 'Usuários', 'usuarios', 3),
(19, 'Ver Empresas', 'mostrar_clientes', 3),
(20, 'Configurações', 'configuracoes', 0);

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
  `salario` decimal(8,2) DEFAULT NULL,
  `valor_hora` decimal(8,2) DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `jornada_horas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`, `cargo`, `data_cad`, `data_nasc`, `obs`, `foto`, `salario`, `valor_hora`, `hora_entrada`, `hora_saida`, `jornada_horas`) VALUES
(33, 'Vinicius Albardeiro', '356.885.558-96', '(19) 97155-3718', 'ender00247@gmail.com', 'Rua Adalton Francisco Landgraf, 85', 3, '2024-06-18', '2024-05-31', '', 'sem-perfil.jpg', 4000.00, 8.00, '08:00:00', '17:00:00', '08:00:00'),
(34, 'Renato Elci', '377.816.498-47', '(22) 22222-2223', 'renato@gmail.com', 'Rua A, Número 150, Bairro XX - Belo Horizonte - MG', 1, '2024-06-18', '1987-06-07', '', 'sem-perfil.jpg', 4000.00, 85.00, '08:00:00', '18:00:00', '08:00:00'),
(38, 'Carlos Antonio', '377.816.498-67', '(22) 22222-2212', 'carlos@gmail.com', 'Rua A, Número 150, Bairro XX - Pirassununga-SP', 3, '2024-06-18', '1987-06-18', '', 'sem-perfil.jpg', 4000.00, 85.00, '07:00:00', '17:00:00', '08:00:00'),
(39, 'Algusto', '377.816.498-71', '(22) 22222-2258', 'algusto@gmail.com', 'Rua 3', 15, '2024-07-10', '1989-07-10', '', 'sem-perfil.jpg', NULL, NULL, NULL, NULL, NULL),
(40, 'Eduardo', '377.816.858-47', '(19) 35614-5847', 'eduardo@gmail.com', 'Rua sete', 3, '2024-07-10', '1990-07-12', '', 'sem-perfil.jpg', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios_permissoes`
--

CREATE TABLE `funcionarios_permissoes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios_permissoes`
--

INSERT INTO `funcionarios_permissoes` (`id`, `usuario`, `permissao`) VALUES
(435, 34, 1),
(436, 34, 2),
(437, 34, 3),
(438, 34, 5),
(439, 34, 6),
(440, 34, 9),
(441, 34, 10),
(442, 34, 11),
(443, 34, 12),
(444, 34, 13),
(445, 34, 14),
(446, 34, 15),
(447, 34, 16),
(448, 34, 18),
(449, 34, 19),
(451, 34, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_acessos`
--

CREATE TABLE `grupo_acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupo_acessos`
--

INSERT INTO `grupo_acessos` (`id`, `nome`) VALUES
(2, 'Cadastros'),
(3, 'Pessoas e Empresas'),
(4, 'Tarefas'),
(5, 'GED (Arquivos)'),
(6, 'Logs');

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
(1397, '2024-05-31', '12:24:35', 'usuarios', 'login', 1, 0, 'login'),
(1398, '2024-05-31', '12:25:14', 'tarefas', 'edição', 1, 175, 'teste'),
(1399, '2024-05-31', '12:25:17', 'tarefas', 'edição', 1, 175, 'teste'),
(1400, '2024-05-31', '12:25:18', 'tarefas', 'edição', 1, 174, 'teste2'),
(1401, '2024-05-31', '12:25:19', 'tarefas', 'edição', 1, 174, 'teste2'),
(1402, '2024-05-31', '12:25:19', 'tarefas', 'edição', 1, 174, 'teste2'),
(1403, '2024-05-31', '12:25:20', 'tarefas', 'edição', 1, 174, 'teste2'),
(1404, '2024-05-31', '12:25:21', 'tarefas', 'edição', 1, 173, 'teste9'),
(1405, '2024-05-31', '12:25:21', 'tarefas', 'edição', 1, 173, 'teste9'),
(1406, '2024-05-31', '12:25:39', 'tarefas', 'exclusão', 1, 173, 'teste9'),
(1407, '2024-05-31', '12:25:42', 'tarefas', 'exclusão', 1, 174, 'teste2'),
(1408, '2024-05-31', '12:27:49', 'tarefas', 'exclusão', 1, 176, 'teste2'),
(1409, '2024-05-31', '12:27:51', 'tarefas', 'exclusão', 1, 175, 'teste'),
(1410, '2024-05-31', '12:30:32', 'tarefas', 'edição', 1, 177, 'teste'),
(1411, '2024-05-31', '12:30:35', 'tarefas', 'exclusão', 1, 177, 'teste'),
(1412, '2024-05-31', '13:32:54', 'tarefas', 'exclusão', 1, 178, 'teste'),
(1413, '2024-05-31', '13:32:56', 'tarefas', 'exclusão', 1, 179, 'teste2'),
(1414, '2024-05-31', '13:43:05', 'tarefas', 'edição', 1, 185, 'Regularizar documento da empresa'),
(1415, '2024-05-31', '13:43:08', 'tarefas', 'edição', 1, 185, 'Regularizar documento da empresa'),
(1416, '2024-05-31', '13:43:09', 'tarefas', 'edição', 1, 185, 'Regularizar documento da empresa'),
(1417, '2024-05-31', '13:43:12', 'tarefas', 'edição', 1, 185, 'Regularizar documento da empresa'),
(1418, '2024-05-31', '15:45:50', 'tarefas', 'exclusão', 1, 186, 'teste545848'),
(1419, '2024-05-31', '15:45:53', 'tarefas', 'exclusão', 1, 185, 'Regularizar documento da empresa'),
(1420, '2024-05-31', '15:45:56', 'tarefas', 'exclusão', 1, 184, 'Regularizar  '),
(1421, '2024-05-31', '15:45:59', 'tarefas', 'exclusão', 1, 183, 'TESTAR CÓDIGO'),
(1422, '2024-05-31', '15:46:01', 'tarefas', 'exclusão', 1, 182, 'teste'),
(1423, '2024-05-31', '15:46:03', 'tarefas', 'exclusão', 1, 181, 'teste2'),
(1424, '2024-05-31', '15:46:06', 'tarefas', 'exclusão', 1, 180, 'teste'),
(1425, '2024-05-31', '15:49:58', 'tarefas', 'exclusão', 1, 188, 'teste2'),
(1426, '2024-05-31', '15:50:02', 'tarefas', 'exclusão', 1, 187, 'teste'),
(1427, '2024-05-31', '16:17:23', 'tarefas', 'edição', 1, 190, 'teste'),
(1428, '2024-05-31', '16:17:24', 'tarefas', 'edição', 1, 190, 'teste'),
(1429, '2024-05-31', '16:17:25', 'tarefas', 'edição', 1, 189, 'teste'),
(1430, '2024-05-31', '16:17:25', 'tarefas', 'edição', 1, 189, 'teste'),
(1431, '2024-05-31', '16:25:28', 'tarefas', 'exclusão', 1, 197, 'TESTAR CÓDIGO'),
(1432, '2024-05-31', '16:25:30', 'tarefas', 'exclusão', 1, 196, 'TESTAR CÓDIGO'),
(1433, '2024-05-31', '16:25:33', 'tarefas', 'exclusão', 1, 195, 'TESTAR CÓDIGO'),
(1434, '2024-05-31', '16:25:35', 'tarefas', 'exclusão', 1, 194, 'TESTAR CÓDIGO'),
(1435, '2024-05-31', '16:25:37', 'tarefas', 'exclusão', 1, 193, 'TESTAR CÓDIGO'),
(1436, '2024-05-31', '16:25:40', 'tarefas', 'exclusão', 1, 192, 'TESTAR CÓDIGO'),
(1437, '2024-05-31', '16:25:42', 'tarefas', 'exclusão', 1, 191, 'TESTAR CÓDIGO'),
(1438, '2024-05-31', '16:25:44', 'tarefas', 'exclusão', 1, 190, 'teste'),
(1439, '2024-05-31', '16:28:36', 'tarefas', 'exclusão', 1, 201, 'teste2'),
(1440, '2024-05-31', '16:28:39', 'tarefas', 'exclusão', 1, 200, 'teste2'),
(1441, '2024-05-31', '16:28:41', 'tarefas', 'exclusão', 1, 199, 'teste2'),
(1442, '2024-05-31', '16:28:44', 'tarefas', 'exclusão', 1, 198, 'teste2'),
(1443, '2024-05-31', '16:29:36', 'tarefas', 'exclusão', 1, 202, 'teste2'),
(1444, '2024-05-31', '16:31:13', 'tarefas', 'exclusão', 1, 203, 'teste2'),
(1445, '2024-05-31', '16:31:17', 'tarefas', 'exclusão', 1, 204, 'teste2'),
(1446, '2024-05-31', '16:31:29', 'tarefas', 'inserção', 17, 205, 'teste2'),
(1447, '2024-05-31', '16:31:38', 'tarefas', 'edição', 17, 205, 'teste2aaaa'),
(1448, '2024-05-31', '16:32:05', 'tarefas', 'edição', 17, 205, 'teste2'),
(1449, '2024-05-31', '16:40:06', 'tarefas', 'edição', 1, 205, 'teste2'),
(1450, '2024-05-31', '16:40:11', 'tarefas', 'edição', 1, 189, 'teste'),
(1451, '2024-05-31', '16:40:17', 'tarefas', 'edição', 1, 205, 'teste2'),
(1452, '2024-05-31', '16:40:33', 'tarefas', 'edição', 1, 189, 'teste'),
(1453, '2024-05-31', '16:41:37', 'tarefas', 'inserção', 17, 206, 'TESTAR CÓDIGO'),
(1454, '2024-05-31', '16:41:52', 'tarefas', 'edição', 1, 206, 'TESTAR CÓDIGO'),
(1455, '2024-05-31', '16:57:50', 'usuarios', 'logout', 1, 0, 'logout'),
(1456, '2024-05-31', '16:58:06', 'usuarios', 'login', 1, 0, 'login'),
(1457, '2024-05-31', '16:58:54', 'funcionarios', 'exclusão', 1, 3, 'Pablo Silva'),
(1458, '2024-05-31', '17:02:44', 'cargos', 'exclusão', 1, 4, 'Recepcionista'),
(1459, '2024-05-31', '18:53:29', 'usuarios', 'login', 1, 0, 'login'),
(1460, '2024-05-31', '18:53:59', 'usuarios', 'logout', 1, 0, 'logout'),
(1461, '2024-05-31', '18:54:01', 'usuarios', 'login', 1, 0, 'login'),
(1462, '2024-05-31', '18:54:13', 'tarefas', 'exclusão', 1, 189, 'teste'),
(1463, '2024-05-31', '18:54:15', 'tarefas', 'exclusão', 1, 205, 'teste2'),
(1464, '2024-05-31', '18:55:57', 'tarefas', 'inserção', 17, 207, 'teste'),
(1465, '2024-05-31', '18:56:35', 'tarefas', 'inserção', 17, 208, 'teste2'),
(1466, '2024-05-31', '18:57:07', 'tarefas', 'inserção', 17, 209, 'Regularizar documento da empresa'),
(1467, '2024-05-31', '18:59:57', 'tarefas', 'inserção', 17, 210, 'teste9'),
(1468, '2024-05-31', '19:01:26', 'tarefas', 'edição', 1, 209, 'Regularizar documento da empresa'),
(1469, '2024-05-31', '19:10:15', 'funcionarios', 'inserção', 1, 31, 'vinicius'),
(1470, '2024-05-31', '19:13:22', 'funcionarios', 'exclusão', 1, 29, 'Ulisses'),
(1471, '2024-05-31', '19:54:40', 'usuarios', 'login', 1, 0, 'login'),
(1472, '2024-05-31', '19:55:05', 'funcionarios', 'edição', 1, 31, 'vinicius'),
(1473, '2024-05-31', '19:55:32', 'tarefas', 'edição', 1, 210, 'teste9'),
(1474, '2024-05-31', '19:55:33', 'tarefas', 'edição', 1, 210, 'teste9'),
(1475, '2024-05-31', '21:21:29', 'usuarios', 'login', 1, 0, 'login'),
(1476, '2024-05-31', '21:36:27', 'usuarios', 'login', 1, 0, 'login'),
(1477, '2024-05-31', '21:39:18', 'funcionarios', 'inserção', 1, 32, 'Vinicius Albardeiro'),
(1478, '2024-05-31', '21:45:27', 'funcionarios', 'exclusão', 1, 32, 'Vinicius Albardeiro'),
(1479, '2024-05-31', '21:46:28', 'funcionarios', 'inserção', 1, 33, 'Vinicius Albardeiro'),
(1480, '2024-05-31', '21:47:39', 'usuarios', 'logout', 1, 0, 'logout'),
(1481, '2024-05-31', '21:47:44', 'usuarios', 'login', 18, 0, 'login'),
(1482, '2024-06-02', '19:33:43', 'usuarios', 'login', 1, 0, 'login'),
(1483, '2024-06-02', '19:35:03', 'tarefas', 'inserção', 18, 211, 'Pagar documento'),
(1484, '2024-06-02', '19:35:30', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1485, '2024-06-02', '19:35:33', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1486, '2024-06-02', '19:35:33', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1487, '2024-06-02', '19:35:35', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1488, '2024-06-02', '19:35:35', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1489, '2024-06-02', '19:35:45', 'tarefas', 'edição', 1, 211, 'Pagar documento'),
(1490, '2024-06-02', '19:45:44', 'usuarios', 'login', 1, 0, 'login'),
(1491, '2024-06-02', '19:46:34', 'tarefas', 'inserção', 1, 212, 'teste9'),
(1492, '2024-06-07', '09:24:40', 'usuarios', 'login', 1, 0, 'login'),
(1493, '2024-06-07', '09:54:03', 'tarefas', 'edição', 1, 212, 'teste9'),
(1494, '2024-06-07', '09:54:04', 'tarefas', 'edição', 1, 212, 'teste9'),
(1495, '2024-06-07', '10:16:01', 'tarefas', 'exclusão', 1, 206, 'TESTAR CÓDIGO'),
(1496, '2024-06-07', '10:16:03', 'tarefas', 'exclusão', 1, 207, 'teste'),
(1497, '2024-06-07', '10:16:06', 'tarefas', 'exclusão', 1, 208, 'teste2'),
(1498, '2024-06-07', '10:16:09', 'tarefas', 'exclusão', 1, 209, 'Regularizar documento da empresa'),
(1499, '2024-06-07', '10:16:12', 'tarefas', 'exclusão', 1, 210, 'teste9'),
(1500, '2024-06-07', '10:16:14', 'tarefas', 'exclusão', 1, 211, 'Pagar documento'),
(1501, '2024-06-07', '10:16:17', 'tarefas', 'exclusão', 1, 212, 'teste9'),
(1502, '2024-06-07', '10:16:38', 'tarefas', 'inserção', 1, 213, 'teste'),
(1503, '2024-06-07', '10:17:11', 'tarefas', 'inserção', 1, 214, 'teste2'),
(1504, '2024-06-07', '10:22:56', 'tarefas', 'inserção', 1, 215, 'teste'),
(1505, '2024-06-07', '10:44:49', 'tarefas', 'exclusão', 1, 215, 'teste'),
(1506, '2024-06-07', '10:44:51', 'tarefas', 'exclusão', 1, 214, 'teste2'),
(1507, '2024-06-07', '10:44:57', 'tarefas', 'exclusão', 1, 213, 'teste'),
(1508, '2024-06-07', '10:47:48', 'tarefas', 'inserção', 18, 216, 'teste'),
(1509, '2024-06-07', '11:05:27', 'tarefas', 'inserção', 1, 217, 'teste2'),
(1510, '2024-06-07', '11:05:41', 'tarefas', 'exclusão', 1, 217, 'teste2'),
(1511, '2024-06-07', '11:06:06', 'tarefas', 'inserção', 1, 218, 'teste2'),
(1512, '2024-06-07', '12:49:50', 'tarefas', 'edição', 1, 218, 'teste2'),
(1513, '2024-06-07', '12:49:51', 'tarefas', 'edição', 1, 218, 'teste2'),
(1514, '2024-06-07', '12:49:56', 'tarefas', 'edição', 1, 218, 'teste2'),
(1515, '2024-06-07', '12:49:57', 'tarefas', 'edição', 1, 218, 'teste2'),
(1516, '2024-06-07', '12:49:58', 'tarefas', 'edição', 1, 218, 'teste2'),
(1517, '2024-06-07', '12:49:58', 'tarefas', 'edição', 1, 218, 'teste2'),
(1518, '2024-06-07', '12:51:41', 'tarefas', 'inserção', 1, 219, 'TESTAR CÓDIGO'),
(1519, '2024-06-07', '14:39:53', 'tarefas', 'edição', 1, 218, 'teste2'),
(1520, '2024-06-07', '14:39:55', 'tarefas', 'edição', 1, 218, 'teste2'),
(1521, '2024-06-07', '14:39:55', 'tarefas', 'edição', 1, 218, 'teste2'),
(1522, '2024-06-07', '14:39:56', 'tarefas', 'edição', 1, 218, 'teste2'),
(1523, '2024-06-07', '14:39:57', 'tarefas', 'edição', 1, 218, 'teste2'),
(1524, '2024-06-07', '14:39:58', 'tarefas', 'edição', 1, 218, 'teste2'),
(1525, '2024-06-07', '14:39:58', 'tarefas', 'edição', 1, 218, 'teste2'),
(1526, '2024-06-07', '14:39:59', 'tarefas', 'edição', 1, 218, 'teste2'),
(1527, '2024-06-07', '14:40:00', 'tarefas', 'edição', 1, 218, 'teste2'),
(1528, '2024-06-07', '14:40:01', 'tarefas', 'edição', 1, 218, 'teste2'),
(1529, '2024-06-07', '14:44:26', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1530, '2024-06-07', '14:44:27', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1531, '2024-06-07', '14:44:28', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1532, '2024-06-07', '14:44:28', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1533, '2024-06-07', '14:45:21', 'tarefas', 'edição', 1, 218, 'teste2'),
(1534, '2024-06-07', '14:45:22', 'tarefas', 'edição', 1, 218, 'teste2'),
(1535, '2024-06-07', '14:45:23', 'tarefas', 'edição', 1, 218, 'teste2'),
(1536, '2024-06-07', '14:45:24', 'tarefas', 'edição', 1, 218, 'teste2'),
(1537, '2024-06-07', '14:56:53', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1538, '2024-06-07', '14:56:54', 'tarefas', 'edição', 1, 219, 'TESTAR CÓDIGO'),
(1539, '2024-06-07', '15:03:57', 'tarefas', 'exclusão', 1, 219, 'TESTAR CÓDIGO'),
(1540, '2024-06-07', '15:04:41', 'tarefas', 'inserção', 1, 220, 'Testar código do sistema'),
(1541, '2024-06-07', '15:06:37', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1542, '2024-06-07', '15:06:38', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1543, '2024-06-07', '15:06:38', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1544, '2024-06-07', '15:06:39', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1545, '2024-06-07', '15:06:39', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1546, '2024-06-07', '15:06:40', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1547, '2024-06-07', '15:06:41', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1548, '2024-06-07', '15:07:27', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1549, '2024-06-07', '15:07:29', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1550, '2024-06-07', '15:07:30', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1551, '2024-06-07', '15:07:32', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1552, '2024-06-07', '15:07:32', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1553, '2024-06-07', '15:27:00', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1554, '2024-06-07', '15:27:07', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1555, '2024-06-07', '15:27:07', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1556, '2024-06-07', '15:27:08', 'tarefas', 'edição', 1, 220, 'Testar código do sistema'),
(1557, '2024-06-07', '15:27:16', 'tarefas', 'edição', 1, 216, 'teste'),
(1558, '2024-06-07', '15:27:17', 'tarefas', 'edição', 1, 216, 'teste'),
(1559, '2024-06-07', '15:27:17', 'tarefas', 'edição', 1, 216, 'teste'),
(1560, '2024-06-07', '15:27:18', 'tarefas', 'edição', 1, 216, 'teste'),
(1561, '2024-06-07', '15:27:18', 'tarefas', 'edição', 1, 216, 'teste'),
(1562, '2024-06-07', '15:28:21', 'tarefas', 'edição', 1, 216, 'teste'),
(1563, '2024-06-07', '15:28:50', 'tarefas', 'exclusão', 1, 216, 'teste'),
(1564, '2024-06-07', '15:28:52', 'tarefas', 'exclusão', 1, 218, 'teste2'),
(1565, '2024-06-07', '15:28:55', 'tarefas', 'exclusão', 1, 220, 'Testar código do sistema'),
(1566, '2024-06-07', '15:29:05', 'tarefas', 'inserção', 1, 221, 'teste'),
(1567, '2024-06-07', '15:29:21', 'tarefas', 'inserção', 1, 222, 'teste2'),
(1568, '2024-06-07', '15:29:59', 'tarefas', 'inserção', 1, 223, 'teste3'),
(1569, '2024-06-07', '15:30:17', 'tarefas', 'edição', 1, 221, 'teste'),
(1570, '2024-06-07', '15:35:48', 'tarefas', 'edição', 1, 221, 'teste'),
(1571, '2024-06-07', '15:36:08', 'tarefas', 'inserção', 1, 224, 'teste4'),
(1572, '2024-06-07', '15:39:15', 'tarefas', 'exclusão', 1, 222, 'teste2'),
(1573, '2024-06-07', '15:39:18', 'tarefas', 'exclusão', 1, 223, 'teste3'),
(1574, '2024-06-07', '15:39:20', 'tarefas', 'exclusão', 1, 224, 'teste4'),
(1575, '2024-06-07', '15:39:23', 'tarefas', 'exclusão', 1, 221, 'teste'),
(1576, '2024-06-07', '16:03:40', 'tarefas', 'inserção', 1, 230, 'TESTAR CÓDIGO'),
(1577, '2024-06-07', '16:17:48', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1578, '2024-06-07', '16:17:50', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1579, '2024-06-07', '16:17:51', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1580, '2024-06-07', '16:17:51', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1581, '2024-06-07', '16:17:52', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1582, '2024-06-07', '16:17:52', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1583, '2024-06-07', '16:17:53', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1584, '2024-06-07', '16:18:06', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1585, '2024-06-07', '16:18:06', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1586, '2024-06-07', '16:18:07', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1587, '2024-06-07', '16:18:07', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1588, '2024-06-07', '16:18:08', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1589, '2024-06-07', '16:18:09', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1590, '2024-06-07', '16:18:09', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1591, '2024-06-07', '16:18:10', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1592, '2024-06-07', '16:18:10', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1593, '2024-06-07', '16:18:11', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1594, '2024-06-07', '16:18:11', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1595, '2024-06-07', '16:18:12', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1596, '2024-06-07', '16:18:12', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1597, '2024-06-07', '16:18:13', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1598, '2024-06-07', '16:18:14', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1599, '2024-06-07', '16:18:14', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1600, '2024-06-07', '16:18:15', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1601, '2024-06-07', '16:18:16', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1602, '2024-06-07', '16:18:17', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1603, '2024-06-07', '16:18:17', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1604, '2024-06-07', '16:18:22', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1605, '2024-06-07', '16:18:23', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1606, '2024-06-07', '16:18:24', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1607, '2024-06-07', '16:18:24', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1608, '2024-06-07', '16:18:25', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1609, '2024-06-07', '16:18:26', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1610, '2024-06-07', '16:18:26', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1611, '2024-06-07', '16:18:27', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1612, '2024-06-07', '16:19:15', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1613, '2024-06-07', '16:19:16', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1614, '2024-06-07', '16:19:16', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1615, '2024-06-07', '16:19:17', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1616, '2024-06-07', '16:19:18', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1617, '2024-06-07', '16:19:18', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1618, '2024-06-07', '16:19:19', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1619, '2024-06-07', '16:19:20', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1620, '2024-06-07', '16:19:22', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1621, '2024-06-07', '16:21:42', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1622, '2024-06-07', '16:21:43', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1623, '2024-06-07', '16:21:59', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1624, '2024-06-07', '16:22:01', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1625, '2024-06-07', '16:22:24', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1626, '2024-06-07', '16:24:49', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1627, '2024-06-07', '16:24:53', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1628, '2024-06-07', '16:24:54', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1629, '2024-06-07', '16:24:55', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1630, '2024-06-07', '16:24:56', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1631, '2024-06-07', '16:24:56', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1632, '2024-06-07', '16:24:57', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1633, '2024-06-07', '16:25:14', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1634, '2024-06-07', '16:25:16', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1635, '2024-06-07', '16:26:10', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1636, '2024-06-07', '16:26:13', 'tarefas', 'edição', 1, 230, 'TESTAR CÓDIGO'),
(1637, '2024-06-07', '16:27:40', 'tarefas', 'exclusão', 1, 230, 'TESTAR CÓDIGO'),
(1638, '2024-06-07', '16:27:56', 'tarefas', 'inserção', 1, 231, 'Regularizar documento da empresa'),
(1639, '2024-06-07', '16:27:59', 'tarefas', 'exclusão', 1, 231, 'Regularizar documento da empresa'),
(1640, '2024-06-07', '16:29:09', 'tarefas', 'inserção', 1, 232, 'Regularizar documento da empresa'),
(1641, '2024-06-07', '16:29:55', 'tarefas', 'inserção', 18, 233, 'Regularizar documento da empresa mm'),
(1642, '2024-06-07', '16:29:59', 'tarefas', 'exclusão', 1, 233, 'Regularizar documento da empresa mm'),
(1643, '2024-06-07', '16:32:41', 'tarefas', 'edição', 1, 232, 'Regularizar documento da empresa'),
(1644, '2024-06-07', '16:32:44', 'tarefas', 'edição', 1, 232, 'Regularizar documento da empresa'),
(1645, '2024-06-07', '16:32:55', 'tarefas', 'edição', 1, 232, 'Regularizar documento da empresa'),
(1646, '2024-06-07', '16:33:26', 'tarefas', 'inserção', 1, 235, 'teste'),
(1647, '2024-06-07', '16:33:45', 'tarefas', 'inserção', 1, 236, 'teste2'),
(1648, '2024-06-07', '16:34:01', 'tarefas', 'edição', 1, 235, 'teste'),
(1649, '2024-06-07', '16:34:03', 'tarefas', 'edição', 1, 236, 'teste2'),
(1650, '2024-06-07', '16:34:04', 'tarefas', 'edição', 1, 236, 'teste2'),
(1651, '2024-06-07', '16:34:05', 'tarefas', 'edição', 1, 236, 'teste2'),
(1652, '2024-06-07', '16:34:06', 'tarefas', 'edição', 1, 232, 'Regularizar documento da empresa'),
(1653, '2024-06-07', '16:34:44', 'tarefas', 'edição', 1, 235, 'teste'),
(1654, '2024-06-07', '16:34:45', 'tarefas', 'edição', 1, 236, 'teste2'),
(1655, '2024-06-07', '16:44:37', 'tarefas', 'inserção', 1, 237, 'teste9'),
(1656, '2024-06-07', '19:06:39', 'usuarios', 'login', 1, 0, 'login'),
(1657, '2024-06-07', '19:07:10', 'tarefas', 'edição', 1, 237, 'teste9'),
(1658, '2024-06-07', '19:07:11', 'tarefas', 'edição', 1, 237, 'teste9'),
(1659, '2024-06-07', '19:07:12', 'tarefas', 'edição', 1, 237, 'teste9'),
(1660, '2024-06-07', '19:07:13', 'tarefas', 'edição', 1, 237, 'teste9'),
(1661, '2024-06-07', '19:07:14', 'tarefas', 'edição', 1, 237, 'teste9'),
(1662, '2024-06-07', '19:07:15', 'tarefas', 'edição', 1, 237, 'teste9'),
(1663, '2024-06-07', '19:07:15', 'tarefas', 'edição', 1, 237, 'teste9'),
(1664, '2024-06-07', '19:09:04', 'funcionarios', 'inserção', 1, 34, 'Renato Elci'),
(1665, '2024-06-07', '19:20:01', 'tarefas', 'inserção', 1, 238, 'Regularizar  '),
(1666, '2024-06-07', '19:20:36', 'tarefas', 'inserção', 19, 239, 'teste2'),
(1667, '2024-06-07', '19:21:56', 'tarefas', 'exclusão', 1, 237, 'teste9'),
(1668, '2024-06-07', '19:22:00', 'tarefas', 'exclusão', 1, 238, 'Regularizar  '),
(1669, '2024-06-07', '19:22:06', 'tarefas', 'exclusão', 1, 239, 'teste2'),
(1670, '2024-06-07', '21:06:42', 'tarefas', 'inserção', 1, 240, 'TESTAR CÓDIGO'),
(1671, '2024-06-07', '21:08:26', 'tarefas', 'inserção', 1, 241, 'teste9'),
(1672, '2024-06-07', '21:08:42', 'tarefas', 'exclusão', 1, 241, 'teste9'),
(1673, '2024-06-07', '21:08:45', 'tarefas', 'exclusão', 1, 240, 'TESTAR CÓDIGO'),
(1674, '2024-06-07', '21:08:49', 'tarefas', 'exclusão', 1, 236, 'teste2'),
(1675, '2024-06-07', '21:09:02', 'tarefas', 'edição', 1, 232, 'Regularizar documento da empresa'),
(1676, '2024-06-07', '21:09:04', 'tarefas', 'edição', 1, 235, 'teste'),
(1677, '2024-06-07', '21:09:09', 'tarefas', 'exclusão', 1, 232, 'Regularizar documento da empresa'),
(1678, '2024-06-07', '21:09:11', 'tarefas', 'exclusão', 1, 235, 'teste'),
(1679, '2024-06-08', '10:43:42', 'usuarios', 'login', 1, 0, 'login'),
(1680, '2024-06-08', '10:44:52', 'tarefas', 'inserção', 1, 242, 'Regularizar documento da empresa'),
(1681, '2024-06-08', '10:47:27', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1682, '2024-06-08', '10:47:28', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1683, '2024-06-08', '10:47:29', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1684, '2024-06-08', '10:47:30', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1685, '2024-06-08', '11:08:04', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1686, '2024-06-08', '11:08:07', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1687, '2024-06-08', '11:11:46', 'usuarios', 'login', 1, 0, 'login'),
(1688, '2024-06-08', '11:12:54', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1689, '2024-06-08', '11:12:59', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1690, '2024-06-08', '11:35:42', 'tarefas', 'inserção', 1, 243, 'teste'),
(1691, '2024-06-08', '11:35:55', 'tarefas', 'edição', 1, 243, 'teste'),
(1692, '2024-06-08', '11:36:01', 'tarefas', 'exclusão', 1, 243, 'teste'),
(1693, '2024-06-08', '11:44:12', 'tarefas', 'inserção', 1, 244, 'teste2'),
(1694, '2024-06-08', '11:55:01', 'usuarios', 'login', 1, 0, 'login'),
(1695, '2024-06-08', '12:03:15', 'tarefas', 'inserção', 1, 245, 'teste2aaaa'),
(1696, '2024-06-08', '12:13:38', 'tarefas', 'inserção', 1, 246, 'Regularizar  '),
(1697, '2024-06-08', '12:13:45', 'tarefas', 'exclusão', 1, 245, 'teste2aaaa'),
(1698, '2024-06-08', '12:13:47', 'tarefas', 'exclusão', 1, 244, 'teste2'),
(1699, '2024-06-08', '12:13:50', 'tarefas', 'exclusão', 1, 246, 'Regularizar  '),
(1700, '2024-06-08', '12:14:10', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1701, '2024-06-08', '12:14:11', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1702, '2024-06-08', '12:14:12', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1703, '2024-06-08', '12:14:13', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1704, '2024-06-08', '12:14:15', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1705, '2024-06-08', '12:14:18', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1706, '2024-06-08', '12:21:59', 'usuarios', 'login', 1, 0, 'login'),
(1707, '2024-06-08', '12:47:28', 'usuarios', 'login', 18, 0, 'login'),
(1708, '2024-06-08', '12:50:55', 'tarefas', 'inserção', 18, 247, 'teste'),
(1709, '2024-06-08', '12:51:07', 'tarefas', 'edição', 18, 247, 'teste'),
(1710, '2024-06-08', '12:51:07', 'tarefas', 'edição', 18, 247, 'teste'),
(1711, '2024-06-08', '13:03:49', 'usuarios', 'login', 1, 0, 'login'),
(1712, '2024-06-08', '13:04:32', 'tarefas', 'inserção', 1, 248, 'Regularizar documento da empresa'),
(1713, '2024-06-08', '13:06:07', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1714, '2024-06-08', '13:06:26', 'tarefas', 'edição', 1, 247, 'teste'),
(1715, '2024-06-08', '13:06:27', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1716, '2024-06-08', '13:39:35', 'tarefas', 'edição', 1, 247, 'teste'),
(1717, '2024-06-08', '13:39:36', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1718, '2024-06-08', '13:43:53', 'tarefas', 'edição', 1, 247, 'teste'),
(1719, '2024-06-08', '13:44:02', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1720, '2024-06-08', '13:44:04', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1721, '2024-06-08', '13:44:16', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1722, '2024-06-08', '13:44:31', 'tarefas', 'edição', 1, 248, 'Regularizar documento da empresa'),
(1723, '2024-06-08', '13:44:36', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1724, '2024-06-08', '13:44:51', 'tarefas', 'exclusão', 1, 248, 'Regularizar documento da empresa'),
(1725, '2024-06-08', '13:45:01', 'tarefas', 'inserção', 1, 249, 'teste'),
(1726, '2024-06-08', '13:45:12', 'tarefas', 'inserção', 1, 250, 'teste2'),
(1727, '2024-06-08', '13:46:14', 'tarefas', 'exclusão', 1, 249, 'teste'),
(1728, '2024-06-08', '13:46:18', 'tarefas', 'exclusão', 1, 250, 'teste2'),
(1729, '2024-06-08', '13:46:26', 'tarefas', 'inserção', 1, 251, 'teste'),
(1730, '2024-06-08', '13:46:39', 'tarefas', 'edição', 1, 251, 'teste'),
(1731, '2024-06-08', '13:46:41', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1732, '2024-06-08', '13:58:20', 'tarefas', 'edição', 1, 251, 'teste'),
(1733, '2024-06-08', '14:07:14', 'tarefas', 'inserção', 1, 252, 'TESTAR CÓDIGO'),
(1734, '2024-06-08', '16:18:49', 'usuarios', 'login', 1, 0, 'login'),
(1735, '2024-06-08', '16:19:10', 'tarefas', 'edição', 1, 242, 'Regularizar documento da empresa'),
(1736, '2024-06-08', '16:47:20', 'tarefas', 'edição', 1, 251, 'teste'),
(1737, '2024-06-08', '16:47:21', 'tarefas', 'edição', 1, 251, 'teste'),
(1738, '2024-06-08', '16:47:22', 'tarefas', 'edição', 1, 251, 'teste'),
(1739, '2024-06-08', '16:47:23', 'tarefas', 'edição', 1, 251, 'teste'),
(1740, '2024-06-08', '16:47:48', 'tarefas', 'inserção', 1, 253, 'teste'),
(1741, '2024-06-08', '16:50:00', 'tarefas', 'inserção', 1, 254, 'TESTAR CÓDIGO'),
(1742, '2024-06-08', '16:52:30', 'tarefas', 'edição', 1, 251, 'teste'),
(1743, '2024-06-08', '16:57:35', 'tarefas', 'exclusão', 1, 247, 'teste'),
(1744, '2024-06-08', '16:57:37', 'tarefas', 'exclusão', 1, 254, 'TESTAR CÓDIGO'),
(1745, '2024-06-08', '16:57:41', 'tarefas', 'exclusão', 1, 253, 'teste'),
(1746, '2024-06-08', '16:57:43', 'tarefas', 'exclusão', 1, 252, 'TESTAR CÓDIGO'),
(1747, '2024-06-08', '16:57:46', 'tarefas', 'exclusão', 1, 251, 'teste'),
(1748, '2024-06-08', '16:57:50', 'tarefas', 'exclusão', 1, 242, 'Regularizar documento da empresa'),
(1749, '2024-06-08', '16:58:52', 'tarefas', 'inserção', 1, 255, 'teste'),
(1750, '2024-06-08', '16:59:09', 'tarefas', 'inserção', 1, 256, 'teste2'),
(1751, '2024-06-08', '16:59:28', 'tarefas', 'inserção', 1, 257, 'teste 3'),
(1752, '2024-06-08', '16:59:42', 'tarefas', 'edição', 1, 255, 'teste'),
(1753, '2024-06-08', '17:00:13', 'tarefas', 'inserção', 19, 258, 'teste 4'),
(1754, '2024-06-08', '17:05:34', 'tarefas', 'exclusão', 1, 258, 'teste 4'),
(1755, '2024-06-08', '17:05:40', 'tarefas', 'edição', 1, 255, 'teste'),
(1756, '2024-06-08', '17:24:12', 'tarefas', 'inserção', 1, 259, 'teste'),
(1757, '2024-06-08', '17:35:20', 'tarefas', 'inserção', 1, 260, 'teste'),
(1758, '2024-06-09', '00:55:35', 'usuarios', 'login', 1, 0, 'login'),
(1759, '2024-06-09', '00:59:55', 'tarefas', 'inserção', 1, 261, 'teste'),
(1760, '2024-06-09', '01:37:27', 'tarefas', 'edição', 1, 256, 'teste2'),
(1761, '2024-06-09', '01:37:33', 'tarefas', 'edição', 1, 256, 'teste2'),
(1762, '2024-06-09', '01:37:33', 'tarefas', 'edição', 1, 256, 'teste2'),
(1763, '2024-06-09', '01:37:34', 'tarefas', 'edição', 1, 256, 'teste2'),
(1764, '2024-06-09', '01:37:35', 'tarefas', 'edição', 1, 256, 'teste2'),
(1765, '2024-06-09', '01:37:36', 'tarefas', 'edição', 1, 256, 'teste2'),
(1766, '2024-06-09', '01:37:44', 'tarefas', 'edição', 1, 261, 'teste'),
(1767, '2024-06-09', '01:37:53', 'tarefas', 'edição', 1, 256, 'teste2'),
(1768, '2024-06-09', '01:38:06', 'tarefas', 'edição', 1, 256, 'teste2'),
(1769, '2024-06-09', '12:17:24', 'usuarios', 'login', 1, 0, 'login'),
(1770, '2024-06-09', '14:33:06', 'tarefas', 'exclusão', 1, 261, 'teste'),
(1771, '2024-06-09', '14:33:08', 'tarefas', 'exclusão', 1, 260, 'teste'),
(1772, '2024-06-09', '14:33:10', 'tarefas', 'edição', 1, 259, 'teste'),
(1773, '2024-06-09', '14:33:11', 'tarefas', 'edição', 1, 257, 'teste 3'),
(1774, '2024-06-09', '14:33:12', 'tarefas', 'edição', 1, 256, 'teste2'),
(1775, '2024-06-09', '14:33:12', 'tarefas', 'edição', 1, 255, 'teste'),
(1776, '2024-06-09', '14:44:50', 'tarefas', 'inserção', 1, 262, 'teste'),
(1777, '2024-06-09', '14:45:31', 'tarefas', 'inserção', 1, 263, 'teste'),
(1778, '2024-06-09', '15:23:57', 'tarefas', 'exclusão', 1, 263, 'teste'),
(1779, '2024-06-09', '15:23:59', 'tarefas', 'exclusão', 1, 262, 'teste'),
(1780, '2024-06-09', '15:24:02', 'tarefas', 'exclusão', 1, 259, 'teste'),
(1781, '2024-06-09', '15:24:04', 'tarefas', 'exclusão', 1, 257, 'teste 3'),
(1782, '2024-06-09', '15:24:06', 'tarefas', 'exclusão', 1, 256, 'teste2'),
(1783, '2024-06-09', '15:24:09', 'tarefas', 'exclusão', 1, 255, 'teste'),
(1784, '2024-06-09', '15:24:29', 'tarefas', 'inserção', 1, 264, 'teste'),
(1785, '2024-06-09', '15:25:07', 'tarefas', 'inserção', 1, 265, 'teste2'),
(1786, '2024-06-09', '21:12:56', 'usuarios', 'login', 1, 0, 'login'),
(1787, '2024-06-09', '21:13:32', 'tarefas', 'edição', 1, 264, 'teste'),
(1788, '2024-06-09', '21:17:07', 'tarefas', 'edição', 1, 265, 'teste2'),
(1789, '2024-06-09', '21:17:09', 'tarefas', 'edição', 1, 264, 'teste'),
(1790, '2024-06-09', '21:17:24', 'tarefas', 'edição', 1, 264, 'teste'),
(1791, '2024-06-09', '21:17:34', 'tarefas', 'edição', 1, 265, 'teste2'),
(1792, '2024-06-09', '21:17:48', 'tarefas', 'edição', 1, 264, 'teste'),
(1793, '2024-06-09', '21:37:33', 'tarefas', 'edição', 1, 265, 'teste2'),
(1794, '2024-06-09', '21:37:34', 'tarefas', 'edição', 1, 265, 'teste2'),
(1795, '2024-06-09', '21:37:35', 'tarefas', 'edição', 1, 265, 'teste2'),
(1796, '2024-06-09', '21:37:36', 'tarefas', 'edição', 1, 265, 'teste2'),
(1797, '2024-06-09', '21:37:36', 'tarefas', 'edição', 1, 265, 'teste2'),
(1798, '2024-06-09', '21:40:47', 'tarefas', 'edição', 1, 265, 'teste2'),
(1799, '2024-06-09', '21:46:24', 'usuarios', 'login', 1, 0, 'login'),
(1800, '2024-06-09', '23:42:49', 'tarefas', 'edição', 1, 265, 'teste2'),
(1801, '2024-06-09', '23:42:50', 'tarefas', 'edição', 1, 265, 'teste2'),
(1802, '2024-06-09', '23:44:16', 'tarefas', 'edição', 1, 265, 'teste2'),
(1803, '2024-06-09', '23:44:17', 'tarefas', 'edição', 1, 264, 'teste'),
(1804, '2024-06-09', '23:44:21', 'tarefas', 'edição', 1, 265, 'teste2'),
(1805, '2024-06-09', '23:44:21', 'tarefas', 'edição', 1, 264, 'teste'),
(1806, '2024-06-09', '23:44:39', 'tarefas', 'edição', 1, 265, 'teste2'),
(1807, '2024-06-09', '23:44:40', 'tarefas', 'edição', 1, 265, 'teste2'),
(1808, '2024-06-09', '23:44:41', 'tarefas', 'edição', 1, 265, 'teste2'),
(1809, '2024-06-09', '23:44:41', 'tarefas', 'edição', 1, 265, 'teste2'),
(1810, '2024-06-09', '23:45:03', 'tarefas', 'inserção', 1, 266, 'teste'),
(1811, '2024-06-10', '11:01:56', 'usuarios', 'login', 1, 0, 'login'),
(1812, '2024-06-10', '11:32:36', 'tarefas', 'inserção', 1, 267, 'teste'),
(1813, '2024-06-10', '11:33:36', 'tarefas', 'edição', 1, 267, 'teste'),
(1814, '2024-06-10', '11:33:47', 'tarefas', 'exclusão', 1, 267, 'teste'),
(1815, '2024-06-10', '11:34:00', 'tarefas', 'inserção', 1, 268, 'teste'),
(1816, '2024-06-10', '11:38:10', 'tarefas', 'exclusão', 1, 268, 'teste'),
(1817, '2024-06-10', '11:39:53', 'tarefas', 'inserção', 1, 269, 'teste'),
(1818, '2024-06-10', '11:46:35', 'tarefas', 'exclusão', 1, 269, 'teste'),
(1819, '2024-06-10', '11:46:38', 'tarefas', 'exclusão', 1, 266, 'teste'),
(1820, '2024-06-10', '11:46:40', 'tarefas', 'exclusão', 1, 265, 'teste2'),
(1821, '2024-06-10', '11:46:42', 'tarefas', 'exclusão', 1, 264, 'teste'),
(1822, '2024-06-10', '11:47:12', 'tarefas', 'inserção', 1, 270, 'teste'),
(1823, '2024-06-10', '12:05:30', 'tarefas', 'inserção', 1, 272, 'teste'),
(1824, '2024-06-10', '12:06:28', 'tarefas', 'inserção', 1, 273, 'teste'),
(1825, '2024-06-10', '12:09:37', 'tarefas', 'inserção', 1, 274, 'teste'),
(1826, '2024-06-10', '12:10:03', 'tarefas', 'exclusão', 1, 274, 'teste'),
(1827, '2024-06-10', '12:10:05', 'tarefas', 'exclusão', 1, 273, 'teste'),
(1828, '2024-06-10', '12:10:08', 'tarefas', 'exclusão', 1, 272, 'teste'),
(1829, '2024-06-10', '12:10:10', 'tarefas', 'exclusão', 1, 271, 'teste'),
(1830, '2024-06-10', '12:10:12', 'tarefas', 'exclusão', 1, 270, 'teste'),
(1831, '2024-06-10', '12:11:17', 'tarefas', 'inserção', 18, 275, 'teste'),
(1832, '2024-06-10', '12:11:39', 'tarefas', 'inserção', 1, 0, 'teste'),
(1833, '2024-06-10', '12:18:20', 'tarefas', 'inserção', 1, 276, 'teste'),
(1834, '2024-06-10', '12:18:33', 'tarefas', 'inserção', 1, 277, 'teste2'),
(1835, '2024-06-10', '12:30:22', 'tarefas', 'edição', 1, 276, 'teste'),
(1836, '2024-06-10', '12:30:28', 'tarefas', 'edição', 1, 276, 'teste'),
(1837, '2024-06-10', '12:39:09', 'tarefas', 'edição', 1, 276, 'teste'),
(1838, '2024-06-10', '12:39:18', 'tarefas', 'edição', 1, 276, 'teste'),
(1839, '2024-06-10', '12:39:25', 'tarefas', 'inserção', 1, 278, 'teste'),
(1840, '2024-06-10', '12:39:37', 'tarefas', 'edição', 1, 276, 'teste'),
(1841, '2024-06-10', '12:52:20', 'tarefas', 'edição', 1, 277, 'teste2'),
(1842, '2024-06-10', '12:53:40', 'tarefas', 'edição', 1, 277, 'teste2'),
(1843, '2024-06-10', '12:54:08', 'tarefas', 'exclusão', 1, 277, 'teste2'),
(1844, '2024-06-10', '12:54:10', 'tarefas', 'edição', 1, 278, 'teste'),
(1845, '2024-06-10', '12:54:11', 'tarefas', 'edição', 1, 278, 'teste'),
(1846, '2024-06-10', '12:54:12', 'tarefas', 'edição', 1, 276, 'teste'),
(1847, '2024-06-10', '12:54:57', 'tarefas', 'inserção', 1, 279, 'teste2'),
(1848, '2024-06-10', '18:41:37', 'usuarios', 'login', 1, 0, 'login'),
(1849, '2024-06-10', '18:42:18', 'tarefas', 'edição', 1, 275, 'teste'),
(1850, '2024-06-11', '06:53:49', 'usuarios', 'login', 1, 0, 'login'),
(1851, '2024-06-11', '06:59:11', 'tarefas', 'edição', 1, 275, 'teste'),
(1852, '2024-06-11', '06:59:57', 'tarefas', 'inserção', 1, 280, 'teste'),
(1853, '2024-06-11', '07:01:41', 'tarefas', 'exclusão', 1, 280, 'teste'),
(1854, '2024-06-11', '07:01:45', 'tarefas', 'exclusão', 1, 279, 'teste2'),
(1855, '2024-06-11', '07:01:48', 'tarefas', 'exclusão', 1, 278, 'teste'),
(1856, '2024-06-11', '07:01:50', 'tarefas', 'exclusão', 1, 276, 'teste'),
(1857, '2024-06-11', '07:01:53', 'tarefas', 'exclusão', 1, 275, 'teste'),
(1858, '2024-06-11', '07:02:10', 'tarefas', 'inserção', 1, 281, 'teste'),
(1859, '2024-06-11', '07:02:43', 'tarefas', 'inserção', 1, 282, 'teste2'),
(1860, '2024-06-11', '07:04:03', 'tarefas', 'inserção', 1, 283, 'teste 3'),
(1861, '2024-06-11', '07:04:21', 'tarefas', 'inserção', 1, 284, 'teste 4'),
(1862, '2024-06-11', '07:05:08', 'tarefas', 'inserção', 1, 285, 'teste 5'),
(1863, '2024-06-11', '07:10:06', 'tarefas', 'edição', 1, 282, 'teste2'),
(1864, '2024-06-11', '07:10:15', 'tarefas', 'edição', 1, 284, 'teste 4'),
(1865, '2024-06-11', '07:10:22', 'tarefas', 'edição', 1, 284, 'teste 4'),
(1866, '2024-06-11', '07:10:23', 'tarefas', 'edição', 1, 282, 'teste2'),
(1867, '2024-06-11', '07:11:18', 'tarefas', 'inserção', 1, 286, 'teste 6'),
(1868, '2024-06-11', '07:25:35', 'tarefas', 'exclusão', 1, 281, 'teste'),
(1869, '2024-06-11', '18:06:45', 'usuarios', 'login', 1, 0, 'login'),
(1870, '2024-06-11', '18:10:52', 'tarefas', 'inserção', 1, 287, 'teste 7'),
(1871, '2024-06-11', '18:12:59', 'tarefas', 'edição', 1, 287, 'teste 7'),
(1872, '2024-06-11', '18:13:04', 'tarefas', 'exclusão', 1, 287, 'teste 7'),
(1873, '2024-06-11', '18:13:11', 'tarefas', 'exclusão', 1, 286, 'teste 6'),
(1874, '2024-06-11', '18:13:14', 'tarefas', 'exclusão', 1, 285, 'teste 5'),
(1875, '2024-06-11', '18:13:54', 'tarefas', 'exclusão', 1, 284, 'teste 4'),
(1876, '2024-06-11', '18:13:57', 'tarefas', 'exclusão', 1, 283, 'teste 3'),
(1877, '2024-06-11', '18:14:00', 'tarefas', 'exclusão', 1, 282, 'teste2'),
(1878, '2024-06-11', '18:19:12', 'tarefas', 'inserção', 1, 288, 'teste'),
(1879, '2024-06-11', '18:38:11', 'tarefas', 'inserção', 1, 289, 'teste2'),
(1880, '2024-06-11', '18:38:44', 'tarefas', 'inserção', 1, 290, 'teste 3'),
(1881, '2024-06-12', '07:03:00', 'usuarios', 'login', 1, 0, 'login'),
(1882, '2024-06-12', '22:07:13', 'usuarios', 'login', 1, 0, 'login'),
(1883, '2024-06-12', '22:08:20', 'tarefas', 'inserção', 1, 291, 'teste'),
(1884, '2024-06-12', '22:16:03', 'tarefas', 'exclusão', 1, 291, 'teste'),
(1885, '2024-06-12', '22:16:35', 'tarefas', 'inserção', 1, 292, 'TESTAR CÓDIGO'),
(1886, '2024-06-12', '22:17:23', 'tarefas', 'inserção', 1, 293, 'teste'),
(1887, '2024-06-12', '22:18:59', 'usuarios', 'login', 1, 0, 'login'),
(1888, '2024-06-12', '22:25:50', 'tarefas', 'exclusão', 1, 288, 'teste'),
(1889, '2024-06-12', '22:25:54', 'tarefas', 'exclusão', 1, 289, 'teste2'),
(1890, '2024-06-12', '22:25:56', 'tarefas', 'exclusão', 1, 290, 'teste 3'),
(1891, '2024-06-12', '22:25:59', 'tarefas', 'exclusão', 1, 292, 'TESTAR CÓDIGO'),
(1892, '2024-06-12', '22:26:02', 'tarefas', 'exclusão', 1, 293, 'teste'),
(1893, '2024-06-12', '22:26:18', 'tarefas', 'inserção', 1, 294, 'teste'),
(1894, '2024-06-12', '22:27:44', 'tarefas', 'inserção', 1, 295, 'teste2'),
(1895, '2024-06-12', '22:30:24', 'tarefas', 'inserção', 1, 296, 'teste3'),
(1896, '2024-06-12', '22:31:02', 'tarefas', 'inserção', 1, 297, 'teste4'),
(1897, '2024-06-12', '22:31:18', 'tarefas', 'exclusão', 1, 297, 'teste4'),
(1898, '2024-06-12', '22:31:20', 'tarefas', 'exclusão', 1, 296, 'teste3'),
(1899, '2024-06-12', '22:31:23', 'tarefas', 'exclusão', 1, 295, 'teste2'),
(1900, '2024-06-12', '22:31:26', 'tarefas', 'exclusão', 1, 294, 'teste'),
(1901, '2024-06-12', '22:32:19', 'tarefas', 'inserção', 1, 298, 'teste'),
(1902, '2024-06-12', '22:32:36', 'tarefas', 'inserção', 1, 299, 'teste2'),
(1903, '2024-06-12', '22:35:37', 'tarefas', 'inserção', 1, 300, 'teste3'),
(1904, '2024-06-12', '22:36:07', 'tarefas', 'inserção', 1, 301, 'teste4'),
(1905, '2024-06-12', '22:40:57', 'tarefas', 'inserção', 1, 302, 'teste'),
(1906, '2024-06-12', '22:47:45', 'tarefas', 'inserção', 1, 303, 'teste'),
(1907, '2024-06-12', '22:47:51', 'tarefas', 'exclusão', 1, 303, 'teste'),
(1908, '2024-06-12', '22:47:53', 'tarefas', 'exclusão', 1, 302, 'teste'),
(1909, '2024-06-12', '22:47:56', 'tarefas', 'exclusão', 1, 301, 'teste4'),
(1910, '2024-06-12', '22:47:59', 'tarefas', 'exclusão', 1, 300, 'teste3'),
(1911, '2024-06-12', '22:48:02', 'tarefas', 'exclusão', 1, 299, 'teste2'),
(1912, '2024-06-12', '22:48:05', 'tarefas', 'exclusão', 1, 298, 'teste'),
(1913, '2024-06-12', '22:48:55', 'tarefas', 'inserção', 1, 304, 'teste'),
(1914, '2024-06-12', '22:50:00', 'tarefas', 'inserção', 1, 305, 'teste2'),
(1915, '2024-06-12', '22:51:32', 'tarefas', 'exclusão', 1, 305, 'teste2'),
(1916, '2024-06-12', '22:51:36', 'tarefas', 'exclusão', 1, 304, 'teste'),
(1917, '2024-06-12', '23:01:19', 'tarefas', 'inserção', 1, 306, 'teste'),
(1918, '2024-06-12', '23:07:44', 'tarefas', 'inserção', 1, 307, 'teste'),
(1919, '2024-06-12', '23:08:02', 'tarefas', 'inserção', 1, 308, 'teste2'),
(1920, '2024-06-12', '23:10:00', 'tarefas', 'exclusão', 1, 308, 'teste2'),
(1921, '2024-06-12', '23:10:03', 'tarefas', 'exclusão', 1, 307, 'teste'),
(1922, '2024-06-12', '23:10:09', 'tarefas', 'exclusão', 1, 306, 'teste'),
(1923, '2024-06-13', '07:14:59', 'usuarios', 'login', 1, 0, 'login'),
(1924, '2024-06-13', '07:35:49', 'tarefas', 'inserção', 1, 309, 'teste'),
(1925, '2024-06-13', '07:36:42', 'tarefas', 'edição', 1, 309, 'teste'),
(1926, '2024-06-13', '07:37:42', 'tarefas', 'edição', 1, 309, 'teste'),
(1927, '2024-06-13', '07:39:37', 'tarefas', 'edição', 1, 309, 'teste'),
(1928, '2024-06-13', '07:46:47', 'tarefas', 'edição', 1, 309, 'teste'),
(1929, '2024-06-13', '17:36:49', 'usuarios', 'login', 1, 0, 'login'),
(1930, '2024-06-13', '19:29:20', 'usuarios', 'login', 1, 0, 'login'),
(1931, '2024-06-16', '11:50:52', 'usuarios', 'login', 1, 0, 'login'),
(1932, '2024-06-16', '13:42:17', 'usuarios', 'logout', 1, 0, 'logout'),
(1933, '2024-06-16', '13:42:23', 'usuarios', 'login', 19, 0, 'login'),
(1934, '2024-06-16', '13:42:51', 'usuarios', 'logout', 19, 0, 'logout'),
(1935, '2024-06-16', '13:42:54', 'usuarios', 'login', 1, 0, 'login'),
(1936, '2024-06-16', '22:14:13', 'usuarios', 'login', 1, 0, 'login'),
(1937, '2024-06-17', '09:51:57', 'usuarios', 'login', 1, 0, 'login'),
(1938, '2024-06-17', '09:57:22', 'usuarios', 'logout', 1, 0, 'logout'),
(1939, '2024-06-17', '09:57:31', 'usuarios', 'login', 19, 0, 'login'),
(1940, '2024-06-17', '10:15:04', 'usuarios', 'login', 1, 0, 'login'),
(1941, '2024-06-17', '10:25:50', 'usuarios', 'logout', 1, 0, 'logout'),
(1942, '2024-06-17', '10:28:14', 'usuarios', 'login', 1, 0, 'login'),
(1943, '2024-06-17', '10:28:42', 'usuarios', 'login', 19, 0, 'login'),
(1944, '2024-06-17', '10:29:32', 'usuarios', 'logout', 19, 0, 'logout'),
(1945, '2024-06-17', '10:29:34', 'usuarios', 'login', 1, 0, 'login'),
(1946, '2024-06-17', '10:46:34', 'usuarios', 'logout', 1, 0, 'logout'),
(1947, '2024-06-17', '10:46:48', 'usuarios', 'login', 19, 0, 'login'),
(1948, '2024-06-17', '10:52:39', 'usuarios', 'logout', 19, 0, 'logout'),
(1949, '2024-06-17', '10:52:41', 'usuarios', 'login', 1, 0, 'login'),
(1950, '2024-06-17', '11:18:32', 'usuarios', 'logout', 1, 0, 'logout'),
(1951, '2024-06-17', '11:18:47', 'usuarios', 'login', 19, 0, 'login'),
(1952, '2024-06-17', '11:31:18', 'usuarios', 'login', 1, 0, 'login'),
(1953, '2024-06-17', '11:33:10', 'usuarios', 'login', 19, 0, 'login'),
(1954, '2024-06-17', '11:40:49', 'usuarios', 'logout', 19, 0, 'logout'),
(1955, '2024-06-17', '11:40:51', 'usuarios', 'login', 1, 0, 'login'),
(1956, '2024-06-17', '11:43:46', 'usuarios', 'logout', 1, 0, 'logout'),
(1957, '2024-06-17', '11:43:58', 'usuarios', 'login', 19, 0, 'login'),
(1958, '2024-06-17', '11:44:09', 'usuarios', 'logout', 19, 0, 'logout'),
(1959, '2024-06-17', '11:44:13', 'usuarios', 'login', 1, 0, 'login'),
(1960, '2024-06-17', '11:44:18', 'usuarios', 'logout', 1, 0, 'logout'),
(1961, '2024-06-17', '11:44:24', 'usuarios', 'login', 19, 0, 'login'),
(1962, '2024-06-17', '11:44:33', 'usuarios', 'logout', 19, 0, 'logout'),
(1963, '2024-06-17', '11:44:36', 'usuarios', 'login', 1, 0, 'login'),
(1964, '2024-06-17', '11:52:10', 'usuarios', 'logout', 1, 0, 'logout'),
(1965, '2024-06-17', '11:52:21', 'usuarios', 'login', 18, 0, 'login'),
(1966, '2024-06-17', '11:53:56', 'usuarios', 'logout', 18, 0, 'logout'),
(1967, '2024-06-17', '11:53:57', 'usuarios', 'login', 1, 0, 'login'),
(1968, '2024-06-17', '11:54:32', 'usuarios', 'logout', 1, 0, 'logout'),
(1969, '2024-06-17', '11:54:42', 'usuarios', 'login', 18, 0, 'login'),
(1970, '2024-06-17', '17:28:40', 'usuarios', 'login', 1, 0, 'login'),
(1971, '2024-06-17', '17:29:13', 'usuarios', 'login', 19, 0, 'login'),
(1972, '2024-06-17', '18:33:46', 'usuarios', 'logout', 1, 0, 'logout'),
(1973, '2024-06-17', '18:33:56', 'usuarios', 'login', 19, 0, 'login'),
(1974, '2024-06-17', '18:36:01', 'usuarios', 'logout', 19, 0, 'logout'),
(1975, '2024-06-17', '18:36:03', 'usuarios', 'login', 1, 0, 'login'),
(1976, '2024-06-17', '18:36:33', 'usuarios', 'logout', 1, 0, 'logout'),
(1977, '2024-06-17', '18:36:40', 'usuarios', 'login', 19, 0, 'login'),
(1978, '2024-06-17', '18:37:17', 'usuarios', 'login', 19, 0, 'login'),
(1979, '2024-06-17', '18:37:21', 'usuarios', 'login', 19, 0, 'login'),
(1980, '2024-06-17', '18:38:00', 'usuarios', 'login', 19, 0, 'login'),
(1981, '2024-06-17', '18:39:10', 'usuarios', 'login', 19, 0, 'login'),
(1982, '2024-06-17', '19:27:58', 'usuarios', 'logout', 19, 0, 'logout'),
(1983, '2024-06-17', '19:29:51', 'usuarios', 'login', 19, 0, 'login'),
(1984, '2024-06-17', '19:30:47', 'usuarios', 'login', 19, 0, 'login'),
(1985, '2024-06-17', '19:39:50', 'usuarios', 'login', 1, 0, 'login'),
(1986, '2024-06-17', '19:50:11', 'usuarios', 'logout', 19, 0, 'logout'),
(1987, '2024-06-17', '19:50:17', 'usuarios', 'login', 19, 0, 'login'),
(1988, '2024-06-17', '22:01:13', 'usuarios', 'login', 1, 0, 'login'),
(1989, '2024-06-17', '22:04:06', 'usuarios', 'login', 19, 0, 'login'),
(1990, '2024-06-17', '23:18:41', 'usuarios', 'login', 1, 0, 'login'),
(1991, '2024-06-17', '23:22:01', 'usuarios', 'login', 1, 0, 'login'),
(1992, '2024-06-17', '23:25:50', 'usuarios', 'logout', 1, 0, 'logout'),
(1993, '2024-06-17', '23:25:52', 'usuarios', 'login', 1, 0, 'login'),
(1994, '2024-06-17', '23:41:58', 'usuarios', 'login', 1, 0, 'login'),
(1995, '2024-06-17', '23:43:46', 'usuarios', 'logout', 1, 0, 'logout'),
(1996, '2024-06-17', '23:43:54', 'usuarios', 'login', 19, 0, 'login'),
(1997, '2024-06-17', '23:45:58', 'usuarios', 'logout', 19, 0, 'logout'),
(1998, '2024-06-17', '23:46:00', 'usuarios', 'login', 1, 0, 'login'),
(1999, '2024-06-17', '23:55:55', 'usuarios', 'login', 1, 0, 'login'),
(2000, '2024-06-18', '06:58:39', 'usuarios', 'login', 1, 0, 'login'),
(2001, '2024-06-18', '07:09:42', 'funcionarios', 'edição', 1, 34, 'Renato Elci'),
(2002, '2024-06-18', '07:10:12', 'funcionarios', 'edição', 1, 34, 'Renato Elci'),
(2003, '2024-06-18', '07:11:43', 'funcionarios', 'edição', 1, 34, 'Renato Elci'),
(2004, '2024-06-18', '07:14:18', 'funcionarios', 'inserção', 1, 35, 'Ulisses'),
(2005, '2024-06-18', '07:14:48', 'funcionarios', 'inserção', 1, 36, 'Ulisses'),
(2006, '2024-06-18', '07:15:04', 'funcionarios', 'exclusão', 1, 36, 'Ulisses'),
(2007, '2024-06-18', '07:15:56', 'funcionarios', 'edição', 1, 35, 'Ulisses'),
(2008, '2024-06-18', '07:16:03', 'funcionarios', 'edição', 1, 35, 'Ulisses co'),
(2009, '2024-06-18', '07:17:07', 'funcionarios', 'inserção', 1, 37, 'Empresa X'),
(2010, '2024-06-18', '07:28:48', 'funcionarios', 'edição', 1, 34, 'Renato Elci'),
(2011, '2024-06-18', '07:29:37', 'funcionarios', 'edição', 1, 33, 'Vinicius Albardeiro'),
(2012, '2024-06-18', '07:30:00', 'funcionarios', 'edição', 1, 35, 'Ulisses co'),
(2013, '2024-06-18', '07:31:29', 'funcionarios', 'exclusão', 1, 35, 'Ulisses co'),
(2014, '2024-06-18', '07:31:34', 'funcionarios', 'exclusão', 1, 37, 'Empresa X'),
(2015, '2024-06-18', '07:32:58', 'funcionarios', 'inserção', 1, 38, 'Carlos Antonio'),
(2016, '2024-06-18', '07:33:39', 'funcionarios', 'edição', 1, 38, 'Carlos Antonio'),
(2017, '2024-06-18', '07:34:20', 'usuarios', 'logout', 1, 0, 'logout'),
(2018, '2024-06-18', '07:34:31', 'usuarios', 'login', 20, 0, 'login'),
(2019, '2024-06-18', '07:35:28', 'usuarios', 'login', 20, 0, 'login'),
(2020, '2024-06-18', '07:35:50', 'usuarios', 'logout', 20, 0, 'logout'),
(2021, '2024-06-18', '07:35:51', 'usuarios', 'login', 1, 0, 'login'),
(2022, '2024-06-18', '09:27:13', 'tarefas', 'inserção', 20, 310, 'TESTAR CÓDIGO'),
(2023, '2024-06-18', '09:27:44', 'tarefas', 'inserção', 20, 311, 'teste2'),
(2024, '2024-06-18', '09:46:42', 'usuarios', 'logout', 1, 0, 'logout'),
(2025, '2024-06-18', '09:46:49', 'usuarios', 'login', 19, 0, 'login'),
(2026, '2024-06-18', '09:47:05', 'usuarios', 'logout', 20, 0, 'logout'),
(2027, '2024-06-18', '09:47:07', 'usuarios', 'login', 1, 0, 'login'),
(2028, '2024-06-18', '09:56:40', 'tarefas', 'edição', 19, 311, 'teste2'),
(2029, '2024-06-18', '09:56:41', 'tarefas', 'edição', 19, 310, 'TESTAR CÓDIGO'),
(2030, '2024-06-18', '09:56:42', 'tarefas', 'edição', 19, 311, 'teste2'),
(2031, '2024-06-18', '09:56:43', 'tarefas', 'edição', 19, 310, 'TESTAR CÓDIGO'),
(2032, '2024-06-18', '09:56:45', 'tarefas', 'edição', 19, 309, 'teste'),
(2033, '2024-06-18', '10:05:30', 'usuarios', 'login', 19, 0, 'login'),
(2034, '2024-06-18', '10:06:04', 'usuarios', 'login', 19, 0, 'login'),
(2035, '2024-06-18', '10:06:16', 'usuarios', 'login', 19, 0, 'login'),
(2036, '2024-06-18', '10:07:53', 'usuarios', 'login', 19, 0, 'login'),
(2037, '2024-06-18', '10:08:11', 'usuarios', 'login', 19, 0, 'login'),
(2038, '2024-06-18', '10:20:54', 'usuarios', 'logout', 19, 0, 'logout'),
(2039, '2024-06-18', '10:21:01', 'usuarios', 'login', 20, 0, 'login'),
(2040, '2024-06-18', '10:21:57', 'usuarios', 'logout', 20, 0, 'logout'),
(2041, '2024-06-18', '10:22:06', 'usuarios', 'login', 19, 0, 'login'),
(2042, '2024-06-18', '10:25:55', 'tarefas', 'exclusão', 1, 311, 'teste2'),
(2043, '2024-06-18', '10:25:58', 'tarefas', 'exclusão', 1, 310, 'TESTAR CÓDIGO'),
(2044, '2024-06-18', '10:26:00', 'tarefas', 'exclusão', 1, 309, 'teste'),
(2045, '2024-06-18', '10:26:32', 'tarefas', 'inserção', 19, 312, 'teste'),
(2046, '2024-06-18', '10:27:14', 'tarefas', 'inserção', 19, 313, 'teste2'),
(2047, '2024-06-18', '10:27:37', 'usuarios', 'logout', 19, 0, 'logout'),
(2048, '2024-06-18', '10:27:49', 'usuarios', 'login', 20, 0, 'login'),
(2049, '2024-06-18', '10:28:06', 'usuarios', 'logout', 1, 0, 'logout'),
(2050, '2024-06-18', '10:28:12', 'usuarios', 'login', 20, 0, 'login'),
(2051, '2024-06-18', '10:30:26', 'usuarios', 'logout', 20, 0, 'logout'),
(2052, '2024-06-18', '10:30:33', 'usuarios', 'login', 19, 0, 'login'),
(2053, '2024-06-18', '10:30:44', 'usuarios', 'logout', 20, 0, 'logout'),
(2054, '2024-06-18', '10:30:46', 'usuarios', 'login', 1, 0, 'login'),
(2055, '2024-06-18', '10:33:33', 'tarefas', 'edição', 1, 312, 'teste'),
(2056, '2024-06-18', '10:33:34', 'tarefas', 'edição', 1, 312, 'teste'),
(2057, '2024-06-18', '10:44:24', 'usuarios', 'login', 1, 0, 'login'),
(2058, '2024-06-18', '10:51:13', 'usuarios', 'logout', 1, 0, 'logout'),
(2059, '2024-06-18', '10:51:20', 'usuarios', 'login', 19, 0, 'login'),
(2060, '2024-06-18', '18:16:48', 'usuarios', 'login', 1, 0, 'login'),
(2061, '2024-06-18', '18:19:10', 'clientes', 'edição', 1, 17, 'Semear Store');
INSERT INTO `logs` (`id`, `data`, `hora`, `tabela`, `acao`, `usuario`, `id_reg`, `descricao`) VALUES
(2062, '2024-06-18', '18:19:15', 'clientes', 'edição', 1, 17, 'Semear Store'),
(2063, '2024-07-09', '20:58:46', 'usuarios', 'login', 1, 0, 'login'),
(2064, '2024-07-09', '20:59:45', 'tarefas', 'edição', 1, 313, 'teste2'),
(2065, '2024-07-09', '20:59:47', 'tarefas', 'edição', 1, 312, 'teste'),
(2066, '2024-07-09', '20:59:54', 'tarefas', 'edição', 1, 313, 'teste2'),
(2067, '2024-07-09', '20:59:55', 'tarefas', 'edição', 1, 312, 'teste'),
(2068, '2024-07-10', '21:10:43', 'usuarios', 'login', 1, 0, 'login'),
(2069, '2024-07-10', '21:28:56', 'usuarios', 'login', 19, 0, 'login'),
(2070, '2024-07-10', '21:59:17', 'funcionarios', 'inserção', 1, 39, 'Algusto'),
(2071, '2024-07-10', '22:00:31', 'funcionarios', 'inserção', 1, 40, 'Eduardo');

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
  `tipo_tarefa` varchar(25) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `vencimento_tarefa` varchar(20) DEFAULT NULL,
  `frequencia` varchar(15) DEFAULT NULL,
  `titulo` varchar(40) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `obs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tarefas`
--

INSERT INTO `tarefas` (`id`, `tipo_tarefa`, `data_inicio`, `vencimento_tarefa`, `frequencia`, `titulo`, `descricao`, `hora`, `data`, `usuario`, `usuario_lanc`, `status`, `obs`) VALUES
(312, 'Única', NULL, NULL, 'Não repete', 'teste', 'tarefa teste', 'Sem hora', '2024-06-18', 19, 1, 'Agendada', ''),
(313, 'Periódica', '2024-06-18', NULL, '3', 'teste2', 'tarefa teste', 'Sem hora', NULL, 19, 1, 'Agendada', '');

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
  `telefone` varchar(20) DEFAULT NULL,
  `senha_crip` varchar(255) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `nivel` varchar(25) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `email`, `telefone`, `senha_crip`, `senha`, `nivel`, `foto`, `id_usu`) VALUES
(1, 'Ulisses Albardeiro', '000.000.000-00', 'ualbardeiro@gmail.com', '19999999999', '202cb962ac59075b964b07152d234b70', '123', 'Administrador', '11-10-2021-15-36-45-2.jpg', 0),
(18, 'Vinicius Albardeiro', '356.885.558-96', 'ender00247@gmail.com', '(19) 97155-3718', '202cb962ac59075b964b07152d234b70', '123', 'Secretário', 'sem-perfil.jpg', 33),
(19, 'Renato Elci', '377.816.498-47', 'renato@gmail.com', '(22) 22222-2223', '202cb962ac59075b964b07152d234b70', '123', 'Gerente', 'sem-perfil.jpg', 34),
(20, 'Carlos Antonio', '377.816.498-67', 'carlos@gmail.com', '(22) 22222-2212', '202cb962ac59075b964b07152d234b70', '123', 'Secretário', 'sem-perfil.jpg', 38),
(21, 'Algusto', '377.816.498-71', 'algusto@gmail.com', '(22) 22222-2258', '202cb962ac59075b964b07152d234b70', '123', 'Auxiliar administrativo', 'sem-perfil.jpg', 39),
(22, 'Eduardo', '377.816.858-47', 'eduardo@gmail.com', '(19) 35614-5847', '202cb962ac59075b964b07152d234b70', '123', 'Secretário', 'sem-perfil.jpg', 40);

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
-- Índices de tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

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
-- Índices de tabela `funcionarios_permissoes`
--
ALTER TABLE `funcionarios_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
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
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `funcionarios_permissoes`
--
ALTER TABLE `funcionarios_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2072;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT de tabela `tipos_empresas`
--
ALTER TABLE `tipos_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
