<?php 

require_once("../conexao.php");
$tabela = 'tarefas';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_user = @$postjson['user'];
$id_usu = @$postjson['idUsu'];
$titulo = @$postjson['titulo'];
$descricao = @$postjson['descricao'];
$hora = @$postjson['hora'];
$data = @$postjson['dataTar'];
$obs = @$postjson['obs'];

 $dataF = implode('/', array_reverse(explode('-', $data)));
 $horaF = date("H:i", strtotime($hora));

if($id_usu == ""){
	$id_usu = $id_user;
}

//validar cpf
$query = $pdo->query("SELECT * FROM $tabela where data = '$data' and hora = '$hora' and usuario = '$id_user'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	$result = json_encode(array('mensagem'=>'Já possui uma tarefa nesse horário!', 'sucesso'=>false));
	echo $result;	
	exit();
}



if($id == "" || $id == "0"){
	$res = $pdo->prepare("INSERT INTO $tabela SET titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario = '$id_usu', usuario_lanc = '$id_user', status = 'Agendada', obs = :obs");
	$acao = 'inserção';

}else{
	$res = $pdo->prepare("UPDATE $tabela SET titulo = :titulo, descricao = :descricao, hora = '$hora', data = '$data', usuario_lanc = '$id_user', obs = :obs where id = '$id'");
	$acao = 'edição';
}


$res->bindValue(":titulo", "$titulo");
$res->bindValue(":descricao", "$descricao");
$res->bindValue(":obs", "$obs");
$res->execute();
$ult_id = $pdo->lastInsertId();


if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}


//NOTIFICAR NO APP
$query_not = $pdo->query("SELECT * FROM token where usuario = '$id_usu'");	
$res_not = $query_not->fetchAll(PDO::FETCH_ASSOC);
for ($i_not=  0; $i_not < count($res_not); $i_not++) { 
	foreach ($res_not[$i_not] as $key => $value) {
}
$token = $res_not[$i_not]['token'];
$titulo_not = 'Tarefa Agendada';
$conteudo_not = $horaF . ' Data '. $dataF;
require("../../painel/notificacoes.php");

}	

//inserir log
$id_usuario = $id_user;
$acao = $acao;
$descricao = $nome .' (App)';
$id_reg = $ult_id;
require_once("../../painel/inserir-logs.php");

$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));

echo $result;

?>