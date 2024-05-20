<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$data = @$_GET['data'];
$data1 = @$_GET['data1'];

$query = $pdo->prepare("SELECT * FROM receber where (data_venc BETWEEN '$data' and '$data1') and pago = 'Não' ORDER BY data_venc ASC, id asc");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);



for ($i=0; $i < count($res); $i++) { 
    $data_vencF = implode('/', array_reverse(explode('-', $res[$i]['data_venc'])));
    $data_lancF = implode('/', array_reverse(explode('-', $res[$i]['data_lanc'])));
    $data_pgtoF = implode('/', array_reverse(explode('-', $res[$i]['data_pgto'])));
    $valorF = number_format($res[$i]['valor'], 2, ',', '.');
   
    $usuario_lanc = $res[$i]['usuario_lanc'];
    $usuario_pgto = $res[$i]['usuario_pgto'];
    $pessoa = $res[$i]['pessoa'];
    $frequencia = $res[$i]['frequencia'];

    $query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario_lanc'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    if(@count($res2) > 0){
        $nome_usuario_lanc = $res2[0]['nome'];
    }else{
        $nome_usuario_lanc = 'Sem Usuário';
    }
    

     $query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario_pgto'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    if(@count($res2) > 0){
        $nome_usuario_pgto = $res2[0]['nome'];
    }else{
        $nome_usuario_pgto = 'Sem Usuário';
    }

     $query2 = $pdo->query("SELECT * FROM fornecedores where id = '$pessoa'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    if(@count($res2) > 0){
        $nome_pessoa = $res2[0]['nome'];
    }else{
        $nome_pessoa = 'Sem Fornecedor';
    }

    $query2 = $pdo->query("SELECT * FROM frequencias where dias = '$frequencia'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    if(@count($res2) > 0){
        $nome_frequencia = $res2[0]['frequencia'];
    }else{
        $nome_frequencia = 'Indefinida';
    }

    $descricaoF = mb_strimwidth($res[$i]['descricao'], 0, 32, "...");

     if($res[$i]['pago'] == 'Não'){
        $icone = 'red';
        $card = 'red';
    }else{
        $icone = 'green';
        $card = 'green';
    }  

$arquivo = $res[$i]['arquivo'];
    //extensão do arquivo
$ext = pathinfo($arquivo, PATHINFO_EXTENSION);
if($ext == 'pdf'){
    $tumb_arquivo = 'pdf.png';
}else if($ext == 'rar' || $ext == 'zip'){
    $tumb_arquivo = 'rar.png';
}else if($ext == 'doc' || $ext == 'docx'){
    $tumb_arquivo = 'word.png';
}else{
    $tumb_arquivo = $arquivo;
}

    $dados[] = array(
        'id' => $res[$i]['id'],
        'pessoa' => $nome_pessoa,
        'descricaoF' => $descricaoF,
        'descricao' => $res[$i]['descricao'],
        'valor' => $valorF,
        'data_lanc' => $data_lancF,
        'data_venc' => $data_vencF,
        'data_pgto' => $data_pgtoF,
        'usuario_lanc' => $nome_usuario_lanc,
        'usuario_pgto' => $nome_usuario_pgto,       
        'frequencia' => $nome_frequencia,
        'saida' => $res[$i]['saida'],
        'arquivo' => $res[$i]['arquivo'],
        'pago' => $res[$i]['pago'],        
        'card' => $card,
        'icone' => $icone,
        'tumb' => $tumb_arquivo,
    );

}



if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>@$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>