<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$id = @$_GET['id'];

$query = $pdo->prepare("SELECT * from arquivos where id = '$id'");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) { 
    foreach ($res[$i] as $key => $value) {
    }   

 
$arquivo = $res[$i]['arquivo'];

//extensão do arquivo
$ext = pathinfo($arquivo, PATHINFO_EXTENSION);
if($ext == 'pdf'){
    $tumb_arquivo = 'pdf.png';
}else if($ext == 'rar' || $ext == 'zip'){
    $tumb_arquivo = 'rar.png';
}else if($ext == 'doc' || $ext == 'docx' || $ext == 'txt'){
    $tumb_arquivo = 'word.png';
}else if($ext == 'xlsx' || $ext == 'xlsm' || $ext == 'xls'){
    $tumb_arquivo = 'excel.png';
}else if($ext == 'xml'){
    $tumb_arquivo = 'xml.png';
}else{
    $tumb_arquivo = $arquivo;
}

    $dados = array(
    'id' => $res[$i]['id'],
        'numero' => $res[$i]['numero'],
        'nome' => $res[$i]['nome'],
        'descricao' => $res[$i]['descricao'],
        'setor' => $res[$i]['setor'],
        'categoria' => $res[$i]['categoria'],  
        'grupo' => $res[$i]['grupo'],
        'fornecedor' => $res[$i]['fornecedor'],  
        'cliente' => $res[$i]['cliente'],
        'funcionario' => $res[$i]['funcionario'],  
        'foto' => $tumb_arquivo,         
        'data_venc' => $res[$i]['vencimento'],        

    );
}

if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'dados'=>$dados));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>