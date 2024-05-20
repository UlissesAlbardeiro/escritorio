<?php 
$tabela = 'clientes';
include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$_GET['id'];
$id_user = @$_GET['user'];
$nome = @$_GET['nome'];

$pdo->query("DELETE from $tabela where id = '$id'");

//inserir log
$id_usuario = $id_user;
$acao = 'exclusão';
$descricao = $nome .' (App)';
$id_reg = $id;
require_once("../../painel/inserir-logs.php");

?>