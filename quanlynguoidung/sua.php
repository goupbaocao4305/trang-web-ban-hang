
<?php
     $sql="select * from account where id_user='$_GET[id_user]'";
	 $run=mysql_query($sql);
	 $dong= mysql_fetch_array($run);
?>

<form action="modules/quanlynguoidung/xuly.php?id_user=<?php echo $dong['id_user']?>" method="post" enctype="multipart/form-data">
<table width="100%" height="338" border="1">
  <tr>
    <th colspan="2"><div align="center">Sửa chi tiết người sử dụng</div></th>
  </tr>
  <tr>
    <td>Họ tên</td>
    <td><input style="font-size:20px" type="text" name="hoten" value="<?php echo $dong['hoten']?>"></td>
  </tr>
  <tr>
    <td>Số điện thoại</td>
    <td>0<input size="13" style="font-size:20px" type="text" name="sdt" value="<?php echo $dong['sdt']?>"></td>
  </tr>
  <tr>
    <td>Email</td>
    <td><input size="13" style="font-size:20px" type="email" name="email" value="<?php echo $dong['email']?>"></td>
  </tr>
  <tr>  
    <td>ID</td>
    <td><label style="font-size:20px"  type="text" ><?php echo $dong['id_user']?></label></td>
  </tr>
  <tr>  
    <td>Tên truy cập</td>
    <td><label style="font-size:20px"  type="text" ><?php echo $dong['username']?></label></td>
  </tr>
   <tr>
    <td>Password</td>
    <td><input size="13" style="font-size:20px" type="password" name="password" value="<?php echo $dong['password']?>"></td>
  </tr>
  <?php
  $sql_tt="select * from statuss";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <tr>
    <td>Quyền truy cập</td>
   <td><select style="font-size:20px" name="level">
    <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['level']==$dong_tt['level']){
		?>
    <option selected="selected" value="<?php echo $dong_tt['level']?>"><?php
    echo $dong_tt['role']?> </option>
    <?php
	}else{
	?>
    <option 
    
    value="<?php echo $dong_tt['level']?>"><?php
    echo $dong_tt['role']?>
    
     </option>
    <?php
	}
	}
	?>
    </select></td>
  </tr>
  <?php
  $sql_tt="select * from statuss";
  $run_tt=mysql_query($sql_tt);
    
  ?>
  <tr>
    <td>Trạng thái</td>
   <td><select style="font-size:20px" name="status">
    <?php
    while($dong_tt=mysql_fetch_array($run_tt)){
		if($dong['status']==$dong_tt['level']){
		?>
    <option selected="selected" value="<?php echo $dong_tt['level']?>"><?php
    echo $dong_tt['tt']?> </option>
    <?php
	}else{
	?>
    <option 
    
    value="<?php echo $dong_tt['level']?>"><?php echo $dong_tt['tt']?>
    
     </option>
    <?php
	}
	}
	?>
    </select></td>
  </tr>
 
  <tr>
    <td colspan="2"> <div align="center">
      <button name="sua" value="Sửa" style="background-color:#CCC; font-size:24px; font-family:'Times New Roman', Times, serif">Sửa</button>
      </div>
      </td>
  </tr>
</table>
</form>
