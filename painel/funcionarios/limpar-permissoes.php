<?php 
require_once("../../conexao.php");

$id_usuario = $_POST['id'];

$pdo->query("DELETE FROM funcionarios_permissoes where usuario = '$id_usuario'");

?>