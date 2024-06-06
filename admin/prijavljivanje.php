<?php
session_start();
include_once "../ukljuci/funkcije.php";
include_once "../ukljuci/konekcija.php";
?>
<!DOCTYPE html>
<html lang="sr">
	<head>
		<title>Пријављивање</title>
		<?php include_once "ukljuci/zaglavlje.php"; ?>
	</head>
	<body>
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
		<div style="width:500px;margin:auto auto;  margin-top:250px;">
			<form method="post" class="form-signin">
				<h1 class="h3 mb-3 font-weight-normal">Молимо вас да се пријавите</h1>
				<input type="email" name="autor_eadresa" id="inputEmail" class="form-control" placeholder="Унесите е-адресу" required autofocus>
				<input type="password" name="autor_lozinka" id="inputPassword" class="form-control" placeholder="Унесите лозинку">
				<button class="btn btn-lg btn-primary btn-block" name="prijavljivanje" type="submit">Пријављивање</button>
			</form>
		</div>
		<?php 
			if(isset($_POST['prijavljivanje'])){
				$autor_eadresa = mysqli_real_escape_string($veza, $_POST['autor_eadresa']);
				$autor_lozinka = mysqli_real_escape_string($veza, $_POST['autor_lozinka']);
				//Провера да ли су поља празна
				if(empty($autor_eadresa)){
					header("Location: prijavljivanje.php?poruka=Поља+су+празна");
					//exit();
				}
				//Провера да ли је е-адреса валидна
				if(!filter_var($autor_eadresa,FILTER_VALIDATE_EMAIL)){
					header("Location: prijavljivanje.php?poruka=Унесите+валидну+е_адресу");
					exit();
				}
				else{
					//Провера да ли постоји е-адреса у бази података
					$sql = "SELECT * FROM `autor` WHERE `autor_eadresa`='$autor_eadresa'";
					$rezultat = mysqli_query($veza, $sql);
					if(mysqli_num_rows($rezultat)<=0){
						header("Location: prijavljivanje.php?poruka=Грешка+приликом+пријављивања");
						//exit();
					} else {
						while($row = mysqli_fetch_assoc($rezultat)){
							//Провера да ли је лозинке поклапају
							if(!password_verify($autor_lozinka, $row['autor_lozinka'])){
								header("Location: prijavljivanje.php?poruka=Грешка+приликом+пријављивања");
								exit();
							}
							else if(password_verify($autor_lozinka, $row['autor_lozinka'])) {
								$_SESSION['autor_id'] = $row['autor_id'];
								$_SESSION['autor_ime'] = $row['autor_ime'];
								$_SESSION['autor_eadresa'] = $row['autor_eadresa'];
								$_SESSION['autor_info'] = $row['autor_info'];
								$_SESSION['autor_uloga'] = $row['autor_uloga'];
								header("Location: index.php");
								//exit();
							}
						}
					}
				}
			}
		?>
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/scroll.js"></script>
	</body>
</html>