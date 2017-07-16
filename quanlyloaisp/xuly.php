
<?php
     include('../config.php');
	 $id=$_GET['id'];
	 $tenloaisp=$_POST['tenloaisp'];
	 $ncc=$_POST['ncc'];
	 if(isset($_POST['them'])){
		 //Thêm
		 $sql="insert into loaisp (tenloaisp,ncc) value('$tenloaisp','$ncc')";
		 mysql_query($sql);
		 header('location:../../index.php?quanly=quanlyloaisp&ac=them');
	 }//Sửa
	 elseif(isset($_POST['sua'])){
		$sql="update loaisp set tenloaisp='$tenloaisp',ncc='$ncc' where id_loaisp='$id'";
		mysql_query($sql);
		header('location:../../index.php?quanly=quanlyloaisp&ac=sua&id='.$id);
	 }//Xóa
	 else{
		 $sql="delete from loaisp where id_loaisp='$id'";
		 mysql_query($sql);
		  header('location:../../index.php?quanly=quanlyloaisp&ac=them');
	 }
?>
