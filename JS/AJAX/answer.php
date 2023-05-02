<?php
header("Access-Control-Allow-Origin: http://127.0.0.1:5500");
$answer = array('status' => 'good', 'body' => 'what is need');
echo json_encode($answer);
?>
