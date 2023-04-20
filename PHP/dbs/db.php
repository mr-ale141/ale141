<?PHP
try {
  $db = new PDO('mysql:host=192.168.0.200;dbname=blog', 'web', 'Qwerty!214550');
} catch (PDOException $e) {
  print "Couldn't connect to the database: " . $e->getMessage();
}
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

//специальный ошибочный запрос
/*
$result = $db->exec("INSERT INTO dishes (dish_size, dish_name, price, is_spicy)
VALUES ('large', 'Sesame Seed Puff', 2.50, 0)");

if (false === $result) {
  $error = $db->errorInfo();
  print "Couldn't insert!\n";
  print "SQL Error={$error[0]}, DB Error={$error[1]}, Message={$error[2]}\n";
}
*/

/*
$stmt = $db->prepare('INSERT INTO dishes (dish_name, price, is_spicy) VALUES (?, ?, ?)');
$stmt->execute(array($_POST['new_dish_name'], $_POST['new_price'], $_POST['is_spicy']));
*/

// извлечение циклом по одной строке
$q = $db->query('SELECT dish_name, price FROM dishes');
while ($row = $q->fetch()) {
  print "$row[dish_name], $row[price] <br/>";
}
print "<br/>";

// извлечение всех строк из таблицы без организации цикла
$q = $db->query('SELECT dish_name, price FROM dishes');
$rows = $q->fetchAll();
print "{$rows[0][0]}, {$rows[0][1]} <br/>";
print "{$rows[1]['dish_name']}, {$rows[1]['price']} <br/>";
print "{$rows[2]['dish_name']}, {$rows[2]['price']} <br/>";
print "{$rows[3][0]}, {$rows[3]['price']} <br/>";
print "<br/>";
print_r($rows);

print "<br/>";
print "<br/>";

//запрос количества записей в таблице
$q = $db->query('SELECT COUNT(*) FROM dishes');
$count = $q->fetch();
print_r($count);
print "<br/>";
print "Count = $count[0] <br/>";

print "<br/>";

//для извлечения одной записи связываем вызовы query() и fetch() в цепочку
$cheapest_dish_info = $db->query('SELECT dish_name, price
                                  FROM dishes
                                  ORDER BY price
                                  LIMIT 1')->fetch();
print "$cheapest_dish_info[0], $cheapest_dish_info[1] <br/>";
print "<br/>";

//fetch() и fetchAll() первый аргумент: выбор режима ключей
//(строки - PDO::FETCH_ASSOC) (числа - PDO::FETCH_NUM) (оба вместе - по умолчанию)
//(в виде объекта, имена свойств будут соответствовать именам столбцов - PDO::FETCH_OBJ)
$q = $db->query('SELECT dish_name, price FROM dishes');
while ($row = $q->fetch(PDO::FETCH_NUM)) {
  print implode(', ', $row) . "<br/>";
}
print "<br/>";
$q = $db->query('SELECT dish_name, price FROM dishes');
while ($row = $q->fetch(PDO::FETCH_OBJ)) {
  print "{$row->dish_name} has prise {$row->price} <br/>";
}

//Установка стиля извлечения по умолчанию для объукта типа PDOStatement:
//$q->setFetchMode(PDO::FETCH_NUM);
//а для всех запросов:
//$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_NUM);



?>

<!--

"CREATE TABLE dishes (
dish_id int PRIMARY KEY AUTO_INCREMENT,
dish_name VARCHAR(255),
price DECIMAL(4,2),
is_spicy INT
)"

"DROP TABLE dishes"

"INSERT INTO dishes (dish_name, price, is_spicy)
VALUES ('Sesame Seed Puff', 2.50, 0)"

$stmt = $db->prepare('INSERT INTO dishes (dish_name, price, is_spicy) 
                    VALUES (?, ?, ?)');
$stmt->execute(array($_POST['new_dish_name'], $_POST['new_price'], 
                    $_POST['new_is_spicy']));

"UPDATE dishes SET is_spicy = 1, price = price * 2 
WHERE dish_name = 'Lobster with Chili Sauce'"

"DELETE FROM dishes WHERE price > 19.95"

"DELETE FROM dishes"



-->