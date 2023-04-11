<?PHP
if ('POST' == $_SERVER['REQUEST_METHOD']) {
  print "Hello, " . $_POST['my_name'] . "<br>";
  print $_SERVER['PHP_SELF'];
} else {
  print <<<_HTML_
  <form method="post" action="$_SERVER[PHP_SELF]">
    Your name: <input type="text" name="my_name" >
  <br />
  <input type="submit" value="Say Hello">
  </form>
  _HTML_;
}
?>

Полезные серверные переменные:

QUERY_STRING - часть URL после ?
PATH_INFO - часть URL после первой /
SERVER_NAME - часть URL до первой /
DOCUMENT_ROOT - каталог с сайтом на компе
REMOTE_ADDR - IP адрес пользователя, посылаающего запрос
REMOTE_HOST - имая хоста пользователя (используется редко)
HTTP_REFERER - ссылка для доступа к странице (правильно HTTP_REFERRER)
HTTP_USER_AGENT - веб-браузер, извлекающий страницу

Доступ к параметрам формы:

GET - массив $_GET со значениями из Query-string
POST - массив $_POST со значениями из формы

<br />
<br />

<form method="post" action="form.php">
  <input type="text" name="product_id">
  <select name="category">
    <option value="ovenmitt">Pot Holder</option>
    <option value="fryingpan">Frying Pan</option>
    <option value="torch">Kitchen Torch</option>
  </select>
  <input type="submit" value="submit">
</form>

Here are the submitted values:
<br />
product_id: <?PHP print $_POST['product_id'] ?? '' // нулеобъединяющая операция 
            ?>
<br />
category: <?PHP print $_POST['category'] ?? '' ?>

<br />

<br />

<form method="post" action="form.php">
  <select name="lunch[]" multiple>
    <option value="pork">Pork</option>
    <option value="chicken">Chicken</option> <!-- $_PHP['lunch'][] = 'chicken' -->
    <option value="lotus">Lotus</option>
  </select>
  <input type="submit" value="submit">
</form>

Selected buns:
<br />
<?PHP
if (isset($_POST['lunch'])) {
  foreach ($_POST['lunch'] as $choice) {
    print "You want a $choice bun. <br/>";
  }
}
?>