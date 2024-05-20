<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$buscar = '%' .@$_GET['buscar']. '%';

$query = $pdo->prepare("SELECT * from funcionarios where nome LIKE '$buscar' or email LIKE '$buscar' or cpf LIKE '$buscar' order by id desc");

$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    $data_cadF = implode('/', array_reverse(explode('-', $res[$i]['data_cad'])));
    $data_nascF = implode('/', array_reverse(explode('-', $res[$i]['data_nasc'])));
    $cargo = $res[$i]['cargo'];

    $query2 = $pdo->query("SELECT * FROM cargos where id = '$cargo'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    $nome_cargo = $res2[0]['nome'];

    $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $res[$i]['nome'],
        'telefone' => $res[$i]['telefone'],
        'email' => $res[$i]['email'],        
        'cpf' => $res[$i]['cpf'],
        'endereco' => $res[$i]['endereco'],
        'cargo' => $res[$i]['cargo'],
        'data_cad' => $res[$i]['data_cad'],
        'data_nasc' => $res[$i]['data_nasc'],
        'obs' => $res[$i]['obs'],
        'foto' => $res[$i]['foto'],
        'data_cadF' => $data_cadF,
        'data_nascF' => $data_nascF,
        'nome_cargo' => $nome_cargo,
    );

}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>