<?php
    move_uploaded_file($_FILES['photo']['tmp_name'], '../../painel/images/perfil/' . $_FILES['photo']['name']);
?>