<?php
include_once "ukljuci/funkcije.php";
include_once "ukljuci/konekcija.php";
if(!isset($_GET['id'])){
	header("Location: index.php?geterr");
}
else{
	$id = mysqli_real_escape_string($veza, $_GET['id']);
	if(!is_numeric($id)){
		header("Location: index.php?numerror");
		exit();
	}
	else if(is_numeric($id)){
		$sql = "SELECT * FROM clanak WHERE clanak_id='$id'";
		$rezultat = mysqli_query($veza, $sql);
		//Провера да ли чланак постоји
		if(mysqli_num_rows($rezultat)<=0){
			//Ако чланак не постоји
			header("Location: index.php?noresult");
		}
		//Ако чланак постоји
		else if(mysqli_num_rows($rezultat)>0){
			while($red=mysqli_fetch_assoc($rezultat)){
				$clanak_naslov = $red['clanak_naslov'];
				$clanak_sadrzaj = $red['clanak_sadrzaj'];
				$clanak_datum = $red['clanak_datum'];
				$clanak_slika = $red['clanak_slika'];
				$clanak_reci = $red['clanak_reci'];
				$clanak_autor = $red['clanak_autor'];
				$clanak_kategorija = $red['clanak_kategorija'];
				?>

<!DOCTYPE html>
<html lang="sr">
	<head>
		<title><?php echo $clanak_naslov; ?></title>
		<?php include_once "ukljuci/zaglavlje.php"; ?>
	</head>
	<body>
		<!--Навигација-->
		<?php include_once "ukljuci/navigacija.php"; ?>
		<!--Чланак-->
		<div class="container">
			<!--Чланак, слика-->
			<img style="width:100%;" src="<?php echo $clanak_slika; ?>">
			<!--Чланак, наслов-->
			<h1><?php echo $clanak_naslov; ?></h1>
			<hr>
			<!--Чланак, информације-->
			<h6>Објављено: <?php echo $clanak_datum; ?> | Аутор: <?php uzmiAutorIme($clanak_autor); ?></h6>
			<h4>Категорија: <a href="kategorija.php?id=<?php echo $clanak_kategorija; ?>"><?php uzmiKategorijaNaziv($clanak_kategorija); ?></a></h4>
			<!--Чланак, садржај-->
			<p><?php echo $clanak_sadrzaj; ?></p>
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