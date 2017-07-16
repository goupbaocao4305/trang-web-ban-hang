
<?php
$sql="select * from account order by id_user  desc";
$run=mysql_query($sql);
?>
<style>
th{
	background:#CCC;
	}
</style>
<table width="100%" border="1">
  <tr>
    <th colspan="10">Bảng danh sách người dùng</th>
  </tr>
  <tr>
    <td><em><strong>STT</strong></em></td>
   
    <td><em><strong>Họ tên </strong></em></td>
    <td><em><strong>Số điện thoại </strong></em></td>
    <td><em><strong>Ảnh đại diện</strong></em></td>
    <td><em><strong>Tên truy cập</strong></em></td>     
    <td><em><strong>Quyền</strong></em></td>
    <td><em><strong>Trạng thái</strong></em></td>
    <td><em><strong>Email</strong></em></td>
    <td colspan="2"><em><strong>Quản lý</strong></em></td>
  </tr>
  <?php
 
  while ($dong=mysql_fetch_array($run)){
  ?>
  <tr>
    <td><?php echo $dong['id_user']; ?></td>
    
    <td><?php echo $dong['hoten'];?></td>
    <td>0<?php echo $dong['sdt'];?></td>
    <td><img src="modules/quanlynguoidung/uploads/<?php echo $dong['avatar']?>" width="120" height="60"></td>
    <td> <div align="center"><?php echo $dong['username']; ?></div> </td>
    
    <?php
  $sql_tt="select * from statuss";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['level']==$dong_tt['level']){
		?>
    <td><div align="center"><?php echo $dong_tt['role']; ?></div></td>
    
    <?php
	}
	}
	?>
     <?php
  $sql_tt="select * from statuss";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['status']==$dong_tt['level']){
		?>
    <td><div align="center"><?php echo $dong_tt['tt']; ?></div></td>
    
    <?php
	}
	}
	?>
    <td> <div align="center"><?php echo $dong['email']; ?></div> </td>
    <td><a href="index.php?quanly=quanlynguoidung&ac=sua&id_user=<?php echo $dong['id_user']?>">Sửa</a></td>
    <td><div align="center"><a href="modules/quanlynguoidung/xuly.php?id_user=<?php echo $dong['id_user'] ?>">Xoá</a></div></td>
  </tr>
  <?php
	
  }
  ?>
</table>
