<?php

session_start();

$_SESSION['NUSERID'] = 1;

$dbConnect = new PDO('mysql:dbname=todolist; host=localhost', 'root', '');
?>
