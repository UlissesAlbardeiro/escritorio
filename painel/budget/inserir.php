<?php
$tabela = 'arquivos';
require_once("../../conexao.php");
@session_start();
$id_usuario = @$_SESSION['id_usuario'];


$nome = $_POST['nome'];
$departamento = $_POST['departamento'];
$cliente = $_POST['cliente'];
$id = $_POST['id'];


$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if ($total_reg > 0) {
	$foto = $res[0]['arquivo'];
} else {
	$foto = 'sem-foto.png';
}

//SCRIPT PARA SUBIR FOTO NO SERVIDOR
$nome_img = date('d-m-Y H:i:s') . '-' . @$_FILES['arquivo']['name'];
$nome_img = preg_replace('/[ :]+/', '-', $nome_img);
$caminho = '../images/arquivos/' . $nome_img;

$imagem_temp = @$_FILES['arquivo']['tmp_name'];

if (@$_FILES['arquivo']['name'] != "") {
	$ext = pathinfo($nome_img, PATHINFO_EXTENSION);
	if ($ext == 'png' or $ext == 'jpg' or $ext == 'jpeg' or $ext == 'gif' or $ext == 'pdf' or $ext == 'rar' or $ext == 'zip' or $ext == 'doc' or $ext == 'docx' or $ext == 'txt' or $ext == 'xlsx' or $ext == 'xlsm' or $ext == 'xls' or $ext == 'xml') {

		if (@$_FILES['arquivo']['name'] != "") {

			//EXCLUO A FOTO ANTERIOR
			if ($foto != "sem-foto.png") {
				@unlink('images/arquivos/' . $foto);
			}

			$foto = $nome_img;
		}

		move_uploaded_file($imagem_temp, $caminho);
	} else {
		echo 'Extensão de Imagem não permitida!';
		exit();
	}
}



if ($id == "") {
	$query = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, departamento = ':departamento', cliente = ':cliente', usuario_editou = :usu, arquivo = ':foto'");
	$acao = 'inserção';
} else {
	$query = $pdo->prepare("INSERT INTO $tabela SET nome = :nome, departamento = ':departamento', cliente = ':cliente', usuario_editou = :usu, arquivo = ':foto' where id = '$id'");
	$acao = 'edição';
}

$query->bindValue(":nome", "$nome");
$query->bindValue(":departamento", "$departamento");
$query->bindValue(":cliente", "$cliente");
$query->bindValue(":usu", "$id_usuario");
$query->bindValue(":foto", "$foto");
$query->execute();
$ult_id = $pdo->lastInsertId();



if (@$ult_id == "" || @$ult_id == 0) {
	$ult_id = $id;
}

//inserir log
$acao = $acao;
$descricao = $descricao;
$id_reg = $ult_id;
require_once("../inserir-logs.php");

echo 'Salvo com Sucesso';
