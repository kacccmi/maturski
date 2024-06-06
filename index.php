<?php
include_once "ukljuci/funkcije.php";
include_once "ukljuci/konekcija.php";
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
		<!--Заглавље на страници-->
		<header class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1 class="display-4"><?php uzmiPodesavanjeVrednost("pocetna_veliki_naslov"); ?></h1>
				<p class="lead"><?php uzmiPodesavanjeVrednost("pocetna_veliki_podnaslov"); ?></p>
			</div>
		</header>
		<!--Главни садржај-->
		<main class="container">
		<?php
			//страничење
			$sqlstranica = "SELECT * FROM `clanak`";
			$rezultatistranica = mysqli_query($veza, $sqlstranica);
			$ukupnoclanaka = mysqli_num_rows($rezultatistranica);
			$ukupnostranica = ceil($ukupnoclanaka/9);
			if(isset($_GET['p'])){
				$pageid = $_GET['p'];
				$start = ($pageid*9)-9;
				$sql = "SELECT * FROM `clanak` ORDER BY clanak_id DESC LIMIT $start,9";
			}else{
				$sql = "SELECT * FROM `clanak` ORDER BY clanak_id DESC LIMIT 0,9";
			}
		?>
		<div class="card-columns">
		<?php 
			
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
				<img class="card-img-top" src="<?php echo $clanak_slika ?>" alt="Naslovna slika za clanak">
				<div class="card-body">
				<h5 class="card-naslov"><?php echo $clanak_naslov ?></h5>
				<h6 class="card-subnaslov mb-2 text-muted"><?php echo $clanak_autor_ime ?></h6>
				<p class="card-text"><?php echo substr(strip_tags($clanak_sadrzaj),0,90)."..."; ?></p>
				<a href="clanak.php?id=<?php echo $clanak_id; ?>" class="btn btn-primary">Опширније...</a>
				</div>
			</div>
			
			<?php }}?>
		</div>
			<?php 
				echo "<center>";
				for($i=1;$i<=$ukupnostranica;$i++){
					?>
					<a href="?p=<?php echo $i; ?>"><button class="btn btn-info"><?php echo $i; ?></button></a>&nbsp;
					<?php
				}
				echo "</center>";
			?>
		</main>
		<br><br>
		<footer>
			<?php include_once "ukljuci/podnozje.php"; ?>
		</footer>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scroll.js"></script>
	</body>
</html>

