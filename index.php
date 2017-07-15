<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Meeting Room</title>

<link rel="stylesheet" type="text/css" href="style/css2.css" />
</head>
<body>

<?php 
    session_start();
    if(isset($_SESSION['dangnhap']) && $_SESSION['level'] == 1 &&  $_SESSION['status'] == 1){
		
?>

<div class="wrapper">
    <?php
	        include('modules/config.php');
			include('modules/header.php');
			include('modules/menu.php');
			include('modules/content.php');
			include('modules/footer.php');

 ?>   
</div>
<?php
	}elseif(isset($_SESSION['dangnhap']) && $_SESSION['level'] == 0 &&  $_SESSION['status'] == 1){
		?>
		      <div class="wrapper">
    <?php
	        include('modules/config.php');
			include('modules/header.php');
			include('modules/menu2.php');
			include('modules/content.php');
			include('modules/footer.php');

 ?>   
</div>
<?php
	}
?>
</body>

</html>










