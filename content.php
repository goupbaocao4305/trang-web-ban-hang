<div class="content">
       <?php
	   if(isset($_GET['quanly'])){
		   $tam=$_GET['quanly'];
	   }else{
		   $tam='';	   
	   }if($tam=='quanlyloaisp'){
		   include('modules/quanlyloaisp/main.php');
	   }if($tam=='quanlychitietsp'){
		   include('modules/quanlychitietsp/main.php');
	   }if($tam=='quanlynguoidung'){
		   include('modules/quanlynguoidung/main.php');
	   }if($tam=='quanlybanhang'){
		   include('modules/quanlybanhang/main.php');
		
	   }
	   ?>     
       
<br />
<div class="clear"></div>