<?PHP
  $db_info_name = 'information_schema';
  $db_name = 'sakila';
  try {
    $db_info = new PDO("mysql:host=localhost;dbname=$db_info_name", 'web', '214550');
    $db_info->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db_info->exec('SET NAMES "utf8"');
  } catch (PDOException $e) {
    $error = "Couldn't connect to the database 'db_info': " . $e->getMessage();
    include 'error.html.php';
    exit();
  }
  
  try {
    $db = new PDO("mysql:host=localhost;dbname=$db_name", 'web', '214550');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $db->exec('SET NAMES "utf8"');
  } catch (PDOException $e) {
    $error = "Couldn't connect to the database 'db': " . $e->getMessage();
    include 'error.html.php';
    exit();
  }

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
      REFERENCED_COLUMN_NAME"
  );
  $all_ref = $q->fetchAll(PDO::FETCH_ASSOC);
  /*
  echo '<h2>All Ref</h2>';
  echo count($all_ref);
  echo '<pre>';
  print_r($all_ref[0]);
  echo '</pre>';
  */
  
  $q = $db->query("SHOW tables");
  $tables = $q->fetchAll(PDO::FETCH_ASSOC);
  /*
  echo '<h2>Tables</h2>';
  echo count($tables);
  echo '<pre>';
  print_r($tables[0]);
  echo '</pre>';
  */
  
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
      count_ref DESC, ref_tab"
  );
  $raiting_table_ref = $q->fetchAll(PDO::FETCH_ASSOC);
  /*
  echo '<h2>Raiting table ref</h2>';
  echo count($raiting_table_ref);
  echo '<pre>';
  print_r($raiting_table_ref[0]);
  echo '</pre>';
  */
  
  $word = 'city';
  $q = $db_info->query(
    "SELECT 
      REFERENCED_TABLE_NAME AS ref_tab,
      REFERENCED_COLUMN_NAME AS ref_col,
      TABLE_NAME AS tab,
      COLUMN_NAME AS col
    FROM key_column_usage
    WHERE 
      REFERENCED_TABLE_SCHEMA = '$db_name' AND
      (
        REFERENCED_TABLE_NAME LIKE '%$word%' OR
        REFERENCED_COLUMN_NAME LIKE '%$word%' OR
        TABLE_NAME LIKE '%$word%' OR
        COLUMN_NAME LIKE '%$word%'
      ) AND
      REFERENCED_TABLE_NAME IS NOT NULL
    ORDER BY
      REFERENCED_TABLE_NAME,
      REFERENCED_COLUMN_NAME"
  );
  $all_ref_word = $q->fetchAll(PDO::FETCH_ASSOC);

  $table = $raiting_table_ref;
  include 'table.html.php';
  