<?php 
include_once('../conexao.php');
$query = $pdo->prepare("SELECT * FROM frequencias order by id asc");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    foreach ($res[$i] as $key => $value) {
    }

    $id_item = $res[$i]['id'];
	$nome_item = $res[$i]['frequencia'];
	$dias = $res[$i]['dias'];

	if($nome_item != 'Uma Vez' and $nome_item != 'Única'){

    $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $res[$i]['frequencia'],
        'dias' => $res[$i]['dias'],
    );

	}
}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>