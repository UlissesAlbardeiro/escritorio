<?php
require_once("verificar.php");
require_once("../conexao.php");
$pag = 'funcionarios';


/* if(@$_SESSION['nivel_usuario'] != "Administrador" and @$_SESSION['nivel_usuario'] != "Gerente" and @$_SESSION['nivel_usuario'] != "RH"){
echo "<script>window.location='../index.php'</script>";
exit();
}
 */

?>
<button onclick="inserir()" type="button" class="btn btn-primary btn-flat btn-pri"><i class="fa fa-plus" aria-hidden="true"></i> Novo Funcionário</button>

<div class="bs-example widget-shadow" style="padding:15px" id="listar">

</div>




<!-- MODAL CADASTRAR FUNCIONÁRIOS -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal"></h4>
				<button id="btn-fechar" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Nome</label>
								<input type="text" class="form-control" name="nome" id="nome" required>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label>Telefone</label>
								<input type="text" class="form-control" name="telefone" id="telefone" required>
							</div>
						</div>


						<div class="col-md-4">
							<div class="form-group">
								<label>CPF</label>
								<input type="text" class="form-control" name="cpf" id="cpf" required>
							</div>
						</div>





					</div>


					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email" id="email" required>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label>Cargo</label>
								<select class="form-control sel2" name="cargo" id="cargo" required style="width:100%;">
									<?php
									$query = $pdo->query("SELECT * FROM cargos order by nome asc");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);
									for ($i = 0; $i < @count($res); $i++) {
										foreach ($res[$i] as $key => $value) {
										}

									?>
										<option value="<?php echo $res[$i]['id'] ?>"><?php echo $res[$i]['nome'] ?></option>

									<?php } ?>

								</select>
							</div>
						</div>


						<div class="col-md-4">
							<div class="form-group">
								<label>Data Nascimento</label>
								<input type="date" class="form-control" name="data_nasc" id="data_nasc" value="<?php echo date('Y-m-d') ?>">
							</div>
						</div>





					</div>





					<div class="row">


						<div class="col-md-3">
							<div class="form-group">
								<label>Salário (Mês)</label>
								<input type="text" class="form-control" name="salario" id="salario">
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label>Valor Hora</label>
								<input type="text" class="form-control" name="valor_hora" id="valor_hora">
							</div>
						</div>

						<div class="col-md-2">
							<div class="form-group">
								<label>Hora Entrada</label>
								<input type="time" class="form-control" name="hora_entrada" id="hora_entrada">
							</div>
						</div>

						<div class="col-md-2">
							<div class="form-group">
								<label>Hora Saída</label>
								<input type="time" class="form-control" name="hora_saida" id="hora_saida">
							</div>
						</div>


						<div class="col-md-2">
							<div class="form-group">
								<label>Jornada Dia</label>
								<input type="time" class="form-control" name="jornada_horas" id="jornada_horas">
							</div>
						</div>



					</div>




					<div class="col-md-12">
						<div class="form-group">
							<label>Endereço</label>
							<input type="text" class="form-control" name="endereco" id="endereco" placeholder="Rua X Número 20 Bairro X">
						</div>
					</div>

					<div class="row">
						<div class="col-md-7">
							<div class="form-group">
								<label>OBS <small>(Max 500 Caracteres)</small></label>
								<textarea maxlength="500" type="text" class="form-control" name="obs" id="obs"> </textarea>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label>Foto</label>
								<input type="file" name="foto" onChange="carregarImg();" id="foto">
							</div>
						</div>
						<div class="col-md-2">
							<div id="divImg">
								<img src="images/perfil/sem-perfil.jpg" width="100px" id="target">
							</div>
						</div>

					</div>


					<br>
					<input type="hidden" name="id" id="id">
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



<!-- MODAL EXCLUIR FUNCIONÁRIOS -->
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




