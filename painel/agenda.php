<?php
require_once("verificar.php");
require_once("../conexao.php");
$pag = 'agenda';

?>


<div class="row" style="background:white; padding:15px">
	<div class="col-md-2" style="margin-bottom: 5px">

		<button style="width:100%" onclick="inserir()" type="button" class="btn btn-primary btn-flat btn-pri"><i class="fa fa-plus" aria-hidden="true"></i>Nova Tarefa</button>


	</div>

	<div class="col-md-4 <?php echo $esc_todos ?>">
		<div class="form-group">
			<select class="form-control sel3" name="usuario_filtro" id="usuario_filtro" required style="width:100%;">

				<option value="<?php echo $_SESSION['id_usuario'] ?>"><?php echo $_SESSION['nome_usuario']  ?> - <?php echo $_SESSION['nivel_usuario']  ?></option>

				<?php

				if ($_SESSION['nivel_usuario'] != 'Administrador') {
					$query = $pdo->query("SELECT * FROM usuarios where nivel != 'Administrador' order by nome asc");
				} else {
					$query = $pdo->query("SELECT * FROM usuarios order by nome asc");
				}

				$res = $query->fetchAll(PDO::FETCH_ASSOC);
				for ($i = 0; $i < @count($res); $i++) {
					foreach ($res[$i] as $key => $value) {
					}
					if ($res[$i]['id'] != $_SESSION['id_usuario']) {

				?>
						<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome']  ?> - <?php echo $res[$i]['nivel']  ?></option>

				<?php }
				} ?>

			</select>
		</div>
	</div>

	<input type="hidden" name="data_agenda" id="data_agenda" value="<?php echo date('Y-m-d') ?>">


</div>


<div class="row">

	<div class="col-md-4 agile-calendar">
		<div class="calendar-widget">

			<!-- grids -->
			<div class="agile-calendar-grid">
				<div class="page">

					<div class="w3l-calendar-left">
						<div class="calendar-heading">

						</div>
						<div class="monthly" id="mycalendar"></div>
					</div>

					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>

	<!-- CARDS QUE FICAM AO LADO DO CALENDÁRIO -->
	<div class="col-md-8 bs-example widget-shadow" style="padding:10px 5px; margin-top: 0px;" id="listar">

	</div>
</div>



<!-- MODAL DELEGAR TAREFA -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal"></h4>
				<button id="btn-fechar" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form-text">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label>Título <small>(Máx 40 Caracteres)</small></label>
								<input maxlength="40" type="text" class="form-control" name="titulo" id="titulo" required>
							</div>
						</div>

						<div class="col-md-4" id="nasc">
							<div class="form-group">
								<label>Data </label>
								<input type="date" class="form-control" name="data" id="data-modal">
							</div>
						</div>


						<div class="col-md-3" id="nasc">
							<div class="form-group">
								<label>Hora</label>
								<input type="time" class="form-control" name="hora" id="hora" value="" required>
							</div>
						</div>


					</div>





					<div class="col-md-12">
						<div class="form-group">
							<label>Descrição <small>(Máx 100 Caracteres)</small></label>
							<input maxlength="100" type="text" class="form-control" name="descricao" id="descricao">
						</div>
					</div>



					<div class="col-md-12">
						<div class="form-group">
							<label>OBS <small>(Max 1000 Caracteres)</small></label>
							<textarea maxlength="1000" name="area" id="area" class="textarea"> </textarea>
						</div>
					</div>


					<br>
					<input type="hidden" name="id" id="id">
					<input type="hidden" name="usuario" id="usuario">
					<small>
						<div id="mensagem" align="center" class="mt-3"></div>
					</small>

				</div>


				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Salvar</button>
				</div>



			</form>

		</div>
	</div>
</div>



<!-- MODAL EXCLUIR TAREFA-->
<div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" style="width:400px; margin:0 auto;">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal">Excluir Registro: <span id="nome-excluido"> </span></h4>
				<button id="btn-fechar-excluir" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form-excluir">
				<div class="modal-body">

					<div class="row" align="center">
						<div class="col-md-6">
							<button type="submit" class="btn btn-danger" style="width:100px">Sim</button>
						</div>
						<div class="col-md-6">
							<button type="button" data-dismiss="modal" class="btn btn-success" style="width:100px">Não</button>
						</div>
					</div>

					<br>
					<input type="hidden" name="id" id="id-excluir">
					<input type="hidden" name="nome" id="nome-excluir">
					<small>
						<div id="mensagem-excluir" align="center" class="mt-3"></div>
					</small>

				</div>

				<div class="modal-footer">

				</div>

			</form>

		</div>
	</div>
