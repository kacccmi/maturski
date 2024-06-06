<?php
include_once "ukljuci/konekcija.php";
include_once "ukljuci/funkcije.php";
if(!isset($_GET['id'])){
	header("Location: index.php?geterr");
}else{
	$id = mysqli_real_escape_string($veza, $_GET['id']);
	if(!is_numeric($id)){
		header("Location: index.php?numerror");
		exit();
	}else if(is_numeric($id)){
		$sql = "SELECT * FROM kategorija WHERE kategorija_id='$id'";
		$rezultat = mysqli_query($veza, $sql);
		//Check if category exits
		if(mysqli_num_rows($rezultat)<=0){
			//no category
			header("Location: index.php?noresult");
		}else{
		?>
		
<!DOCTYPE html>
<html lang="sr">
	<head>
		<title>Аутомобили</title>
		<?php include_once "ukljuci/zaglavlje.php"; ?>
	</head>
	<body>
		<!--Навигација, почетак-->
		<?php include_once "ukljuci/navigacija.php"; ?>
		<!--Навигација, завршетак-->

		<div class="container">
		<h1 style="width:100%;padding-top:25px;padding-bottom:25px;background-color:grey;color:white;text-align:center;">Приказ свих чланака за категорију: <?php uzmiKategorijaNaziv($id); ?></h1>
		<div class="card-columns">
		<?php 
			$sql = "SELECT * FROM `clanak` WHERE clanak_kategorija='$id' ORDER BY clanak_id DESC";
			$rezultat = mysqli_query($veza, $sql);
			while($red=mysqli_fetch_assoc($rezultat)){
				$clanak_naslov = $red['clanak_naslov']; 
				$clanak_slika = $red['clanak_slika']; 
				$clanak_autor = $red['clanak_autor']; 
				$clanak_sadrzaj = $red['clanak_sadrzaj'];
				$clanak_id = $red['clanak_id'];
				
			$sqlautentifikacija = "SELECT * FROM autor WHERE autor_id='$clanak_autor'";
			$rezultatautentifikacija = mysqli_query($veza, $sqlautentifikacija);
			while($autentifikacijared=mysqli_fetch_assoc($rezultatautentifikacija)){
				$clanak_autor_ime = $autentifikacijared['autor_ime'];
			
			
		?>
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<?php echo $clanak_slika ?>" alt="Card image cap">
				<div class="card-body">
				<h5 class="card-title"><?php echo $clanak_naslov ?></h5>
				<h6 class="card-subtitle mb-2 text-muted"><?php echo $clanak_autor_ime ?></h6>
				<p class="card-text"><?php echo substr(strip_tags($clanak_sadrzaj),0,90)."..."; ?></p>
				<a href="clanak.php?id=<?php echo $clanak_id; ?>" class="btn btn-primary">Опширнијe</a>
				</div>
			</div>
			
			<?php }}?>
		</div>
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
?>