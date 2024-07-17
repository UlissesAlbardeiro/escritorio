<?php
session_start();
require_once("../conexao.php");
require_once("verificar.php");



if ($_SESSION['nivel_usuario'] != 'Administrador') {
	require_once("verificar_permissoes.php");
	if (@$_GET['pagina'] == "") {
		$pagina = $pagina_inicial;
	} else {
		$pagina = @$_GET['pagina'];
	}

}else{
	if (@$_GET['pagina'] == "") {
		$pagina = 'home';
	} else {
		$pagina = @$_GET['pagina'];
	}
}




$id_funcionario = $_SESSION['id_funcionario'];
$id_usuario = $_SESSION['id_usuario'];

//RECUPERAR DADOS DO USUÁRIO LOGADO
$query = $pdo->query("SELECT * FROM usuarios where id = '$id_usuario' ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

if ($total_reg > 0) {
	$nome_usu = $res[0]['nome'];
	$foto_usu = $res[0]['foto'];
	$nivel_usu = $res[0]['nivel'];
	$cpf_usu = $res[0]['cpf'];
	$senha_usu = $res[0]['senha'];
	$email_usu = $res[0]['email'];
	$id_usu = $res[0]['id'];
}


$data_atual = date('Y-m-d');
$mes_atual = Date('m');
$ano_atual = Date('Y');
$data_mes = $ano_atual . "-" . $mes_atual . "-01";
$data_ano = $ano_atual . "-01-01";



?>
<!DOCTYPE HTML>
<html>

<head>
	<title><?php echo $nome_sistema; ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Sistema para Escritórios desenvolvido no curso do Hugo Vasconcelos do Portal Hugo Cursos" />
	<script type="application/x-javascript">
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

	<!-- Custom CSS -->
	<link href="css/style.css" rel='stylesheet' type='text/css' />

	<!-- font-awesome icons CSS -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons CSS-->

	<!-- side nav css file -->
	<link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css' />
	<!-- //side nav css file -->

	<link rel="stylesheet" href="css/monthly.css">

	<!-- JS-->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/modernizr.custom.js"></script>

	<!--GOOGLE FONTES-->
	<link href="https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Readex+Pro:wght@160..700&display=swap" rel="stylesheet">

	<!-- CHART -->
	<script src="js/Chart.js"></script>

	<!-- Metis Menu -->
	<script src="js/metisMenu.min.js"></script>
	<script src="js/custom.js"></script>
	<link href="css/custom.css" rel="stylesheet">
	<!--//Metis Menu -->

	<link rel="icon" href="../img/<?php echo $favicon ?>" type="image/x-icon">
	<style>
		#chartdiv {
			width: 100%;
			height: 295px;
		}
	</style>
	<!--pie-chart --><!-- index page sales reviews visitors pie chart -->
	<script src="js/pie-chart.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#demo-pie-1').pieChart({
				barColor: '#2dde98',
				trackColor: '#eee',
				lineCap: 'round',
				lineWidth: 8,
				onStep: function(from, to, percent) {
					$(this.element).find('.pie-value').text(Math.round(percent) + '%');
				}
			});

			$('#demo-pie-2').pieChart({
				barColor: '#8e43e7',
				trackColor: '#eee',
				lineCap: 'butt',
				lineWidth: 8,
				onStep: function(from, to, percent) {
					$(this.element).find('.pie-value').text(Math.round(percent) + '%');
				}
			});

			$('#demo-pie-3').pieChart({
				barColor: '#ffc168',
				trackColor: '#eee',
				lineCap: 'square',
				lineWidth: 8,
				onStep: function(from, to, percent) {
					$(this.element).find('.pie-value').text(Math.round(percent) + '%');
				}
			});


		});
	</script>
	<!-- //pie-chart --><!-- index page sales reviews visitors pie chart -->

	<!-- requried-jsfiles-for owl -->
	<link href="css/owl.carousel.css" rel="stylesheet">
	<script src="js/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				items: 3,
				lazyLoad: true,
				autoPlay: true,
				pagination: true,
				nav: true,
			});
		});
	</script>
	<!-- //requried-jsfiles-for owl -->

	<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css" />
	<script type="text/javascript" src="DataTables/datatables.min.js"></script>


	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>






</head>

