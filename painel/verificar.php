<?php
@session_start();

$_SESSION['id_funcionario'];
/* $_SESSION['nivel_usuario']; */




if (@$_SESSION['id_usuario'] == "") {

    echo "<script>window.location='../index.php'</script>";
    exit();
}
