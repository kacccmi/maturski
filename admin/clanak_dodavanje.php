<?php
include_once "../ukljuci/funkcije.php";
include "../ukljuci/konekcija.php";
session_start();
if(isset($_SESSION['autor_uloga'])){
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
            <h1 class="h2">Додавање новог чланка</h1>
		  <h6>Здраво <?php echo $_SESSION['autor_ime']; ?> | Ваша улога је <?php echo $_SESSION['autor_uloga']; ?></h6>
          </div>
			<div id="admin-index-form">
			<?php
			if(isset($_GET['poruka'])){
				$poruka = $_GET['poruka'];
				echo '<div class="alert alert-warning alert-dismissible fade show" role="alert">
				'.$poruka.'
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>';
			}
			?>
				<form method="post" enctype="multipart/form-data">
					Наслов чланка
					 <input type="text" name="clanak_naslov" class="form-control" placeholder="Унесите наслов чланка"><br>
					Категорија чланка
					<select name="clanak_kategorija" class="form-control" id="obrazacClanakIzbor1">
					<?php
						$sql = "SELECT * FROM `kategorija`";
						$rezultat = mysqli_query($veza, $sql);
						while($red=mysqli_fetch_assoc($rezultat)){
							$kategorija_id = $red['kategorija_id'];
							$kategorija_naziv = $red['kategorija_naziv'];
							?>
							<option value="<?php echo $kategorija_id; ?>"><?php echo $kategorija_naziv; ?></option>
							<?php
						}
					?>
					</select><br>
					Садржај чланка
					<textarea name="clanak_sadrzaj" class="form-control" id="obrazacSadrzajTextarea1" rows="3"></textarea><br>
					Слика
					<input type="file" name="file" class="form-control-file" id="exampleFormControlFile1"><br>
					Кључне речи
					 <input type="text" name="clanak_reci" class="form-control" placeholder="Унесите кључне речи"><br>
					 <button name="prihvati" type="submit" class="btn btn-primary">Прихвати</button>
				</form>
				<?php
					if(isset($_POST['prihvati'])){
						$clanak_naslov = mysqli_real_escape_string($veza, $_POST['clanak_naslov']);
						$clanak_kategorija = mysqli_real_escape_string($veza, $_POST['clanak_kategorija']);
						$clanak_sadrzaj = mysqli_real_escape_string($veza, $_POST['clanak_sadrzaj']);
						$clanak_reci = mysqli_real_escape_string($veza, $_POST['clanak_reci']);
						$clanak_autor = $_SESSION['autor_id'];
						$clanak_datum = date("d/m/y");
						//Провера да ли су поља изнад празна
						if(empty($clanak_naslov) OR empty($clanak_kategorija) OR empty($clanak_sadrzaj)){
							header("Location: clanak_dodavanje.php?poruka=Поља+су+празна");
							exit();
						}
						//Подаци о датотеци слике
						$file = $_FILES['file'];
						$fileName = $file['name'];
						$fileType = $file['type'];
						$fileTmp = $file['tmp_name'];
						$fileErr = $file['error'];
						$fileSize = $file['size'];
						$fileEXT = explode('.',$fileName);
						$fileExtension = strtolower(end($fileEXT));
						$allowedExt = array("jpg", "jpeg", "png", "gif");
						if(in_array($fileExtension, $allowedExt)){
							if($fileErr === 0){
								if($fileSize < 3000000){
									//Чување слике у локалном фолдеру
									$newFileName = uniqid('',true).'.'.$fileExtension;
									$destination = "../slike/$newFileName";
									$dbdestination = "slike/$newFileName";
									move_uploaded_file($fileTmp, $destination);
									//Уписивање података у базу
									$sql = "INSERT INTO clanak (`clanak_naslov`,`clanak_sadrzaj`,`clanak_kategorija`, `clanak_autor`, `clanak_datum`, `clanak_reci`, `clanak_slika`) VALUES ('$clanak_naslov', '$clanak_sadrzaj', '$clanak_kategorija', '$clanak_autor', '$clanak_datum', '$clanak_reci', '$dbdestination');";
									if(mysqli_query($veza, $sql)){
										header("Location: clanci.php?poruka=Чланак+је+додат");
									}
									else{
										header("Location: clanak_dodavanje.php?poruka=Грешка");
									}
								}
								else {
									header("Location: clanak_dodavanje.php?poruka=Слика+је+сувише+велика");
									exit();
								}
							}
							else{
								header("Location: clanak_dodavanje.php?poruka=Грешка+приликом+учитавања+датотеке");
								exit();
							}
						}
						else{
							header("Location: clanak_dodavanje.php?poruka=ГРЕШКА");
							exit();
						}
					}		
				?>
			</div>
          </div>
        </main>
      </div>
    </div>
	
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scroll.js"></script>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=ey5ln3e6qq2sq6u5ka28g3yxtbiyj11zs8l6qyfegao3c0su"></script>
	<script>tinymce.init({ selector:'textarea' });</script>
	</body>
</html>
	<?php
}else{
	header("Location: prijavljivanje.php?poruka=Молимо+вас+да+се+пријавите");
}
?>