<body class="cbp-spmenu-push ">

	<div class="main-content ">
		<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
			<!--MENU DE NAVEGAÇÃO FIXO A ESQUERDA-->
			<aside class="sidebar-left .bg-secondary">
				<nav class="navbar navbar-inverse" style="overflow: hidden; height:100%">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- <h1><a class="navbar-brand" href="./"><span class="fa fa-area-chart"></span> Escritório<span class="dashboard_text">Sistema Gestão</span></a></h1> -->
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="sidebar-menu">
							<li class="header">MENU DE NAVEGAÇÃO</li>
							<li class="treeview <?php echo $menu_home ?>">
								<a href="./">
									<i class="fa fa-dashboard font-italic "></i> <span>Home</span>
								</a>
							</li>
							<li class="treeview <?php echo $menu_cadastros ?>">
								<a href="#">
									<i class="fa fa-plus"></i>
									<span>Cadastro e Edição</span>
									<i class="fa fa-angle-left pull-right"></i>
								</a>
								<ul class="treeview-menu">
									<li class="<?php echo $cargos ?>"><a href="index.php?pagina=cargos"><i class="fa fa-angle-right  "></i> Cargos</a></li>

									<li class="<?php echo $departamentos ?>"><a href="index.php?pagina=departamentos"><i class="fa fa-angle-right  "></i> Departamentos</a></li>

									<li class="<?php echo $tipos_empresas ?>"><a href="index.php?pagina=tipos_empresas"><i class="fa fa-angle-right "></i> Tipos de Empresas</a></li>

									<li class="<?php echo $funcionarios?>"><a href="index.php?pagina=funcionarios"><i class="fa fa-angle-right "></i> Funcionários (edição)</a></li>

									<li class="<?php echo $clientes ?>"><a href="index.php?pagina=clientes"><i class="fa fa-angle-right "></i> Clientes</a></li>

									<!-- GRUPOS E ACESSOS -->

									<li><a href="index.php?pagina=grupos"><i class="fa fa-angle-right"></i> Grupos</a></li>

									<li><a href="index.php?pagina=acessos"><i class="fa fa-angle-right"></i> Acessos</a></li>


								</ul>
							</li>


							<li class="treeview <?php echo $menu_pessoas_empresas ?>">
								<a href="#">
									<i class="fa fa-user"></i>
									<span>Pessoas e Empresas</span>
									<i class="fa fa-angle-left pull-right"></i>
								</a>
								<ul class="treeview-menu">

									<li class="<?php echo $mostrar_clientes ?>"><a href="index.php?pagina=mostrar_clientes"><i class="fa fa-angle-right "></i>Ver Clientes</a></li>

									<li class="<?php echo $usuarios ?>"><a href="index.php?pagina=usuarios"><i class="fa fa-angle-right"></i> Funcionários</a></li>

								</ul>
							</li>


							<!-- MENU TAREFAS -->
							<li class="treeview <?php echo $menu_tarefas ?>">
								<a href="#">
									<i class="fa fa-calendar-o"></i>
									<span>Tarefas</span>
									<i class="fa fa-angle-left pull-right"></i>
								</a>
								<ul class="treeview-menu">
									<li class="<?php echo $tarefas_escritorio ?>"><a href="index.php?pagina=tarefas-escritorio"><i class="fa fa-angle-right"></i> Tarefas Escritório</a></li>

									<li class="<?php echo $tarefas ?>"><a href="index.php?pagina=tarefas"><i class="fa fa-angle-right"></i> Minhas Tarefas</a></li>

									<li class="<?php echo $agenda ?>"><a href="index.php?pagina=agenda"><i class="fa fa-angle-right"></i> Agenda de Tarefas</a></li>

								</ul>
							</li>


							<!-- MENU ARQUIVOS -->
							<li class="treeview <?php echo $menu_aquivos ?>">
								<a href="#">
									<i class="fa fa-file-o"></i>
									<span>GED (Arquivos)</span>
									<i class="fa fa-angle-left pull-right"></i>
								</a>
								<ul class="treeview-menu">

									<li class="<?php echo $arquivos ?>"><a href="index.php?pagina=arquivos"><i class="fa fa-angle-right"></i> Cadastro de Arquivos</a></li>

								</ul>
							</li>


							<li class="treeview <?php echo $menu_logs ?>">
								<a href="#">
									<i class="fa fa-lock"></i>
									<span>Logs</span>
									<i class="fa fa-angle-left pull-right"></i>
								</a>
								<ul class="treeview-menu">
									<li class="<?php echo $logs ?>"><a href="index.php?pagina=logs"><i class="fa fa-angle-right"></i> Ver Logs</a></li>

									<li><a href="#" data-toggle="modal" data-target="#RelLogs"><i class="fa fa-angle-right"></i> Relatório de Logs</a></li>

								</ul>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</aside>
		</div>
		<!--left-fixed -navigation-->

		<!-- INICIO DA HEADER -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--BOTÃO MENU LATERAL-->
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>


				<!-- BOTÃO E DROPDOWN DE NOTIFICAÇÕES DE TAREFAS -->
				<div class="profile_details_left <?php echo $notificacao ?>">
					<ul class="nofitications-dropdown">

						<?php

						$hoje = date('Y-m-d');

						$query = $pdo->prepare("SELECT * FROM tarefas WHERE status = 'Agendada' AND usuario = :id_usu AND data <= :hoje OR (MOD(DATEDIFF(:hoje, data_inicio), frequencia) = 0 AND data_inicio = :hoje AND status = 'Agendada' AND usuario = :id_usu)");
						$query->bindValue(':id_usu', $id_usu);
						$query->bindValue(':hoje', $hoje);
						$query->execute();
						$res = $query->fetchAll(PDO::FETCH_ASSOC);
						$tarefas_pendentes = @count($res);
						?>

						<!-- ICONE DE NOTIFICAÇÃO DE TAREFAS -->
						<li class="dropdown head-dpdn">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge red"><?php echo $tarefas_pendentes ?></span></a>
							<ul class="dropdown-menu">
								<li>
									<div class="notification_header">
										<h3>Você possui <?php echo $tarefas_pendentes ?> Tarefas Pendentes!</h3>
									</div>
								</li>

								<?php
								if ($tarefas_pendentes > 0) {
									for ($i = 0; $i < $tarefas_pendentes; $i++) {
										foreach ($res[$i] as $key => $value) {
										}
										$id_tarefa = $res[$i]['id'];
										$titulo_tarefa = $res[$i]['titulo'];
										$hora_tarefa = $res[$i]['hora'];
										$data_tarefa = $res[$i]['data'];

										if ($data_tarefa == null) {
											$data_tarefa = "Hoje(Periódica)";
										}

										$data_tarefa_formatada = implode('/', array_reverse(explode('-', $data_tarefa)));
										if ($hora_tarefa != 'Sem hora') {
											$hora_tarefa = 'às ' . date("H:i", strtotime($hora_tarefa));
										}



								?>
										<li>
											<a href="#">
												<div class="notification_desc">
													<p><i class="fa fa-calendar-o text-danger" style="margin-right: 3px"></i><?php echo $titulo_tarefa ?></p>
													<p><span><?php echo $data_tarefa_formatada ?> <?php echo $hora_tarefa ?></span></p>
												</div>
												<div class="clearfix"></div>
											</a>
											<hr style="margin:2px">
										</li>
								<?php }
								} ?>

								<li>
									<div class="notification_bottom">
										<a href="index.php?pagina=agenda">Ver toda Agenda</a>
									</div>
								</li>
							</ul>
						</li>

					</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="header-right">

				<!-- INÍCIO AREÁ PESSOAL DO USUÁRIO -->
				<div class="profile_details">
					<ul>
						<li class="dropdown profile_details_drop">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><img src="images/perfil/<?php echo $foto_usu ?>" alt="" width="50px" height="50px"> </span>
									<div class="user-name">
										<p><?php echo $nome_usu ?></p>
										<span><?php echo $nivel_usu ?></span>
									</div>
									<i class="fa fa-angle-down lnr"></i>
									<i class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>
								</div>
							</a>
							<ul class="dropdown-menu drp-mnu">

								<li> <a href="#" data-toggle="modal" data-target="#modalPerfil"><i class="fa fa-user"></i> Perfil</a> </li>

								<li class="<?php echo $configuracoes ?>"> <a href="#" data-toggle="modal" data-target="#modalConfig"><i class="fa fa-cog"></i> Configurações</a> </li>

								<li> <a href="../logout.php"><i class="fa fa-sign-out"></i> Logout</a> </li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!-- //header-ends -->




		<!-- main content start-->
		<div id="page-wrapper">
			<?php
			require_once($pagina . '.php');
			?>
		</div>



	</div>

	<!-- new added graphs chart js-->

	<script src="js/Chart.bundle.js"></script>
	<script src="js/utils.js"></script>


	<!-- new added graphs chart js-->

	<!-- Classie --><!-- for toggle left push menu script -->
	<script src="js/classie.js"></script>
	<script>
		var menuLeft = document.getElementById('cbp-spmenu-s1'),
			showLeftPush = document.getElementById('showLeftPush'),
			body = document.body;

		showLeftPush.onclick = function() {
			classie.toggle(this, 'active');
			classie.toggle(body, 'cbp-spmenu-push-toright');
			classie.toggle(menuLeft, 'cbp-spmenu-open');
			disableOther('showLeftPush');
		};


		function disableOther(button) {
			if (button !== 'showLeftPush') {
				classie.toggle(showLeftPush, 'disabled');
			}
		}
	</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->

	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->

	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
		$('.sidebar-menu').SidebarNav()
	</script>
	<!-- //side nav js -->

	<!-- for index page weekly sales java script -->
	<script src="js/SimpleChart.js"></script>



	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"> </script>
	<!-- //Bootstrap Core JavaScript -->

	<!-- Mascaras JS -->
	<script type="text/javascript" src="js/mascaras.js"></script>
	<!-- Ajax para funcionar Mascaras JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>

