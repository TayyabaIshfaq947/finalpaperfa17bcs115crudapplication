<?php 
	include 'database.php';
	$id = $_POST['id'];
	$name = $_POST['name'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];
	$link->query("UPDATE crudtable SET name = '".$name."',email = '".$email."',phone = '".$phone."',address = '".$address."' WHERE id = '".$id."'");
?>