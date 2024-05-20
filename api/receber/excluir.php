<?php 
$tabela = 'receber';
include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$_GET['id'];
$id_user = @$_GET['user'];
$nome = @$_GET['nome'];

$query = $pdo->query("SELECT * FROM $tabela where id = '$id' and pago = 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
	$result = json_encode(array('mensagem'=>'Você não pode excluir uma conta já Paga!', 'sucesso'=>false));
	echo $result;
	exit();
}

$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
$foto = $res[0]['arquivo'];
if($foto != "sem-foto.png"){
	@unlink('../../painel/images/contas/'.$foto);
}

$pdo->query("DELETE from $tabela where id = '$id'");

//inserir log
$id_usuario = $id_user;
$acao = 'exclusão';
$descricao = $nome .' (App)';
$id_reg = $id;
require_once("../../painel/inserir-logs.php");

?>