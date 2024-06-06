<?php
include_once "ukljuci/funkcije.php";
include_once "ukljuci/konekcija.php";
if(!isset($_GET['id'])){
	header("Location: index.php?geterr");
}else{
	$id = mysqli_real_escape_string($veza, $_GET['id']);
	if(!is_numeric($id)){
		header("Location: index.php?numerror");
		exit();
	}else if(is_numeric($id)){
		$sql = "SELECT * FROM stranica WHERE stranica_id='$id'";
		$rezultat = mysqli_query($veza, $sql);
		//Провера да ли страница постоји
		if(mysqli_num_rows($rezultat)<=0){
			//Ако страница не постоји
			header("Location: index.php?nopagefound");
		}
		//Ако страница постоји
		else if(mysqli_num_rows($rezultat)>0){
			while($red=mysqli_fetch_assoc($rezultat)){
				$stranica_naslov = $red['stranica_naslov'];
				$stranica_sadrzaj = $red['stranica_sadrzaj'];
				$stranica_naslov2 = $red['stranica_naslov'];
				?>
<!DOCTYPE html>
<html lang="sr">
	<head>
		<title><?php echo $stranica_naslov; ?></title>
		<?php include_once "ukljuci/zaglavlje.php"; ?>
	</head>
	<body>
		<!--Навигација, почетак-->
		<?php include_once "ukljuci/navigacija.php"; ?>
		<!--Навигација, завршетак-->
		<div class="container">
			<h1 style="width:100%;background-color:grey;padding-top:25px;padding-bottom:25px;text-align:center;color:white"><?php echo $stranica_naslov2; ?></h1>
			<hr>
			<p><?php echo $stranica_sadrzaj; ?></p>
		</div>
		<footer>
			<?php include_once "ukljuci/podnozje.php"; ?>
		</footer>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scroll.js"></script>
	</body>
</html>
				<?php
			}
		}
	}
}
?>