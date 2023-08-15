<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Visual database</title>
</head>

<body>
  <p>
    <?PHP
      $db_name = 'information_schema';
      try {
        $db = new PDO("mysql:host=localhost;dbname=$db_name", 'web', '214550');
      } catch (PDOException $e) {
        print "Couldn't connect to the database: " . $e->getMessage();
      }
      $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      print('Connected!!!')
    ?>
  </p>

  <p>
    <?PHP
      $q = $db->query('SELECT now()');
      $count = $q->fetch();
      print_r($count[0]);
    ?>
  </p>

  <p>
    <?PHP
      echo date('l, F jS Y.');
    ?>
  </p>



</body>

</html>