<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$limite = (isset($_GET['limite'])) ? $_GET['limite'] : 5; 
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1; 

$inicio = ($limite * $pagina) - $limite; 

$query = $pdo->prepare("SELECT * FROM clientes ORDER BY id DESC LIMIT $inicio, $limite");

$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);



for ($i=0; $i < count($res); $i++) { 
    $data_cadF = implode('/', array_reverse(explode('-', $res[$i]['data_cad'])));
    $data_nascF = implode('/', array_reverse(explode('-', $res[$i]['data_nasc'])));

    $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $res[$i]['nome'],
        'telefone' => $res[$i]['telefone'],
        'email' => $res[$i]['email'],
        'ativo' => $res[$i]['ativo'],
        'pessoa' => $res[$i]['pessoa'],
        'doc' => $res[$i]['doc'],
        'endereco' => $res[$i]['endereco'],
        'data_cad' => $res[$i]['data_cad'],
        'data_nasc' => $res[$i]['data_nasc'],
        'obs' => $res[$i]['obs'],
        'data_cadF' => $data_cadF,
        'data_nascF' => $data_nascF,
    );

}



if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>@$dados, 'totalItems'=>@count($dados) + ($inicio)));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>