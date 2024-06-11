<?php
require_once("../../conexao.php");
$tabela = 'tarefas';

@session_start();
$usuario_logado = $_SESSION['id_usuario'];

$titulo = $_POST['titulo'];
$tipo_tarefa = $_POST['tipo_tarefa'];
$data_inicio_tarefa = $_POST['data_inicio_tarefa'];
$frequencia_tarefa = $_POST['frequencia_tarefa'];
$data = $_POST['data'];
$hora = $_POST['hora'];
$descricao = $_POST['descricao'];
$obs = $_POST['area'];
$id_usuario = $_POST['usuario'];
$id = $_POST['id'];

if ($tipo_tarefa == 'Única') {
	$data_inicio_tarefa = null;
	$frequencia_tarefa = 'Não repete';
}

if ($tipo_tarefa == 'Periódica') {
	$data = '2050-01-01';
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
	$query->bindValue(":usuario_lanc", $usuario_logado);
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

//NOTIFICAR NO APP
/* 	 $query_not = $pdo->query("SELECT * FROM token where usuario = '$id_usuario'");	
		$res_not = $query_not->fetchAll(PDO::FETCH_ASSOC);
		for ($i_not=  0; $i_not < count($res_not); $i_not++) { 
			foreach ($res_not[$i_not] as $key => $value) {
		}
		$token = $res_not[$i_not]['token'];
		$titulo_not = 'Tarefa Agendada';
		$conteudo_not = $hora_formatada . ' Data '. $data_formatada;
		require("../notificacoes.php");
		} */

//inserir log
$acao = $acao;
$descricao = $titulo;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo "Salvo com Sucesso";
