<?php
include_once "../ukljuci/funkcije.php";
include_once "../ukljuci/konekcija.php";
session_start();
if(isset($_SESSION['autor_uloga'])){
	if($_SESSION['autor_uloga']=="admin"){
	?>
<!DOCTYPE html>
<html lang="sr">
	<head>
		<?php include_once "ukljuci/zaglavlje.php"; ?>
	</head>
	<body>
	<!--Горњи мени-->
		<?php include_once "ukljuci/gornji_meni.php"; ?>
	<!--Контејнер-->
    <div class="container-fluid">
      <div class="row">
		<!--Леви мени-->
			<?php include_once "ukljuci/levi_meni.php"; ?>
		<!--Главни садржај-->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <!--h1 class="h2">Категорије</h1-->
			<button id="addCatBtn" class="btn btn-info">Додавање нове категорије</button>
		  <h6>Здраво <?php echo $_SESSION['autor_ime']; ?> | Ваша улога је <?php echo $_SESSION['autor_uloga']; ?></h6>
          </div>
		
			<div id="admin-index-form">
			<?php
			if(isset($_GET['poruka'])){
				$msg = $_GET['poruka'];
				echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">
				'.$msg.'
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>';
			}
			?>
				<div style="display:none;" id="addCatForm">
					<form action="kategorija_dodavanje.php" method="post">
						<input type="text" name="kategorija_naziv" class="form-control" placeholder="Назив категорије"><br>
						<button name="submit" class="btn btn-success">Додај категорију</button>
					</form><br>
				</div>
				<h1>Категорије:</h1>
				<table class="table">
				  <thead>
					<tr>
					  <th scope="col">ИД категорије</th>
					  <th scope="col">Назив категорије</th>
					</tr>
				  </thead>
				  <tbody>
				  <?php
					$sql = "SELECT * FROM `kategorija` ORDER BY kategorija_id DESC";
					$rezultat = mysqli_query($veza, $sql);
					while($row=mysqli_fetch_assoc($rezultat)){
						$kategorija_id = $row['kategorija_id']; 
						$kategorija_naziv = $row['kategorija_naziv']; 
		?>
			<tr>
					  <th scope="row"><?php echo $kategorija_id;?></th>
					  <td><?php echo $kategorija_naziv; ?></td>
			</tr>
			<?php }?>
				  </tbody>
				</table>
			</div>
          </div>
        </main>
      </div>
    </div>
	
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scroll.js"></script>
	<script>
		$(document).ready(function(){
			$("#addCatBtn").click(function(){
				$("#addCatForm").slideToggle();
			});
		});
	</script>
	</body>
</html>
<?php
		}
	}
?>
