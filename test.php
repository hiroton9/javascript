<?php
// タブ html bootstrap 
// http://symfoware.blog68.fc2.com/blog-entry-1451.html
// https://www.google.co.jp/search?q=%E3%82%BF%E3%83%96+html+bootstrap&ie=utf-8&oe=utf-8&hl=ja
$a = isset($_REQUEST['a']) ? $_REQUEST['a'] : '0';
$ini_arr = parse_ini_file("test.ini",true);
?>
<!DOCTYPE html>
<html lang="ja">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap</title>
    <!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
 </head>
 <body>
    <ul class="nav nav-tabs" role="tablist">
    <!--
      <ul class="nav nav-pills" role="tablist">
     -->
     <li <?php echo ($a === '0') ? 'class="active"' : ''; ?>><a href="?a=0">ホーム</a></li>
     <li <?php echo ($a === '1') ? 'class="active"' : ''; ?>><a href="?a=1">プロフィール</a></li>
     <li <?php echo ($a === '2') ? 'class="active"' : ''; ?>><a href="?a=2">テスト</a></li>
    </ul>
<pre>
<?php
    print_r($ini_arr['aaa.' . $a]);
?>
</pre>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
    <!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
 </body>
</html>
