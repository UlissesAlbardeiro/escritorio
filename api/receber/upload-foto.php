<?php
    move_uploaded_file($_FILES['photo']['tmp_name'], '../../painel/images/contas/' . $_FILES['photo']['name']);
?>