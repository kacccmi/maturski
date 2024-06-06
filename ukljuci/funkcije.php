<?php
include_once "konekcija.php";

function uzmiAutorIme($id){
	global $veza;
	$sql = "SELECT * FROM autor WHERE autor_id='$id'";
	$rezultat = mysqli_query($veza, $sql);
	while($red=mysqli_fetch_assoc($rezultat)){
		$ime = $red['autor_ime'];
		echo $ime;
	}
}

function uzmiKategorijaNaziv($id){
	global $veza;
	$sql = "SELECT * FROM kategorija WHERE kategorija_id='$id'";
	$rezultat = mysqli_query($veza, $sql);
	while($red=mysqli_fetch_assoc($rezultat)){
		$ime = $red['kategorija_naziv'];
		echo $ime;
	}
}
function uzmiPodesavanjeVrednost($podesavanje){
	global $veza;
	$sql = "SELECT * FROM podesavanje WHERE podesavanje_naziv='$podesavanje'";
	$rezultat = mysqli_query($veza, $sql);
	while($red=mysqli_fetch_assoc($rezultat)){
		$vrednost = $red['podesavanje_vrednost'];
		echo $vrednost;
	}
}

function postaviPodesavanjeVrednost($podesavanje,$vrednost){
	global $veza;
	$sql = "UPDATE podesavanje SET podesavanje_vrednost='$vrednost' WHERE podesavanje_naziv='$podesavanje'";
	if(mysqli_query($veza, $sql)){
		return true;
	}else{
		return false;
	}
}

?>