<?php
require_once("../conexao.php");
$id_funcionario = $_SESSION['id_funcionario'];

//SEM GRUPO
$home = 'ocultar';

//GRUPO CADASTROS
$cargos = 'ocultar';
$tipos_empresas = 'ocultar';
$funcionarios = 'ocultar';
$clientes = 'ocultar';

//GRUPO PESSOAS E EMPRESAS
$usuarios = 'ocultar';
$mostrar_empresas = 'ocultar';

//TAREFAS
$tarefas_escritorio = 'ocultar';
$tarefas = 'ocultar';
$agenda = 'ocultar';

//GED (ARQUIVOS)
$setor_arquivo = 'ocultar';
$cat_arquivos = 'ocultar';
$grupo_arquivos = 'ocultar';
$arquivos = 'ocultar';

//LOGS
$logs = 'ocultar';

$query = $pdo->query ("SELECT * FROM funcionarios_permissoes where usuario = '$id_funcionario'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if ($total_reg > 0) {
	for ($i = 0; $i < $total_reg; $i++) {
		foreach ($res[$i] as $key => $value) {
		}
		$permissao = $res[$i]['permissao'];

		$query2 = $pdo->query("SELECT * FROM acessos where id = '$permissao'");
		$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
		$nome = $res2[0]['nome'];
		$chave = $res2[0]['chave'];
		$id = $res2[0]['id'];

		if ($chave == 'home') {
			$home = '';
		}

		if ($chave == 'cargos') {
			$cargos = '';
		}

		if ($chave == 'tipos_empresas') {
			$tipos_empresas = '';
		}

		if ($chave == 'funcionarios') {
			$funcionarios = '';
		}

		if ($chave == 'clientes') {
			$clientes = '';
		}
		if ($chave == 'tarefas_escritorio') {
			$tarefas_escritorio = '';
		}

		if ($chave == 'tarefas') {
			$tarefas = '';
		}

		if ($chave == 'agenda') {
			$agenda = '';
		}

		if ($chave == 'setor_arquivo') {
			$setor_arquivo = '';
		}



		if ($chave == 'cat_arquivos') {
			$cat_arquivos = '';
		}

		if ($chave == 'grupo_arquivos') {
			$grupo_arquivos = '';
		}

		if ($chave == 'arquivos') {
			$arquivos = '';
		}

		if ($chave == 'logs') {
			$logs = '';
		}


		if ($chave == 'usuarios') {
			$usuarios = '';
		}

		if ($chave == 'mostrar_arquivos') {
			$mostar_arquivos = '';
		}

	}
}



 if($home != 'ocultar'){
	$pagina_inicial = 'home';
}else if($tarefas != 'ocultar'){
	$pagina_inicial = 'tarefas';
}else{
	$query = $pdo->query("SELECT * FROM funcionarios_permissoes where usuario = '$id_funcionario' order by id asc limit 1");
	$res = $query->fetchAll(PDO::FETCH_ASSOC);
	$total_reg = @count($res);
	if($total_reg > 0){	
			$permissao = $res[0]['permissao'];		
			$query2 = $pdo->query("SELECT * FROM acessos where id = '$permissao'");
			$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);		
			$pagina_inicial = $res2[0]['chave'];		

	}else{
		$pagina_inicial = 'sem_permissao';
	}
} 


//ESCONDER MENU HOME
if ($home == 'ocultar'){
	$menu_home = 'ocultar';
} else{
	$menu_home = '';
}

//ESCONDE O MENU CADASTROS E EDIÇÕES
if ($cargos == 'ocultar' and $tipos_empresas == 'ocultar' and $funcionarios == 'ocultar' and $clientes == 'ocultar') {
	$menu_cadastros = 'ocultar';
} else {
	$menu_cadastros = '';
}


//ESCONDER O MENU PESSOAS E EMPRESAS
if ($usuarios == 'ocultar' and $mostrar_empresas == 'ocultar') {
	$menu_pessoas_empresas = 'ocultar';
} else {
	$menu_pessoas_empresas = '';
}

//ESCONDER O MENU TAREFAS
if ($tarefas_escritorio == 'ocultar' and $tarefas == 'ocultar' and $agenda == 'ocultar') {
	$menu_tarefas = 'ocultar';
} else {
	$menu_tarefas = '';
}

//ESCONDER MENU ARQUIVOS
if ($setor_arquivo == 'ocultar' and $cat_arquivos == 'ocultar' and $grupo_arquivos == 'ocultar' and $arquivos == 'ocultar') {
	$menu_aquivos = 'ocultar';
} else {
	$menu_aquivos = '';
}

//ESCONDER MENU LOGS
if ($logs == 'ocultar') {
	$menu_logs = 'ocultar';
} else {
	$menu_logs = '';
}
