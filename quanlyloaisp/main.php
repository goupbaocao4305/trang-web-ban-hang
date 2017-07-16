<?php 

    if(isset($_SESSION['dangnhap']) && $_SESSION['level'] == 1){
		
?>
<div class="left">
	<?php
    if(isset($_GET['ac'])){
        $tam=$_GET['ac'];
    }else
    {
        $tam='';
    }if($tam=='them'){
        include('modules/quanlyloaisp/them.php');
    }if($tam=='sua'){
        include('modules/quanlyloaisp/sua.php');	
    }
    ?>
</div>
<div class="right">
<?php
include('modules/quanlyloaisp/lietke.php');
?>
</div>
<?php 
	}else
	echo"Người dùng không được phép truy cập trang này!";
?>