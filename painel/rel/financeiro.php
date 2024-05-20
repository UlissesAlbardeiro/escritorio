<?php 
require_once("../../conexao.php");
require_once("data_formatada.php");
$dataInicial = $_GET['dataInicial'];
$dataFinal = $_GET['dataFinal'];
$acao = $_GET['acao'];
$tipo = $_GET['tipo'];

$total_entradas = 0;
$total_saidas = 0;
$saldo_total = 0;
$total_entradasF = 0;
$total_saidasF = 0;
$saldo_totalF = 0;
$classe_saldo = 0;

$dataInicialF = implode('/', array_reverse(explode('-', $dataInicial)));
$dataFinalF = implode('/', array_reverse(explode('-', $dataFinal)));

if($dataInicial == $dataFinal){
	$texto_apuracao = 'APURADO EM '.$dataInicialF;
}else if($dataInicial == '1980-01-01'){
	$texto_apuracao = 'APURADO EM TODO O PERÍODO';
}else{
	$texto_apuracao = 'APURAÇÃO DE '.$dataInicialF. ' ATÉ '.$dataFinalF;
}


if($tipo == ''){
	$tipo_rel = '';
}else{
	$tipo_rel = ' - '.$tipo;
}


if($acao == ''){
	$acao_rel = '';
}else{
	$acao_rel = ' - '.$acao;
}



$acao = '%'.$acao.'%';
$tipo = '%'.$tipo.'%';





?>



<!DOCTYPE html>
<html>
<head>
	<title>Relatório Financeiro</title>

	<?php 
	if($relatorio_pdf != 'pdf'){
		?>
		<link rel="icon" href="<?php echo $url_sistema ?>/img/<?php echo $favicon ?>" type="image/x-icon">

	<?php } ?>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">


	<style>

		@page {
			margin: 0px;

		}

		body{
			margin-top:0px;
			font-family:Times, "Times New Roman", Georgia, serif;
		}


		<?php if($relatorio_pdf == 'pdf'){ ?>

			.footer {
				margin-top:20px;
				width:100%;
				background-color: #ebebeb;
				padding:5px;
				position:absolute;
				bottom:0;
			}

		<?php }else{ ?>
			.footer {
				margin-top:20px;
				width:100%;
				background-color: #ebebeb;
				padding:5px;

			}

		<?php } ?>

		.cabecalho {    
			padding:10px;
			margin-bottom:30px;
			width:100%;
			font-family:Times, "Times New Roman", Georgia, serif;
		}

		.titulo_cab{
			color:#0340a3;
			font-size:17px;
		}

		
		
		.titulo{
			margin:0;
			font-size:28px;
			font-family:Arial, Helvetica, sans-serif;
			color:#6e6d6d;

		}

		.subtitulo{
			margin:0;
			font-size:12px;
			font-family:Arial, Helvetica, sans-serif;
			color:#6e6d6d;
		}



		hr{
			margin:8px;
			padding:0px;
		}


		
		.area-cab{
			
			display:block;
			width:100%;
			height:10px;

		}

		
		.coluna{
			margin: 0px;
			float:left;
			height:30px;
		}

		.area-tab{
			
			display:block;
			width:100%;
			height:30px;

		}


		.imagem {
			width: 200px;
			position:absolute;
			right:20px;
			top:10px;
		}

		.titulo_img {
			position: absolute;
			margin-top: 10px;
			margin-left: 10px;

		}

		.data_img {
			position: absolute;
			margin-top: 40px;
			margin-left: 10px;
			border-bottom:1px solid #000;
			font-size: 10px;
		}

		.endereco {
			position: absolute;
			margin-top: 50px;
			margin-left: 10px;
			border-bottom:1px solid #000;
			font-size: 10px;
		}

		.verde{
			color:green;
		}
		

	</style>


