<?php 

require_once("../conexao.php");
$tabela = 'arquivos';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_user = @$postjson['user'];
$nome = @$postjson['nomeArquivo'];
$foto = @$postjson['nomeImagem'];

$query = $pdo->query("SELECT * FROM receber where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
if(@count($res) > 0){
	$fornecedor = $res[0]['pessoa'];
}else{
	$fornecedor = "";
}

	$res = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, setor = '1', categoria = '1',  cliente = '$fornecedor', data_cad = curDate(), usuario_cad = '$id_user', arquivo = '$foto', tipo = 'Conta à Receber', id_reg = '$id'");
	$acao = 'inserção';

$res->bindValue(":nome", "$nome");
$res->execute();
$ult_id = $pdo->lastInsertId();


//inserir log
$id_usuario = $id_user;
$acao = $acao;
$descricao = $nome .' (App)';
$id_reg = $ult_id;
require_once("../../painel/inserir-logs.php");

$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));

echo $result;

?>