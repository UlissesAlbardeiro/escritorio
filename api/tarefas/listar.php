<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$data = @$_GET['data'];
$data1 = @$_GET['data1'];
$usuario = @$_GET['user']; 
$id_user = @$_GET['id_user'];

if($id_user != ""){
   $usuario = $id_user;
}

$query = $pdo->prepare("SELECT * FROM tarefas where (data BETWEEN '$data' and '$data1') and usuario = '$usuario' ORDER BY data ASC, status asc, hora asc");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);



for ($i=0; $i < count($res); $i++) { 
    $dataF = implode('/', array_reverse(explode('-', $res[$i]['data'])));
    $horaF = date("H:i", strtotime($res[$i]['hora']));

    $id_usu = $res[$i]['usuario'];
    $id_usu_lanc = $res[$i]['usuario'];

    $query2 = $pdo->query("SELECT * FROM usuarios where id = '$id_usu'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    $nome_usu = $res2[0]['nome'];

     $query2 = $pdo->query("SELECT * FROM usuarios where id = '$id_usu_lanc'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    $nome_usu_lanc = $res2[0]['nome'];

    $descricaoF = mb_strimwidth($res[$i]['descricao'], 0, 32, "...");

     if($res[$i]['status'] == 'Agendada'){
        $icone = 'red';
        $card = 'red';
    }else{
        $icone = 'green';
        $card = 'green';
    }  

    $dados[] = array(
        'id' => $res[$i]['id'],
        'titulo' => $res[$i]['titulo'],
        'descricao' => $res[$i]['descricao'],
        'hora' => $res[$i]['hora'],
        'data' => $res[$i]['data'],
        'usuario' => $res[$i]['usuario'],
        'usuario_lanc' => $res[$i]['usuario_lanc'],
        'status' => $res[$i]['status'],
        'obs' => $res[$i]['obs'],       
        'nome_usu' => $nome_usu,
        'nome_usu_lanc' => $nome_usu_lanc,
        'dataF' => $dataF,
        'horaF' => $horaF,
        'descricaoF' => $descricaoF,
        'card' => $card,
        'icone' => $icone,
    );

}



if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>@$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>