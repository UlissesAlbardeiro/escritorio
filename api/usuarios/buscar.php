<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$buscar = '%' .@$_GET['buscar']. '%';

$nivel_usu = @$_GET['nivel'];

if($nivel_usu == 'Gerente'){
    $query = $pdo->prepare("SELECT * FROM usuarios where nivel != 'Gerente' and nivel != 'Administrador' and (nome LIKE '$buscar' or email LIKE '$buscar' or cpf LIKE '$buscar') order by id desc");
}else if($nivel_usu == 'Administrador'){
    $query = $pdo->prepare("SELECT * FROM usuarios where (nome LIKE '$buscar' or email LIKE '$buscar' or cpf LIKE '$buscar') order by id desc");   
}else{
    $query = $pdo->prepare("SELECT * FROM usuarios where nivel = 'Nenhum'");
}


$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    foreach ($res[$i] as $key => $value) {  }
       

    $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $res[$i]['nome'],
        'cpf' => $res[$i]['cpf'],
        'email' => $res[$i]['email'],
        'senha_crip' => $res[$i]['senha_crip'],
        'senha' => $res[$i]['senha'],
        'nivel' => $res[$i]['nivel'],
        'foto' => $res[$i]['foto'],
    );
}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>