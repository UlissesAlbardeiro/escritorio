<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$_GET['id'];

$query = $pdo->prepare("SELECT * from funcionarios where id = '$id'");

$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    foreach ($res[$i] as $key => $value) {
    }

    $dados = array(
    'id' => $res[$i]['id'],
        'nome' => $res[$i]['nome'],
        'telefone' => $res[$i]['telefone'],
        'email' => $res[$i]['email'],
        'cargo' => $res[$i]['cargo'],
        'salario' => $res[$i]['salario'],
        'cpf' => $res[$i]['cpf'],
        'endereco' => $res[$i]['endereco'],
        'data_nasc' => $res[$i]['data_nasc'],
        'obs' => $res[$i]['obs'],
        'foto' => $res[$i]['foto'],
        'hora' => $res[$i]['valor_hora'],
        'horaEntrada' => $res[$i]['hora_entrada'],
        'horaSaida' => $res[$i]['hora_saida'],
        'jornada' => $res[$i]['jornada_horas'],
    );
}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'dados'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>