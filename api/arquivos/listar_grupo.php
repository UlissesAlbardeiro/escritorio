<?php 
include_once('../conexao.php');
$cat = @$_GET['cat'];
$query = $pdo->prepare("SELECT * FROM grupo_arquivos where categoria = '$cat' order by id asc");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    foreach ($res[$i] as $key => $value) {
    }  
	
    $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $res[$i]['nome'],
        
    );

}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>