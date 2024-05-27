<?php 
$tabela = 'tipos_empresas';
require_once("../../conexao.php");

$tipo = $_POST['tipo_empresa'];
$id = $_POST['id'];

//VERIFICAÇÃO SE EXISTE O TIPO DE EMPRESA NO BD
$query = $pdo->query("SELECT * FROM $tabela where tipo = '$tipo'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

/* echo $res;
exit(); */

if($total_reg > 0 and $res[0]['id'] != $id){
	echo 'Tipo de Empresa já Cadastrada, escolha Outra!';
	exit();
}

//INSERÇÃO DO TIPO DE EMPRESA NO BD
if($id == ""){
	$query = $pdo->prepare("INSERT INTO $tabela SET tipo = :tipo");
	$acao = 'inserção';

//ATUALIZAÇÃO DE UMA EMPRESA NO BD
}else{
	$query = $pdo->prepare("UPDATE $tabela SET tipo = :tipo WHERE id = '$id'");
	$acao = 'edição';
}

$query->bindValue(":tipo", "$tipo");
$query->execute();
$ult_id = $pdo->lastInsertId();

if($ult_id == "" || $ult_id == 0){
	$ult_id = $id;
}

//INSERIR LOG
$acao = $acao;
$descricao = $nome;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso'; 

?>