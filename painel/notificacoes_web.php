<?php

$dia_atual = date('Y-m-d');

$query2 = $pdo->query("SELECT * FROM tarefas where data <= '$dia_atual' and usuario = '$id_usu' and status = 'Agendada' order by data asc ");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
$tarefas_pendentes_hoje = @count($res2);

$query = $pdo->query("SELECT * FROM tarefas where data <= '$dia_atual' and usuario = '$id_usu' and status = 'Agendada' order by data asc limit 6 ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$tarefas_pendentes_taref_limit = @count($res);


if ($tarefas_pendentes_taref_limit > 0) {
    for ($i = 0; $i < $tarefas_pendentes_taref_limit; $i++) {
        foreach ($res[$i] as $key => $value) {
        }
        $id_taref = $res[$i]['id'];
        $titulo_taref = $res[$i]['titulo'];
        $hora_tarefa = $res[$i]['hora'];
        $data_taref = $res[$i]['data'];

        $dataF_taref = implode('/', array_reverse(explode('-', $data_taref)));

        if ($hora_tarefa != 'Sem hora') {
            $hora_formatada_tarefa = 'às ' . date("H:i", strtotime($hora_tarefa));
        } else {
            $hora_formatada_tarefa = $hora_tarefa;
        }
    }
}
