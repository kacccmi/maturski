<?php
include_once "../ukljuci/konekcija.php";
session_start();
if(!isset($_POST['dodavanje'])){
	header("Location: stranice.php?poruka=Молимо+вас+да+попуните+образац");
	exit();
}
else{
	if(!isset($_SESSION['autor_uloga'])){
		header("Location: prijavljivanje.php");
	}
	else{
		if($_SESSION['autor_uloga']!="admin"){
			echo "Немате приступ овој страници";
			exit();
		}
		else if($_SESSION['autor_uloga']=="admin"){
			$stranica_naslov = $_POST['stranica_naslov'];
			$stranica_sadrzaj = $_POST['stranica_sadrzaj'];
			$sql = "INSERT INTO stranica (`stranica_naslov`, `stranica_sadrzaj`) VALUES ('$stranica_naslov', '$stranica_sadrzaj');";
			if(mysqli_query($veza, $sql)){
				header("Location: stranice.php?poruka=Страница+је+успешно+додата");
				exit();
			}
			else{
				header("Location: stranice.php?poruka=Грешка");
				exit();
			}
		}
	}
}
?>