</div>





<!-- MODAL MOSTRAR TAREFAS ESCRITÓRIO -->
<div class="modal fade" id="modalMostrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal"><span id="nome_mostrar"> </span> <small>Tarefa : <span id="status_mostrar"> </span></small></h4>
				<button id="btn-fechar-excluir" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">




				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Data: </b></span>
						<span id="data_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Hora: </b></span>
						<span id="hora_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Usuário: </b></span>
						<span id="usuario_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Lançado Por: </b></span>
						<span id="usuario_lanc_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Tipo da tarefa: </b></span>
						<span id="tipo_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Frequência: </b></span>
						<span id="frequencia_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-12">
						<span><b>Descrição: </b></span>
						<span id="descricao_mostrar"></span>
					</div>
				</div>




				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-12">
						<span><b>Observações: </b></span>
						<div id="obs_mostrar" style="margin-top: 15px"></div>
					</div>
				</div>



			</div>


		</div>
	</div>
</div>



<script type="text/javascript">
	var pag = "<?= $pag ?>"
</script>
<script src="js/ajax.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#usuario").val($("#usuario_filtro").val());
		listar();
	});


	$('#usuario_filtro').change(function() {
		$("#usuario").val($("#usuario_filtro").val());
		listar();
	});
</script>


<script type="text/javascript">
	function listar() {

		var data = $("#data_agenda").val();
		var usuario = $("#usuario_filtro").val();
		$("#data-modal").val(data);


		$.ajax({
			url: pag + "/listar.php",
			method: 'POST',
			data: {
				data,
				usuario
			},
			dataType: "text",

			success: function(result) {
				$("#listar").html(result);
			}
		});
	}
</script>

<!-- calendar -->
<script type="text/javascript" src="js/monthly.js"></script>
<script type="text/javascript">
	$(window).load(function() {

		$('#mycalendar').monthly({
			mode: 'event',

		});

		$('#mycalendar2').monthly({
			mode: 'picker',
			target: '#mytarget',
			setWidth: '250px',
			startHidden: true,
			showTrigger: '#mytarget',
			stylePast: true,
			disablePast: true
		});

		switch (window.location.protocol) {
			case 'http:':
			case 'https:':
				// running on a server, should be good.
				break;
			case 'file:':
				alert('Just a heads-up, events will not work when run locally.');
		}

	});
</script>
<!-- //calendar -->

<script type="text/javascript">
	$(document).ready(function() {
		$('.sel3').select2({

		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {
		$('.sel2').select2({
			dropdownParent: $('#modalForm')
		});
	});
</script>


<script>
	$("#form-text").submit(function() {
		event.preventDefault();
		nicEditors.findEditor('area').saveContent();
		var formData = new FormData(this);

		$.ajax({
			url: pag + "/inserir.php",
			type: 'POST',
			data: formData,

			success: function(mensagem) {
				$('#mensagem').text('');
				$('#mensagem').removeClass()
				if (mensagem.trim() == "Salvo com Sucesso") {
					$('#btn-fechar').click();
					listar();
				} else {
					$('#mensagem').addClass('text-danger')
					$('#mensagem').text(mensagem)
				}

			},

			cache: false,
			contentType: false,
			processData: false,

		});

	});
</script>


<script type="text/javascript">
	function mostrar(id, titulo, descricao, hora, data, usuario, tipo_tarefa, frequencia_tarefa, usuario_lanc, status, obs) {

		for (let letra of obs) {
			if (letra === '*') {
				obs = obs.replace('**', '"');
			}
		}


		$('#nome_mostrar').text(titulo);
		$('#descricao_mostrar').text(descricao);
		$('#hora_mostrar').text(hora);
		$('#tipo_mostrar').text(tipo_tarefa);
		$('#frequencia_mostrar').text(frequencia_tarefa);
		$('#data_mostrar').text(data);
		$('#usuario_mostrar').text(usuario);
		$('#usuario_lanc_mostrar').text(usuario_lanc);
		$('#status_mostrar').text(status);

		$("#obs_mostrar").html(obs);


		$('#modalMostrar').modal('show');
	}

	function limparCampos() {
		$('#id').val('');
		$('#titulo').val('');
		$('#descricao').val('');
		$('#hora').val('');
		$('#data').val('<?= $data_atual ?>');
		nicEditors.findEditor("area").setContent('');

	}
</script>


<script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(nicEditors.allTextAreas);
</script>