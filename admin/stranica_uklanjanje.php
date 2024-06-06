<?php 
include_once "../ukljuci/funkcije.php";
include_once "../ukljuci/konekcija.php";
session_start();
if(!isset($_GET['id'])){
	header("Location: stranice.php?poruka=Кликните+на+дугме+на+страници");
	exit();
}
else{
	if(!isset($_SESSION['autor_uloga'])){
		header("Location: prijavljivanje.php?poruka=Молимо+вас+да+се+пријавите");
		exit();
	}
	else{
		if($_SESSION['autor_uloga']!="admin"){
			echo "Немате приступ овој страници";
		}
		else{
			$stranica_id = $_GET['id'];
			$sql = "SELECT * FROM stranica WHERE stranica_id='$stranica_id'";
			$rezultat = mysqli_query($veza, $sql);
			if(mysqli_num_rows($rezultat)<=0){
				//Није пронађена страница
				header("Location: stranice.php?poruka=Страница+није+пронађена");
				exit();
			}
			else{
				$stranica_id = $_GET['id'];
				$sql = "DELETE FROM `stranica` WHERE `stranica_id`='$stranica_id'";
				if(mysqli_query($veza, $sql)){
					header("Location: stranice.php?poruka=Страница+је+уклоњена");
					exit();
				}
				else{
					header("Location: stranice.php?poruka=Није+могуће+избрисати+страницу");
					exit();
				}
			}
		}
	}
}
?>