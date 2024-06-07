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


if($tipo_tarefa == 'Única'){
	$data_início_tarefa = $data;
	$frequencia_tarefa = 'Não repete';
}

if($hora == null){
	$hora = 'Sem hora';
}

$data_formatada = date('d-m-Y', strtotime($data));


if($id == ""){
	$query = $pdo->prepare("INSERT INTO $tabela SET tipo_tarefa = '$tipo_tarefa', data_inicio = '$data_inicio_tarefa', frequencia = '$frequencia_tarefa', titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$usuario_logado', status = 'Agendada', obs = :obs");
	$acao = 'inserção';	

}else{
	$query = $pdo->prepare("UPDATE $tabela SET tipo_tarefa = '$tipo_tarefa', data_inicio = '$data_início_tarefa', frequencia = '$frequencia_tarefa', titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$usuario_logado', obs = :obs where id = '$id'");
	$acao = 'edição';
}


$query->bindValue(":titulo", "$titulo");
	$query->bindValue(":descricao", "$descricao");
	$query->bindValue(":obs", "$obs");
	$query->execute();
	$ult_id = $pdo->lastInsertId();

	

if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}	
 
//inserir log
$acao = $acao;
$descricao = $titulo;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo "Salvo com Sucesso"; 


/* <?php 
$tabela = 'tarefas';
require_once("../../conexao.php");

@session_start();
$usuario_logado = @$_SESSION['id_usuario'];

$titulo = $_POST['titulo'];
$data = $_POST['data'];
$hora = $_POST['hora'];
$descricao = $_POST['descricao'];
$obs = $_POST['area'];
$id_usuario = $_POST['usuario'];
$id = $_POST['id'];

$dataF = implode('/', array_reverse(explode('-', $data)));
 $horaF = date("H:i", strtotime($hora));

//validar cpf
$query = $pdo->query("SELECT * FROM $tabela where data = '$data' and hora = '$hora' and usuario = '$id_usuario'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	echo 'Este horário não está disponível!';
	exit();
}


if($id == ""){
	$query = $pdo->prepare("INSERT INTO $tabela SET titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$usuario_logado', status = 'Agendada', obs = :obs");
	$acao = 'inserção';
	

}else{
	$query = $pdo->prepare("UPDATE $tabela SET titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usuario', usuario_lanc = '$usuario_logado', obs = :obs where id = '$id'");
	$acao = 'edição';

	
}

$query->bindValue(":titulo", "$titulo");
	$query->bindValue(":descricao", "$descricao");
	$query->bindValue(":obs", "$obs");
	$query->execute();
	$ult_id = $pdo->lastInsertId();


if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}


//NOTIFICAR NO APP
$query_not = $pdo->query("SELECT * FROM token where usuario = '$id_usuario'");	
$res_not = $query_not->fetchAll(PDO::FETCH_ASSOC);
for ($i_not=  0; $i_not < count($res_not); $i_not++) { 
	foreach ($res_not[$i_not] as $key => $value) {
}
$token = $res_not[$i_not]['token'];
$titulo_not = 'Tarefa Agendada';
$conteudo_not = $horaF . ' Data '. $dataF;
require("../notificacoes.php");

}

//inserir log
$acao = $acao;
$descricao = $titulo;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso'; 

?> */