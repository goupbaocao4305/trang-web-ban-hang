<?php 
    
    if(isset($_SESSION['dangnhap']) && $_SESSION['level'] == 1){
		
?>
<div class="left">
    <?php
include('modules/quanlybanhang/lietke.php');
?>
	
</div>
<div class="right">
<?php
    if(isset($_GET['ac'])){
        $tam=$_GET['ac'];
    }else
    {
        $tam='';
    }if($tam=='them'){
        include('modules/quanlybanhang/them.php');
    }if($tam=='sua'){
        include('modules/quanlybanhang/sua.php');	
    }
    ?>
</div>
<?php 
	}else
	echo"Người dùng không được phép truy cập trang này!";
		
?>
