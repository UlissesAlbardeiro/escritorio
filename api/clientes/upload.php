<?php
    move_uploaded_file($_FILES['photo']['tmp_name'], '../../painel/images/arquivos/' . $_FILES['photo']['name']);
?>