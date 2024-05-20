<?php 
if(@$id_usuario == ""){
	@session_start();
	$id_usuario = $_SESSION['id_usuario'];
}

if(@$logs == ""){
	$query = $pdo->query("SELECT * FROM config");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$logs = $res[0]['logs'];
}


if(@$id_reg == ""){
	$id_reg = 0;
}

if($id_usuario != ""){
	if($logs == 'Sim'){
		$query = $pdo->query("INSERT INTO logs SET data = curDate(), hora = curTime(), tabela = '$tabela', acao = '$acao', usuario = '$id_usuario', id_reg = '$id_reg', descricao = '$descricao'");
	}
}

?>