</body>

</html>




<!-- MODAL PERFIL -->
<div class="modal fade" id="modalPerfil" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Editar Dados</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form-usu">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Nome</label>
								<input type="text" class="form-control" name="nome_usu" value="<?php echo $nome_usu ?>" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>CPF</label>
								<input type="text" class="form-control" id="cpf_usu" name="cpf_usu" value="<?php echo $cpf_usu ?>" required>
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email_usu" value="<?php echo $email_usu ?>" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Senha</label>
								<input type="password" class="form-control" name="senha_usu" value="<?php echo $senha_usu ?>" required>
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<label>Foto</label>
								<input type="file" name="foto" onChange="carregarImg2();" id="foto-usu">
							</div>
						</div>
						<div class="col-md-4">
							<div id="divImg">
								<img src="images/perfil/<?php echo $foto_usu ?>" width="100px" id="target-usu">
							</div>
						</div>

					</div>

					<input type="hidden" name="id_usu" value="<?php echo $id_usu ?>">
					<input type="hidden" name="foto_usu" value="<?php echo $foto_usu ?>">

					<small>
						<div id="msg-usu" align="center" class="mt-3"></div>
					</small>

				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Editar Dados</button>
				</div>
			</form>

		</div>
	</div>
</div>





<!-- MODAL CONFIGURAÇÕES-->
<div class="modal fade" id="modalConfig" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Configurações do Sistema</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="form-config">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>Nome</label>
								<input type="text" class="form-control" name="nome_config" value="<?php echo $nome_sistema ?>" required>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>Telefone</label>
								<input type="text" class="form-control" name="tel_config" id="tel_config" value="<?php echo $tel_sistema ?>">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Endereço</label>
								<input type="text" class="form-control" name="end_config" value="<?php echo $end_sistema ?>">
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" name="email_config" value="<?php echo $email_adm ?>" required>
							</div>
						</div>
						<div class="col-md-2">
							<div class="form-group">
								<label>Capturar Logs</label>
								<select class="form-control" name="logs" required>
									<option <?php if ($logs == 'Sim') { ?>selected <?php } ?> value="Sim">Sim</option>
									<option <?php if ($logs == 'Não') { ?>selected <?php } ?> value="Não">Não</option>
								</select>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label>Dias Limpar Logs</label>
								<input type="number" class="form-control" name="dias_limpar_logs" value="<?php echo $dias_limpar_logs ?>" required>
							</div>
						</div>

						<div class="col-md-3">
							<div class="form-group">
								<label>Relatório PDF / HTML</label>
								<select class="form-control" name="rel" required>
									<option <?php if ($relatorio_pdf == 'pdf') { ?>selected <?php } ?> value="pdf">PDF</option>
									<option <?php if ($relatorio_pdf == 'html') { ?>selected <?php } ?> value="html">HTML</option>
								</select>
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<label>Logo</label>
								<input type="file" name="logo" onChange="carregarImgLogo();" id="foto-logo">
							</div>
						</div>
						<div class="col-md-4">
							<div id="divImgLogo">
								<img src="../img/<?php echo $logo ?>" width="100px" id="target-logo">
							</div>
						</div>



						<div class="col-md-4">
							<div class="form-group">
								<label>Favicon (ico)</label>
								<input type="file" name="favicon" onChange="carregarImgFavicon();" id="foto-favicon">
							</div>
						</div>
						<div class="col-md-2">
							<div id="divImgFavicon">
								<img src="../img/<?php echo $favicon ?>" width="20px" id="target-favicon">
							</div>
						</div>





					</div>


					<div class="row">

						<div class="col-md-3">
							<div class="form-group">
								<label>Img Relatório (*jpg) 200x60</label>
								<input type="file" name="imgRel" onChange="carregarImgRel();" id="foto-rel">
							</div>
						</div>
						<div class="col-md-3">
							<div id="divImgRel">
								<img src="../img/<?php echo $logo_rel ?>" width="100px" id="target-rel">
							</div>
						</div>

					</div>

					<input type="hidden" name="id_usu" value="<?php echo $id_usu ?>">
					<input type="hidden" name="foto_usu" value="<?php echo $foto_usu ?>">

					<small>
						<div id="msg-config" align="center" class="mt-3"></div>
					</small>

				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Editar Dados</button>
				</div>
			</form>

		</div>
	</div>
