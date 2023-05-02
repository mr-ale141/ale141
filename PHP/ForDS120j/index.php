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
  <p class="aforizm">
    <?PHP
    try {
      $db = new PDO('mysql:host=localhost;dbname=blog', 'web', 'Qwerty!214550');
    } catch (PDOException $e) {
      print "Couldn't connect to the database: " . $e->getMessage();
    }
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $q = $db->query('SELECT COUNT(*) FROM aforizms');
    $count = $q->fetch()['COUNT(*)'];
    $rand_num = rand(1, $count + 1);

    $rand_aforizm = $db->query(
      "SELECT aforizm, author
      FROM aforizms
      WHERE aforizm_id = $rand_num"
    )->fetch();
    $db = NULL;
    print($rand_aforizm['aforizm']);
    ?>
  </p>
  <p class="author">
    <?php
    print($rand_aforizm['author']);
    ?>
  </p>
</body>
</html>