<!-- MODAL MOSTRAR FUNCIONÁRIOS -->
<div class="modal fade" id="modalMostrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal"><span id="nome_mostrar"> </span></h4>
				<button id="btn-fechar-excluir" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">



				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>CPF: </b></span>
						<span id="cpf_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Telefone: </b></span>
						<span id="telefone_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Email: </b></span>
						<span id="email_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Cargo: </b></span>
						<span id="cargo_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-12">
						<span><b>Endereço: </b></span>
						<span id="endereco_mostrar"></span>
					</div>
				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Cadastro: </b></span>
						<span id="data_cad_mostrar"></span>
					</div>
					<div class="col-md-6">
						<span><b>Nascimento: </b></span>
						<span id="data_nasc_mostrar"></span>
					</div>
				</div>

				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Salário: R$</b></span>
						<span id="salario_mostrar"></span>
					</div>

					<div class="col-md-6">
						<span><b>Valor Hora: R$</b></span>
						<span id="hora_mostrar"></span>
					</div>

				</div>


				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Hora Entrada</b></span>
						<span id="hora_entrada_mostrar"></span>
					</div>

					<div class="col-md-6">
						<span><b>Hora Saída</b></span>
						<span id="hora_saida_mostrar"></span>
					</div>

				</div>



				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-6">
						<span><b>Jornada Horas Dia</b></span>
						<span id="jornada_mostrar"></span>
					</div>



				</div>



				<div class="row" style="border-bottom: 1px solid #cac7c7;">
					<div class="col-md-12">
						<span><b>OBS: </b></span>
						<span id="obs_mostrar"></span>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12" align="center">
						<img width="200px" id="target_mostrar">
					</div>
				</div>



			</div>


		</div>
	</div>
</div>





<!-- MODAL ARQUIVOS -->
<div class="modal fade" id="modalArquivos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="tituloModal">Gestão de Arquivos - <span id="nome-arquivo"> </span></h4>
				<button id="btn-fechar-arquivos" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="form-arquivos" method="post">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<label>Arquivo</label>
								<input type="file" name="arquivo_conta" onChange="carregarImgArquivos();" id="arquivo_conta">
							</div>
						</div>
						<div class="col-md-4" style="margin-top:-10px">
							<div id="divImgArquivos">
								<img src="images/arquivos/sem-foto.png" width="60px" id="target-arquivos">
							</div>
						</div>




					</div>

					<div class="row" style="margin-top:-40px">
						<div class="col-md-8">
							<input type="text" class="form-control" name="nome-arq" id="nome-arq" placeholder="Nome do Arquivo * " required>
						</div>

						<div class="col-md-4">
							<button type="submit" class="btn btn-primary">Inserir</button>
						</div>
					</div>

					<hr>

					<small>
						<div id="listar-arquivos"></div>
					</small>
					<br>
					<small>
						<div align="center" id="mensagem-arquivo"></div>
					</small>
					<input type="hidden" class="form-control" name="id-arquivo" id="id-arquivo">
				</div>
			</form>
		</div>
	</div>
