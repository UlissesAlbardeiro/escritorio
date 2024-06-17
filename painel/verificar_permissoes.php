<?php 
require_once("../conexao.php");
@session_start();
$id_usuario = $_SESSION['id'];

//SEM GRUPO
$home = 'ocultar';

//GRUPO CADASTROS
$cargos = 'ocultar';
$tipos_empresas = 'ocultar';
$funcionarios = 'ocultar';
$clientes = 'ocultar';

//GRUPO PESSOAS E EMPRESAS
$usuarios = 'ocultar';
$mostar_clientes = 'ocultar';

//TAREFAS
$tarefas_escritorio = 'ocultar';
$minhas_tarefas = 'ocultar';
$agenda_tarefas = 'ocultar';

//GED (ARQUIVOS)
$setor_arquivo = 'ocultar';
$cat_arquivos = 'ocultar';
$grupo_arquivos = 'ocultar';
$arquivos = 'ocultar';

//LOGS
$logs = 'ocultar';

$query = $pdo->query("SELECT * FROM funcionarios_permissoes where usuario = '$id_usuario'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
	for($i=0; $i < $total_reg; $i++){
		foreach ($res[$i] as $key => $value){}
		$permissao = $res[$i]['permissao'];
		
		$query2 = $pdo->query("SELECT * FROM acessos where id = '$permissao'");
		$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
		$nome = $res2[0]['nome'];
		$chave = $res2[0]['chave'];
		$id = $res2[0]['id'];

		if($chave == 'home'){
			$home = '';
		}

		if($chave == 'cargos'){
			$cargos = '';
		}

		if($chave == 'tipos_empresas'){
			$tipos_empresas = '';
		}

		if($chave == 'funcionarios'){
			$funcionarios = '';
		}

		if($chave == 'clientes'){
			$clientes = '';
		}


		if($chave == 'usuarios'){
			$usuarios = '';
		}

		if($chave == 'mostar_clientes'){
			$mostrar_clientes = '';
		}

		if($chave == 'tarefas_escritorio'){
			$tarefas_escritorio = '';
		}

		if($chave == 'minhas_tarefas'){
			$minhas_tarefas = '';
		}

		if($chave == 'agenda_tarefas'){
			$agenda_tarefas = '';
		}

		if($chave == 'setor_arquivos'){
			$setor_arquivos = '';
		}

		if($chave == 'cat_arquivos'){
			$cat_arquivos = '';
		}


		if($chave == 'grupo_arquivos'){
			$grupo_arquivos = '';
		}

		if($chave == 'arquivos'){
			$arquivos = '';
		}

		if($chave == 'logs'){
			$ver_logs = '';
		}

	}

}



if($home != 'ocultar'){
	$pag_inicial = 'home';
}else if($atendimento == 'Sim'){
	$pag_inicial = 'agenda';
}else{
	$query = $pdo->query("SELECT * FROM funcionarios_permissoes where usuario = '$id_usuario' order by id asc limit 1");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){	
			$permissao = $res[0]['permissao'];		
			$query2 = $pdo->query("SELECT * FROM acessos where id = '$permissao'");
			$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);		
			$pag_inicial = $res2[0]['chave'];		

	}
}



if($cargos == 'ocultar' and $tipos_empresas == 'ocultar' and $funcionarios == 'ocultar' and $clientes == 'ocultar'){
	$menu_cadastros = 'ocultar';
}else{
	$menu_cadastros = '';
}



if($usuarios == 'ocultar' and $mostrar_clientes == 'ocultar'){
	$menu_pessoas_empresas = 'ocultar';
}else{
	$menu_pessoas_empresas = '';
}



if($tarefas_escritorio == 'ocultar' and $minhas_tarefas == 'ocultar' and $agenda_tarefas == 'ocultar'){
	$menu_tarefas = 'ocultar';
}else{
	$menu_tarefas = '';
}




if($setor_arquivo == 'ocultar' and $cat_arquivos == 'ocultar' and $grupo_arquivos == 'ocultar' and $arquivos == 'ocultar'){
	$menu_arquivos= 'ocultar';
}else{
	$menu_aquivos = '';
}



if($logs == 'ocultar'){
	$menu_logs = 'ocultar';
}else{
	$menu_logs = '';
}


 ?>