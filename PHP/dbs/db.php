<?PHP
try {
  $db = new PDO('mysql:host=192.168.0.200;dbname=blog', 'web', 'Qwerty!214550');
  $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  print "Couldn't connect to the database: " . $e->getMessage();
}

$result = $db->exec("INSERT INTO dishes (dish_size, dish_name, price, is_spicy)
VALUES ('large', 'Sesame Seed Puff', 2.50, 0)");

if (false === $result) {
  $error = $db->errorInfo();
  print "Couldn't insert!\n";
  print "SQL Error={$error[0]}, DB Error={$error[1]}, Message={$error[2]}\n";
}

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