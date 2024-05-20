<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$limite = (isset($_GET['limite'])) ? $_GET['limite'] : 5; 
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1; 

$inicio = ($limite * $pagina) - $limite; 
$nivel_usu = @$_GET['nivel'];

if($nivel_usu == 'Gerente'){
    $query = $pdo->prepare("SELECT * FROM usuarios where nivel != 'Gerente' and nivel != 'Administrador' ORDER BY id DESC LIMIT $inicio, $limite");
}else if($nivel_usu == 'Administrador'){
    $query = $pdo->prepare("SELECT * FROM usuarios  ORDER BY id DESC LIMIT $inicio, $limite");   
}else{
    $query = $pdo->prepare("SELECT * FROM usuarios where nivel = 'Nenhum'");
}

$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    

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
    $result = json_encode(array('success'=>true, 'resultado'=>@$dados, 'totalItems'=>@count($dados) + ($inicio)));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>