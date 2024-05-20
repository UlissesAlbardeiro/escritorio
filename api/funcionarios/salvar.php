<?php 

require_once("../conexao.php");
$tabela = 'funcionarios';

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$postjson['id'];
$id_user = @$postjson['user'];
$nome = @$postjson['nome'];
$telefone = @$postjson['celular'];
$email = @$postjson['email'];
$endereco = @$postjson['endereco'];
$cargo = @$postjson['cargo'];
$cpf = @$postjson['cpf'];
$salario = @$postjson['salario'];
$data_nasc = @$postjson['data_nasc'];
$valor_hora = @$postjson['hora'];
$hora_entrada = @$postjson['horaEntrada'];
$hora_saida = @$postjson['horaSaida'];
$jornada_horas = @$postjson['jornada'];
$obs = @$postjson['obs'];
$foto = @$postjson['foto'];

//validar cpf
$query = $pdo->query("SELECT * FROM $tabela where cpf = '$cpf'");
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



//recuperar o nome do cargo
	$query2 = $pdo->query("SELECT * FROM cargos where id = '$cargo'");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
	if(@count($res2) > 0){
		$nome_cargo = $res2[0]['nome'];
	}

if($nome_cargo == 'Gerente'){
	$nivel_usu = 'Gerente';				
}

if($nome_cargo == 'Tesoureiro'){
	$nivel_usu = 'Tesoureiro';		
}

if($nome_cargo == 'Secretário' || $nome_cargo == 'Secretario' || $nome_cargo == 'Secretária' || $nome_cargo == 'Secretaria' || $nome_cargo == 'Secretário(a)'){
	$nivel_usu = 'Secretario';		
}

if($nome_cargo == 'Recepcionista'){
	$nivel_usu = 'Recepcionista';			
}

if($nome_cargo == 'RH'){
	$nivel_usu = 'RH';			
}



if($id == "" || $id == "0"){

	if($foto == ""){
		$foto = 'sem-perfil.jpg';
	}

	$res = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, endereco = :endereco, cargo = '$cargo', data_cad = curDate(), data_nasc = '$data_nasc', obs = :obs, foto = '$foto', salario = :salario, valor_hora = :valor_hora, hora_entrada = '$hora_entrada', hora_saida = '$hora_saida', jornada_horas = '$jornada_horas'");
	$acao = 'inserção';


	$res->bindValue(":nome", "$nome");
$res->bindValue(":cpf", "$cpf");
$res->bindValue(":telefone", "$telefone");
$res->bindValue(":email", "$email");
$res->bindValue(":endereco", "$endereco");
$res->bindValue(":obs", "$obs");
$res->bindValue(":salario", "$salario");
$res->bindValue(":valor_hora", "$valor_hora");
$res->execute();
$ult_id = $pdo->lastInsertId();

	//inserir o funcionário na tabela de usuários	
	if(@$nivel_usu != ""){
		$query_usu = $pdo->prepare("INSERT INTO usuarios SET nome = :nome, cpf = :cpf,  email = :email, senha_crip = :senha_crip, senha = :senha, nivel = '$nivel_usu',  foto = '$foto' , id_usu = '$ult_id'");


		$senha_crip = md5('123');
		$query_usu->bindValue(":nome", "$nome");
		$query_usu->bindValue(":email", "$email");
		$query_usu->bindValue(":cpf", "$cpf");
		$query_usu->bindValue(":senha_crip", "$senha_crip");
		$query_usu->bindValue(":senha", "123");	
		$query_usu->execute();
	}

}else{

	if($foto == ""){
		$res = $pdo->prepare("UPDATE $tabela SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, endereco = :endereco, cargo = '$cargo', data_cad = curDate(), data_nasc = '$data_nasc', obs = :obs, salario = :salario, valor_hora = :valor_hora, hora_entrada = '$hora_entrada', hora_saida = '$hora_saida', jornada_horas = '$jornada_horas' where id = '$id'");

		//atualizar na tabela de usuários
	if(@$nivel_usu != ""){
		$query_usu = $pdo->prepare("UPDATE usuarios SET nome = :nome, cpf = :cpf,  email = :email, nivel = '$nivel_usu' WHERE id_usu = '$id'");

		if($query_usu != ""){
			$senha_crip = md5('123');
			$query_usu->bindValue(":nome", "$nome");
			$query_usu->bindValue(":email", "$email");
			$query_usu->bindValue(":cpf", "$cpf");			
			$query_usu->execute();
		}
	}
	


	}else{
	$res = $pdo->prepare("UPDATE $tabela SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, endereco = :endereco, cargo = '$cargo', data_cad = curDate(), data_nasc = '$data_nasc', obs = :obs, foto = '$foto', salario = :salario, valor_hora = :valor_hora, hora_entrada = '$hora_entrada', hora_saida = '$hora_saida', jornada_horas = '$jornada_horas' where id = '$id'");

	//atualizar na tabela de usuários
	if(@$nivel_usu != ""){
		$query_usu = $pdo->prepare("UPDATE usuarios SET nome = :nome, cpf = :cpf,  email = :email, nivel = '$nivel_usu', foto = '$foto' WHERE id_usu = '$id'");

		if($query_usu != ""){
			$senha_crip = md5('123');
			$query_usu->bindValue(":nome", "$nome");
			$query_usu->bindValue(":email", "$email");
			$query_usu->bindValue(":cpf", "$cpf");			
			$query_usu->execute();
		}
	}
	
}
	$acao = 'edição';
	$res->bindValue(":nome", "$nome");
$res->bindValue(":cpf", "$cpf");
$res->bindValue(":telefone", "$telefone");
$res->bindValue(":email", "$email");
$res->bindValue(":endereco", "$endereco");
$res->bindValue(":obs", "$obs");
$res->bindValue(":salario", "$salario");
$res->bindValue(":valor_hora", "$valor_hora");
$res->execute();
}
	




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