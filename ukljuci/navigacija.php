<?php
include_once "ukljuci/konekcija.php";
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a class="navbar-brand" href="index.php">Аутомобили</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mx-auto">
      <li class="nav-item"> <a class="nav-link" href="index.php">Почетак</a> </li>
		<?php
		$sqlstranica = "SELECT * FROM stranica";
			$rezultatstranica = mysqli_query($veza, $sqlstranica);
			while($redstranica=mysqli_fetch_array($rezultatstranica)){
				$stranica_id = $redstranica['stranica_id'];
				$stranica_naslov = $redstranica['stranica_naslov'];
						
		?>
      <li class="nav-item"> <a class="nav-link" href="stranica.php?id=<?php echo $stranica_id; ?>"><?php echo $stranica_naslov; ?></a> </li>
      <?php
					}
			  ?>
      <li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Све категорије </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <?php
					$sql = "SELECT * FROM kategorija";
					$rezultat = mysqli_query($veza, $sql);
					while($red=mysqli_fetch_array($rezultat)){
						$kategorija_id = $red['kategorija_id'];
						$kategorija_naziv = $red['kategorija_naziv'];
						
						?>
          <a class="dropdown-item" href="kategorija.php?id=<?php echo $kategorija_id ?>"><?php echo $kategorija_naziv; ?></a>
          <?php
					}
				?>
        </div>
      </li>
    </ul>
    <form action="pretraga.php" class="form-inline my-2 my-lg-0">
      <input name="s" class="form-control mr-sm-2" type="search" placeholder="Унесите појам за претрагу" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Претрага</button>
    </form>
  </div>
</nav>
