<?php 

require_once("../conexao.php");
$tabela = 'arquivos';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_user = @$postjson['user'];
$nome = @$postjson['nomeArquivo'];
$foto = @$postjson['nomeImagem'];



	$res = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, setor = '1', categoria = '1',  funcionario = '$id', data_cad = curDate(), usuario_cad = '$id_user', arquivo = '$foto', tipo = 'Funcionário', id_reg = '$id'");
	$acao = 'inserção';

$res->bindValue(":nome", "$nome");
$res->execute();
$ult_id = $pdo->lastInsertId();


//inserir log
$id_usuario = $id_user;
$acao = $acao;
$descricao = $nome .' (App)';
$id_reg = $ult_id;
require_once("../../painel/inserir-logs.php");

$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));

echo $result;

?>