<?php 
$tabela = 'receber';
include_once('../conexao.php');

$id = @$_GET['id'];
$id_usuario = @$_GET['user'];
$nome = @$_GET['nome'];

$data_atual = date('Y-m-d');
	$dia = date('d');
	$mes = date('m');
	$ano = date('Y');


$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

$descricao = $res[0]['descricao'];
$pessoa = $res[0]['pessoa'];
$valor_antigo = $res[0]['valor'];
$data_lanc = $res[0]['data_lanc'];
$data_venc = $res[0]['data_venc'];
$data_pgto = $res[0]['data_pgto'];
$usuario_lanc = $res[0]['usuario_lanc'];
$usuario_pgto = $res[0]['usuario_pgto'];
$frequencia = $res[0]['frequencia'];
$saida_antiga = $res[0]['saida'];
$arquivo = $res[0]['arquivo'];
$pago = $res[0]['pago'];



$pdo->query("UPDATE $tabela set saida = '$saida_antiga', usuario_pgto = '$id_usuario', pago = 'Sim', valor = '$valor_antigo', data_pgto = 'curDate()' where id = '$id'");

	//CRIAR A PRÓXIMA CONTA A PAGAR
	$dias_frequencia = $frequencia;

	if($dias_frequencia == 30 || $dias_frequencia == 31){		
		$nova_data_vencimento = date('Y/m/d', strtotime("+1 month",strtotime($data_venc)));

	}else if($dias_frequencia == 90){
		$nova_data_vencimento = date('Y/m/d', strtotime("+3 month",strtotime($data_venc)));

	}else if($dias_frequencia == 180){ 
		$nova_data_vencimento = date('Y/m/d', strtotime("+6 month",strtotime($data_venc)));

	}else if($dias_frequencia == 360){
		$nova_data_vencimento = date('Y/m/d', strtotime("+1 year",strtotime($data_venc)));

	}else{		
		$nova_data_vencimento = date('Y/m/d', strtotime("+$dias_frequencia days",strtotime($data_venc))); 
	}


	if(@$dias_frequencia > 0){
		$pdo->query("INSERT INTO $tabela set descricao = '$descricao', pessoa = '$pessoa', valor = '$valor_antigo', data_lanc = curDate(), data_venc = '$nova_data_vencimento', frequencia = '$frequencia', saida = '$saida_antiga', arquivo = '$arquivo', pago = 'Não'");
				$id_ult_registro = $pdo->lastInsertId();				
	}

//LANÇAR NAS MOVIMENTAÇÕES
	$pdo->query("INSERT INTO movimentacoes set tipo = 'Entrada', movimento = 'Conta à Receber', descricao = '$descricao', valor = '$valor_antigo', usuario = '$id_usuario', data = curDate(), lancamento = '$saida_antiga', id_mov = '$id'");


//NOTIFICAR NO APP
$query_not = $pdo->query("SELECT * FROM token where nivel = 'Administrador' or nivel = 'Gerente' or nivel = 'Tesoureiro'");	
$res_not = $query_not->fetchAll(PDO::FETCH_ASSOC);
for ($i_not=  0; $i_not < count($res_not); $i_not++) { 
	foreach ($res_not[$i_not] as $key => $value) {
}
$token = $res_not[$i_not]['token'];
$titulo_not = 'Baixa Conta à Receber ';
$conteudo_not = $descricao;
require("../../painel/notificacoes.php");

}	

//inserir log
$id_usuario = $id_usuario;
$acao = 'edição';
$descricao = $nome .' (App)';
$id_reg = $id;
require_once("../../painel/inserir-logs.php");

?>