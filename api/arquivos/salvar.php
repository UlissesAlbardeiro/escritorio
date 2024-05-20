<?php 

require_once("../conexao.php");
$tabela = 'arquivos';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_usuario = @$postjson['user'];
$nome = @$postjson['nome'];
$numero = @$postjson['numero'];
$descricao = @$postjson['descricao'];
$vencimento = @$postjson['data_venc'];
$setor = @$postjson['setor'];
$categoria = @$postjson['categoria'];
$grupo = @$postjson['grupo'];
$foto = @$postjson['foto'];
$cliente = @$postjson['cliente'];
$funcionario = @$postjson['funcionario'];
$fornecedor = @$postjson['fornecedor'];
$venc = @$postjson['venc'];

if($venc == 'Não'){
	$vencimento = '0000-00-00';
}

if($numero != ""){
//validar nome
$query = $pdo->query("SELECT * FROM $tabela where numero = '$numero'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	echo 'Número de arquivo já Cadastrado, escolha Outro!';
	exit();
}
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
	$res = $pdo->prepare("INSERT INTO $tabela SET numero = :numero, nome = :nome, descricao = :descricao, setor = '$setor', categoria = '$categoria', grupo = '$grupo', fornecedor = '$fornecedor', cliente = '$cliente', funcionario = '$funcionario', data_cad = curDate(), vencimento = '$vencimento', usuario_cad = '$id_usuario', arquivo = '$foto'");
	$acao = 'inserção';

}else{
	$res = $pdo->prepare("UPDATE $tabela SET numero = :numero, nome = :nome, descricao = :descricao, setor = '$setor', categoria = '$categoria', grupo = '$grupo', fornecedor = '$fornecedor', cliente = '$cliente', funcionario = '$funcionario', data_cad = curDate(), vencimento = '$vencimento', usuario_editou = '$id_usuario', arquivo = '$foto' where id = '$id'");
	$acao = 'edição';
}


$res->bindValue(":descricao", "$descricao");
$res->bindValue(":numero", "$numero");
$res->bindValue(":nome", "$nome");
$res->execute();
$ult_id = $pdo->lastInsertId();


if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}

//inserir log
$id_usuario = $id_usuario;
$acao = $acao;
$descricao = $nome .' (App)';
$id_reg = $ult_id;
require_once("../../painel/inserir-logs.php");

$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));

echo $result;

?>