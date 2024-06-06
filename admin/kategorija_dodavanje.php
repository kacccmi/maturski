<?php
include_once "../ukljuci/konekcija.php";
session_start();
if(!isset($_POST['submit'])){
	header("Location: kategorije.php?poruka=Молимо+вас+упишите+категорију");
	exit();
}
else{
	//Провера да ли је сесија активна
	if(!isset($_SESSION['autor_uloga'])){
		header("Location: prijavljivanje.php");
	}
	else{
		//Провера да ли корисник има улогу администратора
		if($_SESSION['autor_uloga']!="admin"){
			echo "Немате приступ овој страници";
			exit();
		}
		else if($_SESSION['autor_uloga']=="admin"){
			//Додавање нове категорије
			$kategorija_naziv = $_POST['kategorija_naziv'];
			$sql = "INSERT INTO kategorija (`kategorija_naziv`) VALUES ('$kategorija_naziv');";
			if(mysqli_query($veza, $sql)){
				header("Location: kategorije.php?poruka=Успешно+додата+категорија");
				exit();
			}
			else{
				header("Location: kategorije.php?poruka=Грешка");
				exit();
			}
		}
	}
}
?>