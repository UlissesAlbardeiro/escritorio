<?php 
require_once("conexao.php");
$postjson = json_decode(file_get_contents('php://input'), true);

$token = @$postjson['token'];
$nivel = @$postjson['nivel'];
$usuario = @$postjson['id'];

//VALIDAR CAMPO
$query = $pdo->query("SELECT * from token where token = '$token'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 ){
	$id = $res[0]['id'];		
	if($nivel == $res[0]['nivel'] and $usuario == $res[0]['usuario']){
		exit();
	}else{
		$res = $pdo->prepare("UPDATE token SET nivel = :nivel, usuario = '$usuario' WHERE id = '$id'");
		$res->bindValue(":nivel", $nivel);		
		@$res->execute();
	}
	
}else{
	$res = $pdo->prepare("INSERT INTO token SET token = :token, nivel = :nivel, usuario = :usuario");
	$res->bindValue(":token", $token);
	$res->bindValue(":nivel", $nivel);
	$res->bindValue(":usuario", $usuario);
	@$res->execute();
}


$result = json_encode(array('mensagem'=>'Salvo com sucesso!', 'sucesso'=>true));
echo $result;
?>