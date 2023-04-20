<?PHP
try {
  $db = new PDO('mysql:host=localhost;dbname=blog', 'web', '214550');
} catch (PDOException $e) {
  print "Couldn't connect to the database: " . $e->getMessage();
}
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$result = $db->exec("CREATE TABLE blog.aforizms (
aforizm_id int PRIMARY KEY AUTO_INCREMENT,
aforizm TEXT,
author VARCHAR(255)
)");

if (false === $result) {
  $error = $db->errorInfo();
  print "Couldn't execute!\n";
  print "SQL Error={$error[0]}, DB Error={$error[1]}, Message={$error[2]}\n";
}

print("<pre>");
$content = file_get_contents('aforizm.txt');
$string = explode("\n", $content);
for ($i = 0; $i < count($string); $i += 2) {
  $stmt = $db->prepare('INSERT INTO blog.aforizms (aforizm, author) VALUES (?, ?)');
  $stmt->execute(array($string[$i], $string[$i + 1]));
}

print_r($string);

$q = $db->query('SELECT aforizm, author FROM blog.aforizms');
while ($row = $q->fetch()) {
  print "$row[aforizm] Author: $row[author] <br/>";
}
print "<br/>";

?>
