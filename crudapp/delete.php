<?php 

	include 'database.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM crudtable WHERE id = '".$id."'");