<?php 
$tabela = 'pagar';
require_once("../../conexao.php");
@session_start();
$id_usuario = @$_SESSION['id_usuario'];


$descricao = $_POST['descricao'];
$pessoa = $_POST['pessoa'];
$valor = $_POST['valor'];
$valor = str_replace(',', '.', $valor);
$data_venc = $_POST['data_venc'];
$frequencia = $_POST['frequencia'];
$saida = $_POST['saida'];
$id = $_POST['id'];


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


$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
	$foto = $res[0]['arquivo'];
}else{
	$foto = 'sem-foto.png';
}

//SCRIPT PARA SUBIR FOTO NO SERVIDOR
$nome_img = date('d-m-Y H:i:s') .'-'.@$_FILES['arquivo']['name'];
$nome_img = preg_replace('/[ :]+/' , '-' , $nome_img);
$caminho = '../images/contas/' .$nome_img;

$imagem_temp = @$_FILES['arquivo']['tmp_name']; 

if(@$_FILES['arquivo']['name'] != ""){
	$ext = pathinfo($nome_img, PATHINFO_EXTENSION);   
	if($ext == 'png' or $ext == 'jpg' or $ext == 'jpeg' or $ext == 'gif' or $ext == 'pdf' or $ext == 'rar' or $ext == 'zip' or $ext == 'doc' or $ext == 'docx'){ 

		if (@$_FILES['arquivo']['name'] != ""){

			//EXCLUO A FOTO ANTERIOR
			if($foto != "sem-foto.png"){
				@unlink('images/contas/'.$foto);
			}

			$foto = $nome_img;
		}

		move_uploaded_file($imagem_temp, $caminho);
	}else{
		echo 'Extensão de Imagem não permitida!';
		exit();
	}
}



if($id == ""){
	$query = $pdo->prepare("INSERT INTO $tabela SET descricao = :descricao, pessoa = '$pessoa', valor = :valor, data_venc = '$data_venc', frequencia = '$frequencia', saida = '$saida', data_lanc = curDate(), usuario_lanc = '$id_usuario', arquivo = '$foto', pago = 'Não'");
	$acao = 'inserção';

}else{
	$query = $pdo->prepare("UPDATE $tabela SET descricao = :descricao, pessoa = '$pessoa', valor = :valor, data_venc = '$data_venc', frequencia = '$frequencia', saida = '$saida', data_lanc = curDate(), usuario_lanc = '$id_usuario', arquivo = '$foto' where id = '$id'");
	$acao = 'edição';
	
}

$query->bindValue(":descricao", "$descricao");
$query->bindValue(":valor", "$valor");
$query->execute();
$ult_id = $pdo->lastInsertId();



if(@$ult_id == "" || @$ult_id == 0){
	$ult_id = $id;
}





//inserir log
$acao = $acao;
$descricao = $descricao;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso'; 

?>