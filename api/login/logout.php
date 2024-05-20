<?php 
include_once('../conexao.php');
$tabela = 'usuarios';
//inserir log
    $id_usuario = @$_GET['user'];
    $acao = 'logout';
    $descricao = 'logout (App)';
    
    require_once("../../painel/inserir-logs.php");

 ?>