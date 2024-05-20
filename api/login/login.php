<?php 
$tabela = 'usuarios';
include_once('../conexao.php');

$postjson = json_decode(file_get_contents("php://input"), true);
$senha = md5($postjson['senha']);
$query_buscar = $pdo->prepare("SELECT * from usuarios where (email = :email or cpf = :cpf) and senha_crip = :senha ");
$query_buscar->bindValue(":email", "$postjson[email]");
$query_buscar->bindValue(":cpf", "$postjson[email]");
$query_buscar->bindValue(":senha", "$senha");
$query_buscar->execute();

$dados_buscar = $query_buscar->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($dados_buscar); $i++) { 
    foreach ($dados_buscar[$i] as $key => $value) {
    }
    $id_user = $dados_buscar[$i]['id'];

    $dados[] = array(
        'id' => intVal($dados_buscar[$i]['id']),
        'nome' => $dados_buscar[$i]['nome'],  
        'email' => $dados_buscar[$i]['email'],  
        'nivel' => $dados_buscar[$i]['nivel'],  
    );
}

if(@count($dados_buscar) > 0){
    $result = json_encode(array('result'=>$dados));
    echo $result;

    //inserir log
    $id_usuario = $id_user;
    $acao = 'login';
    $descricao = 'login (App)';    
    require_once("../../painel/inserir-logs.php");

}else{
    $result = json_encode(array('success'=>'Dados Incorretos!'));
 	echo $result;
}

?>