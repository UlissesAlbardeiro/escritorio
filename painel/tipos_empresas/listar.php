<?php 
require_once("../../conexao.php");

echo <<<HTML
<small>
HTML;
$query = $pdo->query("SELECT * FROM tipos_empresas ORDER BY id desc");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
echo <<<HTML
	<table class="table table-hover" id="tabela">
		<thead> 
			<tr> 
				<th>ID</th> 
				<th>Tipo da empresa</th> 
				
			</tr> 
		</thead> 
		<tbody> 
HTML;
for($i=0; $i < $total_reg; $i++){
	foreach ($res[$i] as $key => $value){}
$id = $res[$i]['id'];
$tipo = $res[$i]['tipo'];
echo <<<HTML
			<tr> 
				<td>{$id}</td> 
				<td>{$tipo}</td>
				<td>
					<big><a href="#" onclick="editar('{$id}', '{$tipo}')" title="Editar Dados"><i class="fa fa-edit text-primary"></i></a></big>
					<big><a href="#" onclick="excluir('{$id}', '{$tipo}')" title="Excluir Item"><i class="fa fa-trash-o text-danger"></i></a></big>
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



	function editar(id, nome){
		$('#id').val(id);
		$('#nome').val(nome);			
			
		$('#tituloModal').text('Editar Registro');
		$('#modalForm').modal('show');
		$('#mensagem').text('');
	}

	function limparCampos(){
		$('#id').val('');
		$('#nome').val('');
	}

</script>



