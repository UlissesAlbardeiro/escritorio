<?php
require_once("../../conexao.php");
$tabela = 'tarefas';

@session_start();
$id_usuario = @$_SESSION['id_usuario'];
$titulo = $_POST['titulo'];
$data = $_POST['data'];
$hora = $_POST['hora'];
$descricao = $_POST['descricao'];
$obs = $_POST['area'];
$id = $_POST['id'];
$tipo_tarefa = $_POST['tipo_tarefa'];
$data_inicio_tarefa = $_POST['data_inicio_tarefa'];
$frequencia_tarefa = $_POST['frequencia_tarefa'];





if ($tipo_tarefa == 'Única') {
	$data_início_tarefa = $data;
	$frequencia_tarefa = 'Não repete';
}

if ($hora == null) {
	$hora = '----';
}

$data_formatada = date('d-m-Y', strtotime($data));

if ($id == "") {
	$query = $pdo->prepare("INSERT INTO $tabela SET tipo_tarefa = '$tipo_tarefa', data_inicio = '$data_inicio_tarefa', frequencia = '$frequencia_tarefa', titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$id_usuario', status = 'Agendada', obs = :obs");
	$acao = 'inserção';
} else {
	$query = $pdo->prepare("UPDATE $tabela SET tipo_tarefa = '$tipo_tarefa', data_inicio = '$data_inicio_tarefa', frequencia = '$frequencia_tarefa', titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$id_usuario', obs = :obs where id = '$id'");
	$acao = 'edição';
}

$query->bindValue(":titulo", "$titulo");
$query->bindValue(":descricao", "$descricao");
$query->bindValue(":obs", "$obs");
$query->execute();
$ult_id = $pdo->lastInsertId();

if (@$ult_id == "" || @$ult_id == 0) {
	$ult_id = $id;
}

//inserir log
$acao = $acao;
$descricao = $titulo;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso';
