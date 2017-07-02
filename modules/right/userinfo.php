
<?php
      $sql="select * from account where id_user=$_GET[id]";
	  $query=mysql_query($sql);
	  $dong=mysql_fetch_array($query);
?>
<style>
th{
	background:#CCC;
	}
</style>
<table width="100%" border="1">
  <tr>
    <th colspan="10">Thông tin người dùng</th>
  </tr>
  <tr>
    <td><div align="center"><em><strong>Số thứ tự</strong></em></div></td>
   
    <td><div align="center"><em><strong>Họ tên </strong></em></div></td>
    <td><div align="center"><em><strong>Số điện thoại </strong></em></div></td>
    <td><div align="center"><em><strong>Email </strong></em></div></td>
    <td><div align="center"><em><strong>Ảnh đại diện</strong></em></div></td>
    <td><div align="center"><em><strong>Tên truy cập</strong></em></div></td>     
    <td><div align="center"><em><strong>Quyền truy cập</strong></em></div></td>
    <td><div align="center"><em><strong>Trạng thái</strong></em></div></td>
    
  </tr>

  <tr>
    <td><div align="center"><?php echo $dong['id_user'];?></div></td>
    
    <td><div align="center"><?php echo $dong['hoten'];?></div></td>
    <td><div align="center">0<?php echo $dong['sdt'];?></div></td>
    <td><div align="center"><?php echo $dong['email'];?></div></td>
    <td align="center"><img src="admincp/modules/quanlynguoidung/uploads/<?php echo $dong['avatar']?>" width="250" height="220"></td>
    <td> <div align="center"><?php echo $dong['username']; ?></div>
   </td>
   
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

  </tr>

</table>


