<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Visual database</title>
</head>

<body>
  <p>
    <?PHP
      $db_info_name = 'information_schema';
      $db_name = 'sakila';
      try {
        $db_info = new PDO("mysql:host=localhost;dbname=$db_info_name", 'web', '214550');
      } catch (PDOException $e) {
        print "Couldn't connect to the database: " . $e->getMessage();
      }
      $db_info->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      print('Connected db_info!!!');
    ?>
  </p>

  <p>
    <?PHP
      $q = $db_info->query(
      "SELECT 
        REFERENCED_TABLE_NAME,
        REFERENCED_COLUMN_NAME,
        TABLE_NAME,
        COLUMN_NAME
      FROM key_column_usage
      WHERE 
        REFERENCED_TABLE_SCHEMA = '$db_name' AND
        REFERENCED_TABLE_NAME IS NOT NULL
      ORDER BY
        REFERENCED_TABLE_NAME,
        REFERENCED_COLUMN_NAME
      ");
      $count = $q->fetch();
      print_r($count);
    ?>
  </p>

  <p>
    <?PHP
      echo date('l, F jS Y.');
    ?>
  </p>

  <p>
    <?PHP
      
    ?>
  </p>

</body>

</html>