</div>









<!-- MODAL RELATÓRIOS DE LOGS -->
<div class="modal fade" id="RelLogs" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Relatório de Logs
					<small>(
						<a href="#" onclick="datas('1980-01-01', 'tudo-Logs', 'Logs')">
							<span style="color:#000" id="tudo-Logs">Tudo</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_atual ?>', 'hoje-Logs', 'Logs')">
							<span id="hoje-Logs">Hoje</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_mes ?>', 'mes-Logs', 'Logs')">
							<span style="color:#000" id="mes-Logs">Mês</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_ano ?>', 'ano-Logs', 'Logs')">
							<span style="color:#000" id="ano-Logs">Ano</span>
						</a>
						)</small>



				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" action="rel/logs_class.php" target="_blank">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Data Inicial</label>
								<input type="date" class="form-control" name="dataInicial" id="dataInicialRel-Logs" value="<?php echo date('Y-m-d') ?>" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Data Final</label>
								<input type="date" class="form-control" name="dataFinal" id="dataFinalRel-Logs" value="<?php echo date('Y-m-d') ?>" required>
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Ações</label>
								<select class="form-control" name="acao">
									<option value="">Selecionar Ação</option>
									<option value="login">Login</option>
									<option value="inserção">Inserção</option>
									<option value="exclusão">Exclusão</option>
									<option value="edição">Edição</option>
									<option value="logout">Logout</option>
								</select>
							</div>
						</div>

						<div class="col-md-4">
							<div class="form-group">
								<label>Usuário</label>
								<select class="form-control sel2index" name="usuario" style="width:100%;">
									<option value="">Selecionar Usuário</option>
									<?php
									$query = $pdo->query("SELECT * FROM usuarios order by nome asc");
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
								<label>Tabelas</label>
								<select class="form-control sel2index" name="tabela" style="width:100%;">
									<option value="">Selecionar Tabela</option>
									<?php
									$query = $pdo->query("SELECT table_name FROM information_schema.tables where table_schema = '$banco'");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);

									for ($i = 0; $i < @count($res); $i++) {
										foreach ($res[$i] as $key => $value) {
										}

									?>
										<option value="<?php echo $res[$i]['table_name'] ?>"><?php echo $res[$i]['table_name'] ?></option>

									<?php } ?>
								</select>
							</div>
						</div>

					</div>


				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Gerar Relatório</button>
				</div>
			</form>

		</div>
	</div>