</head>
<body>	


	<div class="titulo_cab titulo_img"><u>Relatório Financeiro <?php echo $acao_rel ?> <?php echo $tipo_rel ?> </u></div>	
	<div class="data_img"><?php echo mb_strtoupper($data_hoje) ?></div>

	<?php 
	if($logo_rel != ''){
		?>
		<img class="imagem" src="<?php echo $url_sistema ?>img/<?php echo $logo_rel ?>" width="200px" height="60">

	<?php } ?>
	

	<br><br><br>
	<div class="cabecalho" style="border-bottom: solid 1px #0340a3">
	</div>

	<div class="mx-2" style="padding-top:10px ">

		<section class="area-cab">
			
			<div class="coluna" style="width:50%">
				<small><small><small><u><?php echo $texto_apuracao ?></u></small></small></small>
			</div>



		</section>

		<br>

		<?php 
		$query = $pdo->query("SELECT * FROM movimentacoes where lancamento LIKE '$acao' and tipo LIKE '$tipo' and data >= '$dataInicial' and data <= '$dataFinal' order by data asc");
		$res = $query->fetchAll(PDO::FETCH_ASSOC);
		$total_reg = count($res);
		if($total_reg > 0){
			?>



			<small><small>
				<section class="area-tab" style="background-color: #f5f5f5;">
					
					<div class="linha-cab" style="padding-top: 5px;">
						<div class="coluna" style="width:10%">VALOR</div>
						<div class="coluna" style="width:35%">DESCRIÇÃO</div>
						<div class="coluna" style="width:20%">LANÇADO POR</div>
						<div class="coluna" style="width:20%">LANÇAMENTO</div>
						<div class="coluna" style="width:15%">DATA</div>
						

					</div>
					
				</section><small></small>

				<div class="cabecalho mb-1" style="border-bottom: solid 1px #e3e3e3;">
				</div>

				<?php

				for($i=0; $i < $total_reg; $i++){
					foreach ($res[$i] as $key => $value){}
						$data = $res[$i]['data'];
					$descricao = $res[$i]['descricao'];
					$valor = $res[$i]['valor'];
					$lancamento = $res[$i]['lancamento'];
					$usuario = $res[$i]['usuario'];
					$tipo = $res[$i]['tipo'];
					
					$valorF = number_format($valor, 2, ',', '.');
					$dataF = implode('/', array_reverse(explode('-', $data)));

					$query_con = $pdo->query("SELECT * FROM usuarios where id = '$usuario'");
					$res_con = $query_con->fetchAll(PDO::FETCH_ASSOC);
					if(count($res_con) > 0){
						$nome_usu = $res_con[0]['nome'];
					}else{
						$nome_usu= '';
					}

					if($tipo == 'Saída'){
						$classe_tipo = 'text-danger';
						$total_saidas += $valor;
					}else{
						$classe_tipo = 'text-success';
						$total_entradas += $valor;
					}

					$saldo_total = $total_entradas - $total_saidas;
					if($saldo_total < 0){
						$classe_saldo = 'text-danger';
					}else{
						$classe_saldo = 'text-success';
					}

					$total_saidasF = number_format($total_saidas, 2, ',', '.');
					$total_entradasF = number_format($total_entradas, 2, ',', '.');
					$saldo_totalF = number_format($saldo_total, 2, ',', '.');

					
					?>

					<section class="area-tab" style="padding-top:5px">					
						<div class="linha-cab">				
							<div class="coluna <?php echo $classe_tipo ?>" style="width:10%">R$ <?php echo $valorF ?></div>

							<div class="coluna" style="width:35%"><?php echo $descricao ?></div>

							<div class="coluna" style="width:20%"><?php echo $nome_usu ?></div>

							<div class="coluna" style="width:20%"><?php echo $lancamento ?></div>

							<div class="coluna" style="width:15%"><?php echo $dataF ?></div>								

						</div>
					</section>
					<div class="cabecalho" style="border-bottom: solid 1px #e3e3e3;">
					</div>

				<?php } ?>

			</small>



		</div>


		<div class="cabecalho mt-3" style="border-bottom: solid 1px #0340a3">
		</div>


	<?php }else{
		echo '<div style="margin:8px"><small><small>Sem Registros no banco de dados!</small></small></div>';
	} ?>



	<div class="col-md-12 p-2">
		<div class="" align="right">
			<span class="verde" style="margin-right: 100px"> <small><small><small><small>ENTRADAS</small> : R$ <?php echo $total_entradasF ?></small></small></small>  </span>

			<span class="text-danger" style="margin-right: 100px"> <small><small><small><small>SAÍDAS</small> : R$ <?php echo $total_saidasF ?></small></small></small>  </span>


			<span class="<?php echo $classe_saldo ?>"> <small><small><small><small>SALDO</small> : R$ <?php echo $saldo_totalF ?></small></small></small>  </span>
		</div>
	</div>
	<div class="cabecalho" style="border-bottom: solid 1px #0340a3">
	</div>




	<div class="footer"  align="center">
		<span style="font-size:10px"><?php echo $end_sistema ?> Tel: <?php echo $tel_sistema ?></span> 
	</div>



</body>
</html>