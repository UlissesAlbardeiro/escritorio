<?php 
$tabela = 'arquivos';
include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$_GET['id'];
$id_user = @$_GET['user'];
$nome = @$_GET['nome'];


$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
$foto = $res[0]['arquivo'];
if($foto != "sem-foto.png"){
	@unlink('../../painel/images/arquivos/'.$foto);
}


$pdo->query("DELETE from $tabela where id = '$id'");

//inserir log
$id_usuario = $id_user;
$acao = 'exclusão';
$descricao = $nome .' (App)';
$id_reg = $id;
require_once("../../painel/inserir-logs.php");

?>