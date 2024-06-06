<?php
include_once "ukljuci/konekcija.php";
if(!isset($_GET['s'])){
	header("Location: index.php");
	exit();
}else{
	$search = mysqli_real_escape_string($veza, $_GET['s']);
	
	
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
		<h1>Приказивање свих резултата за: <?php echo $search; ?>
		</h1>
		<div class="card-columns">
		<?php 
			$sql = "SELECT * FROM `clanak` WHERE `clanak_naslov` LIKE '%$search%' OR `clanak_sadrzaj` LIKE '%$search%' OR `clanak_reci` LIKE '%$search%'";
			$rezultat = mysqli_query($veza, $sql);
			if(mysqli_num_rows($rezultat)<=0){
				echo "No rezultats Found";
				exit();
			}else{
			while($row=mysqli_fetch_assoc($rezultat)){
				$clanak_naslov = $row['clanak_naslov']; 
				$clanak_slika = $row['clanak_slika']; 
				$clanak_autor = $row['clanak_autor']; 
				$clanak_sadrzaj = $row['clanak_sadrzaj'];
				$clanak_id = $row['clanak_id'];
				
			$sql_autentifikacija = "SELECT * FROM autor WHERE autor_id='$clanak_autor'";
			$rezultat_autentifikacija = mysqli_query($veza, $sql_autentifikacija);
			while($_autentifikacijared=mysqli_fetch_assoc($rezultat_autentifikacija)){
				$clanak_autor_name = $_autentifikacijared['autor_ime'];
			
			
		?>
			
			<div class="card" style="width: 18rem;">
				<img class="card-img-top" src="<?php echo $clanak_slika ?>" alt="Card image cap">
				<div class="card-body">
				<h5 class="card-title"><?php echo $clanak_naslov ?></h5>
				<h6 class="card-subtitle mb-2 text-muted"><?php echo $clanak_autor_name ?></h6>
				<p class="card-text"><?php echo substr(strip_tags($clanak_sadrzaj),0,90)."..."; ?></p>
				<a href="clanak.php?id=<?php echo $clanak_id; ?>" class="btn btn-primary">Опширније</a>
				</div>
			</div>
			
			<?php }}?>
		</div>
		</div>
	
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scroll.js"></script>
	</body>
</html>
	
	<?php
}}
?>