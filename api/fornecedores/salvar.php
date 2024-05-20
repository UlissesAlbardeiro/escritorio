<?php 

require_once("../conexao.php");
$tabela = 'fornecedores';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_user = @$postjson['user'];
$nome = @$postjson['nome'];
$telefone = @$postjson['celular'];
$email = @$postjson['email'];
$endereco = @$postjson['endereco'];
$ativo = @$postjson['ativo'];
$doc = @$postjson['cpf'];
$pessoa = @$postjson['pessoa'];
$data_nasc = @$postjson['data_nasc'];
$obs = @$postjson['obs'];


if($pessoa == 'Jurídica'){
	$data_nasc = '0000-00-00';
}


//validar cpf
$query = $pdo->query("SELECT * FROM $tabela where doc = '$doc'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	$result = json_encode(array('mensagem'=>'Documento já Cadastrado, escolha Outro!', 'sucesso'=>false));
	echo $result;	
	exit();
}


$query = $pdo->query("SELECT * FROM $tabela where email = '$email'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	$result = json_encode(array('mensagem'=>'Email já Cadastrado, escolha Outro!', 'sucesso'=>false));
	echo $result;	
	exit();
}


if($id == "" || $id == "0"){
	$res = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, pessoa = '$pessoa', doc = :doc, telefone = :telefone, email = :email, endereco = :endereco, data_cad = curDate(), data_nasc = '$data_nasc', obs = :obs, ativo = 'Sim'");
	$acao = 'inserção';

}else{
	$res = $pdo->prepare("UPDATE $tabela SET nome = :nome, pessoa = '$pessoa', doc = :doc, telefone = :telefone, email = :email, endereco = :endereco, data_nasc = '$data_nasc', obs = :obs, ativo = '$ativo' where id = '$id'");
	$acao = 'edição';
}


$res->bindValue(":nome", "$nome");
$res->bindValue(":doc", "$doc");
$res->bindValue(":telefone", "$telefone");
$res->bindValue(":email", "$email");
$res->bindValue(":endereco", "$endereco");
$res->bindValue(":obs", "$obs");
$res->execute();
$ult_id = $pdo->lastInsertId();


if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
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