</div>







<!-- MODAL RELATÓRIO FINANCEIRO -->
<div class="modal fade" id="RelFin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">Relatório Financeiro
					<small>(
						<a href="#" onclick="datas('1980-01-01', 'tudo-Fin', 'Fin')">
							<span style="color:#000" id="tudo-Fin">Tudo</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_atual ?>', 'hoje-Fin', 'Fin')">
							<span id="hoje-Fin">Hoje</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_mes ?>', 'mes-Fin', 'Fin')">
							<span style="color:#000" id="mes-Fin">Mês</span>
						</a> /
						<a href="#" onclick="datas('<?php echo $data_ano ?>', 'ano-Fin', 'Fin')">
							<span style="color:#000" id="ano-Fin">Ano</span>
						</a>
						)</small>



				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" action="rel/financeiro_class.php" target="_blank">
				<div class="modal-body">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Data Inicial</label>
								<input type="date" class="form-control" name="dataInicial" id="dataInicialRel-Fin" value="<?php echo date('Y-m-d') ?>" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Data Final</label>
								<input type="date" class="form-control" name="dataFinal" id="dataFinalRel-Fin" value="<?php echo date('Y-m-d') ?>" required>
							</div>
						</div>

					</div>


					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Movimentações em:</label>
								<select class="form-control " name="local_filtro">
									<option value="">Tudo</option>
									<option value="Caixa">Caixa</option>
									<option value="Cartão de Débito">Cartão de Débito</option>
									<option value="Cartão de Crédito">Cartão de Crédito</option>

									<?php
									$query = $pdo->query("SELECT * FROM contas_banco order by nome asc");
									$res = $query->fetchAll(PDO::FETCH_ASSOC);
									for ($i = 0; $i < @count($res); $i++) {
										foreach ($res[$i] as $key => $value) {
										}

									?>
										<option value="<?php echo $res[$i]['nome'] ?>"><?php echo $res[$i]['nome'] ?></option>

									<?php } ?>
								</select>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label>Entrada / Saídas</label>
								<select class="form-control" name="tipo_mov" style="width:100%;">
									<option value="">Tudo</option>
									<option value="Entrada">Entrada</option>
									<option value="Saída">Saída</option>
								</select>
							</div>
						</div>



					</div>


				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Gerar Relatório</button>
				</div>
			</form>

		</div>
	</div>
