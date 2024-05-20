<?php 

require_once("../conexao.php");
$tabela = 'pagar';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_usuario = @$postjson['user'];
$valor = @$postjson['valor'];
$valor = str_replace(',', '.', $valor);
$descricao = @$postjson['descricao'];
$data_venc = @$postjson['data_venc'];
$frequencia = @$postjson['frequencia'];
$saida = @$postjson['saida'];
$pessoa = @$postjson['fornecedor'];
$foto = @$postjson['foto'];

if($descricao == "" and $pessoa == ""){
	echo 'Escolha um Fornecedor ou insira uma descrição!';
	exit();
}

if($descricao == "" and $pessoa != ""){
	$query = $pdo->query("SELECT * FROM fornecedores where id = '$pessoa'");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$nome_pessoa = $res[0]['nome'];
	$descricao = $nome_pessoa;
}

if($id != "" and $foto == ""){
	$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){
		$foto = $res[0]['arquivo'];
	}else{
		$foto = 'sem-foto.png';
	}

}



if($id == "" || $id == "0"){
	$res = $pdo->prepare("INSERT INTO $tabela SET descricao = :descricao, pessoa = '$pessoa', valor = :valor, data_venc = '$data_venc', frequencia = '$frequencia', saida = '$saida', data_lanc = curDate(), usuario_lanc = '$id_usuario', arquivo = '$foto', pago = 'Não'");
	$acao = 'inserção';

}else{
	$res = $pdo->prepare("UPDATE $tabela SET descricao = :descricao, pessoa = '$pessoa', valor = :valor, data_venc = '$data_venc', frequencia = '$frequencia', saida = '$saida', data_lanc = curDate(), usuario_lanc = '$id_usuario', arquivo = '$foto' where id = '$id'");
	$acao = 'edição';
}


$res->bindValue(":descricao", "$descricao");
$res->bindValue(":valor", "$valor");
$res->execute();
$ult_id = $pdo->lastInsertId();


if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}

//inserir log
$id_usuario = $id_usuario;
$acao = $acao;
$descricao = $descricao .' (App)';
$id_reg = $ult_id;
require_once("../../painel/inserir-logs.php");

$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));

echo $result;

?>