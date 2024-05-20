<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$data = @$_GET['data'];
$data1 = @$_GET['data1'];
$buscar = '%' .@$_GET['buscar']. '%';

$query = $pdo->prepare("SELECT * FROM arquivos where (data_cad BETWEEN '$data' and '$data1') and (nome LIKE '$buscar' or numero LIKE '$buscar') ORDER BY data_cad ASC, id asc");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);


for ($i=0; $i < count($res); $i++) { 

$id = $res[$i]['id'];
$descricao = $res[$i]['descricao'];
$numero = $res[$i]['numero'];
$setor = $res[$i]['setor'];
$data_cad = $res[$i]['data_cad'];
$vencimento = $res[$i]['vencimento'];
$nome = $res[$i]['nome'];
$categoria = $res[$i]['categoria'];
$grupo = $res[$i]['grupo'];
$fornecedor = $res[$i]['fornecedor'];
$cliente = $res[$i]['cliente'];
$funcionario = $res[$i]['funcionario'];
$usuario_cad = $res[$i]['usuario_cad'];
$usuario_editou = $res[$i]['usuario_editou'];
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

$data_cadF = implode('/', array_reverse(explode('-', $data_cad)));
$data_vencF = implode('/', array_reverse(explode('-', $vencimento)));

$query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario_cad'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_usu_lanc = $res2[0]['nome'];
}else{
    $nome_usu_lanc = 'Sem Usuário';
}

$query2 = $pdo->query("SELECT * FROM usuarios where id = '$usuario_editou'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_usu_edit = $res2[0]['nome'];
}else{
    $nome_usu_edit = 'Sem Usuário';
}



$query2 = $pdo->query("SELECT * FROM setor_arquivos where id = '$setor'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_setor = $res2[0]['nome'];
}else{
    $nome_setor = 'Não Definido';
}


$query2 = $pdo->query("SELECT * FROM cat_arquivos where id = '$categoria'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_cat = $res2[0]['nome'];
}else{
    $nome_cat = 'Não Definido';
}


$query2 = $pdo->query("SELECT * FROM grupo_arquivos where id = '$grupo'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_grupo = $res2[0]['nome'];
}else{
    $nome_grupo = 'Não Definido';
}


$query2 = $pdo->query("SELECT * FROM fornecedores where id = '$fornecedor'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_forn = $res2[0]['nome'];
}else{
    $nome_forn = 'Não Definido';
}


$query2 = $pdo->query("SELECT * FROM funcionarios where id = '$funcionario'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_func = $res2[0]['nome'];
}else{
    $nome_func = 'Não Definido';
}


$query2 = $pdo->query("SELECT * FROM clientes where id = '$cliente'");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
if(@count($res2) > 0){
    $nome_cli = $res2[0]['nome'];
}else{
    $nome_cli = 'Não Definido';
}


if($vencimento != '0000-00-00' and $vencimento < date('Y-m-d')){
    $classe_venc = 'red';   
}else{
    $classe_venc = '';  
}

if($vencimento == '0000-00-00'){
    $data_vencF = 'Sem Vencimento';
}

    $dados[] = array(
        'id' => $res[$i]['id'],
        'numero' => $res[$i]['numero'],
        'nome' => $res[$i]['nome'],
        'descricao' => $res[$i]['descricao'],
        'setor' => $nome_setor,
        'categoria' => $nome_cat,
        'grupo' => $nome_grupo,
        'fornecedor' => $nome_forn,
        'cliente' => $nome_cli,
        'funcionario' => $nome_func,       
        'arquivo' => $res[$i]['arquivo'],
        'data_cad' => $data_cadF,
        'data_venc' => $data_vencF,
        'usuario_cad' => $nome_usu_lanc,       
        'usuario_editou' => $nome_usu_edit,
        'classe_venc' => $classe_venc,
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