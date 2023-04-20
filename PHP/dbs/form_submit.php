<?PHP
require 'FormHelper.php';

try {
  $db = new PDO('mysql:host=192.168.0.200;dbname=blog', 'web', 'Qwerty!214550');
} catch (PDOException $e) {
  print "Couldn't connect to the database: " . $e->getMessage();
}
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  list($errors, $input) = validate_form();
  if ($errors) {
    show_form($errors);
  } else {
    process_form($input);
  }
} else {
  show_form();
}

function show_form($errors = array()) {
  $defaults = array('price' => '5.00');
  $form = new FormHelper($defaults);
  include 'insert-form.php';
}

function validate_form() {
  $input = array();
  $errors = array();
  $input['dish_name'] = trim($_POST['dish_name'] ?? '');
  if (! strlen($input['dish_name'])) {
    $errors[] = 'Please enter the name of the dish.';
  }
  $input['price'] = filter_input(INPUT_POST, 'price', FILTER_VALIDATE_FLOAT);
  if ($input['price'] <= 0) {
    $errors[] = 'Please enter a valid price.';
  }
  $input['is_spicy'] = $_POST['is_spicy'] ?? 'no';
  return array($errors, $input);
}

function process_form($input) {
  global $db;
  if ($input['is_spicy'] == 'yes') {
    $is_spicy = 1;
  } else {
    $is_spicy = 0;
  }
  try {
    $stmt = $db->prepare('INSERT INTO dishes (dish_name, price, is_spicy) VALUES (?, ?, ?)');
    $stmt->execute(array($input['dish_name'], $input['price'], $is_spicy));
    print 'Added ' . htmlentities($input['dish_name']) . ' to the database.';
  } catch (PDOException $e) {
    print "Couldn't add your dish to the database.";
  }
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