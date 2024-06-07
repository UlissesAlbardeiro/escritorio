<?php
require_once("../../conexao.php");
@session_start();
$usuario = @$_POST['usuario'];
$data = @$_POST['data'];

if ($data == "") {
	$data = date('Y-m-d');
}

if ($usuario == "") {
	$usuario = @$_SESSION['id_usuario'];
}

echo <<<HTML
<small>
HTML;
$query = $pdo->query("SELECT * FROM tarefas where usuario = '$usuario' and data = '$data' ORDER BY hora asc");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if ($total_reg > 0) {
	for ($i = 0; $i < $total_reg; $i++) {
		foreach ($res[$i] as $key => $value) {
		}
		$id = $res[$i]['id'];
		$tipo_tarefa = $res[$i]['tipo_tarefa'];
		$data_inicio_tarefa = $res[$i]['data_inicio'];
		$frequencia_tarefa = $res[$i]['frequencia'];
		$titulo = $res[$i]['titulo'];
		$descricao = $res[$i]['descricao'];
		$hora = $res[$i]['hora'];
		$data = $res[$i]['data'];
		$usuario = $res[$i]['usuario'];
		$usuario_lanc = $res[$i]['usuario_lanc'];
		$status = $res[$i]['status'];
		$obs = $res[$i]['obs'];

		$dataF = implode('/', array_reverse(explode('-', $data)));

		//QUANTIDADE DE DIAS ATÉ A NOTIFICAÇÃO DA TEREFA
		if ($tipo_tarefa == 'Periódica') {

			$hoje = strtotime(date('Y-m-d')); //tranforma data de hoje em segundos
			$data_inicio = strtotime(date($data_inicio_tarefa)); //transforma data escolhida em segundos

			if (($data_inicio - $hoje) > $frequencia_tarefa) {
				$dias_que_faltam = ($data_inicio - $hoje) / 86400;
				$data_formatada = 'Em '.$dias_que_faltam.' dia(s)';
				$frequencia = 'A cada '.$frequencia_tarefa.' dia(s)';
			} else {
				$diferenca = $hoje - $data_inicio;
				$dia = $diferenca / 86400; //transformando segundos em dias
				$modulo = $dia % $frequencia_tarefa;
				$frequencia = 'A cada '.$frequencia_tarefa.' dia(s)';

				if ($modulo == 0) {
					$data_formatada = 'Hoje';
					$frequencia = 'A cada '.$frequencia_tarefa.' dia(s)';
				} else {
					$data_dias =  $frequencia_tarefa - $modulo;
					$data_formatada = 'Em '.$data_dias.' dia(s)';
					$frequencia = 'A cada '.$frequencia_tarefa.' dia(s)';
				}
			}
		} else {
			$data_formatada = implode('/', array_reverse(explode('-', $data)));
			$frequencia = $frequencia_tarefa;
		}
		

		if ($status == 'Concluída') {
			$icone = 'fa-check-square';
			$titulo_link = 'Cancelar Conclusão';
			$acao = 'Agendada';
			$classe_linha = '';
		} else {
			$icone = 'fa-square-o';
			$titulo_link = 'Concluir Tarefa';
			$acao = 'Concluída';
			$classe_linha = 'text-muted';
		}



		if ($status == 'Agendada') {
			$cor_card = '#242424';
		} else {
			$cor_card = '#8a8a8a';
		}

		$query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario'");
		$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
		if (@count($res2) > 0) {
			$nome_usu = $res2[0]['nome'];
		} else {
			$nome_usu = 'Sem Usuário';
		}


		$query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario_lanc'");
		$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
		if (@count($res2) > 0) {
			$nome_usu_lanc = $res2[0]['nome'];
		} else {
			$nome_usu_lanc = 'Sem Usuário';
		}


		//retirar aspas do texto do obs
		$obs = str_replace('"', "**", $obs);

		echo <<<HTML
			<div class=" col-md-12 widget cardTarefas">
        		<div class="r3_counter_box">
        		<button type="button" class="close" onclick="excluir('{$id}', '{$titulo}')" title="Excluir Tarefa" style="margin-top: -10px">
					<span aria-hidden="true"><big>&times;</big></span>
				</button>
				<a href="#" onclick="mostrar('{$id}', '{$titulo}', '{$descricao}','{$hora}','{$data_formatada}','{$nome_usu}', '{$tipo_tarefa}', '{$frequencia}', '{$nome_usu_lanc}', '{$status}','{$obs}')" title="Ver Dados">
        		<div>
        	
        		<div class="col-md-12" style="margin-left: -16px">
        			<p style="color:{$cor_card}; margin-bottom: -4px; font-size: 16px;">{$titulo}</p>
        		</div>
        		</div>
				<div>
					<p style="color: #8a8a8a; margin-bottom: -4px;">Hora: {$hora}</p>
				</div>
				<div>
					<p style="color: #8a8a8a">Tipo: {$tipo_tarefa}</p>
				</div>
        		</a>
        		<hr style="margin-top:-2px; margin-bottom: 3px">                    
                    <div class="stats esc" style="margin-top:-15px;">
                      <span>
                      <a href="#" onclick="ativar('{$id}', '{$titulo}', '{$acao}')" title="{$titulo_link}">
                      <i class="fa {$icone} mr-1 text-primary" style="font-size:14px; margin:0; padding:0; width:17px; height: 17px"></i>
                      </a>
                       <small>{$status}</small></span>
                    </div>
                </div>
        	</div>
HTML;
	}
} else {
	echo 'Não possui nenhum registro cadastrado nessa data!';
}
