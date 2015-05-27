<html>
<head>
<title>PHP TEST</title>
</head>
<body>

<?php

header('Content-type: text/html; charset=UTF-8');

$link = mysql_connect('localhost', 'root', '');
if (!$link) {
    die('接続失敗です。'.mysql_error());
}

print('<p>接続に成功しました。</p>');

$db_selected = mysql_select_db('test', $link);
if (!$db_selected){
    die('データベース選択失敗です。'.mysql_error());
}

print('<p>データベースを選択しました。</p>');


$result = mysql_query('SELECT id,name FROM tab');
if (!$result) {
    die('クエリーが失敗しました。'.mysql_error());
}

while ($row = mysql_fetch_assoc($result)) {
    print('<p>');
    print('id='.$row['id']);
    print(',name='.$row['name']);
    print('</p>');
}

$close_flag = mysql_close($link);

if ($close_flag){
    print('<p>切断に成功しました。</p>');
}

?>
</body>
</html>
