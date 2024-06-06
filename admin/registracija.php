<?php
include_once "../ukljuci/funkcije.php";
include_once "../ukljuci/konekcija.php";
?>
<!DOCTYPE html>
<html lang="sr">
	<head>
		<title>Регистрација</title>
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
		  <h1 class="h3 mb-3 font-weight-normal">Молимо вас да се региструјете</h1>
		  <input type="text" name="autor_ime" id="input" class="form-control" placeholder="Унесите ваше име" required autofocus>
		  <input type="email" name="autor_eadresa" id="inputEmail" class="form-control" placeholder="Унесите е-адресу" required autofocus>
		  <input type="password" name="autor_lozinka" id="inputPassword" class="form-control" placeholder="Унесите лозинку" required>
		  <button class="btn btn-lg btn-primary btn-block" name="registrovanje" type="submit">Регистровање</button>
		</form>
		</div>
		<?php 
			if(isset($_POST['registrovanje'])){
				$autor_ime = mysqli_real_escape_string($veza, $_POST['autor_ime']);
				$autor_eadresa = mysqli_real_escape_string($veza, $_POST['autor_eadresa']);
				$autor_lozinka = mysqli_real_escape_string($veza, $_POST['autor_lozinka']);
				
				//Провера да ли су поља празна
				if(empty($autor_ime) OR empty($autor_eadresa) OR empty($autor_lozinka)){
					header("Location: registracija.php?poruka=Поља+су+празна");
					exit();
				}
				//Провера да ли је е-адреса валидна
				if(!filter_var($autor_eadresa,FILTER_VALIDATE_EMAIL)){
					header("Location: registracija.php?poruka=Молимо+вас+унесите+валидну+еадресу");
					exit();
				}
				else{
					//Ако е-адреса постоји
					$sql2 = "SELECT * FROM `autor` WHERE `autor_eadresa`='$autor_eadresa'";
					$rezultat = mysqli_query($veza, $sql2);
					if(mysqli_num_rows($rezultat)>0){
						header("Location: registracija.php?poruka=ЕАдреса+већ+постоји");
						exit();
					} 
					else {
						//криптовање лозинке
						$hash = password_hash($autor_lozinka, PASSWORD_DEFAULT);
						//Регистрација корисника
						$sql = "INSERT INTO `autor` (`autor_ime`, `autor_eadresa`, `autor_lozinka`, `autor_info`, `autor_uloga`) VALUES ('$autor_ime', '$autor_eadresa', '$hash', 'Унесите основне информације о себи', 'autor')";
						if(mysqli_query($veza, $sql)){
							header("Location: registracija.php?poruka=Успешно+сте+се+регистровали");
							exit();
						}
						else{
							header("Location: registracija.php?poruka=Регистрација+није+успешна");
							exit();
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