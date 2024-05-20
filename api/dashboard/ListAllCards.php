<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id_usu = @$_GET['user'];

$tarefasPendentes = 0;
$tarefasPendentesEscritorio = 0;
$totalTarefasHoje = 0;
$totalTarefasConcluidasHoje = 0;
$porcentagemTarefas = 0;

$saldoDia = 0;
$saldoCaixaDia = 0;
$saldoDiaF = 0;
$saldoCaixaDiaF = 0;
$classe_saldo_dia = '';
$classe_saldo_caixa_dia = '';

$contasReceberVencidas = 0;
$contasPagarVencidas = 0;
$contasReceberHoje = 0;
$contasPagarHoje = 0;

$query = $pdo->query("SELECT * from clientes where ativo = 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_pessoas = @count($res);

$query = $pdo->query("SELECT * from fornecedores where ativo = 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_forn = @count($res);

$query = $pdo->query("SELECT * from funcionarios");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_func = @count($res);

$query = $pdo->query("SELECT * FROM tarefas where status = 'Agendada' and usuario = '$id_usu' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$tarefasPendentes = @count($res);

$query = $pdo->query("SELECT * FROM tarefas where status = 'Agendada' and data = curDate() ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$tarefasPendentesEscritorio = @count($res);


$query = $pdo->query("SELECT * FROM tarefas where data = curDate() and usuario = '$id_usu'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$totalTarefasHoje = @count($res);

$query = $pdo->query("SELECT * FROM tarefas where data = curDate() and usuario = '$id_usu' and status = 'Concluída'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$totalTarefasConcluidasHoje = @count($res);

if($totalTarefasConcluidasHoje > 0 and $totalTarefasHoje > 0){
	$porcentagemTarefas = ($totalTarefasConcluidasHoje / $totalTarefasHoje) * 100;
}





$query = $pdo->query("SELECT * FROM pagar where data_venc < curDate() and pago != 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$contasPagarVencidas = @count($res);

$query = $pdo->query("SELECT * FROM receber where data_venc < curDate() and pago != 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$contasReceberVencidas = @count($res);


$query = $pdo->query("SELECT * FROM pagar where data_venc = curDate() and pago != 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$contasPagarHoje = @count($res);

$query = $pdo->query("SELECT * FROM receber where data_venc = curDate() and pago != 'Sim'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$contasReceberHoje = @count($res);



//TOTALIZAR SALDO DO DIA
$query_t = $pdo->query("SELECT * from movimentacoes where data = curDate()");
$res_t = $query_t->fetchAll(PDO::FETCH_ASSOC);
if(@count($res_t)>0){
	for($it=0; $it < @count($res_t); $it++){
		foreach ($res_t[$it] as $key => $value){}			

		if($res_t[$it]['tipo'] == 'Entrada'){
			$saldoDia += $res_t[$it]['valor'];
		}else{
			$saldoDia -= $res_t[$it]['valor'];
		}

		if($res_t[$it]['lancamento'] == 'Caixa'){
			if($res_t[$it]['tipo'] == 'Entrada'){
				$saldoCaixaDia += $res_t[$it]['valor'];
			}else{
				$saldoCaixaDia -= $res_t[$it]['valor'];
			}
		}
	}	

	if($saldoDia < 0){
		$classe_saldo_dia = 'red';
	}else{
		$classe_saldo_dia = 'green';
	}


	if($saldoCaixaDia < 0){
		$classe_saldo_caixa_dia = 'red';
	}else{
		$classe_saldo_caixa_dia = 'green';
	}

	$saldoDiaF = number_format($saldoDia, 2, ',', '.');
	$saldoCaixaDiaF = number_format($saldoCaixaDia, 2, ',', '.');
}


$result = json_encode(array('success'=>true, 
    'quantidade_clientes'=>$total_pessoas,
    'quantidade_forn'=>$total_forn,
    'tarefasPendentes' => $tarefasPendentes,
    'tarefasPendentesEscritorio' => $tarefasPendentesEscritorio,
    'totalTarefasHoje' => $totalTarefasHoje,
    'totalTarefasConcluidasHoje' => $totalTarefasConcluidasHoje,
    'porcentagemTarefas' => $porcentagemTarefas,
    'saldoDia' => $saldoDiaF,
    'saldoCaixaDia' => $saldoCaixaDiaF,
    'contasReceberHoje' => $contasReceberHoje,
    'contasPagarHoje' => $contasPagarHoje,
    'contasReceberVencidas' => $contasReceberVencidas,
    'contasPagarVencidas' => $contasPagarVencidas,
    'corSaldo' => $classe_saldo_dia,
    'corSaldoCaixa' => $classe_saldo_caixa_dia
    
));

echo $result;
