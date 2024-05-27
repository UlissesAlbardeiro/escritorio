<?php 
$tabela = 'tipos_empresas';
require_once("../../conexao.php");

$id = $_POST['id'];
$nome = $_POST['tipo_empresa'];

$query = $pdo->query("SELECT * FROM clientes where tipo_empresa = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) > 0){
	echo 'Este tipo não pode ser excluído, primeiro exclua ou mude as empresas e clientes relacionados com esse tipo de empresa!';
	exit();
}

$pdo->query("DELETE FROM $tabela where id = '$id'");

echo 'Excluído com Sucesso';

//inserir log
$acao = 'exclusão';
$descricao = $nome;
$id_reg = $id;
require_once("../inserir-logs.php");

?>