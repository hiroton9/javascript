aaa
<?php

header("Content-Type: application/json; charset=utf-8");

$link = mysql_connect('localhost', 'root', '');
if (!$link) {
    die('接続失敗です。'.mysql_error());
}

$db_selected = mysql_select_db('test', $link);
if (!$db_selected){
    die('データベース選択失敗です。'.mysql_error());
}

$result = mysql_query('SELECT id,name FROM tab');
if (!$result) {
    die('クエリーが失敗しました。'.mysql_error());
}

$d = array();
while ($row = mysql_fetch_assoc($result)) {
    $d[] = array(
        'id'   => $row['id'],
        'name' => $row['name'],
    );
}

$close_flag = mysql_close($link);

if (!$close_flag){
    print('<p>切断に失敗しました。</p>');
}

echo json_encode($d);
