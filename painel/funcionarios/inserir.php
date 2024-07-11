<?php 
$tabela = 'funcionarios';
require_once("../../conexao.php");

$nome = $_POST['nome'];
$telefone = $_POST['telefone'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$cargo = $_POST['cargo'];
$data_nasc = $_POST['data_nasc'];
$endereco = $_POST['endereco'];
$obs = $_POST['obs'];
$salario = $_POST['salario'];
$salario = str_replace(',', '.', $salario);
$valor_hora = $_POST['valor_hora'];
$valor_hora = str_replace(',', '.', $valor_hora);
$hora_entrada = $_POST['hora_entrada'];
$hora_saida = $_POST['hora_saida'];
$jornada_horas = $_POST['jornada_horas'];
$id = $_POST['id'];

if($salario == "" and $valor_hora == ""){
	$salario = null;
	$valor_hora = null;
}

if($hora_entrada == "" and $hora_saida == "" and $jornada_horas == ""){
	$hora_entrada = null;
	$hora_saida = null;
	$jornada_horas = null;
}

//VALIDAR CPF
$query = $pdo->query("SELECT * FROM $tabela where cpf = '$cpf'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	echo 'CPF já Cadastrado, escolha Outro!';
	exit();
}

/* VALIDAR EMAIL */

$query = $pdo->query("SELECT * FROM $tabela where email = '$email'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id){
	echo 'Email já Cadastrado, escolha Outro!';
	exit();
}


$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
	$foto = $res[0]['foto'];
}else{
	$foto = 'sem-perfil.jpg';
}

//SCRIPT PARA SUBIR FOTO NO SERVIDOR
$nome_img = date('d-m-Y H:i:s') .'-'.@$_FILES['foto']['name'];
$nome_img = preg_replace('/[ :]+/' , '-' , $nome_img);
$caminho = '../images/perfil/' .$nome_img;

$imagem_temp = @$_FILES['foto']['tmp_name']; 

if(@$_FILES['foto']['name'] != ""){
	$ext = pathinfo($nome_img, PATHINFO_EXTENSION);   
	if($ext == 'png' or $ext == 'jpg' or $ext == 'jpeg' or $ext == 'gif'){ 

		if (@$_FILES['foto']['name'] != ""){

			//EXCLUO A FOTO ANTERIOR
			if($foto != "sem-perfil.jpg"){
				@unlink('images/perfil/'.$foto);
			}

			$foto = $nome_img;
		}

		move_uploaded_file($imagem_temp, $caminho);
	}else{
		echo 'Extensão de Imagem não permitida!';
		exit();
	}
}


//recuperar o nome do cargo
	$query2 = $pdo->query("SELECT * FROM cargos where id = '$cargo'");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
	if(@count($res2) > 0){
		$nome_cargo = $res2[0]['nome'];
	}

	$nivel_usu = $nome_cargo;


if ($id == "") {
    $query = $pdo->prepare("INSERT INTO $tabela (nome, cpf, telefone, email, endereco, cargo, data_cad, data_nasc, obs, foto, salario, valor_hora, hora_entrada, hora_saida, jornada_horas) 
                          VALUES (:nome, :cpf, :telefone, :email, :endereco, :cargo, curDate(), :data_nasc, :obs, :foto, :salario, :valor_hora, :hora_entrada, :hora_saida, :jornada_horas)");
    $acao = 'inserção';

    $query->bindValue(":nome", $nome);
    $query->bindValue(":cpf", $cpf);
    $query->bindValue(":telefone", $telefone);
    $query->bindValue(":email", $email);
    $query->bindValue(":endereco", $endereco);
    $query->bindValue(":cargo", $cargo); 
    $query->bindValue(":data_nasc", $data_nasc); 
    $query->bindValue(":obs", $obs);
    $query->bindValue(":foto", $foto);
    $query->bindValue(":salario", $salario);
    $query->bindValue(":valor_hora", $valor_hora);
    $query->bindValue(":hora_entrada", $hora_entrada); 
    $query->bindValue(":hora_saida", $hora_saida); 
    $query->bindValue(":jornada_horas", $jornada_horas); 
    $query->execute();
    $ult_id = $pdo->lastInsertId();

    // Inserir o funcionário na tabela de usuários
    if ($nivel_usu != "") {
        $query_usu = $pdo->prepare("INSERT INTO usuarios (nome, cpf, telefone, email, senha_crip, senha, nivel, foto, id_usu) 
                                  VALUES (:nome, :cpf, :telefone, :email, :senha_crip, :senha, :nivel, :foto, :id_usu)");

        $senha_crip = md5('123');
        $query_usu->bindValue(":nome", $nome);
        $query_usu->bindValue(":email", $email);
        $query_usu->bindValue(":cpf", $cpf);
        $query_usu->bindValue(":telefone", $telefone);
        $query_usu->bindValue(":senha_crip", $senha_crip);
        $query_usu->bindValue(":senha", "123");
        $query_usu->bindValue(":nivel", $nivel_usu); 
        $query_usu->bindValue(":foto", $foto); 
        $query_usu->bindValue(":id_usu", $ult_id);
        $query_usu->execute();
    }

} else {
    // Atualização
    $query = $pdo->prepare("UPDATE $tabela 
                          SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, endereco = :endereco, cargo = :cargo, data_cad = curDate(), 
                              data_nasc = :data_nasc, obs = :obs, foto = :foto, salario = :salario, valor_hora = :valor_hora, 
                              hora_entrada = :hora_entrada, hora_saida = :hora_saida, jornada_horas = :jornada_horas 
                          WHERE id = :id");
    $acao = 'edição';

    $query->bindValue(":nome", $nome);
    $query->bindValue(":cpf", $cpf);
    $query->bindValue(":telefone", $telefone);
    $query->bindValue(":email", $email);
    $query->bindValue(":endereco", $endereco);
    $query->bindValue(":cargo", $cargo); 
    $query->bindValue(":data_nasc", $data_nasc); 
    $query->bindValue(":obs", $obs);
    $query->bindValue(":foto", $foto); 
    $query->bindValue(":salario", $salario);
    $query->bindValue(":valor_hora", $valor_hora);
    $query->bindValue(":hora_entrada", $hora_entrada); 
    $query->bindValue(":hora_saida", $hora_saida); 
    $query->bindValue(":jornada_horas", $jornada_horas); 
    $query->bindValue(":id", $id);
    $query->execute();

    // Atualizar na tabela de usuários
    if ($nivel_usu != "") {
        $query_usu = $pdo->prepare("UPDATE usuarios 
                                  SET nome = :nome, cpf = :cpf, telefone = :telefone, email = :email, nivel = :nivel, foto = :foto 
                                  WHERE id_usu = :id_usu");

        if ($query_usu) {
            $senha_crip = md5('123');
            $query_usu->bindValue(":nome", $nome);
            $query_usu->bindValue(":email", $email);
            $query_usu->bindValue(":cpf", $cpf);
            $query_usu->bindValue(":telefone", $telefone);
            $query_usu->bindValue(":nivel", $nivel_usu); 
            $query_usu->bindValue(":foto", $foto); 
            $query_usu->bindValue(":id_usu", $id);
            $query_usu->execute();
        }
    }

}

if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}

//inserir log
$acao = $acao;
$descricao = $nome;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso'; 

?>