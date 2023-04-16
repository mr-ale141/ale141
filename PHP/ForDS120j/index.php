<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Афоризмы</title>
  <link rel="stylesheet" type="text/css" href="./index.css">
  <link rel="shortcut icon" href="./lamp.ico" type="image/x-icon">
</head>

<body>
  <h1>Случайный афоризм</h1>
  <a href="/index.php">Следующий</a>
  <p>
    <?PHP
    $content = file_get_contents('./aforizm.txt');
    $aforizms = explode("\n", $content);
    $ramd_num = rand(0, count($aforizms) - 1);
    print($aforizms[$ramd_num]);
    ?>
  </p>
</body>

</html>