</div>

	<!-- MODAL PERMISSÓES -->
	<div class="modal fade" id="modalPermissoes" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						Funcionário: <span id="nome-usuario"></span>
						<span style="position:absolute; right:35px">
							<input class="form-check-input" type="checkbox" id="input-todos" onchange="marcarTodos()">
							<label class="">Marcar Todos</label>
						</span>
					</h4>
					<button id="btn-fechar-permissoes" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div style="font-size: 14px" class="row" id="listar-permissoes">
					</div>
					<div class="row">
						<div class="col-md-12">
						</div>
					</div>
					<br>
					<input type="hidden" name="id" id="id-usuario">
					<small>
						<div id="mensagem-permissao" align="center" class="mt-3"></div>
					</small>
				</div>
			</div>
		</div>
	</div>





	<script type="text/javascript">
		var pag = "<?= $pag ?>";
	</script>
	<script src="js/ajax.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.sel2').select2({
				dropdownParent: $('#modalForm')
			});
		});
	</script>






	<script type="text/javascript">
		function carregarImg() {
			var target = document.getElementById('target');
			var file = document.querySelector("#foto").files[0];

			var reader = new FileReader();

			reader.onloadend = function() {
				target.src = reader.result;
			};

			if (file) {
				reader.readAsDataURL(file);

			} else {
				target.src = "";
			}
		}
	</script>







	<script type="text/javascript">
		function carregarImgArquivos() {
			var target = document.getElementById('target-arquivos');
			var file = document.querySelector("#arquivo_conta").files[0];

			var arquivo = file['name'];
			resultado = arquivo.split(".", 2);

			if (resultado[1] === 'pdf') {
				$('#target-arquivos').attr('src', "images/pdf.png");
				return;
			}

			if (resultado[1] === 'rar' || resultado[1] === 'zip') {
				$('#target-arquivos').attr('src', "images/rar.png");
				return;
			}

			if (resultado[1] === 'doc' || resultado[1] === 'docx' || resultado[1] === 'txt') {
				$('#target-arquivos').attr('src', "images/word.png");
				return;
			}


			if (resultado[1] === 'xlsx' || resultado[1] === 'xlsm' || resultado[1] === 'xls') {
				$('#target-arquivos').attr('src', "images/excel.png");
				return;
			}


			if (resultado[1] === 'xml') {
				$('#target-arquivos').attr('src', "images/xml.png");
				return;
			}



			var reader = new FileReader();

			reader.onloadend = function() {
				target.src = reader.result;
			};

			if (file) {
				reader.readAsDataURL(file);

			} else {
				target.src = "";
			}
		}
	</script>




	<script type="text/javascript">
		$("#form-arquivos").submit(function() {
			event.preventDefault();
			var formData = new FormData(this);

			$.ajax({
				url: pag + "/arquivos.php",
				type: 'POST',
				data: formData,

				success: function(mensagem) {
					$('#mensagem-arquivo').text('');
					$('#mensagem-arquivo').removeClass()
					if (mensagem.trim() == "Inserido com Sucesso") {
						//$('#btn-fechar-arquivos').click();
						$('#nome-arq').val('');
						$('#arquivo_conta').val('');
						$('#target-arquivos').attr('src', 'images/arquivos/sem-foto.png');
						listarArquivos();
					} else {
						$('#mensagem-arquivo').addClass('text-danger')
						$('#mensagem-arquivo').text(mensagem)
					}

				},

				cache: false,
				contentType: false,
				processData: false,

			});

		});
	</script>

	<script type="text/javascript">
		function listarArquivos() {
			var id = $('#id-arquivo').val();
			$.ajax({
				url: pag + "/listar-arquivos.php",
				method: 'POST',
				data: {
					id
				},
				dataType: "text",

				success: function(result) {
					$("#listar-arquivos").html(result);
				}
			});
		}
	</script>

	<!-- AJAX PERMISSÕES -->

	<script type="text/javascript">
		function listarPermissoes(id) {
			$.ajax({
				url: pag + "/listar-permissoes.php",
				method: 'POST',
				data: {
					id
				},
				dataType: "html",

				success: function(result) {
					$("#listar-permissoes").html(result);
					$('#mensagem-permissao').text('');
					//$('#input-todos').prop('checked', false);
				}
			});
		}


		function marcarTodos() {
			let checkbox = document.getElementById('input-todos');
			var usuario = $('#id-usuario').val();

			if (checkbox.checked) {
				adicionarPermissoes(usuario);
			} else {
				limparPermissoes(usuario);
			}
		}



		function adicionarPermissoes(id) {
			$.ajax({
				url: pag + "/add-permissoes.php",
				method: 'POST',
				data: {
					id
				},
				dataType: "html",

				success: function(result) {
					listarPermissoes(id)
				}
			});
		}


		function limparPermissoes(id) {
			$.ajax({
				url: pag + "/limpar-permissoes.php",
				method: 'POST',
				data: {
					id
				},
				dataType: "html",

				success: function(result) {
					listarPermissoes(id)
				}
			});
		}


		function adicionarPermissao(idpermissao, idusuario) {

			$.ajax({
				url: pag + "/add-permissao.php",
				method: 'POST',
				data: {
					idpermissao,
					idusuario
				},
				dataType: "html",

				success: function(result) {
					listarPermissoes(idusuario)
				}
			});
		}
	</script>