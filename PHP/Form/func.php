<?PHP
if ('POST' == $_SERVER['REQUEST_METHOD']) {
  if ($form_errors = validate_form()) {
    show_form($form_errors);
  } else {
    process_form();
  }
} else {
  show_form();
}

  function process_form() {
  print "Hello, " . $_POST['my_name'] . "<br>";
} 

  function show_form($errors = []) {
  if ($errors) {
    print 'Please correct these errors: <ul><li>';
    print implode('</li><li>', $errors);
    print '</li></ul>';
  }

  print <<<_HTML_
  <form method="post" action="$_SERVER[PHP_SELF]">
    Your name: <input type="text" name="my_name" >
  <br />
  <input type="submit" value="Say Hello">
  </form>
  _HTML_;
}

function validate_form() {
  $errors = array();

  if (strlen($_POST['my_name']) < 3) {
    $errors[] = 'Your name must be at least 3 letters long.';
  }
  
  if (strlen($_POST['my_name']) == 0) {
    $errors[] = 'Your must enter name.';
  }

  return $errors;
}
?>