<?php

     session_start();
     include('../config.php');	  
	 $ui=$_SESSION['id']; 
	 $them=$_GET['add'];
	 $date=$_POST['date'];	
	 $tenhang=$_POST['tenhang'];
	 $soluong=$_POST['soluong'];
	 $gia=$_POST['gia'];
	 //them
	 if(isset($_POST['them'])){
		 $sql="insert into banhang (tenhang,soluong,gia,nguoiban,date) values('$tenhang','$soluong','$gia',$ui,(now()))";
		 mysql_query($sql);
		 header('location:../../index.php?quanly=quanlybanhang&ac=them');
	 }
?>
