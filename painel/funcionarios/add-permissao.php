<?php 
require_once("../../conexao.php");

$id_usuario = $_POST['idusuario'];
$id_permissao = $_POST['idpermissao'];

$query = $pdo->query("SELECT * FROM funcionarios_permissoes where permissao = '$id_permissao' and usuario = '$id_usuario'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
	$pdo->query("DELETE FROM funcionarios_permissoes where permissao = '$id_permissao' and usuario = '$id_usuario'");
}else{
	$pdo->query("INSERT INTO funcionarios_permissoes SET permissao = '$id_permissao', usuario = '$id_usuario'");
}

?>