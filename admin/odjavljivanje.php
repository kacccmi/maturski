<?php
session_start();
session_unset();
session_destroy();
header("Location: prijavljivanje.php?message=Успешно+сте+одјављени");