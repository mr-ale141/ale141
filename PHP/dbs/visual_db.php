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
      try {
        $db = new PDO("mysql:host=localhost;dbname=$db_name", 'web', '214550');
      } catch (PDOException $e) {
        print "Couldn't connect to the database: " . $e->getMessage();
      }
      $db_info->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      print('Connected db!!!');
    ?>
  </p>

  <pre>
    <?PHP
      $q = $db_info->query(
      "SELECT 
        REFERENCED_TABLE_NAME AS ref_tab,
        REFERENCED_COLUMN_NAME AS ref_col,
        TABLE_NAME AS tab,
        COLUMN_NAME AS col
      FROM key_column_usage
      WHERE 
        REFERENCED_TABLE_SCHEMA = '$db_name' AND
        REFERENCED_TABLE_NAME IS NOT NULL
      ORDER BY
        REFERENCED_TABLE_NAME,
        REFERENCED_COLUMN_NAME
      ");
      $all_ref = $q->fetchAll();
      print_r($all_ref);
    ?>
  </pre>

  <pre>
    <?PHP
      $q = $db->query("SHOW tables");
      $tables = $q->fetchAll();
      print_r($tables);
    ?>
  </pre>

  <pre>
    <?PHP
      $q = $db_info->query(
      "SELECT 
          REFERENCED_TABLE_NAME AS ref_tab,
          count(*) AS count_ref
        FROM key_column_usage
        WHERE 
          REFERENCED_TABLE_SCHEMA = '$db_name' AND
          REFERENCED_TABLE_NAME IS NOT NULL
        GROUP BY
          REFERENCED_TABLE_NAME
        ORDER BY
          count_ref DESC, ref_tab
        "
      );
      $raiting_table_ref = $q->fetchAll();
      print_r($raiting_table_ref);
    ?>
  </pre>
  
  <pre>
    <?PHP
      
    ?>
  </pre>

</body>

</html>