</div>






<script type="text/javascript">
	function carregarImg2() {
		var target = document.getElementById('target-usu');
		var file = document.querySelector("#foto-usu").files[0];

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
	function carregarImgLogo() {
		var target = document.getElementById('target-logo');
		var file = document.querySelector("#foto-logo").files[0];

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
	function carregarImgFavicon() {
		var target = document.getElementById('target-favicon');
		var file = document.querySelector("#foto-favicon").files[0];

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
	function carregarImgRel() {
		var target = document.getElementById('target-rel');
		var file = document.querySelector("#foto-rel").files[0];

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
	$("#form-usu").submit(function() {

		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: "editar-dados.php",
			type: 'POST',
			data: formData,

			success: function(mensagem) {
				$('#msg-usu').text('');
				$('#msg-usu').removeClass()
				if (mensagem.trim() == "Salvo com Sucesso") {
					location.reload();
				} else {

					$('#msg-usu').addClass('text-danger')
					$('#msg-usu').text(mensagem)
				}


			},

			cache: false,
			contentType: false,
			processData: false,

		});

	});
</script>





<script type="text/javascript">
	$("#form-config").submit(function() {

		event.preventDefault();
		var formData = new FormData(this);

		$.ajax({
			url: "editar-config.php",
			type: 'POST',
			data: formData,

			success: function(mensagem) {
				$('#msg-config').text('');
				$('#msg-config').removeClass()
				if (mensagem.trim() == "Salvo com Sucesso") {
					location.reload();
				} else {

					$('#msg-config').addClass('text-danger')
					$('#msg-config').text(mensagem)
				}


			},

			cache: false,
			contentType: false,
			processData: false,

		});

	});
</script>




<script type="text/javascript">
	$(document).ready(function() {
		$('.sel2index').select2({
			dropdownParent: $('#RelLogs')
		});
	});
</script>

<style type="text/css">
	.select2-selection__rendered {
		line-height: 36px !important;
		font-size: 16px !important;
		color: #666666 !important;

	}

	.select2-selection {
		height: 36px !important;
		font-size: 16px !important;
		color: #666666 !important;

	}
</style>




<script type="text/javascript">
	function datas(data, id, campo) {
		var data_atual = "<?= $data_atual ?>";
		$('#dataInicialRel-' + campo).val(data);
		$('#dataFinalRel-' + campo).val(data_atual);

		document.getElementById('hoje-' + campo).style.color = "#000";
		document.getElementById('mes-' + campo).style.color = "#000";
		document.getElementById(id).style.color = "blue";
		document.getElementById('tudo-' + campo).style.color = "#000";
		document.getElementById('ano-' + campo).style.color = "#000";
		document.getElementById(id).style.color = "blue";
	}
</script>