<?php 
require_once("../../conexao.php");
@session_start();
$data_atual = date('Y-m-d');
echo <<<HTML
<small>
HTML;

$query = $pdo->query("SELECT * FROM usuarios  ORDER BY id desc");	
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
echo <<<HTML
	<table class="table table-hover" id="tabela">
		<thead> 
			<tr> 				
				<th>Nome</th>
				<th class="esc">Telefone</th> 
				<th class="esc">Email</th> 
				<th class="esc">Nível</th>				
				<th>Ações</th>
			</tr> 
		</thead> 
		<tbody> 
HTML;
for($i=0; $i < $total_reg; $i++){
	foreach ($res[$i] as $key => $value){}
$id = $res[$i]['id'];
$nome = $res[$i]['nome'];
$telefone = $res[$i]['telefone'];
$email = $res[$i]['email'];
$nivel = $res[$i]['nivel'];
$foto = $res[$i]['foto'];


echo <<<HTML
			<tr> 
				<td>
				<img src="images/perfil/{$foto}" width="27px" class="mr-2">
				{$nome}
				</td> 
				<td class="esc">{$telefone}</td>
				<td class="esc">{$email}</td>
				<td class="esc">{$nivel}</td>
				<td>
				
					<big><a href="#" onclick="mostrar('{$id}', '{$nome}', '{$telefone}','{$email}','{$nivel}','{$foto}')" title="Ver Dados"><i class="fa fa-info-circle text-secondary"></i></a></big>

					
				</td>  
			</tr> 
HTML;
}
echo <<<HTML
		</tbody> 
	</table>
</small>
HTML;
}else{
	echo 'Não possui nenhum registro cadastrado!';
}

?>


<script type="text/javascript">


	$(document).ready( function () {
	    $('#tabela').DataTable({
	    	"ordering": false,
	    	"stateSave": true,
	    });
	    $('#tabela_filter label input').focus();
	} );



	
	function mostrar(id, nome, telefone, email, nivel, foto){
		
		
		$('#nome_mostrar').text(nome);
		$('#telefone_mostrar').text(telefone);
		$('#email_mostrar').text(email);
		$('#cargo_mostrar').text(nivel);
		
		$('#target_mostrar').attr('src','images/perfil/' + foto);	

		$('#modalMostrar').modal('show');		
	}

	

</script>



