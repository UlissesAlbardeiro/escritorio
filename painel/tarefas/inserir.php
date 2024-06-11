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
	$data_inicio_tarefa = null;
	$frequencia_tarefa = 'Não repete';
}

if ($tipo_tarefa == 'Periódica') {
	$data = null;
}

if ($hora == null) {
	$hora = 'Sem hora';
}

$data_formatada = date('d-m-Y', strtotime($data));

try {
	if ($id == "") {
		$query = $pdo->prepare("INSERT INTO $tabela (tipo_tarefa, data_inicio, frequencia, titulo, descricao, hora, data, usuario, usuario_lanc, status, obs) VALUES (:tipo_tarefa, :data_inicio, :frequencia, :titulo, :descricao, :hora, :data, :usuario, :usuario_lanc, 'Agendada', :obs)");
		$acao = 'inserção';
	} else {
		$query = $pdo->prepare("UPDATE $tabela SET tipo_tarefa = :tipo_tarefa, data_inicio = :data_inicio, frequencia = :frequencia, titulo = :titulo, descricao = :descricao, hora = :hora, data = :data, usuario = :usuario, usuario_lanc = :usuario_lanc, obs = :obs WHERE id = :id");
		$acao = 'edição';
	}

	$query->bindValue(":tipo_tarefa", $tipo_tarefa);
	$query->bindValue(":data_inicio", $data_inicio_tarefa);
	$query->bindValue(":frequencia", $frequencia_tarefa);
	$query->bindValue(":titulo", $titulo);
	$query->bindValue(":descricao", $descricao);
	$query->bindValue(":hora", $hora);
	$query->bindValue(":data", $data);
	$query->bindValue(":usuario", $id_usuario);
	$query->bindValue(":usuario_lanc", $id_usuario);
	$query->bindValue(":obs", $obs);
	if ($id != "") {
		$query->bindValue(":id", $id);
	}

	$query->execute();

	if ($id == "") {
		$ult_id = $pdo->lastInsertId();
	}

	
} catch (Exception $e) {
	echo "Erro: " . $e->getMessage();
}


if (@$ult_id == "" || @$ult_id == 0) {
	$ult_id = $id;
}

//inserir log
$acao = $acao;
$descricao = $titulo;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso';
