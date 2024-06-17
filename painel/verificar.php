<?php 
@session_start();

$_SESSION['id_funcionario'];


if(@$_SESSION['id_usuario'] == ""){

echo "<script>window.location='../index.php'</script>";
exit();
}
 ?>
